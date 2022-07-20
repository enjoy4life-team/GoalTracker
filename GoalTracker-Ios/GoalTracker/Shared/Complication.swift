//
//  Complication.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Agus Budianto on 19/07/22.
//

import Foundation


struct Complication: Codable {
    var goalName: String
    var activityName: String
    var time: Date
    
    
    func encodeIt() -> Data {
          let data = try! PropertyListEncoder.init().encode(self)
              return data
      }
      
    static func decodeIt(_ data:Data) -> Complication {
          let goalProgress = try! PropertyListDecoder.init().decode(Complication.self, from: data)
          return goalProgress
    }
}


