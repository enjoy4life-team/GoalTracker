//
//  GoalLocalDefaultDataSource.swift
//  GoalTracker
//
//  Created by Agus Budianto on 22/06/22.
//

import Foundation


import Foundation


final class GoalDefaultLocalDataStore: GoalLocalDataSource {
    func rollback() {
        container.viewContext.rollback()
    }
    
    private let container = PersistenceController.shared.container

    
    func getAllGoalsData() throws -> [Goal]? {
        let fetchRequest = Goal.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "endDate", ascending: true)]
        return try self.container.viewContext.fetch(fetchRequest)

    }
    
    func createNewGoal() {
        let goal = Goal(context: container.viewContext)
        
        goal.id = UUID.init()
        goal.startDate = Date.now
        goal.endDate = Date.now
        goal.name = "goal a"

        try? self.container.viewContext.save()
    }
    
    func saveChanges() {
        try? self.container.viewContext.save()
    }
}
