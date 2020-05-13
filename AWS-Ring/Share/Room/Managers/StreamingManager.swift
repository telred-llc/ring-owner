//
//  StreamingManager.swift
//  GoChat
//
//  Created by Daniil on 21.12.2017.
//  Copyright © 2017 ForaSoft. All rights reserved.
//

import Foundation
import MetalKit

#if os(OSX)
    import Cocoa
#else
    import UIKit
#endif

// MARK: Delegate Methods Definition

/// Stream video events.
protocol StreamingVideoEvents: class {
    func stream(_ stream: StreamingManager?, shouldRemoveVideoViewForUserIdentifier identifier: String)
    func stream(_ stream: StreamingManager?, shouldShowVideoView view: AnyObject?, forUserIdentifier identifier: String, connectionState: RTCIceConnectionState)
}

/// Stream connection events.
protocol StreamingConnectionEvents: class {
    func stream(_ stream: StreamingManager?, shouldSendSessionDescription sessionDescription: String, forUserIdentifier identifier: String)
    func stream(_ stream: StreamingManager?, shouldSendCandidate candidate: [String : Any], forUserIdentifier identifier: String)
    func stream(_ stream: StreamingManager?, didChangeConnectionState state: RTCIceConnectionState, forUserIdentifier identifier: String)
}

// MARK: Public Methods Definition

private protocol PublicMethods {
    func startCameraStream()
    func startStreaming(withServersModel model: IceServersModel?)
    func startWatching(withServersModel model: IceServersModel?)
    func stopStreamingAndWatching()
    
    func add(sessionDescriptionFrom dictionary: [String : Any]?)
    func add(candidateFrom dictionary: [String : Any])
    
    func connectionState() -> RTCIceConnectionState
}

// MARK: Class Definition

class StreamingManager: NSObject {
    
    private struct Keys {
        static let sdpMid = "sdpMid"
        static let sdpMLineIndex = "sdpMLineIndex"
        static let candidate = "candidate"
        static let answerDescription = "answerSdp"
        static let offerDescription = "offerSdp"
    }
    
    // MARK: Private Properties
    
    private weak var videoDelegate: StreamingVideoEvents?
    private weak var connectionDelegate: StreamingConnectionEvents?
    
    private var queuedLocalCandidates = NSMutableSet()
    private var queuedRemoteCandidates = NSMutableSet()
    private var peerConnection: RTCPeerConnection?
    private var remoteMediaStream: RTCMediaStream?
    
    private var userIdentifier: String!
    
    private var streaming = false
    private var watching = false
    
    // MARK: Init Methods & Superclass Overriders
    
    init(withUserIdentifier identifier: String, videoDelegate: StreamingVideoEvents?, connectionDelegate: StreamingConnectionEvents?) {
        self.userIdentifier = identifier
        
        self.videoDelegate = videoDelegate
        self.connectionDelegate = connectionDelegate
    }
    
    deinit {
        self.stopPeerConnection()
    }
    
}

// MARK: Public Methods

extension StreamingManager: PublicMethods {
    /// Setups local media stream. Starts camera. Creates camera view.
    func startCameraStream() {
        let cameraStreamManager = CameraStreamManager.shared()
        cameraStreamManager.startLocalMediaStream()
        
        #if os(OSX)
            let localStreamView = cameraStreamManager.capturePreview() as? NSView
        #else
            let localStreamView = cameraStreamManager.capturePreview() as? UIView
        #endif
        
        let conntectionState = self.peerConnection?.iceConnectionState ?? RTCIceConnectionState.failed
        self.videoDelegate?.stream(self, shouldShowVideoView: localStreamView, forUserIdentifier: self.userIdentifier, connectionState: conntectionState)
        self.startAudioSession()
    }

    /// Starts streaming peer connection.
    ///
    /// - Parameter model: Ice servers model.
    func startStreaming(withServersModel model: IceServersModel?) {
        if self.streaming {
            return
        }
        if self.watching {
            self.stopPeerConnection()
        }
        
        self.queuedLocalCandidates.removeAllObjects()
        self.queuedRemoteCandidates.removeAllObjects()
        
        self.streaming = true
        self.watching = false
        
        self.createConnection(withModel: model)
    }
    
    /// Starts watching peer connection.
    ///
    /// - Parameter model: Ice servers model.
    func startWatching(withServersModel model: IceServersModel?) {
        if self.watching {
            return
        }
        if self.streaming {
            self.stopPeerConnection()
        }
        
        self.queuedLocalCandidates.removeAllObjects()
        self.queuedRemoteCandidates.removeAllObjects()
        
        self.streaming = false
        self.watching = true
        
        self.createConnection(withModel: model)
    }
    
    /// Stops streaming and watching.
    func stopStreamingAndWatching() {
        if self.streaming {
            self.stopPeerConnection()
        }
        
        if self.watching {
            self.stopPeerConnection()
        }
        
        self.queuedLocalCandidates.removeAllObjects()
        self.queuedRemoteCandidates.removeAllObjects()
        
        self.streaming = false
        self.watching = false
    }
    
    /// Adds session description.
    ///
    /// - Parameter dictionary: Session description dictionary.
    func add(sessionDescriptionFrom dictionary: [String : Any]?) {
        if let response = dictionary, let answerSDP = response[Keys.answerDescription] as? String {
            self.receiveAnswer(answerSDP)
        } else if let description = self.peerConnection?.localDescription {
            let adoptedSessionDescription = self.adoptedSessionDescription(description, adoptAudio: false)
            self.sendSessionDescription(adoptedSessionDescription)
        }
    }
    
    /// Adds candidate to the peer connection.
    ///
    /// - Parameter dictionary: Candidate dictionary.
    func add(candidateFrom dictionary: [String : Any]) {
        guard let candidate = self.candidateFromDictionary(dictionary) else {
            return
        }
        
        if self.peerConnection?.remoteDescription != nil {
            self.peerConnection?.add(candidate)
        } else {
            self.queuedRemoteCandidates.add(candidate)
        }
    }
    
    /// Returns connection state of the peer connection. RTCIceConnectionState.failed if peer connection doesn't exist.
    func connectionState() -> RTCIceConnectionState {
        let conntectionState = self.peerConnection?.iceConnectionState ?? RTCIceConnectionState.failed
        return conntectionState
    }
}

// MARK: Peer Connection

private extension StreamingManager {
    func createConnection(withModel model: IceServersModel?) {
        let cameraStreamManager = CameraStreamManager.shared()
        let peerConnectionConstraints = self.peerConnectionConstraints(withAudio: self.watching, withVideo: self.watching)
        
        let configuration = RTCConfiguration()
        configuration.iceServers = self.iceServers(fromModel: model)
        
        self.peerConnection = cameraStreamManager.connectionFactory().peerConnection(with: configuration, constraints: peerConnectionConstraints, delegate: self)
        
        if self.streaming {
            if let localStream = cameraStreamManager.mediaStream() {
                self.peerConnection?.add(localStream)
            }
        }
        
        self.sendOffer()
    }
    
    func iceServers(fromModel model: IceServersModel?) -> [RTCIceServer] {
        var iceServers: [RTCIceServer] = []
        if let stuns = model?.stunServers, stuns.count > 0 {
            var addresses: [String] = []
            for stun in stuns {
                addresses.append(stun.address)
            }
            
            let server = RTCIceServer(urlStrings: addresses)
            iceServers.append(server)
        }
        if let turns = model?.turnServers, turns.count > 0 {
            for turn in turns {
                let server = RTCIceServer(urlStrings: [turn.address], username: turn.username, credential: turn.password)
                iceServers.append(server)
            }
        }
        
        return iceServers
    }
    
    func peerConnection(didCreateSessionDescription sessionDescription: RTCSessionDescription?, withError peerConnectionError: Error?) {
        if let errorMessage = peerConnectionError?.localizedDescription {
            print("\(self) peerConnection error didCreateSessionDescription \(errorMessage)")
        }
        
        if let description = sessionDescription {
            let adoptedSessionDescription = self.adoptedSessionDescription(description, adoptAudio: false)
            self.peerConnection?.setLocalDescription(adoptedSessionDescription, completionHandler: { [weak self] (error) in
                Threader.performOnMainThread { [weak self] in
                    self?.peerConnection(didSetSessionDescriptionWithError: error)
                    self?.sendSessionDescription(adoptedSessionDescription)
                }
            })
        }
    }
    
    func peerConnection(didSetSessionDescriptionWithError peerConnectionError: Error?) {
        if let errorMessage = peerConnectionError?.localizedDescription {
            print("\(self) peerConnection error didSetSessionDescriptionWithError \(errorMessage)")
        }
        
        if self.peerConnection?.remoteDescription != nil {
            self.drainRemoteCandidates()
            self.drainLocalCandidates()
        }
    }
    
    func peerConnection(didAddStream stream: RTCMediaStream?) {
        if self.streaming {
            return
        }
        
        self.remoteMediaStream = stream
        
        #if os(OSX)
            var videoView: (NSView & RTCVideoRenderer)!
            if RTCMTLNSVideoView.isMetalAvailable() {
                let frame = CGRect(x: 0.0, y: 0.0, width: 250.0, height: 250.0)
                videoView = RTCMTLNSVideoView(frame: frame)
                for subview in videoView.subviews {
                    if let metalView = subview as? MTKView {
                        metalView.layerContentsPlacement = NSView.LayerContentsPlacement.scaleProportionallyToFill
                        metalView.layer?.backgroundColor = NSColor.clear.cgColor
                    }
                }
            } else {
                let frame = CGRect(x: 0.0, y: 0.0, width: 250.0, height: 250.0)
                let attributes: [NSOpenGLPixelFormatAttribute] = [UInt32(NSOpenGLPFADoubleBuffer), UInt32(NSOpenGLPFADepthSize), 24, UInt32(NSOpenGLPFAOpenGLProfile), UInt32(NSOpenGLProfileVersion3_2Core), 0]
                let pixelFormat = NSOpenGLPixelFormat(attributes: attributes)
                videoView = RTCNSGLVideoView(frame: frame, pixelFormat: pixelFormat)
            }
            
            videoView.layerContentsPlacement = NSView.LayerContentsPlacement.scaleProportionallyToFill
            videoView.layer?.backgroundColor = NSColor.clear.cgColor
        #else
            #if arch(arm64)
                let videoView = RTCMTLVideoView(frame: UIScreen.main.bounds)
                for subview in videoView.subviews {
                    if let metalView = subview as? MTKView {
                        metalView.contentMode = UIView.ContentMode.scaleAspectFill
                        metalView.backgroundColor = .clear
                    }
                }
            #else
                let videoView = RTCEAGLVideoView(frame: UIScreen.main.bounds)
            #endif
            
            videoView.transform = CGAffineTransform(scaleX: -1, y: 1)
            videoView.layoutMargins = UIEdgeInsets.zero
            videoView.backgroundColor = .clear
            videoView.contentMode = UIView.ContentMode.scaleAspectFill
        #endif

        if let track = stream?.videoTracks.first {
            track.add(videoView)
        }
        
        let conntectionState = self.peerConnection?.iceConnectionState ?? RTCIceConnectionState.failed
        self.videoDelegate?.stream(self, shouldShowVideoView: videoView, forUserIdentifier: self.userIdentifier, connectionState: conntectionState)
        self.startAudioSession()
    }
    
    func peerConnection(didRemoveStream stream: RTCMediaStream?) {
        if self.streaming {
            return
        }

        self.videoDelegate?.stream(self, shouldRemoveVideoViewForUserIdentifier: self.userIdentifier)
    }
    
    func peerConnection(didAddCandidate candidate: RTCIceCandidate) {
        if self.peerConnection?.remoteDescription != nil {
            self.sendCandidate(candidate)
        } else {
            self.queuedLocalCandidates.add(candidate)
        }
    }
    
    func peerConnection(didChangeState state: RTCIceConnectionState) {
        self.connectionDelegate?.stream(self, didChangeConnectionState: state, forUserIdentifier: self.userIdentifier)
    }
    
    func stopPeerConnection() {
        if self.streaming {
            let cameraStreamManager = CameraStreamManager.shared()
            if let localMediaStream = cameraStreamManager.mediaStream() {
                self.peerConnection?.remove(localMediaStream)
            }
        }
        
        if let peerConnection = self.peerConnection {
            if peerConnection.iceConnectionState != RTCIceConnectionState.closed {
                peerConnection.close()
            }
            
            self.peerConnection = nil
        }
        
        self.remoteMediaStream = nil
    }
}

// MARK: Offers & Answers

private extension StreamingManager {
    func sendOffer() {
        let mediaConstraints = self.mediaConstraints(withAudio: self.watching, withVideo: self.watching)
        
        self.peerConnection?.offer(for: mediaConstraints, completionHandler: { [weak self] (sessionDescription, error) in
            Threader.performOnMainThread { [weak self] in
                self?.peerConnection(didCreateSessionDescription: sessionDescription, withError: error)
            }
        })
    }
    
    func receiveAnswer(_ response: String) {
        guard let sessionDescription = self.sessionDescriptionFromString(response, type: RTCSdpType.answer) else {
            return
        }
        
        let adoptedSessionDescription = self.adoptedSessionDescription(sessionDescription, adoptAudio: true)
        self.peerConnection?.setRemoteDescription(adoptedSessionDescription, completionHandler: { [weak self] (error) in
            Threader.performOnMainThread { [weak self] in
                self?.peerConnection(didSetSessionDescriptionWithError: error)
            }
        })
    }
}

// MARK: Sesession Descriptions & Candidates

private extension StreamingManager {
    func sendSessionDescription(_ sessionDescription: RTCSessionDescription?) {
        guard let description = self.sessionDescriptionToString(sessionDescription) else {
            return
        }
        
        self.connectionDelegate?.stream(self, shouldSendSessionDescription: description, forUserIdentifier: self.userIdentifier)
    }
    
    func sendCandidate(_ candidate: RTCIceCandidate?) {
        guard let candidateDictionary = self.candidateToDictionary(candidate) else {
            return
        }
        
        self.connectionDelegate?.stream(self, shouldSendCandidate: candidateDictionary, forUserIdentifier: self.userIdentifier)
    }
    
    func drainLocalCandidates() {
        for localCandidate in self.queuedLocalCandidates {
            if let candidate = localCandidate as? RTCIceCandidate {
                self.sendCandidate(candidate)
            }
        }
        
        self.queuedLocalCandidates.removeAllObjects()
    }
    
    func drainRemoteCandidates() {
        for localCandidate in self.queuedRemoteCandidates {
            if let candidate = localCandidate as? RTCIceCandidate {
                self.peerConnection?.add(candidate)
            }
        }
        
        self.queuedRemoteCandidates.removeAllObjects()
    }
    
    func candidateToDictionary(_ candidate: RTCIceCandidate?) -> [String : Any]? {
        guard let description = candidate?.sdp, let sdpMLineIndex = candidate?.sdpMLineIndex, let sdpMid = candidate?.sdpMid else {
            return nil
        }
        
        let candidateDictionary: [String : Any] = [Keys.candidate : description,
                                                   Keys.sdpMLineIndex : sdpMLineIndex,
                                                   Keys.sdpMid : sdpMid]
        return candidateDictionary
    }
    
    func candidateFromDictionary(_ dictionary: [String : Any]?) -> RTCIceCandidate? {
        guard let description = dictionary?[Keys.candidate] as? String, let sdpMLineIndex = dictionary?[Keys.sdpMLineIndex] as? Int32, let sdpMid = dictionary?[Keys.sdpMid] as? String else {
            return nil
        }
        
        let candidate = RTCIceCandidate(sdp: description, sdpMLineIndex: sdpMLineIndex, sdpMid: sdpMid)
        return candidate
    }
    
    func sessionDescriptionToString(_ sessionDescription: RTCSessionDescription?) -> String? {
        guard let description = sessionDescription?.sdp else {
            return nil
        }
        
        return description
    }
    
    func sessionDescriptionFromString(_ string: String?, type: RTCSdpType) -> RTCSessionDescription? {
        guard let description = string else {
            return nil
        }
        
        let sessionDescription = RTCSessionDescription(type: type, sdp: description)
        return sessionDescription
    }
    
    func adoptedSessionDescription(_ sessionDescription: RTCSessionDescription, adoptAudio: Bool) -> RTCSessionDescription {
        var adoptedSessionDescriptionString = sessionDescription.sdp.replacingOccurrences(of: "UDP/TLS/RTP/SAVPF", with: "RTP/SAVPF")
        let lines = adoptedSessionDescriptionString.components(separatedBy: "\r\n")
        
        if adoptAudio {
            var audioMLineIndex: Int?
            var audioMatch: String?
            let audioRegularExpression = try? NSRegularExpression.init(pattern: "^a=rtpmap:(\\d+) ISAC/16000[\r]?$", options: NSRegularExpression.Options.init(rawValue: 0))
            for index in 0..<lines.count {
                if audioMLineIndex != nil && audioMatch != nil {
                    break
                }
                
                let line = lines[index]
                if line.hasPrefix("m=audio ") {
                    audioMLineIndex = index
                    continue
                }
                
                audioMatch = self.firstMatch(withExpression: audioRegularExpression, inString: line)
            }
            
            if let mLineIndex = audioMLineIndex, let match = audioMatch {
                let lineParts = lines[mLineIndex].components(separatedBy: " ")
                var newMLine: [String] = []
                
                newMLine.append(lineParts[0])
                newMLine.append(lineParts[1])
                newMLine.append(lineParts[2])
                newMLine.append(match)
                
                for index in 4..<lineParts.count {
                    let line = lineParts[index]
                    if match != line {
                        newMLine.append(line)
                    }
                }
                
                var newLines: [String] = []
                newLines += lines
                newLines[mLineIndex] = newMLine.joined(separator: " ")
                
                adoptedSessionDescriptionString = newLines.joined(separator: "\r\n")
            }
        }
        
        let adoptedSessionDescription = RTCSessionDescription.init(type: sessionDescription.type, sdp: adoptedSessionDescriptionString)
        return adoptedSessionDescription
    }
}

// MARK: Stream Constraints

private extension StreamingManager {
    func peerConnectionConstraints(withAudio: Bool, withVideo: Bool) -> RTCMediaConstraints {
        let optionalConstraintes = ["DtlsSrtpKeyAgreement" : "true"]
        
        let peerConnectionConstraints = RTCMediaConstraints(mandatoryConstraints: nil, optionalConstraints: optionalConstraintes)
        return peerConnectionConstraints
    }
    
    func mediaConstraints(withAudio: Bool, withVideo: Bool) -> RTCMediaConstraints {
        let mandatoryConstraints = ["OfferToReceiveAudio" : (withAudio ? "true" : "false"),
                                    "OfferToReceiveVideo" : (withVideo ? "true" : "false")]
        
        let mediaConstraints = RTCMediaConstraints(mandatoryConstraints: mandatoryConstraints, optionalConstraints: nil)
        return mediaConstraints
    }
}

// MARK: Support Methods

private extension StreamingManager {
    func startAudioSession() {
        #if os(OSX)
            return
        #else
            RTCDispatcher.dispatchAsync(on: RTCDispatcherQueueType.typeAudioSession) {
                let session = RTCAudioSession.sharedInstance()
                session.lockForConfiguration()
                try? session.setCategory(AVAudioSession.Category.playAndRecord.rawValue, with: [AVAudioSession.CategoryOptions.defaultToSpeaker, AVAudioSession.CategoryOptions.allowBluetooth, AVAudioSession.CategoryOptions.allowBluetoothA2DP, AVAudioSession.CategoryOptions.allowAirPlay, AVAudioSession.CategoryOptions.mixWithOthers])
                try? session.setMode(AVAudioSession.Mode.videoChat.rawValue)
                try? session.setActive(true)
                session.unlockForConfiguration()
            }
        #endif
    }
    
    func firstMatch(withExpression expression: NSRegularExpression?, inString string: String) -> String? {
        let range = NSMakeRange(0, string.count)
        if let result = expression?.firstMatch(in: string, options: NSRegularExpression.MatchingOptions.init(rawValue: 0), range: range) {
            if result.numberOfRanges > 1 {
                let resultRange = result.range(at: 1)
                let match = (string as NSString).substring(with: resultRange)
                return match
            }
        }
        
        return nil
    }
    
    func signalingStateToString(_ signalingState: RTCSignalingState) -> String {
        switch signalingState {
        case .stable:
            return "stable"
        case .haveLocalOffer:
            return "have local offer"
        case .haveRemoteOffer:
            return "have remote offer"
        case .haveLocalPrAnswer:
            return "have local answer"
        case .haveRemotePrAnswer:
            return "have remote answer"
        case .closed:
            return "closed"
        }
    }
    
    func iceConnectionStateToString(_ iceConnectionState: RTCIceConnectionState) -> String {
        switch iceConnectionState {
        case .new:
            return "new"
        case .checking:
            return "checking"
        case .completed:
            return "completed"
        case .connected:
            return "connected"
        case .disconnected:
            return "disconnected"
        case .failed:
            return "failed"
        case .count:
            return "count"
        case .closed:
            return "closed"
        }
    }
    
    func iceGatheringStateToString(_ iceGatheringState: RTCIceGatheringState) -> String {
        switch iceGatheringState {
        case .new:
            return "new"
        case .gathering:
            return "gathering"
        case .complete:
            return "complete"
        }
    }
}

// MARK: RTCPeerConnectionDelegate

extension StreamingManager: RTCPeerConnectionDelegate {
    func peerConnection(_ peerConnection: RTCPeerConnection, didChange stateChanged: RTCSignalingState) {
        #if DEBUG
            print("\(self) peer сonnection did change signaling state - \(self.signalingStateToString(stateChanged))")
        #endif
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didChange newState: RTCIceConnectionState) {
        #if DEBUG
            print("\(self) peer сonnection did change connection state - \(self.iceConnectionStateToString(newState))")
        #endif
        
        Threader.performOnMainThread { [weak self] in
            self?.peerConnection(didChangeState: newState)
        }
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didChange newState: RTCIceGatheringState) {
        #if DEBUG
            print("\(self) peer сonnection did change gathering state - \(self.iceGatheringStateToString(newState))")
        #endif
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didRemove candidates: [RTCIceCandidate]) {
        #if DEBUG
            print("\(self) peer сonnection did remove \(candidates.count) candidates")
        #endif
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didGenerate candidate: RTCIceCandidate) {
        Threader.performOnMainThread { [weak self] in
            self?.peerConnection(didAddCandidate: candidate)
        }
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didOpen dataChannel: RTCDataChannel) {
        #if DEBUG
            print("\(self) peer сonnection did open data channel")
        #endif
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didRemove stream: RTCMediaStream) {
        Threader.performOnMainThread { [weak self] in
            self?.peerConnection(didRemoveStream: stream)
        }
    }
    
    func peerConnection(_ peerConnection: RTCPeerConnection, didAdd stream: RTCMediaStream) {
        Threader.performOnMainThread { [weak self] in
            self?.peerConnection(didAddStream: stream)
        }
    }
    
    func peerConnectionShouldNegotiate(_ peerConnection: RTCPeerConnection) {
        #if DEBUG
            print("\(self) peer сonnection should negotiate")
        #endif
    }
}
