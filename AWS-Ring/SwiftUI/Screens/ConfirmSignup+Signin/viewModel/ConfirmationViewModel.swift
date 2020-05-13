//
//  ConfirmationViewModel.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/15/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import Foundation
import AWSMobileClient

final class ConfirmationViewModel: BaseObservableObject {
    
    @Published var code: String = ""
    @Published var username: String = ""
    
    func confirmSignup() {
        Untils.baseViewController.showProgressHub()
        AWSMobileClient.sharedInstance().confirmSignUp(username: username, confirmationCode: code) { (signUpResult, error) in
            Untils.baseViewController.hideProgressHub()
            if let signUpResult = signUpResult {
                switch(signUpResult.signUpConfirmationState) {
                case .confirmed:
                    self.showAlert(title: "Verified", mess: "Your account has been successfully verified!", data: signUpResult)
//                    self.showAlert(title: "Verified!", msg: "Your account has been successfully verified!", {
//                        Switcher.updateRootVC(logined: false)
//                    })
                case .unconfirmed:
                    self.showAlert(title: "", mess: "User is not confirmed and needs verification via \(signUpResult.codeDeliveryDetails!.deliveryMedium) sent at \(signUpResult.codeDeliveryDetails!.destination!)", data: signUpResult)
                case .unknown:
                    self.showAlert(title: "Error", mess: "Somthing went wrong!", data: nil)
                }
            } else if let error = error {
                self.showAlert(title: "Error", mess: nil, data: error)
            }
        }
    }
    
    func confirmSignin() {
        Untils.baseViewController.showProgressHub()
        AWSMobileClient.sharedInstance().confirmSignIn(challengeResponse: code) { (signInResult, error) in
            Untils.baseViewController.hideProgressHub()
            if let error = error  {
                self.showAlert(title: "Error", mess: nil, data: error)
            } else if let signInResult = signInResult {
                switch (signInResult.signInState) {
                case .signedIn:
                    print("User is signed in.")
                    Switcher.updateRootVC(logined: true)
                default:
                    self.showAlert(title: "", mess: "\(signInResult.signInState.rawValue)", data: error)
                }
            }
        }
    }
    
    func resendCode() {
        Untils.baseViewController.showProgressHub()
        AWSMobileClient.sharedInstance().resendSignUpCode(username: username, completionHandler: { (result, error) in
            
            Untils.baseViewController.hideProgressHub()
            
            if let signUpResult = result {
                self.showAlert(title: "Successed", mess: "A verification code has been sent via \(signUpResult.codeDeliveryDetails!.deliveryMedium) at \(signUpResult.codeDeliveryDetails!.destination!)", data: nil)
            } else if let error = error {
                self.showAlert(title: "Error", mess: nil, data: error)
            }
        })
    }
    
}
