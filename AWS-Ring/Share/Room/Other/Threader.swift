//
//  Threader.swift
//  GoChat
//
//  Created by Daniil on 26.12.2017.
//  Copyright © 2017 ForaSoft. All rights reserved.
//

import Foundation

class Threader {
    static func performOnMainThread(_ block: (() -> ())?) {
        guard let executableCode = block else {
            return
        }
        
        if Thread.current.isMainThread {
            executableCode()
        } else {
            DispatchQueue.main.async {
                executableCode()
            }
        }
    }
}
