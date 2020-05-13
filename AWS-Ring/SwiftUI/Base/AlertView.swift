//
//  AlertView.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/12/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI
import AWSMobileClient
import AWSAppSync

struct AlertView: View {
    @Binding var title: String
    @Binding var data: Any?
    @Binding var message: String?
    @Binding var isShowing: Bool
    var completion: ((_ error: Any?) -> Void)?
    
    var body: some View {
        return renderView()
    }
    
    private func renderView() -> some View {
        VStack() {Button("") {}}.alert(isPresented: $isShowing) { () -> Alert in
            Alert(title: Text($title.wrappedValue), message: Text(getMessage()), dismissButton: .default(Text("OK"), action: {
                self.handleDismissAlertComplete(data: self.data)
                self.completion?(self.data)
            }))
        }
        
    }
    
    private func handleDismissAlertComplete(data: Any?) {
        if let error = data as? Error {
           if let appSyncError = error as? AWSAppSyncClientError {
                switch appSyncError {
                case .authenticationError(_):
                    Session.shared.signOut()
                    Switcher.updateRootVC(logined: false)
                case .requestFailed(_ , let response, _):
                    if response?.statusCode == 401 {
                        Session.shared.signOut()
                        Switcher.updateRootVC(logined: false)
                    } 
                default:
                    break
                }
            }
        }
    }
    
    func getMessage() -> String {
        var errorMessage = ""
        if (message?.isEmpty ?? true) || message == nil {
            if let error = data as? Error {
                if let error = error as? AWSMobileClientError {
                    
                    switch error {
                    case .aliasExists(let message):
                        errorMessage = message
                    case .codeDeliveryFailure(let message):
                        errorMessage = message
                    case .codeMismatch(let message):
                        errorMessage = message
                    case .expiredCode(let message):
                        errorMessage = message
                    case .groupExists(let message):
                        errorMessage = message
                    case .internalError(let message):
                        errorMessage = message
                    case .invalidLambdaResponse(let message):
                        errorMessage = message
                    case .invalidOAuthFlow(let message):
                        errorMessage = message
                    case .invalidParameter(let message):
                        errorMessage = message
                    case .invalidPassword(let message):
                        errorMessage = message
                    case .invalidUserPoolConfiguration(let message):
                        errorMessage = message
                    case .limitExceeded(let message):
                        errorMessage = message
                    case .mfaMethodNotFound(let message):
                        errorMessage = message
                    case .notAuthorized(let message):
                        errorMessage = message
                    case .passwordResetRequired(let message):
                        errorMessage = message
                    case .resourceNotFound(let message):
                        errorMessage = message
                    case .scopeDoesNotExist(let message):
                        errorMessage = message
                    case .softwareTokenMFANotFound(let message):
                        errorMessage = message
                    case .tooManyFailedAttempts(let message):
                        errorMessage = message
                    case .tooManyRequests(let message):
                        errorMessage = message
                    case .unexpectedLambda(let message):
                        errorMessage = message
                    case .userLambdaValidation(let message):
                        errorMessage = message
                    case .userNotConfirmed(let message):
                        errorMessage = message
                    case .userNotFound(let message):
                        errorMessage = message
                    case .usernameExists(let message):
                        errorMessage = message
                    case .unknown(let message):
                        errorMessage = message
                    case .notSignedIn(let message):
                        errorMessage = message
                    case .identityIdUnavailable(let message):
                        errorMessage = message
                    case .guestAccessNotAllowed(let message):
                        errorMessage = message
                    case .federationProviderExists(let message):
                        errorMessage = message
                    case .cognitoIdentityPoolNotConfigured(let message):
                        errorMessage = message
                    case .unableToSignIn(let message):
                        errorMessage = message
                    case .invalidState(let message):
                        errorMessage = message
                    case .userPoolNotConfigured(let message):
                        errorMessage = message
                    case .userCancelledSignIn(let message):
                        errorMessage = message
                    case .badRequest(let message):
                        errorMessage = message
                    case .expiredRefreshToken(let message):
                        errorMessage = message
                    case .errorLoadingPage(let message):
                        errorMessage = message
                    case .securityFailed(let message):
                        errorMessage = message
                    case .idTokenNotIssued(let message):
                        errorMessage = message
                    case .idTokenAndAcceessTokenNotIssued(let message):
                        errorMessage = message
                    case .invalidConfiguration(let message):
                        errorMessage = message
                    case .deviceNotRemembered(let message):
                        errorMessage = message
                    }
                } else if let appSyncError = error as? AWSAppSyncClientError {
                    switch appSyncError {
                    case .requestFailed(_ , let response, _):
                        if response?.statusCode == 401 {
                            errorMessage = "Token expired!"
                        }
                    default:
                        break
                    }
                }
                else {
                    errorMessage = error.localizedDescription
                }
            }
        } else if let mess = message {
            return mess
            
        }
        return errorMessage
    }
}
