//
//  AppDelegate.swift
//  WidgetDemo
//
//  Created by kbedi on 10/07/2020.
//

import UIKit
import UserNotifications


fileprivate let orderStatusKey = "OrderStatusKey"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().delegate = self
        getPushNotifications()
        application.applicationIconBadgeNumber = 0
        UserDefaults.standard.setValue(0, forKey: orderStatusKey)
        return true
    }

    func getPushNotifications() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.getRegisteredPushNotifications()
            case .authorized:
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            case .denied:
                print("Permission Denied.")
            default:
                break
            }
        }
    }
    
    
    func getRegisteredPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { (granted, error) in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        })
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

        if var tag = UserDefaults.standard.value(forKey: orderStatusKey) as? Int {
            print("Background Fetch ... tag \(tag)")
            if #available(iOS 14.0, *) {
                MyOrdersTableViewController.updateWidget(tag)
                tag = tag + 1
                tag = tag > 2 ? 0 : tag
                UserDefaults.standard.setValue(tag, forKey: orderStatusKey)
                UserDefaults.standard.synchronize()

            } else {
                // Fallback on earlier versions
            }
        }
        completionHandler(.newData)
    }
    
    //MARK: -  Remote Notifications
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print(userInfo)
        if #available(iOS 14.0, *) {
            updateWidget(userInfo)
        }
        completionHandler(.newData)

    }
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
         // 1. Convert device token to string
         let tokenParts = deviceToken.map { data -> String in
             return String(format: "%02.2hhx", data)
         }
         let token = tokenParts.joined()
         // 2. Print device token to use for PNs payloads
         print("Device Token: \(token)")
     }

     func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
         // 1. Print out error if PNs registration not successful
         print("Failed to register for remote notifications with error: \(error)")
     }
}


extension AppDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Test Foreground: \(notification.request.identifier)")
        
        if #available(iOS 14.0, *) {
            updateWidget(notification.request.content.userInfo)
        }         
        if #available(iOS 14.0, *) {
            completionHandler([.banner, .list, .sound])
        } else {
            // Fallback on earlier versions
            completionHandler([.sound])
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(response)
        if #available(iOS 14.0, *) {
            updateWidget(response.notification.request.content.userInfo)
        }         
        completionHandler()
    }

}


extension AppDelegate {
    @available(iOS 14.0, *)
    func updateWidget(_ userInfo: [AnyHashable:Any]?) {
        if let data = userInfo?["data"] as? [AnyHashable:Any] {
            if let tag = Int((data["orderStatus"] as? String) ?? "") {
                MyOrdersTableViewController.updateWidget(tag)
            }
        }
    }
}
