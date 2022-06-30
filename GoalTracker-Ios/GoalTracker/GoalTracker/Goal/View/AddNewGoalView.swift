//
//  DefaultGoal.swift
//  GoalTracker
//
//  Created by Mikhael Budi Mulya Marpaung on 28/06/22.
//

import SwiftUI

struct AddNewGoalView: View{
    @ObservedObject var viewModel: AddNewGoalViewModel
    @Binding var parentRoute: GoalViewMainScreen.Route?

    var body: some View{
            VStack(spacing: 15){
                ZStack{
                    Image(viewModel.goal.isTemplate ? (viewModel.goal.name ?? "Custom Goal") : "Custom Goal")
                        .resizable()
                        .frame(width: .infinity,
                               height: 187)
                    
                    Text(viewModel.goal.name ?? "Custom Goal")
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.top, 120)
                        .padding(.trailing, 150)
                }
                    if !viewModel.goal.isTemplate {
                        Text("Your Goal")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.bottom, -10)
                            .padding(.top)
                        
                            TextField("write it down here", text: $viewModel.goal.name.toUnwrapped(defaultValue: ""))
                            .frame(width: 320, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10,
                                                 style: .continuous)
                                .fill(.gray.opacity(0.2))
                                .frame(width: 350, height: 50))
                        }
              
                Group{
                    DatePicker("Start Date",
                               selection: $viewModel.goal.startDate.toUnwrapped(defaultValue: Date.now),
                               in: Date()...,
                               displayedComponents: [DatePickerComponents.date, DatePickerComponents.hourAndMinute])
                    
                    Divider()
                    
                    DatePicker("Target Date",
                               selection: $viewModel.goal.endDate.toUnwrapped(defaultValue: Date.now),
                               in: Date()...,
                               displayedComponents: [DatePickerComponents.date, DatePickerComponents.hourAndMinute])
                }
                .padding(.horizontal, 30)
                
                
                Group{
                    ForEach(0..<viewModel.questionList.count, id: \.self){ idx in
                        Text(viewModel.questionList[idx].text ?? "question")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.bottom, -10)
                            .padding(.top)
                        
                        TextField("write it down here", text: $viewModel.questionList[idx].answer.toUnwrapped(defaultValue: ""))
                            .frame(width: 320, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10,
                                                 style: .continuous)
                                .fill(.gray.opacity(0.2))
                                .frame(width: 350, height: 50))
                    }
                    
                    
                }
            }
            .navigationTitle("Set Goal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        viewModel.saveChanges()
                        parentRoute = nil
                    } label: {
                        Text("Save")
                        
                    }
                    .tint(.blue)
                }
            }
        }
}

struct Communication_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGoalView(viewModel: AddNewGoalViewModel(goal: SmartGoalTemplate.Presentation.getGoals()), parentRoute: Binding.constant(GoalViewMainScreen.Route.AddGoalsMainScreen))
    }
}
