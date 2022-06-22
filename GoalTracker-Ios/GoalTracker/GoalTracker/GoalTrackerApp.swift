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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
