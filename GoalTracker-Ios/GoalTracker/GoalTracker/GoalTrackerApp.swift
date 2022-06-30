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
    

    var body: some Scene {
        WindowGroup {
            MainTabView().fullScreenCover(isPresented:$firstTimeUser){
                OnboardingMainView(sheetPresented: $firstTimeUser)
            }.onAppear{
                let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
                print(paths[0])

//            HomescreenView()
            }
        }
    }
}

