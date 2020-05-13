//
//  BaseObservableObject.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/15/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import Foundation
import SwiftUI

class BaseObservableObject: ObservableObject {
    @Published var titleAlert: String = ""
    @Published var alertResponse: Any?
    @Published var messageAlert: String?
    @Published var isShowAlert = false
    @Published var complete: (() -> Void)?
    let appSyncClient = Untils.shared.getAppSync()

    func showAlert(title: String?, mess: String?, data: Any?) {
        DispatchQueue.main.async {
            self.titleAlert = title ?? ""
            self.messageAlert = mess
            self.alertResponse = data
            self.isShowAlert = true
        }
    }
    
}
