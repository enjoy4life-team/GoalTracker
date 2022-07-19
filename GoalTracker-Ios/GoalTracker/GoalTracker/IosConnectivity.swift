//
//  IosConnectivity.swift
//  GoalTracker
//
//  Created by Agus Budianto on 18/07/22.
//

import Foundation
import WatchConnectivity

class IosConnectivity: NSObject, WCSessionDelegate, ObservableObject {
    
    var session: WCSession
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        self.session.activate()
    }
    
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print(message)

    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        guard let key = message[msgKey] as? String else {
            return
        }
        
        switch key{
        case MessageKey.getGoalProgress.rawValue:
            replyHandler([dataKey: [GoalProgress(goalName: "A", completedTask: 10, totalTask: 20).encodeIt()]])
        default:
            return
        }
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
}

