//
//  GoalSummary.swift
//  GoalTracker
//
//  Created by Mikhael Budi Mulya Marpaung on 01/07/22.
//

import SwiftUI

struct GoalSummary: View {
    @ObservedObject var viewModel: GoalSummaryViewModel
    var body: some View {
        VStack{
                ZStack{
                    Image(viewModel.goal.name ?? "Custom Goal")
                        .resizable()
                        .frame(width: .infinity,
                               height: 187)
                    
                    HStack{
                        Text("End Date")
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.white)
                            .padding(.top, 120)
                        
                        Spacer()
                        
                        Text(viewModel.goal.endDate?.formattedString() ?? "null")
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.white)
                            .padding(.top, 120)
                    }
                    .padding(.horizontal,30)
                }
             
            List{
                ForEach(viewModel.activities.indices, id: \.self){ idx in
                    Section {
                        CardExpandableView(isExpanded: $viewModel.expandable[idx], activity: $viewModel.activities[idx], action: viewModel.changeTaskStatus)
                    }
                }
                
            }
            .frame(maxHeight: .infinity)
            
        }.onAppear{
            viewModel.getData()
        }
    }
        
}



struct CardExpandableView: View {
    @Binding var isExpanded: Bool
    @Binding var activity: Activity
    var action: (Task) -> Void
    var body: some View {
        VStack{
            HStack{
                Text(activity.name ?? "nil")
                    .fontWeight(.medium)
                    .font(.headline)
                Spacer()
                Button(action: {
                    isExpanded.toggle()
                }){
                Label("", systemImage: isExpanded ? "chevron.up" : "chevron.down")
                }.buttonStyle(.plain)
            }
            
            if isExpanded {
                let data = Array(activity.tasks as? Set<Task> ?? []).sorted(by: {$0.number > $1.number})
                
                if data.count == 0 {
                    Text("No Task")
                        .padding()
                        .foregroundColor(Color.gray)
                        .opacity(0.4)
                }
                
                
                ForEach(data, id: \.self){task in
                    HStack{
                        Button(action: {
                            action(task)
                        }){
                            Label("", systemImage: task.finish ? "square.fill" : "square")
                                .frame(width: 22, height: 22)
                        }.buttonStyle(.plain)
                        
                        Text(task.name ?? "nil")
                            .strikethrough(task.finish, color: .blue)
                         
                        Spacer()
                    }
                    .padding(.leading, 5)
                }
                
                
                
                HStack{
                    Spacer()
                    Text(Date.now.formattedString())
                }
            }
        }
            
            
}
}
