//
//  TaskLocalDataSource.swift
//  GoalTracker
//
//  Created by Agus Budianto on 27/06/22.
//

import SwiftUI

protocol TaskLocalDataSource {
    func markTaskAsComplete(taskId: UUID)
    func getTaskByActivityID(id: UUID) throws -> [Task]?
    func saveChanges()
    func rollBack()
}
