//
//  IceServersModel.swift
//  GoChat
//
//  Created by Daniil on 26.12.2017.
//  Copyright © 2017 ForaSoft. All rights reserved.
//

import Foundation

// MARK: Structure Definition

struct IceServersModel {
    
    private enum Keys {
        static let stunAddresses = "stuns"
        static let turnAddresses = "turns"
    }
    
    // MARK: Properties
    
    var stunServers: [IceServerModel]?
    var turnServers: [IceServerModel]?
    
    // MARK: Init Methods
    
    /// Initialize ice servers model from data if it is valid.
    ///
    /// - Parameter data: Initialization data.
    /// - Returns: Ice servers model  or nil.
    static func servers(withData data: Any?) -> IceServersModel? {
        if let dictionary = data as? [String : Any] {
            var stunServers: [IceServerModel] = []
            if let stuns = dictionary[Keys.stunAddresses] as? [[String : Any]] {
                for data in stuns {
                    if let server = IceServerModel.stunServer(withData: data) {
                        stunServers.append(server)
                    }
                }
            }
            
            var turnServers: [IceServerModel] = []
            if let turns = dictionary[Keys.turnAddresses] as? [[String : Any]] {
                for data in turns {
                    if let server = IceServerModel.turnServer(withData: data) {
                        turnServers.append(server)
                    }
                }
            }
            
            return IceServersModel(stunServers: stunServers, turnServers: turnServers)
        }
        
        return nil
    }
    
}

// MARK: Structure Definition

struct IceServerModel {
    
    private enum Keys {
        static let address = "url"
        static let username = "username"
        static let password = "credential"
    }
    
    // MARK: Properties
    
    var address: String!
    var username: String?
    var password: String?
    
    // MARK: Init Methods
    
    /// Initialize stun server model from data if it is valid.
    ///
    /// - Parameter data: Initialization data.
    /// - Returns: Stun server model  or nil.
    static func stunServer(withData data: Any?) -> IceServerModel? {
        if let dictionary = data as? [String : Any] {
            if let address = dictionary[Keys.address] as? String {
                let clearAddress = address.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                if !clearAddress.hasPrefix("stun:") {
                    let fullAddress = "stun:" + clearAddress
                    return IceServerModel(address: fullAddress, username: nil, password: nil)
                } else {
                    return IceServerModel(address: clearAddress, username: nil, password: nil)
                }
            }
        }
        
        return nil
    }
    
    /// Initialize turn server model from data if it is valid.
    ///
    /// - Parameter data: Initialization data.
    /// - Returns: Turn server model  or nil.
    static func turnServer(withData data: Any?) -> IceServerModel? {
        if let dictionary = data as? [String : Any] {
            if let address = dictionary[Keys.address] as? String, let username = dictionary[Keys.username] as? String, let password = dictionary[Keys.password] as? String {
                let clearAddress = address.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                if !clearAddress.hasPrefix("turn:") {
                    let fullAddress = "turn:" + clearAddress
                    return IceServerModel(address: fullAddress, username: username, password: password)
                } else {
                    return IceServerModel(address: clearAddress, username: username, password: password)
                }
            }
        }
        
        return nil
    }
    
}
