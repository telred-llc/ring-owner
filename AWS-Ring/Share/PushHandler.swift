//
//  PushHandler.swift
//  AWS-Ring
//
//  Created by Pham Hoa on 4/4/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import Foundation

class PushHandler {
    static let shared = PushHandler.init()

    // save deviceIds
    var processQueue: [String] = []

    private init() {
        //
    }
}
