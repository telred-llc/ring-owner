//
//  Session.swift
//  ChatQL
//
//  Created by Pham Hoa on 1/15/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import UIKit
import AWSSNS
import AWSMobileClient

class Session {
    static let shared = Session()
    
    var meData: GetUserQuery.Data.GetUser? {
        didSet {
            self.updateDeviceTokenIfNeed()
        }
    }
    
    var deviceToken: String? {
        get {
            return UserDefaults.standard.value(forKey: "deviceToken") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "deviceToken")
            UserDefaults.standard.synchronize()
            
            self.updateDeviceTokenIfNeed()
        }
    }
    
    var lastCredential: (String?, String?)? {
        get {
            let username = UserDefaults.standard.value(forKey: "username") as? String
            let password = UserDefaults.standard.value(forKey: "password") as? String
         
            if username != nil && password != nil {
                return (username!, password!)
            } else {
                return nil
            }
        }
        set {
            UserDefaults.standard.set(lastCredential?.0, forKey: "username")
            UserDefaults.standard.set(lastCredential?.1, forKey: "password")
            UserDefaults.standard.synchronize()
        }
    }
    
    var latestAwsAuthToken: String? {
        get {
            return UserDefaults.standard.value(forKey: "latestAwsAuthToken") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "latestAwsAuthToken")
            UserDefaults.standard.synchronize()
        }
    }
    
    // MARK: Public functions
    
    func signOut() {
        self.clearCurrentSession {
            AWSMobileClient.sharedInstance().signOut()
            self.latestAwsAuthToken = nil
        }
    }

    func update(cameras: [String]?, _ completion: @escaping ((Error?) -> Void)) {
        guard let userId = meData?.id else {
            completion(nil)
            return
        }

        let input = UpdateUserInput.init(id: userId, username: meData?.username, registered: meData?.registered, deviceToken: meData?.deviceToken, awsSnsEnpointArn: meData?.awsSnsEnpointArn, cameras: cameras)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.appSyncClient?.perform(mutation: UpdateUserMutation.init(input: input)) { (_, error) in
            if error == nil {
                self.meData?.cameras = cameras
                completion(nil)
            } else {
                completion(error)
            }
        }
    }
}

private extension Session {
    
    func clearCurrentSession(_ completion: @escaping (() -> Void)) {
        self.update(deviceToken: nil, awsSNSEnpointARN: nil, {
            completion()
        })
    }

    func updateDeviceTokenIfNeed() {
        if meData != nil  {

            // deviceToken is not nil
            if let deviceToken = self.deviceToken, deviceToken.count > 0, let endpointArn = self.createSNSPlatformEndpoint(from: deviceToken) {
                self.update(deviceToken: deviceToken, awsSNSEnpointARN: endpointArn, {
                    
                })
            } else { // deviceToken is nil
                self.update(deviceToken: nil, awsSNSEnpointARN: nil, {
                    
                })
            }
        }
    }
    
    func update(deviceToken: String?, awsSNSEnpointARN: String?, _ completion: @escaping (() -> Void)) {
        guard let userId = meData?.id else {
            completion()
            return
        }

        let input = UpdateUserInput.init(id: userId, username: meData?.username, registered: meData?.registered, deviceToken: deviceToken, awsSnsEnpointArn: awsSNSEnpointARN)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.appSyncClient?.perform(mutation: UpdateUserMutation.init(input: input)) { (_, _) in
            completion()
        }
    }

    func createSNSPlatformEndpoint(from deviceToken: String) -> String? {
        /// Create a platform endpoint. In this case, the endpoint is a
        /// device endpoint ARN
        
        let credentialsProvider = AWSStaticCredentialsProvider.init(accessKey: Constant.ASWConfiguration.CredentialsProvider.accessKey, secretKey: Constant.ASWConfiguration.CredentialsProvider.secretKey)
        
        if let snsConfig = AWSServiceConfiguration.init(region: .USEast1, credentialsProvider: credentialsProvider) {
            AWSSNS.register(with: snsConfig, forKey: "AWSSNS")
        }

        if let request = AWSSNSCreatePlatformEndpointInput.init() {
            request.token = deviceToken
            request.platformApplicationArn = Constant.ASWConfiguration.snsPlatformApplicationArn
            request.attributes = ["Enabled": "true"]
            
            let sns = AWSSNS.init(forKey: "AWSSNS")
            
            let response = sns.createPlatformEndpoint(request)
            response.waitUntilFinished()
            if let createEndpointResponse = response.result {
                if let endpointArnForSNS = createEndpointResponse.endpointArn {
                    print("endpointArn: \(endpointArnForSNS)")
                    return endpointArnForSNS
                }
            } else if let  error = response.error {
                print(error)
            }
        }
        
        return nil
    }
}
