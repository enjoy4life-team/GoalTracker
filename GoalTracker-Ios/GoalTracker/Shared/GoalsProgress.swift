//
//  GoalsProgress.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Agus Budianto on 18/07/22.
//

import Foundation
import SwiftUI


struct GoalProgress: Codable {
    var goalID: UUID = UUID.init()
    var goalName: String = ""
    var completedTask: Int = 0
    var totalTask: Int = 0
    
    func encodeIt() -> Data {
          let data = try! PropertyListEncoder.init().encode(self)
              return data
      }
      
    static func decodeIt(_ data:Data) -> GoalProgress {
          let goalProgress = try! PropertyListDecoder.init().decode(GoalProgress.self, from: data)
          return goalProgress
    }
    
    func getProgressPercentage() -> Double {
        if self.totalTask == 0 {
            return 0.0
        }
        
         return Double(completedTask) / Double(totalTask)
    }
}


