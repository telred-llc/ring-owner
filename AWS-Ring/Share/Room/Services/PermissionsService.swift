//
//  PermissionsService.swift
//  GoChat
//
//  Created by Daniil on 21.12.2017.
//  Copyright © 2017 ForaSoft. All rights reserved.
//

import Foundation
import AVKit

// MARK: Public Methods Definition

private protocol PublicMethods {
    func checkMicrophonePermission() -> Bool
    func checkCameraPermission() -> Bool
    func requestMicrophonePermission(_ completion: ((_ granted: Bool) -> ())?)
    func requestCameraPermission(_ completion: ((_ granted: Bool) -> ())?)
}

// MARK: Class Definition

/// Checks the permissions to the resources and services of the phone.
class PermissionsService {
    
}

// MARK: Public Methods

extension PermissionsService: PublicMethods {
    /// Checks the microphone permission.
    ///
    /// - Returns: True if access granted and false otherwise.
    func checkMicrophonePermission() -> Bool {
        let recordPermission = AVAudioSession.sharedInstance().recordPermission
        switch recordPermission {
        case .granted:
            return true
        default:
            return false
        }
    }
    
    /// Checks the camera permission.
    ///
    /// - Returns: True if access granted and false otherwise.
    func checkCameraPermission() -> Bool {
        let recordPermission = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch recordPermission {
        case .authorized:
            return true
        default:
            return false
        }
    }
    
    /// Checks the microphone permission and requests it if not determined.
    ///
    /// - Parameter completion: Returns true if access granted and false otherwise. Called on the main thread.
    func requestMicrophonePermission(_ completion: ((_ granted: Bool) -> ())?) {
        let recordPermission = AVAudioSession.sharedInstance().recordPermission
        switch recordPermission {
        case .undetermined:
            AVAudioSession.sharedInstance().requestRecordPermission({ (granted) in
                Threader.performOnMainThread({
                    completion?(granted)
                })
            })
            break
        case .granted:
            Threader.performOnMainThread({
                completion?(true)
            })
            break
        default:
            Threader.performOnMainThread({
                completion?(false)
            })
            break
        }
    }
    
    /// Checks the camera permission and requests it if not determined.
    ///
    /// - Parameter completion: Returns true if access granted and false otherwise. Called on the main thread.
    func requestCameraPermission(_ completion: ((_ granted: Bool) -> ())?) {
        let recordPermission = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch recordPermission {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted) in
                Threader.performOnMainThread({
                    completion?(granted)
                })
            })
            break
        case .authorized:
            Threader.performOnMainThread({
                completion?(true)
            })
            break
        default:
            Threader.performOnMainThread({
                completion?(false)
            })
            break
        }
    }
}
