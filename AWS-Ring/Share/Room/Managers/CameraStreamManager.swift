//
//  CameraStreamManager.swift
//  GoChat
//
//  Created by Daniil on 26.12.2017.
//  Copyright © 2017 ForaSoft. All rights reserved.
//

import Foundation
import AVFoundation

#if os(OSX)
    import Cocoa
#else
    import UIKit
#endif

// MARK: Public Methods Definition

private protocol PublicMethods {
    func startLocalMediaStream()
    
    func connectionFactory() -> RTCPeerConnectionFactory
    func mediaStream() -> RTCMediaStream?
    func capturePreview() -> AnyObject?
}

// MARK: Class Definition

class CameraStreamManager {
    
    // MARK: Private Properties
    
    private static let singleton = CameraStreamManager()
    
    private var peerConnectionFactory: RTCPeerConnectionFactory!
    private var localMediaStream: RTCMediaStream?
    private var cameraVideoCapturer: RTCCameraVideoCapturer?
    private var localVideoTrack: RTCVideoTrack?
    private var captureFormat: AVCaptureDevice.Format?
    private var cameraCapturerPreview: AnyObject?
    
    // MARK: Init Methods & Superclass Overriders
    
    class func shared() -> CameraStreamManager {
        return CameraStreamManager.singleton
    }
    
}

// MARK: Public Methods

extension CameraStreamManager: PublicMethods {
    /// Setups local media stream. Starts camera.
    func startLocalMediaStream() {
        if self.localMediaStream != nil {
            self.startCameraCapturer()
        } else {
            self.peerConnectionFactory = RTCPeerConnectionFactory()
            let streamLabel = UUID().uuidString.replacingOccurrences(of: "-", with: "")
            self.localMediaStream = self.peerConnectionFactory.mediaStream(withStreamId: "\(streamLabel)")
            
            let audioTrack = self.peerConnectionFactory.audioTrack(withTrackId: "\(streamLabel)a0")
            self.localMediaStream?.addAudioTrack(audioTrack)
            
            let videoSource = self.peerConnectionFactory.videoSource()
            self.cameraVideoCapturer = RTCCameraVideoCapturer(delegate: videoSource)
            
            self.startCameraCapturer()
            
            self.localVideoTrack = self.peerConnectionFactory.videoTrack(with: videoSource, trackId: "\(streamLabel)v0")
            if let videoTrack = self.localVideoTrack  {
                self.localMediaStream?.addVideoTrack(videoTrack)
            }
            
            self.configureCameraCapturerPreview()
        }
    }
    
    /// Returns capture preview.
    func capturePreview() -> AnyObject? {
        return self.cameraCapturerPreview
    }
    
    /// Returns peer connection factory.
    func connectionFactory() -> RTCPeerConnectionFactory {
        return self.peerConnectionFactory
    }
    
    /// Returns local media stream.
    func mediaStream() -> RTCMediaStream? {
        return self.localMediaStream
    }
}

// MARK: Camera Video Capturer

private extension CameraStreamManager {
    func startCameraCapturer() {
        guard let capturer = self.cameraVideoCapturer, let captureSession = self.cameraVideoCapturer?.captureSession else {
            return
        }
        
        if !captureSession.isRunning {
            guard let device = self.captureDevice(fromCameraVideoCapturer: capturer) else {
                return
            }
            
            if let format = self.captureFormat(fromCaptureDevice: device, respectRatio: true) {
                let framesPerSecond = self.framesPerSecond(fromCaptureFormat: format)
                capturer.startCapture(with: device, format: format, fps: framesPerSecond)
                self.captureFormat = format
            } else if let format = self.captureFormat(fromCaptureDevice: device, respectRatio: false) {
                let framesPerSecond = self.framesPerSecond(fromCaptureFormat: format)
                capturer.startCapture(with: device, format: format, fps: framesPerSecond)
                self.captureFormat = format
            } else {
                let format = device.activeFormat
                let framesPerSecond = self.framesPerSecond(fromCaptureFormat: format)
                capturer.startCapture(with: device, format: format, fps: framesPerSecond)
                self.captureFormat = format
            }
        }
    }
    
    func stopCameraCapturer() {
        guard let captureSession = self.cameraVideoCapturer?.captureSession else {
            return
        }
        
        if captureSession.isRunning {
            self.cameraVideoCapturer?.stopCapture()
        }
    }
    
    func captureDevice(fromCameraVideoCapturer capturer: RTCCameraVideoCapturer) -> AVCaptureDevice? {
        var captureDevices = RTCCameraVideoCapturer.captureDevices()
        if (captureDevices.count == 0) {
            #if os(OSX)
                captureDevices = AVCaptureDevice.devices(for: .video)
                if (captureDevices.count == 0) {
                    captureDevices = AVCaptureDevice.devices()
                }
            #else
                let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera, .builtInTelephotoCamera, .builtInDuoCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.front)
                captureDevices = discoverySession.devices
            #endif
        }
        
        #if os(iOS)
            for device in captureDevices {
                if device.position == .back {
                    return device
                }
            }
        #endif
        
        if let standartDevice = AVCaptureDevice.default(for: .video) {
            return standartDevice
        } else if let standartDevice = AVCaptureDevice.default(for: .audio) {
            return standartDevice
        } else {
            return captureDevices.last
        }
    }
    
    func captureFormat(fromCaptureDevice device: AVCaptureDevice, respectRatio: Bool) -> AVCaptureDevice.Format? {
        var selectedFormat: AVCaptureDevice.Format?
        let targetWidth: Int32 = 720
        let targetHeight: Int32 = 540
        let targetDimensionRatio: Double = round((Double(targetWidth) / Double(targetHeight)) * 10) / 10.0
        var currentSizeDiff = Int32.max
        
        var captureDeviceFormats = RTCCameraVideoCapturer.supportedFormats(for: device)
        if captureDeviceFormats.count == 0 {
            captureDeviceFormats = device.formats
        }
        
        for format in captureDeviceFormats {
            let dimension = CMVideoFormatDescriptionGetDimensions(format.formatDescription)
            let dimensionRatio = round((Double(dimension.width) / Double(dimension.height)) * 10) / 10.0
            if (respectRatio && targetDimensionRatio == dimensionRatio) || !respectRatio {
                let sizeDiff = abs(targetWidth - dimension.width) + abs(targetHeight - dimension.height)
                if sizeDiff <= currentSizeDiff {
                    selectedFormat = format
                    currentSizeDiff = sizeDiff
                }
            }
        }
        
        return selectedFormat
    }
    
    func framesPerSecond(fromCaptureFormat format: AVCaptureDevice.Format) -> Int {
        let maxFramerate: Float64 = 20.0
        var maxFormatFramerate: Float64 = 0.0
        var minFormatFramerate: Float64 = Float64.greatestFiniteMagnitude
        
        let supportedFrameRateRanges = format.videoSupportedFrameRateRanges
        for range in supportedFrameRateRanges {
            maxFormatFramerate = fmax(maxFormatFramerate, range.maxFrameRate)
            minFormatFramerate = fmin(minFormatFramerate, range.minFrameRate)
        }
        
        if maxFormatFramerate > maxFramerate {
            if minFormatFramerate > maxFramerate {
                return Int(minFormatFramerate)
            } else {
                return Int(maxFramerate)
            }
        } else {
            return Int(maxFormatFramerate)
        }
    }
}

// MARK: Support Methods

private extension CameraStreamManager {
    func configureCameraCapturerPreview() {
        guard let captureFormat = self.captureFormat, let captureSession = self.cameraVideoCapturer?.captureSession else {
            return
        }
        
        let dimensions = CMVideoFormatDescriptionGetDimensions(captureFormat.formatDescription)
        let frame = CGRect(x: 0.0, y: 0.0, width: Double(dimensions.width), height: Double(dimensions.height))
        
        #if os(OSX)
            let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            previewLayer.frame = frame
            previewLayer.backgroundColor = NSColor.clear.cgColor
            
            let capturerPreview = NSView(frame: frame)
            capturerPreview.layer = previewLayer
        #else
            let capturerPreview = RTCCameraPreviewView(frame: frame)
            capturerPreview.captureSession = captureSession
            capturerPreview.backgroundColor = .clear
            
            if let cameraPreviewLayer = capturerPreview.layer as? AVCaptureVideoPreviewLayer {
                cameraPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                cameraPreviewLayer.backgroundColor = UIColor.clear.cgColor
            }
        #endif
        
        self.cameraCapturerPreview = capturerPreview
    }
}
