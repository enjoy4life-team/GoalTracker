//
//  WatchConnectivity.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Agus Budianto on 18/07/22.
//

import Foundation
import WatchConnectivity


final class WatchConnectivity: NSObject, WCSessionDelegate, ObservableObject {
    
    public let shared = WatchConnectivity()
    
    
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
    
}
