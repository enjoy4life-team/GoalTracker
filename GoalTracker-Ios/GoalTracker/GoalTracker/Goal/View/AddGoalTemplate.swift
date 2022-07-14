//
//  AddGoal.swift
//  GoalTracker
//
//  Created by Mikhael Budi Mulya Marpaung on 28/06/22.
//

import SwiftUI

struct AddGoalTemplate: View {
    @ObservedObject var viewModel: GoalViewModel
    @Binding var isSheetPresented: Bool
    @Binding var parentRoute: GoalViewMainScreen.Route?
    
    var body: some View {
            VStack{
                HStack{
                    Button(action: {
                        isSheetPresented.toggle()
                    }){
                        Label("List Goals", systemImage: "chevron.left")
                    }
                    .padding()
                    Spacer()
                }
                ZStack{
                    Image("Communication")
                        .resizable()
                        .frame(width: 330,
                               height: 120)
                        .cornerRadius(20)
                    
                    Text("Communication")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                        .padding(.top, 60)
                        .padding(.trailing, 120)
                }
                .onTapGesture {
                    viewModel.setSelectedGoal(goalName: .Communication)
                    parentRoute = .AddGoalsMainScreen
                    isSheetPresented.toggle()
                }
                
                ZStack{
                    Image("Collaboration")
                        .resizable()
                        .frame(width: 330,
                               height: 120)
                        .cornerRadius(20)
                    Text("Collaboration")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                        .padding(.top, 60)
                        .padding(.trailing, 120)
                }
                .onTapGesture {
                    viewModel.setSelectedGoal(goalName: .Collaboration)
                    parentRoute = .AddGoalsMainScreen
                    isSheetPresented.toggle()
                }
                
                
                ZStack{
                    Image("Presentation")
                        .resizable()
                        .frame(width: 330,
                               height: 120)
                        .cornerRadius(20)
                    
                    Text("Presentation")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                        .padding(.top, 60)
                        .padding(.trailing, 120)
                }
                
                .onTapGesture {
                    viewModel.setSelectedGoal(goalName: .Presentation)
                    parentRoute = .AddGoalsMainScreen
                    isSheetPresented.toggle()
                }
                
                
                ZStack{
                    Image("Custom Goal")
                        .resizable()
                        .frame(width: 330, height: 120)
                        .cornerRadius(20)
                    Text("Custom Goal")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                        .padding(.top, 60)
                        .padding(.trailing, 120)
                }
                .onTapGesture {
                    parentRoute = .AddGoalsMainScreen
                    viewModel.setSelectedGoal(goalName: .Custom)
                    isSheetPresented.toggle()
                }
                
                Spacer()
                
            }
    }
}


