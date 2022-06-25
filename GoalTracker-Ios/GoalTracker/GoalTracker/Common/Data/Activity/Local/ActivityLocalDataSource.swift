//
//  ActivityLocalDataSource.swift
//  GoalTracker
//
//  Created by Agus Budianto on 24/06/22.
//

import SwiftUI

protocol ActivityLocalDataSource {
    func deleteActivity(activity: Activity)
    func getActivitiesByGoalID(id: UUID) throws -> [Activity]?
    func saveChanges()
}
