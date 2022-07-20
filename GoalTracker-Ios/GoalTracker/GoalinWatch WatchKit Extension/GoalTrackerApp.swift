//
//  GoalTrackerApp.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Agus Budianto on 14/07/22.
//

import SwiftUI


@main
struct GoalTrackerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                MainTabView()
//                ContentView()
            }.task {
                WatchConnectivity.shared.getComplicationData()
               
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
