//
//  GoalTrackerApp.swift
//  GoalTracker
//
//  Created by Agus Budianto on 22/06/22.
//

import SwiftUI

@main
struct GoalTrackerApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("FirstTimeUser") var firstTimeUser: Bool = true
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    

    var body: some Scene {
        WindowGroup {
            MainTabView().fullScreenCover(isPresented:$firstTimeUser){
                OnboardingMainView(sheetPresented: $firstTimeUser)
            }.onAppear{
                let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
                print(paths[0])

                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
//            HomescreenView()
            }
        }
    }
}

