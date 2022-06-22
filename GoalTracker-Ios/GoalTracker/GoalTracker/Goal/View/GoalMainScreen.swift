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
        ForEach(0..<viewModel.goal.count, id: \.self) { idx in
            Text(viewModel.goal[idx].id?.uuidString ?? "null")
        }
    
    
    Button("new item"){
        viewModel.newData()
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
