//
//  Switcher.swift
//  ChatQL
//
//  Created by Pham Hoa on 1/10/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import UIKit
import SwiftUI

class Switcher {
    static var rootVC : UIViewController?

    static func updateRootVC(logined: Bool) {

        if logined {
//            rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplitViewController")
            rootVC = UIHostingController(rootView: MainScreen())
        }
        else {
            rootVC = UIHostingController(rootView: LoginScreen())
            
        }
        
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            if rootVC?.isKind(of: UISplitViewController.self) == true  {
                (rootVC as! UISplitViewController).delegate = appDelegate
                appDelegate.window?.rootViewController = rootVC
            } else if rootVC?.isKind(of: UINavigationController.self) == true {
                appDelegate.window?.rootViewController = rootVC
            } else {
                appDelegate.window?.rootViewController = UINavigationController.init(rootViewController: rootVC!)
            }
            appDelegate.window?.makeKeyAndVisible()
        }
    }
}
