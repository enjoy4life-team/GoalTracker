//
//  GoalView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 24/06/22.
//

import SwiftUI
import SwiftUINavigation

struct GoalViewMainScreen: View {
    
    @ObservedObject var viewModel: GoalViewModel
    @Binding var parentRoute: Route?
    
    
    var body: some View{
            VStack{
                NavigationLink(unwrapping: $parentRoute, case: /Route.AddGoalsMainScreen) { _ in
                    AddNewGoalView(viewModel: AddNewGoalViewModel(goal: viewModel.selectedGoal!), parentRoute: $parentRoute)
                } onNavigate: { _ in } label: { EmptyView() }
                
                
                if viewModel.goals.isEmpty {
                    GoalItemEmpty()
                        .onAppear{
                            viewModel.getData()
                        }
                }else{
                    SegmentedControls(viewModel: viewModel)
                }
                
        }
    }
    
}



//struct GoalView_Previews: PreviewProvider {
//    static var previews: some View {
//        GoalView()
//    }
//}

extension GoalViewMainScreen {
    enum Route {
        case AddGoalsMainScreen
    }
}
