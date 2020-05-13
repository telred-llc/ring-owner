//
//  AppDelegate.swift
//  AWS-Ring
//
//  Created by Pham Hoa on 2/13/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import UIKit
import AWSAppSync
import AWSCognitoIdentityProvider
import IQKeyboardManagerSwift
import AWSMobileClient
import Toast_Swift
import UserNotifications
import AWSKinesisVideoArchivedMedia
import AWSRekognition

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    var appSyncClient: AWSAppSyncClient?
    let gcmMessageIDKey = "gcm.message_id"
    var roomService: RoomService?
    var isDisplayingDetailVC = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.USWest2,
                                                                identityPoolId:"YOUR IDENTITY POOL ID")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration

        UNUserNotificationCenter.current().delegate = self
        registerForPushNotifications()
        
        setupAppSyncInitialization()
        setupIQKeyboardMananger()
        setupToast()

        if Session.shared.latestAwsAuthToken != nil {
            Switcher.updateRootVC(logined: true)
        } else {
            Switcher.updateRootVC(logined: false)
        }

        UIApplication.shared.applicationIconBadgeNumber = 0
        return true
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if let userInfo = userInfo as? [String: AnyObject] {
            if let deviceId = parseRemoteNotification(notification: userInfo) {
                PushHandler.shared.processQueue = [deviceId]

                if let root = Switcher.rootVC,
                    let splitVC = root as? UISplitViewController {

                    if let navigation = splitVC.viewControllers.first as? UINavigationController,
                        let masterVC = navigation.viewControllers.first as? MasterViewController {
                        masterVC.handlePushNotificaionIfNeeded(byTapping: false)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                            completionHandler(.newData)
                        }
                        return
                    }
                }
            }
        }

        completionHandler(.failed)
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        let navController = self.window?.rootViewController as! UINavigationController
        let notificationSettingsVC = MasterViewController()
        navController.pushViewController(notificationSettingsVC, animated: true)
    }

    func setupAppSyncInitialization() {
        do {
            // You can choose the directory in which AppSync stores its persistent cache databases
            let cacheConfiguration = try AWSAppSyncCacheConfiguration()
            
            // AppSync configuration & client initialization
            let appSyncServiceConfig = try AWSAppSyncServiceConfig()
            let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncServiceConfig: appSyncServiceConfig,
                                                                  userPoolsAuthProvider: self,
                                                                  cacheConfiguration: cacheConfiguration)
            appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
            // Set id as the cache key for objects. See architecture section for details
            appSyncClient?.apolloClient?.cacheKeyForObject = { $0["id"] }
            appSyncClient?.offlineMutationDelegate = self
        } catch {
            print("Error initializing appsync client. \(error)")
        }

        // State tracking
        AWSMobileClient.sharedInstance().addUserStateListener(self) { (userState, info) in
            switch (userState) {
            case .signedIn:
                print("user is signed in.")
                PushHandler.shared.processQueue = []
            default:
                Switcher.updateRootVC(logined: false)
            }
        }
    }
    
    func setupIQKeyboardMananger() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enableAutoToolbar = false
    }

    func setupToast() {
        ToastManager.shared.isQueueEnabled = false
        ToastManager.shared.isTapToDismissEnabled = false
    }
    
    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        return true
    }

    func splitViewController(_ svc: UISplitViewController, willChangeTo displayMode: UISplitViewController.DisplayMode) {
        if displayMode == .allVisible || displayMode == .primaryHidden {
            isDisplayingDetailVC = true
        } else {
            isDisplayingDetailVC = false
        }
    }
    
    // MARK: - Notification

    func registerForPushNotifications() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) {
                [weak self] granted, error in
                
                print("Permission granted: \(granted)")
                self?.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                // Already authorized
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
            else {
                // Either denied or notDetermined
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
                    (granted, error) in
                    UNUserNotificationCenter.current().delegate = self
                    let alertController = UIAlertController(title: "Notification Alert", message: "please enable notifications", preferredStyle: .alert)
                    let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
                        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                            return
                        }
                        if UIApplication.shared.canOpenURL(settingsUrl) {
                            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                            })
                        }
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                    alertController.addAction(cancelAction)
                    alertController.addAction(settingsAction)
                    DispatchQueue.main.async {
                        self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
                        
                    }
                }
            }
        }
        
    }
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
        ) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        print("Device Token: \(token)")
        Session.shared.deviceToken = token
    }
    
    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
        UIApplication.shared.applicationIconBadgeNumber = 1
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        UIApplication.shared.applicationIconBadgeNumber = 0

        print("handling notification")

        if let notification = response.notification.request.content.userInfo as? [String:AnyObject] {
            if let deviceId = parseRemoteNotification(notification: notification) {
                PushHandler.shared.processQueue = [deviceId]

                if let root = Switcher.rootVC,
                    let splitVC = root as? UISplitViewController {

                    if let navigation = splitVC.viewControllers.first as? UINavigationController,
                        let masterVC = navigation.viewControllers.first as? MasterViewController {
                        masterVC.handlePushNotificaionIfNeeded(byTapping: true)
                    }
                }
            }
        }

        completionHandler()
    }
    
    private func parseRemoteNotification(notification:[String:AnyObject]) -> String? {
        if let aps = notification["payload"] as? [String:AnyObject] {
            let deviceId = aps["deviceId"] as? String
            return deviceId
        }
        return nil
    }

}

extension AppDelegate: AWSCognitoUserPoolsAuthProviderAsync {
    func getLatestAuthToken(_ callback: @escaping (String?, Error?) -> Void) {
        if let awsLatestAuthToken = Session.shared.latestAwsAuthToken {
            callback(awsLatestAuthToken, nil)
        } else {
            AWSMobileClient.sharedInstance().getTokens { (tokens, error) in
                if error != nil {
                    Session.shared.latestAwsAuthToken = nil
                    callback(nil, error)
                } else {
                    Session.shared.latestAwsAuthToken = tokens?.idToken?.tokenString
                    callback(tokens?.idToken?.tokenString, nil)
                }
            }
        }
    }
}

extension AppDelegate: AWSAppSyncOfflineMutationDelegate {
    func mutationCallback(recordIdentifier: String, operationString: String, snapshot: Snapshot?, error: Error?) {
        
    }
}
