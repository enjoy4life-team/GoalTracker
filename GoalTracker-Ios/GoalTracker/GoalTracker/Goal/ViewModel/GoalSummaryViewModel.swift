//
//  GoalViewModel.swift
//  GoalTracker
//
//  Created by Agus Budianto on 22/06/22.
//

import Foundation

final class GoalSummaryViewModel: ObservableObject {
    @Published var expandable: [Bool] = []
    @Published var activities = [Activity]()
    @Published var goal: Goal
    
    let dataStore: ActivityLocalDataSource
    
    init(datastore: ActivityLocalDataSource = ActivityDefaultLocalDataStore(), goal: Goal){
        self.dataStore = datastore
        self.goal = goal
        
        self.getData()
        
    }
    
    
    func getData(){
        do {
            
            guard let goalID = goal.id else {
                return
            }
            
            guard let data = try dataStore.getActivitiesByGoalID(id: goalID) else{
                return
            }
            activities = data.sorted(by: { $0.number < $1.number })
            self.expandable = activities.map{($0.tasks?.count ?? 0) != 0}
        } catch {
            print(error)
        }
    }
    
    func changeTaskStatus(task: Task) {
        task.finish.toggle()
        dataStore.saveChanges()
        
        getData()
    }
}
