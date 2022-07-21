//
//  GoalTrackerApp.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Agus Budianto on 14/07/22.
//

import SwiftUI


@main
struct GoalTrackerApp: App {
    @WKExtensionDelegateAdaptor(ExtensionDelegate.self)
    private var extensionDelegate
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                MainTabView()
//                ContentView()
            }.task {
                ExtensionDelegate.scheduleBAR(true)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
