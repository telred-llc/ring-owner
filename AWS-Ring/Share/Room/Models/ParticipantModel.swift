//
//  ParticipantModel.swift
//  GoChat
//
//  Created by Daniil on 26.12.2017.
//  Copyright © 2017 ForaSoft. All rights reserved.
//

import Foundation

// MARK: Structure Definition

struct ParticipantModel {
    
    // MARK: Properties
    
    var identifier: String!
    
    // MARK: Init Methods
    
    /// Initialize participant model from data if it is valid.
    ///
    /// - Parameter data: Initialization data.
    /// - Returns: Participant model  or nil.
    static func participant(withData data: Any?) -> ParticipantModel? {
        if let identifier = data as? String {
            return ParticipantModel(identifier: identifier)
        }
        
        return nil
    }
    
}
