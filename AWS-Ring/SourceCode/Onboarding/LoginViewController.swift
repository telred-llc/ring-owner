//
//  ViewController.swift
//  ChatQL
//
//  Created by Pham Hoa on 1/10/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import UIKit
import AWSCognitoIdentityProvider
import AWSMobileClient
import AWSAppSync

class LoginViewController: BaseViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupforgotPasswordButton()        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func setupforgotPasswordButton() {
        self.forgotPasswordButton.addTarget(self, action: #selector(moveToForgotPassword), for: .touchUpInside)
    }
    
    @objc func moveToForgotPassword() {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordViewControlller") as? ForgotPasswordViewControlller else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func clickedOnLoginButton(_ sender: Any) {
        self.view.endEditing(true)
        
        if !validate() {
            self.showAlert(title: "Missing information", msg: "Please enter a valid user name and password")
            return
        }
        
        self.showProgressHub()
        AWSMobileClient.sharedInstance().signIn(username: self.usernameTextField.text!, password: self.passwordTextField.text!, completionHandler: { (signInResult, error) in
            self.hideProgressHub()
            if let error = error {
                self.showErrorMessage(error: error, {
                    if let awsClientError = error as? AWSMobileClientError {
                        switch awsClientError {
                        case .userNotConfirmed(message: _):
                            self.showConfirmationVC(type: .signup)
                        default:
                            break
                        }
                    }
                })
            } else if let signInResult = signInResult {
                switch (signInResult.signInState) {
                case .signedIn:
                    AWSMobileClient.sharedInstance().getUserAttributes(completionHandler: { (attrs, error) in
                        if let attrs = attrs, let cognitoId = attrs["sub"] {
                            self.createUserIfNeeded(cognitoId: cognitoId)
                        } else {
                            self.showAlert(title: "ERROR", msg: "Something went wrong!")
                        }
                    })
                case .smsMFA:
                    self.showAlert(title: nil, msg: "SMS message sent to \(signInResult.codeDetails!.destination!)", {
                        self.showConfirmationVC(type: .signin)
                    })
                default:
                    self.showAlert(title: nil, msg: "\(signInResult.signInState.rawValue)")
                }
            }
        })
    }

    func createUserIfNeeded(cognitoId: String) {
        self.showProgressHub()

        appSyncClient?.fetch(query: GetUserQuery.init(id: cognitoId), cachePolicy: CachePolicy.fetchIgnoringCacheData, resultHandler: { (result, error) in
            self.hideProgressHub()
            if let error = error {
                self.showErrorMessage(error: error)
            } else if result?.data?.getUser == nil {
                self.createUser(cognitoId: cognitoId)
            } else {
                Session.shared.meData = result?.data?.getUser
                Switcher.updateRootVC(logined: true)
            }
        })
    }

    func createUser(cognitoId: String) {
        self.showProgressHub()

        let createUserInput = CreateUserInput.init(id: cognitoId, username: self.usernameTextField.text!, registered: true, deviceToken: Session.shared.deviceToken, awsSnsEnpointArn: nil)
        appSyncClient?.perform(mutation: CreateUserMutation.init(input: createUserInput), resultHandler: { (result, error) in
            self.hideProgressHub()
            if let error = error {
                self.showErrorMessage(error: error)
            } else if let result = result {
                if let snapshot = result.data?.createUser?.snapshot {
                    Session.shared.meData = GetUserQuery.Data.GetUser.init(snapshot: snapshot)
                    Switcher.updateRootVC(logined: true)
                }
            }
        })
    }
    
    func validate() -> Bool {
        if (usernameTextField.text ?? "").count == 0 {
            return false
        }
        
        if (passwordTextField.text ?? "").count == 0 {
            return false
        }

        return true
    }
    
    func showConfirmationVC(type: ConfirmationViewController.ConfirmationType) {
        DispatchQueue.main.async {
            let confirmVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ConfirmationViewController") as! ConfirmationViewController
            confirmVC.confirmType = type
            confirmVC.username = self.usernameTextField.text ?? ""
            self.navigationController?.pushViewController(confirmVC, animated: true)
        }
    }
}
