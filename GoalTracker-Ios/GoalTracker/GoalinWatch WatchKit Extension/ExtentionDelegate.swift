//
//  ExtentionDelegate.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Agus Budianto on 21/07/22.
//

import Foundation
import WatchKit
import ClockKit


class ExtensionDelegate: NSObject, WKExtensionDelegate {
    
    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        for task in backgroundTasks {

            print("task received")
              switch task {
                case let backgroundTask as WKApplicationRefreshBackgroundTask:

                  if let userInfo: NSDictionary = backgroundTask.userInfo as? NSDictionary {
                      if let then: Date = userInfo["submissionDate"] as? Date {
                        let interval = Date.init().timeIntervalSince(then)
                        print("interval since request was made \(interval)")
                     }
                  }

                  WatchConnectivity.shared.getComplicationData()
                  ExtensionDelegate.scheduleBAR(false)
                  backgroundTask.setTaskCompletedWithSnapshot(false)
                  default:
                  task.setTaskCompletedWithSnapshot(false)
              }
            }
        
       
        
    }
    
    
    
    public static func scheduleBAR(_ first: Bool) {
        
      
      let now = Date()
      let scheduledDate = now.addingTimeInterval(first ? 1 : 15*60)
      print("task scheduled for \(scheduledDate)")
        
        
      // use the info dictionary to supply your own data to the refresh
      let info: NSDictionary = ["submissionDate": now]

      let wkExt = WKExtension.shared()
      wkExt.scheduleBackgroundRefresh(
          withPreferredDate: scheduledDate,
          userInfo:info
      ) { (error: Error?) in
        if (error != nil) {
          print("background refresh could not be scheduled \(error.debugDescription)")
        }
      }
    }

}
