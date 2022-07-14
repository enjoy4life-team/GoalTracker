//
//  NotificationManager.swift
//  GoalTracker
//
//  Created by Agus Budianto on 14/07/22.
//

import Foundation
import UserNotifications

struct NotificationManager {
    static func sendNotif(timeInterval: Int, title: String, subtitle: String){
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(timeInterval), repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
    
    static func removeChangedActivityNotification(ids: [String]){
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ids)
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ids)
    }
}


