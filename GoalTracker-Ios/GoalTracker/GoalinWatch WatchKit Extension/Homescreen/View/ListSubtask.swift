//
//  ListSubtask.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Imam Sutria on 14/07/22.
//

import SwiftUI

struct ListSubtask: View {
    @ObservedObject var viewModel = WatchConnectivity.shared
    @State var empty = true
    var body: some View {
        ScrollView {
            if !empty {
                TodayTaskView()
            }else{
                EmptyTaskView()
            }
            
        }
        .onAppear{
            viewModel.getTodayActivity()
            empty = viewModel.todayActivity.isEmpty
        }
        
    }
}

struct ListSubtask_Previews: PreviewProvider {
    static var previews: some View {
        ListSubtask()
    }
}
