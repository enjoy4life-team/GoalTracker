//
//  TaskLocalDefaultDataSource.swift
//  GoalTracker
//
//  Created by Mikhael Budi Mulya Marpaung on 20/07/22.
//

import Foundation

struct TaskLocalDefaultDataSource: TaskLocalDataSource {
    
    private let container = PersistenceController.shared.container
    
    func getTaskByID(taskId: String) throws -> Task?{
        let fetchRequest = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", taskId)
        return try self.container.viewContext.fetch(fetchRequest).first
    }
    
    func saveChanges() {
        try? self.container.viewContext.save()
    }
    
    func rollBack(){
        self.container.viewContext.rollback()
    }
    
    
}
