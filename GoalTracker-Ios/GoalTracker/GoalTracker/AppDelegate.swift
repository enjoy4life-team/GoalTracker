//
//  AppDelegate.swift
//  GoalTracker
//
//  Created by Agus Budianto on 14/07/22.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self // add this
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent   notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)   {
        completionHandler([.alert, .badge, .sound])
   }
}