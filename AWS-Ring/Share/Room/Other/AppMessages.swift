//
//  AppMessages.swift
//  GoChat
//
//  Created by Daniil on 29.12.2017.
//  Copyright © 2017 ForaSoft. All rights reserved.
//

import Foundation

// MARK: Structure Definition

/// Titles, messages, instructions and other application texts.
struct AppMessage {
    
    enum ErrorMessages: String {
        case connectionProblems = "Connection problems. Please check your internet connection and try again."
        case invalidRoomIdentifier = "Room ID is empty."
        case mediaPermissions = "Camera and microphone permission denied."
        case microphonePermission = "Microphone permission denied."
        case cameraPermission = "Camera permission denied."
    }
    
    enum ErrorTitles: String {
        case commonError = "An error occured"
        case permission = "Grant permission to continue."
        case permissions = "Grant permissions to continue."
    }
    
    enum InfoMessages: String {
        case forceLogout = "You have been log out cause of the users identifiers conflict."
        case yourName = "You"
    }
    
    enum ButtonTitles: String {
        case confirm = "Ok"
        case cancel = "Cancel"
        case settings = "Open settings"
    }
    
}
