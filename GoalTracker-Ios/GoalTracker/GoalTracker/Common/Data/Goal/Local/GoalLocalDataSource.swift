//
//  GoalLocalDataSource.swift
//  GoalTracker
//
//  Created by Agus Budianto on 22/06/22.
//

import Foundation

protocol GoalLocalDataSource {
    func getAllGoalsData() throws -> [Goal]?
    func createNewGoal()
}
