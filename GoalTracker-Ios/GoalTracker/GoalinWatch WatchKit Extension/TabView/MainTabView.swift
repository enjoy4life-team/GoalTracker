//
//  MainTabView.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Imam Sutria on 14/07/22.
//

import SwiftUI
import ClockKit

struct MainTabView: View {
    
    @State var currentView = 1
    var body: some View {
        TabView(selection: $currentView){
            Homescreen().tag(1)
            ListSubtask().tag(2)
            VStack{
                Button(action:{
                    send()
                }){
                    Text("asd")
                }
            }.tag(3)
        }
    }
    
    func send(){
        WatchConnectivity.shared.complicationData = [Complication(goalName: "A", activityName: "asd", time: Date(timeIntervalSinceNow: 30)), Complication(goalName: "B", activityName: "asd", time: Date(timeIntervalSinceNow: 40))]
        
        let server = CLKComplicationServer.sharedInstance()
        server.activeComplications?.forEach {
          server.reloadTimeline(for: $0)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
