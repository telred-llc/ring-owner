//
//  ContentView.swift
//  SwiftUI Test
//
//  Created by Vu Vuong on 11/11/19.
//  Copyright © 2019 Vu Vuong. All rights reserved.
//

import SwiftUI
import AWSMobileClient
import AWSAppSync

struct RegisterScreen: View {
    
    @State private var isShowPicker = false
    
    @ObservedObject private var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            AlertView(title: $viewModel.titleAlert, data: $viewModel.alertResponse, message: $viewModel.messageAlert, isShowing: $viewModel.isShowAlert) { (data) in
                self.handleDismissAlertComplete(data: data)
            }
            InputViewCustom(placeholder: "Username*", value: $viewModel.username)
            InputViewCustom(placeholder: "Password*", value: $viewModel.password)
            InputViewCustom(placeholder: "Email*", value: $viewModel.email)
            NavigationLink(destination: CountryPicker(phoneCodeDataSource: $viewModel.phoneCodeDataSource, showing: $isShowPicker, model: $viewModel.phoneModel), isActive: $isShowPicker) {
                Text(String(format: "+%@ %@", viewModel.phoneModel?.phoneCode ?? "", viewModel.phoneModel?.countryName ?? "" ))
                    .multilineTextAlignment(.leading)
                    .padding()
                    .foregroundColor(Color.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.2))
            }
            
            InputViewCustom(placeholder: "Phone*", value: $viewModel.phone)
            
            Button("REGISTER") {
                self.viewModel.register()
            }
            .modifier(LoginButtonModifier())
            Spacer()
            Spacer()
        }
        .padding(.all, 30)
        .padding(.top, 30)
        .navigationBarTitle("Register")
    }
    
    private func handleDismissAlertComplete(data: Any?) {
        if let res = data as? SignUpResult {
            switch res.signUpConfirmationState {
            case .confirmed:
                Switcher.updateRootVC(logined: false)
            case .unconfirmed:
                showConfirmationVC(type: .signup)
            default:
                break
            }
        }
    }
    
    private func showConfirmationVC(type: ConfirmationViewController.ConfirmationType) {
           self.viewModel.showAlert(title: "PUSH", mess: "Goto ConfirmationScreen", data: nil)
           
       }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        RegisterScreen()
    }
}
