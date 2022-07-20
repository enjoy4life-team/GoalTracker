//
//  MessageKey.swift
//  GoalTracker
//
//  Created by Agus Budianto on 18/07/22.
//

import Foundation


enum MessageKey: String {
    case getGoalProgress = "get_goal"
    case getComplicationData = "get_complication_data"
    case getTodayActivity = "get_activity"
    case markTaskComplete = "mark_task_comlete"
}

let msgKey = "message_key"
let dataKey = "data_key"
