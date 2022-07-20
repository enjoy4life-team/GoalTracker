//
//  WatchConnectivity.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Agus Budianto on 18/07/22.
//

import Foundation
import WatchConnectivity


final class WatchConnectivity: NSObject, WCSessionDelegate, ObservableObject {
    var session: WCSession
    @Published var goalProgress = [GoalProgress]()
    @Published var todayActivity = [ActivityItem]()
    
    static let shared = WatchConnectivity()
    
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        self.session.activate()    }
    

    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
    public func getGoalProgress(){
        session.sendMessage([msgKey: MessageKey.getGoalProgress.rawValue]){ res in
            if let data = res[dataKey] as? [Data] {
                DispatchQueue.main.async {
                    self.goalProgress = data.compactMap{
                        GoalProgress.decodeIt($0)
                    }
                    print(self.goalProgress.count)
                }
            }
        }
    }
    
    public func getTodayActivity(){
        session.sendMessage([msgKey: MessageKey.getTodayActivity.rawValue]){ res in

            if let data = res[dataKey] as? Data {
                DispatchQueue.main.async {
                    self.todayActivity = TodayActivity.decodeIt(data).activityList
                    print(self.todayActivity)
                }
            }
        }
    }
    
    
    public func markTaskComplete(taskID: UUID){
        session.sendMessage([msgKey: MessageKey.markTaskComplete.rawValue, "task_id" : taskID.uuidString]){ res in
        }
    }
}
