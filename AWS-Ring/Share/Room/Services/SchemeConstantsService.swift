//
//  SchemeConstantsService.swift
//  GoChat
//
//  Created by Daniil on 21.12.2017.
//  Copyright © 2017 ForaSoft. All rights reserved.
//

import Foundation

// MARK: Public Methods Definition

private protocol PublicMethods {
    func socketServerAddress() -> String?
}

// MARK: Class Definition

/// Gets user-defined values from Info.plist.
class SchemeConstantsService {
    
    private struct Keys {
        static let userDefinedConstaints = "GCUserDefinedConstaints"
        
        static let socketServerAddress = "socket_server_address"
        static let hockeyAppApplicationIdentifier = "hockeyapp_app_identifier"
    }
    
    // MARK: Private Properties
    
    private var info: [String : Any]?
    
    // MARK: Init Methods & Superclass Overriders
    
    init() {
        self.info = Bundle.main.object(forInfoDictionaryKey: Keys.userDefinedConstaints) as? [String : Any]
    }
    
}

// MARK: Public Methods

extension SchemeConstantsService: PublicMethods {
    /// Gets socket server address for current build scheme.
    ///
    /// - Returns: Socket server address as a string or nil.
    func socketServerAddress() -> String? {
        return self.stringValue(forKey: Keys.socketServerAddress)
    }
}

// MARK: Private Methods

private extension SchemeConstantsService {
    func stringValue(forKey key: String) -> String? {
        if let string = self.info?[key] as? String {
            let clearString = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            return clearString
        }
        
        return nil
    }
}
