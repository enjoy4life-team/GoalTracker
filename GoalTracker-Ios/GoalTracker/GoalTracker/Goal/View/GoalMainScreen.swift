//
//  HomeScreen.swift
//  GoalTracker
//
//  Created by Agus Budianto on 22/06/22.
//

import SwiftUI

struct GoalMainScreen: View {
    @ObservedObject var viewModel: GoalViewModel
    var body: some View {
        ScrollView{
            ForEach(0..<viewModel.goals.count, id: \.self) { idx in
                NavigationLink {
                    SetActivityView(viewModel: SetActivityViewModel(goal: viewModel.goals[idx]))
                } label: {
                    Text(viewModel.goals[idx].id?.uuidString ?? "null")
                }.buttonStyle(.plain)
            }
            
            
            Button("new item"){
                viewModel.addGoals(goal: SmartGoalTemplate.Communication.getGoals())
            }.onAppear{
                viewModel.getData()
            }
            
            Button("Save"){
                viewModel.saveState()
            }.onAppear{
                viewModel.getData()
            }
        }
    }
    
}

struct GoalMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        GoalMainScreen(viewModel: GoalViewModel())
    }
}
