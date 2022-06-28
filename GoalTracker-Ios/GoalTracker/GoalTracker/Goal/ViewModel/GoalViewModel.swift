//
//  GoalViewModel.swift
//  GoalTracker
//
//  Created by Agus Budianto on 22/06/22.
//

import Foundation

final class GoalViewModel: ObservableObject {
    @Published var goals: [Goal] = []
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


}
