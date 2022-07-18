//
//  ListSubtask.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Imam Sutria on 14/07/22.
//

import SwiftUI

struct ListSubtask: View {
    var body: some View {
        ScrollView {
            TodayTaskView()
        }
        .navigationTitle("Today's Activity")
        
    }
}

struct ListSubtask_Previews: PreviewProvider {
    static var previews: some View {
        ListSubtask()
    }
}
