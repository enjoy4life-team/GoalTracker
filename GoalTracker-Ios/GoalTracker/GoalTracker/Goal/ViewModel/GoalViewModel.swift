//
//  GoalViewModel.swift
//  GoalTracker
//
//  Created by Agus Budianto on 22/06/22.
//

import Foundation

final class GoalViewModel: ObservableObject {
    @Published var goals: [Goal] = []
    @Published var finishedGoals: [Goal] = []
    @Published var selectedGoal: Goal?
    
    let dataStore: GoalLocalDataSource
    
    init(datastore: GoalLocalDataSource = GoalDefaultLocalDataStore()){
        self.dataStore = datastore
    }
    
    
    func getData() {
        do {
            guard let data = try dataStore.getAllGoalsData() else{
                return
            }
            goals = data
                    
        } catch {
                print(error)
            }
    }
    
    func newData(){
        dataStore.createNewGoal()
        getData()
    }
    
    func addGoals(goal: Goal) {
        goals.append(goal)
    }
    
    func saveState(){
        dataStore.saveChanges()
    }
    
    func getGoalTemplateData() -> [GoalTemplateItem] {
        return [
            GoalTemplateItem(imageName: "communication", goal: .Communication),
            GoalTemplateItem(imageName: "collaboration", goal: .Collaboration),
            GoalTemplateItem(imageName: "presentation", goal: .Presentation),
        ]
    }
    
    func setSelectedGoal(goalName: SmartGoalTemplate) {
        selectedGoal = goalName.getGoals()
    }


    func getFinishGoal() -> [Goal]{
        return self.goals.filter{
            $0.isFinished()
        }
    }
    
    func getArchivedGoal() -> [Goal]{
        return self.goals.filter{
            $0.isArchived
        }
    }
    
    func getGoalPercentage(goalType: String) -> Double {
        let goals: [Goal] = goals.filter{$0.name == goalType && !$0.isFinished()}
        
        
        var taskList = [Task]()
        
        for goal in goals {
            let activities = Array(goal.activities as? Set<Activity> ?? [])
            for activity in activities {
                let tasks = Array(activity.tasks as? Set<Task> ?? [])
                taskList.append(contentsOf: tasks)
            }
        }
        
        let taskFinishCount = taskList.filter{$0.finish}.count
        
        if taskList.count == 0 {
            return 0.0
        }
        
        return Double(taskFinishCount) / Double(taskList.count)
    }

    

}


extension Goal {
    func isFinished() -> Bool {
        var taskList = [Task]()
        
        let activities = Array(self.activities as? Set<Activity> ?? [])
        for activity in activities {
            let tasks = Array(activity.tasks as? Set<Task> ?? [])
            taskList.append(contentsOf: tasks)
        }
        
        let taskFinishCount = taskList.filter{$0.finish}.count
        
        if taskList.count == 0 {
            return false
        }
        
        return taskFinishCount == taskList.count
    }
}
