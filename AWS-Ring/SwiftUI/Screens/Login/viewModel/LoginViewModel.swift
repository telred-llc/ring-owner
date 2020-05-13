//
//  LoginViewModel.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/13/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI
import Combine
import AWSCognitoIdentityProvider
import AWSMobileClient
import AWSAppSync

final class LoginViewModel: BaseObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    //MARK: -Publish function
    func login() {
        guard validate() else {
            return
        }
        loginToServer()
    }
    
    //MARK: -Private function
    private func validate() -> Bool {
        guard !username.isEmpty, !password.isEmpty else {
            showAlert(title: "ERROR", mess: "Please input all field!", data: nil)
            return false
        }
        return true
    }
    
    private func loginToServer() {
        Untils.baseViewController.showProgressHub()
        AWSMobileClient.sharedInstance().signIn(username: username, password: password) { [weak self] (response, error) in
            Untils.baseViewController.hideProgressHub()
            guard let `self` = self else {
                return
            }
            if let error = error {
                self.showAlert(title: "Error", mess: nil, data: error)
            } else if let response = response {
                switch (response.signInState) {
                case .signedIn:
                    AWSMobileClient.sharedInstance().getUserAttributes(completionHandler: { (attrs, error) in
                        if let attrs = attrs, let cognitoId = attrs["sub"] {
                            self.createUserIfNeeded(cognitoId: cognitoId)
                        } else {
                            self.showAlert(title: "ERROR", mess: "Something went wrong!", data: nil)
                        }
                    })
                case .smsMFA:
                    self.showAlert(title: nil, mess: "SMS message sent to \(response.codeDetails!.destination!)", data: response)
                default:
                    self.showAlert(title: "ERROR", mess: "\(response.signInState.rawValue)", data: nil)
                    
                }
            }
        }
    }
    
    private func createUserIfNeeded(cognitoId: String) {
        Untils.baseViewController.showProgressHub()
        
        appSyncClient?.fetch(query: GetUserQuery.init(id: cognitoId), cachePolicy: CachePolicy.fetchIgnoringCacheData, resultHandler: { [weak self] (result, error) in
            guard let `self` = self else {
                return
            }
            Untils.baseViewController.hideProgressHub()
            if let error = error {
                self.showAlert(title: "Error", mess: nil, data: error)
            } else if result?.data?.getUser == nil {
                self.createUser(cognitoId: cognitoId)
            } else {
                Session.shared.meData = result?.data?.getUser
                Switcher.updateRootVC(logined: true)
            }
        })
    }
    
    private func createUser(cognitoId: String) {
        Untils.baseViewController.showProgressHub()
        let createUserInput = CreateUserInput.init(id: cognitoId, username: self.username, registered: true, deviceToken: Session.shared.deviceToken, awsSnsEnpointArn: nil)
        appSyncClient?.perform(mutation: CreateUserMutation.init(input: createUserInput), resultHandler: { [weak self] (result, error) in
            guard let `self` = self else {
                return
            }
            Untils.baseViewController.hideProgressHub()
            if let error = error {
                self.showAlert(title: "Error", mess: nil, data: error)
            } else if let result = result {
                if let snapshot = result.data?.createUser?.snapshot {
                    Session.shared.meData = GetUserQuery.Data.GetUser.init(snapshot: snapshot)
                    Switcher.updateRootVC(logined: true)
                }
            }
        })
    }
}
