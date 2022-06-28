//
//  GoalViewItem.swift
//  GoalTracker
//
//  Created by Agus Budianto on 28/06/22.
//

import SwiftUI

struct GoalViewItem: View {
    @ObservedObject var viewModel: GoalViewModel
    var status = ["On Going", "Completed", "Archive"]
    @State var goalStatus = "On Going"

    
    var body: some View {
        
        ScrollView{
        VStack {
            ZStack {
                Text("On Going")
                    .font(.title2)
                    .bold()
                
                Group {
                    goalRings(radius: 110, percent: 0.85, background: .black.opacity(0.1), color: .black)
                    goalRings(radius: 90, percent: 0.45, background: .mint.opacity(0.1), color: .mint)
                    goalRings(radius: 70, percent: 0.6, background: .red.opacity(0.1), color: .red)
                }
            }
            .padding()
            
            Picker("", selection: $goalStatus) {
                ForEach(status, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
           
            ForEach(viewModel.goals, id: \.self) { goal in
                card(goalName: goal.name ?? "Goal")
                }
            Spacer()
        }
        }
    }
}

//struct GoalViewItem_Previews: PreviewProvider {
//    static var previews: some View {
//        GoalViewItem()
//    }
//}
