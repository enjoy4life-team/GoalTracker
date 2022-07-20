//
//  TodayActivity.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Agus Budianto on 18/07/22.
//

import Foundation

struct TodayActivity: Codable {
    var activityList = [ActivityItem]()
    var goalName = ""
    
    func encodeIt() -> Data {
          let data = try! PropertyListEncoder.init().encode(self)
              return data
      }
      
    static func decodeIt(_ data:Data) -> TodayActivity {
          let todayActivity = try! PropertyListDecoder.init().decode(TodayActivity.self, from: data)
          return todayActivity
    }
}


struct ActivityItem: Codable {
    var ID = UUID.init()
    var activityName: String?
    var activityDate: Date?
    var TaskList = [TaskItem]()
}


struct TaskItem:Codable {
    var taskID: UUID
    var taskName: String
    var finish: Bool
    var number: Int
}
