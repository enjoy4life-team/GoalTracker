//
//  GoalSummary.swift
//  GoalTracker
//
//  Created by Mikhael Budi Mulya Marpaung on 01/07/22.
//

import SwiftUI

struct GoalSummary: View {
    @State private var goalName: String = "Communication"
    @State private var goalImage: String = "Communication"
    @State private var goalEndDate: Date = Date.now
    @State private var activityName: String = "Scripting"
    @State private var subtask: String = "Subtask1"
    @State private var subtaskDate: Date = Date.now
    
    var body: some View {
        NavigationView{
            VStack(spacing: 15){
                ZStack{
                    Image(goalImage)
                        .resizable()
                        .frame(width: .infinity,
                               height: 187)
                    
                    HStack{
                        Text("End Date")
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.white)
                            .padding(.top, 120)
                        
                        Spacer()
                        
                        Text(goalEndDate, format: .dateTime.day().month().hour().minute())
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.white)
                            .padding(.top, 120)
                    }
                    .padding(.horizontal,30)
                }
                List{
                    Section {
                        HStack{
//                            Image(systemName: $subtask.isCompleted ? "square.fill" : "square")
//                                .foregroundColor(subtask.isCompleted ? .green : .red)
                            Text(subtask)
                        }
                        
                    } header: {
                        Text(activityName)
                    } footer: {
                        HStack{
                            Spacer()
                            Text("Today")
                            Text(subtaskDate, format: .dateTime.hour().minute())
                        }
                        .font(.caption)
                    }
                }
            }
        }
        .navigationTitle(goalName)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    
                }label: {
                    Text("Edit")
                }
            }
        }
    }
}

struct GoalSummary_Previews: PreviewProvider {
    static var previews: some View {
        GoalSummary()
    }
}
