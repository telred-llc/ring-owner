//
//  LoginScreen.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/12/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI
import AWSMobileClient
import AWSAppSync


struct LoginScreen: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    @State private var isShowConfirmation = false
    @State private var type: ConfirmationScreen.ConfirmationType = .signin
    
    var body: some View {
        return VStack(spacing: 20) {
            renderComponents()
            renderUI()
        }
        .padding(.all, 30)
        .navigationBarTitle("Login")
    }
    
    private func renderComponents() -> some View {
        Group {
            //MARK: - Alert view
            AlertView(title: $viewModel.titleAlert, data: $viewModel.alertResponse, message: $viewModel.messageAlert, isShowing: $viewModel.isShowAlert) { (data) in
                self.handleDismissAlertComplete(data: data)
            }
            
            //MARK: - NavigationLink auto
            NavigationLink(destination: ConfirmationScreen(type: type), isActive: $isShowConfirmation) {
                Text("")
            }
        }
        
    }
    
    private func renderUI() -> some View {
        Group {
            Image("Icon-Small")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .padding(16)
                .padding(.bottom, 30)
            
            InputViewCustom(placeholder: "Username*", value: $viewModel.username)
            SecureTextFieldCustom(placeholder: "Password*", value: $viewModel.password)
            
            Button("LOGIN") {
                self.viewModel.login()
            }
            .modifier(LoginButtonModifier())
            
            NavigationLink(destination: ForgotPasswordScreen()) {
                Text("Forgot password")
                    .foregroundColor(Color.gray)
                    .padding(.top, 20)
            }
            
            HStack(spacing: 8) {
                Text("You don't have an account?")
                    .foregroundColor(Color.gray.opacity(0.8))
                NavigationLink(destination: RegisterScreen()) {
                    Text("Register")
                        .foregroundColor(Color.blue)
                }
            }
            Spacer()
            Spacer()
        }
        
    }
    
    private func handleDismissAlertComplete(data: Any?) {
        if let error = data as? Error {
            if let awsClientError = error as? AWSMobileClientError {
                switch awsClientError {
                case .userNotConfirmed(message: _):
                    self.showConfirmationVC(type: .signup)
                default:
                    break
                }
            } else if let appSyncError = error as? AWSAppSyncClientError {
                switch appSyncError {
                case .authenticationError(_):
                    Session.shared.signOut()
                    Switcher.updateRootVC(logined: false)
                case .requestFailed(_ , let response, let error):
                    if response?.statusCode == 401 {
                        Session.shared.signOut()
                        Switcher.updateRootVC(logined: false)
                    } else {
                        self.viewModel.showAlert(title: "Error", mess: error?.localizedDescription, data: nil)
                    }
                default:
                    self.viewModel.showAlert(title: "Error", mess: error.localizedDescription, data: nil)
                    
                }
            }
        } else if let res = data as? SignInResult {
            switch res.signInState {
            case .smsMFA:
                self.showConfirmationVC(type: .signin)
            default:
                break
            }
        }
    }
    
    private func showConfirmationVC(type: ConfirmationViewController.ConfirmationType) {
        isShowConfirmation = true
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

