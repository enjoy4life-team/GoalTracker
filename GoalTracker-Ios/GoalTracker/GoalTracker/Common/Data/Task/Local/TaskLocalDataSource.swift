//
//  TaskLocalDataSource.swift
//  GoalTracker
//
//  Created by Agus Budianto on 27/06/22.
//

import SwiftUI

protocol TaskLocalDataSource {
    func getTaskByID(taskId: String)throws -> Task?
    func saveChanges()
    func rollBack()
}
