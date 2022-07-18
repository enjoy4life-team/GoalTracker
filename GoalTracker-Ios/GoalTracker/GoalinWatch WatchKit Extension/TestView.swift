//
//  TestView.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Agus Budianto on 18/07/22.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        Button(action:{
            WatchConnectivity.shared.session.sendMessage(["msg_type", GoalProgress(color: .blue, goalName: "name", completedTask: 10, totalTask: 20)])
        }){
            Text("Hello, World!")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
