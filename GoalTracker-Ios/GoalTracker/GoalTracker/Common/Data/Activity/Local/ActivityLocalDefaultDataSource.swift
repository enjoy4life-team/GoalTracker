//
//  ActivityLocalDefaultDataSource.swift
//  GoalTracker
//
//  Created by Agus Budianto on 24/06/22.
//

import Foundation
final class ActivityDefaultLocalDataStore: ActivityLocalDataSource{
    func getActivitiesByGoalID(id: UUID) throws -> [Activity]? {
        let fetchRequest = Activity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "goal_id == %@", id.uuidString)
        return try self.container.viewContext.fetch(fetchRequest)
    }
    
    
    
    private let container = PersistenceController.shared.container

    func deleteActivity(activity: Activity) {
        container.viewContext.delete(activity)
    }
    
    func getTodayActivities() throws -> [Activity]? {
        let fetchRequest = Activity.fetchRequest()
        
        return try self.container.viewContext.fetch(fetchRequest)
    }
    
    func saveChanges() {
        try? self.container.viewContext.save()
    }
    
    func rollBack(){
        self.container.viewContext.rollback()
    }
    
}
