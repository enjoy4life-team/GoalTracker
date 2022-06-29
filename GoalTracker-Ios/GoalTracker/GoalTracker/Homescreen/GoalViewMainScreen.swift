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
    @State var searchText = ""
    @State var isSheetPresented = false
    @State var route: Route?
    
    init(viewModel: GoalViewModel){
        self.viewModel = viewModel
    }
    
    
    var body: some View{
        NavigationView{
           
            VStack{
                NavigationLink(unwrapping: $route, case: /Route.AddGoalsMainScreen) { _ in
                    AddNewGoalView(viewModel: AddNewGoalViewModel(goal: viewModel.selectedGoal!), parentRoute: $route)
                } onNavigate: { _ in } label: { EmptyView() }
                
                
                if viewModel.goals.isEmpty {
                    GoalItemEmpty()
                        .onAppear{
                            viewModel.getData()
                        }
                }else{
                    GoalViewItem(viewModel: viewModel)
                        .onAppear{
                            viewModel.getData()
                        }
                }
                
            }.navigationBarTitleDisplayMode(.large)
                .navigationTitle("My Goals")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button(){
                            isSheetPresented.toggle()
                        }label: {
                            Image(systemName: "plus")
                        }
                        .tint(.blue)
                    })
                }.searchable(text: $searchText)
        }
        .fullScreenCover(isPresented: $isSheetPresented){
            AddGoalTemplate(viewModel: viewModel, isSheetPresented: $isSheetPresented, parentRoute: $route)
        }
        
    }
    
}

struct goalRings: View {
    var radius: CGFloat
    var percent: CGFloat
    
    var background : Color = .red.opacity(0.05)
    var color: Color = Color.red
    var lineWidth: CGFloat = 16
    var animationDuration: CGFloat = 0.5
    
    @State var trimRing = false
    
    var body: some View {
        Group {
            ZStack {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: self.lineWidth))
                    .frame(width: self.radius * 2, height: self.radius * 2)
                    .foregroundColor(background)
                
                Circle()
                    .trim(from: 0, to: self.trimRing ? self.percent : 0)
                    .stroke(color, style: StrokeStyle(lineWidth: self.lineWidth, lineCap: .round))
                    .frame(width: self.radius * 2, height: self.radius * 2)
                    .rotationEffect(.degrees(-90))
                    .animation(Animation.easeIn(duration: self.animationDuration))
                    .onAppear(){
                        self.trimRing.toggle()
                    }
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
