//
//  ForgotPassword.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/12/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI
import AWSMobileClient

struct ForgotPasswordScreen: View {
    @State private var username = ""
    @State private var titleAlert: String = ""
    @State private var alertResponse: Any?
    @State private var messageAlert: String?
    @State private var isShowAlert = false
    @State private var isConfirmCode = false
    
    var body: some View {
        
        VStack(spacing: 20) {
            NavigationLink(destination: ConfirmForgotPasswordScreen(username: username), isActive: $isConfirmCode) {
                Text("")
            }
            AlertView(title: $titleAlert, data: $alertResponse, message: $messageAlert, isShowing: $isShowAlert) { (data) in
                
            }
            InputViewCustom(placeholder: "Username*", value: $username)
            Button("Submit") {
                //Todo:
                self.resetPass()
            }
            .modifier(LoginButtonModifier())
            Spacer()
        }
        .padding(.all, 30)
        .padding(.top, 30)
        .navigationBarTitle("Forgot Password")
    }
    
    private func resetPass() {
        guard validate() else {
            return
        }
        Untils.baseViewController.showProgressHub()
        AWSMobileClient.sharedInstance().forgotPassword(username: username) {(result, error) in
           
            Untils.baseViewController.hideProgressHub()
            if let error = error {
                //TODO:
                self.showAlert(title: "Error", mess: nil, data: error)
            } else {
                switch result?.forgotPasswordState {
                case .confirmationCodeSent:
                    //TODO: goto confirm pass
                    self.isConfirmCode = true
                    
                default:
                    break
                }
            }
        }
    }
    
    private func validate() -> Bool {
        guard !username.isEmpty else {
            self.showAlert(title: "Error", mess: "Please input username", data: nil)
            return false
        }
        return true
    }
    
    func showAlert(title: String?, mess: String?, data: Any?) {
        DispatchQueue.main.async {
            self.titleAlert = title ?? ""
            self.messageAlert = mess
            self.alertResponse = data
            self.isShowAlert = true
        }
    }
    
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordScreen()
    }
}
