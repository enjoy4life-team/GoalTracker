//
//  MainTabView.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Imam Sutria on 14/07/22.
//

import SwiftUI

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
        WatchConnectivity.shared.session.sendMessage(["data": GoalProgress(goalName: "name", completedTask: 10, totalTask: 20).encodeIt()], replyHandler: nil)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
