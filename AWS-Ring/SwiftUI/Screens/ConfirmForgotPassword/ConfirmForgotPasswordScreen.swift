//
//  ConfirmForgotPassword.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/14/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI
import AWSMobileClient

struct ConfirmForgotPasswordScreen: View {

    var username: String
    @ObservedObject private var viewModel = ConfirmForgotPassViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            AlertView(title: $viewModel.titleAlert, data: $viewModel.alertResponse, message: $viewModel.messageAlert, isShowing: $viewModel.isShowAlert) { (data) in
                self.handleDismiss(data: data)
            }
            Text("Enter your verifycation code to set new password")
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.gray)
            InputViewCustom(placeholder: "Verify Code*", value: $viewModel.code)
            InputViewCustom(placeholder: "New password*", value: $viewModel.newPass)
            Button("Submit") {
                self.viewModel.changePassword()
            }.modifier(LoginButtonModifier())
            
            Button("Resend Code") {
                self.viewModel.resendCode()
            }
            Spacer()
        }
        .padding(30)
        .padding(.top, 30)
        .navigationBarTitle("Confirm Password")
        .onAppear() {
            self.viewModel.username = self.username
        }
    }
    
    private func handleDismiss(data: Any?) {
        if let data = data as? ForgotPasswordResult {
            switch data.forgotPasswordState {
            case .done:
                Session.shared.signOut()
                Switcher.updateRootVC(logined: false)
            default:
                break
            }
        }
    }
   
}

struct ConfirmForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmForgotPasswordScreen(username: "")
    }
}
