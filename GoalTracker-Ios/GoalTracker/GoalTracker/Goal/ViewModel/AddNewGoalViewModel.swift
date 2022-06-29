//
//  AddNewGoalMainScreenViewModel.swift
//  GoalTracker
//
//  Created by Agus Budianto on 29/06/22.
//

import Foundation


final class AddNewGoalViewModel: ObservableObject {
    @Published var goal: Goal
    @Published var questionList = [Question]()
    private var dataStore: GoalLocalDataSource

    
    init(goal: Goal){
        self.goal = goal
        self.questionList = Array(goal.questions as? Set<Question> ?? []).sorted(by: {$0.number > $1.number})
        dataStore = GoalDefaultLocalDataStore()
        
    }
    
        
    func saveChanges(){
        dataStore.saveChanges()
    }
    
}



