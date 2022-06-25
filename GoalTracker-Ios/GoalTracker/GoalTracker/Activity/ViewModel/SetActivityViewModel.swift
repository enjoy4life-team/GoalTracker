//
//  SetActivityViewModel.swift
//  GoalTracker
//
//  Created by Agus Budianto on 24/06/22.
//

import Foundation

class SetActivityViewModel: ObservableObject {
    var goal: Goal
    
    @Published var activities = [Activity]()
    
    let dataStore: ActivityLocalDataSource
    
    init(goal: Goal){
        self.dataStore = ActivityDefaultLocalDataStore()
        self.goal = goal
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
            
        } catch {
            print(error)
        }
    }
    
    func addActivity(activity: Activity) {
        activities.append(activity)
    }
    
    func moveData(fromOffsets source: IndexSet, toOffset destination: Int) {
        activities.move(fromOffsets: source, toOffset: destination)
    }
    
    func saveChanges(){
        var i  = 0
        activities.forEach{ _ in
            activities[i].number = (Int16(i + 1))
            i = i+1
        }
        
        dataStore.saveChanges()
    }
    
    func deleteData(idx: IndexSet) {
        idx.forEach{
            i in
            dataStore.deleteActivity(activity: activities[i])
        }
        
        activities.remove(atOffsets: idx)
    }
    
    func cancelChanges(){
        dataStore.rollBack()
    }
}
