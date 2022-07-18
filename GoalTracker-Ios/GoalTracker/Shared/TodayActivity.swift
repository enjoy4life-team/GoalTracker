//
//  TodayActivity.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Agus Budianto on 18/07/22.
//

import Foundation

class TodayActivity {
    var activityList = [ActivityItem]()
}


class ActivityItem {
    var activityName: String?
    var activityDate: Date?
    var TaskList: [TaskDetail]?
}


class TaskDetail{
    var taskID: UUID?
    var taskName: String?
}
