//
//  CQLError.swift
//  ChatQL
//
//  Created by Pham Hoa on 1/17/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import Foundation

enum ARLError: Error {
    case unknownError
    case imageFormatError

    var localizedDescription: String {
        get {
            switch self {
            case .unknownError:
                return "Something went wrong!"
            case .imageFormatError:
                return "Image format is not supported!"
            }
        }
    }
}
