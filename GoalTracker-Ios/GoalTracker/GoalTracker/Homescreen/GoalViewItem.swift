//
//  GoalView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 24/06/22.
//

import SwiftUI

struct GoalViewItem: View {
    
    @ObservedObject var viewModel: GoalViewModel
    @State private var goalStatus = "On Going"
    var status = ["On Going", "Completed", "Archive"]
    
    var body: some View{
        ScrollView{
            VStack {
                ZStack {
                    Text("On Going")
                        .font(.title2)
                        .bold()
                    
                    Rectangle()
                        .frame(width: 330, height: 260)
                        .foregroundColor(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Group {
                        goalRings(radius: 110, percent: viewModel.getGoalPercentage(goalType: SmartGoalData.communicationString), background: .red.opacity(0.3), color: .red)
                        goalRings(radius: 90, percent: viewModel.getGoalPercentage(goalType: SmartGoalData.collaborationString), background: .mint.opacity(0.3), color: .mint)
                        goalRings(radius: 70, percent: viewModel.getGoalPercentage(goalType: SmartGoalData.presentationString), background: .black.opacity(0.3), color: .black)
                    }
                }
                .padding(.bottom, 20)
                
                
                ForEach(viewModel.goals.indices, id: \.self) { idx in
                    
                    NavigationLink(destination:
                                    GoalSummary(viewModel: GoalSummaryViewModel(goal: viewModel.goals[idx]))
                        .navigationBarTitle(viewModel.goals[idx].name ?? "nil", displayMode: .inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                
                                NavigationLink(destination:
                                                SetActivityView(viewModel: SetActivityViewModel(goal: viewModel.goals[idx]))
                                ) {
                                   Text("Edit")                            }
                                
                                
                            }
                        }
                    ) {
                        CardNew(goalName: viewModel.goals[idx].name ?? "Empty Goal Name")
                        
                    }
                    
                }
            }
            Spacer()
            
        }.onAppear{
            viewModel.getData()
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
                    .onAppear{
                        self.trimRing = true
                    }
                    .onDisappear{
                        if self.percent != 1.0{
                            self.trimRing = false
                        }
                    }
            }
        }
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalViewItem(viewModel: GoalViewModel())
    }
}

struct CardNew: View {
    var goalName: String
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(chooseColor())
                .frame(height: 85)
                .cornerRadius(20)
            
            HStack {
                Text(goalName)
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color.black)
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.horizontal, 30)
    }
    
    func chooseColor() -> Color {
        switch self.goalName {
        case SmartGoalData.communicationString:
            return .red
        case SmartGoalData.collaborationString:
            return .mint
        default:
            return .black
        }
    }
}
