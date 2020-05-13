//
//  ConfirmForgotPassViewModel.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/15/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import Foundation
import AWSMobileClient

final class ConfirmForgotPassViewModel: BaseObservableObject {
    
    @Published var code: String = ""
    @Published var newPass: String = ""
    @Published var username = ""
    
    private func validate() -> Bool {
        guard !code.isEmpty, !newPass.isEmpty else {
            self.showAlert(title: "Error", mess: "Please input all field!", data: nil)
            return false
        }
        return true
    }
    
    func changePassword() {
        guard validate() else {
            return
        }
        Untils.baseViewController.showProgressHub()
        AWSMobileClient.sharedInstance().confirmForgotPassword(username: username, newPassword: newPass, confirmationCode: code) { (result, error) in
            Untils.baseViewController.hideProgressHub()
            if let error = error {
                self.showAlert(title: "Error", mess: nil, data: error)
            } else {
                switch result?.forgotPasswordState{
                case .done:
                    self.showAlert(title: "Successed", mess: "Change password successfuly!", data: result)
                default:
                    break
                }
            }
        }
    }
    
    func resendCode() {
        Untils.baseViewController.showProgressHub()
        AWSMobileClient.sharedInstance().forgotPassword(username: username) { (result, error) in
            Untils.baseViewController.hideProgressHub()
            if let error = error {
                //TODO:
                self.showAlert(title: "Error", mess: nil, data: error)
            } else {
                switch result?.forgotPasswordState {
                case .confirmationCodeSent:
                    //TODO: goto confirm pass
                    self.showAlert(title: "Successed", mess: "A verification code has been sent via your email", data: nil)
                default:
                    break
                }
            }
        }
    }
    
}
