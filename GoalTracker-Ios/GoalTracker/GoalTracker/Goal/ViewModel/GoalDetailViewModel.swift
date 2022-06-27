//
//  GoalDetailViewModel.swift
//  GoalTracker
//
//  Created by Agus Budianto on 27/06/22.
//

import SwiftUI

final class GoalDetailViewModel: ObservableObject {
    
    @Published var goal: Goal
    
    let dataStore: GoalLocalDataSource
    
    init(datastore: GoalLocalDataSource = GoalDefaultLocalDataStore(), goal: Goal){
        self.dataStore = datastore
        self.goal = goal
    }
    
    
    func saveChanges(){
        dataStore.saveChanges()
    }
    
    func changeActivvityTaskStatus(task: Task) {
        
//
//        let activities = Array(goal.activities as? Set<Activity> ?? [])
//
//        guard activities.count > activityIdx else {
//            return
//        }
//
//        let tasks = Array(activities[activityIdx].tasks as? Set<Task> ?? [])
//
//
//        guard tasks.count > taskIdx else {
//            return
//        }
//
//
//        tasks[taskIdx].finish = true
        
        task.finish = true
        dataStore.saveChanges()
    }
}



