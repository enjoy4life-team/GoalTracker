//
//  AddGoal.swift
//  GoalTracker
//
//  Created by Mikhael Budi Mulya Marpaung on 28/06/22.
//

import SwiftUI

struct AddGoal: View {
    @ObservedObject var viewModel: GoalViewModel
    @Binding var isSheetPresented: Bool
    @Binding var parentRoute: GoalViewMainScreen.Route?
    
    var body: some View {
            VStack{
                ZStack{
                    Image("Communication")
                        .resizable()
                        .frame(width: 330,
                               height: 120)
                        .cornerRadius(20)
                    
                    NavigationLink(destination: Communication(), label: {
                        Text("Communication")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                            .padding(.top, 60)
                            .padding(.trailing, 120)
                    })
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
                    NavigationLink(destination: Communication(), label: {
                        Text("Collaboration")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                            .padding(.top, 60)
                            .padding(.trailing, 140)
                    })
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
                    
                    NavigationLink(destination: Communication(), label: {
                        Text("Presentation")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                            .padding(.top, 60)
                            .padding(.trailing, 145)
                    })
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
                    NavigationLink(destination: Communication(), label: {
                        Text("+ Custom Goal")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                            .padding()
                    })
                }
                .onTapGesture {
                    parentRoute = .AddGoalsMainScreen
                }
                
            }
            .navigationTitle("Select Goal")
            .padding(.top, -150)
    }
}


