//
//  IosConnectivity.swift
//  GoalTracker
//
//  Created by Agus Budianto on 18/07/22.
//

import Foundation
import WatchConnectivity

class IosConnectivity: NSObject, WCSessionDelegate, ObservableObject {
    
    let shared = IosConnectivity()
    var session: WCSession
   
    
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    

    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        DispatchQueue.main.async {
            
        }
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
}

