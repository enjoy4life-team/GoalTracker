//
//  TodayTaskView.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Mikhael Budi Mulya Marpaung on 15/07/22.
//

import SwiftUI

struct TodayTaskView: View {
    
    private struct Goals: Identifiable {
        let goalColor: Color
//        let isCompleted: Bool
        let activityName: String
        let subtaskName: String
        let subtaskDate: String
        var id: String {activityName}
    }
    private let todayTasks: [Goals] = [
        Goals(goalColor: .red, activityName: "Activity 1", subtaskName: "Subtask 1", subtaskDate: "15.00"),
        Goals(goalColor: .teal, activityName: "Activity 2", subtaskName: "Subtask 2", subtaskDate: "16.00"),
        Goals(goalColor: .purple, activityName: "Activity 3", subtaskName: "Subtask 3", subtaskDate: "15.00")
    ]
    @State private var isCompleted: Bool = false
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 3) {
                ForEach(todayTasks) {Goals in
                    Text(Goals.activityName)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Button{
                        isCompleted.toggle()
                    } label: {
                        Image(systemName: "rectangle.fill")
                            .resizable()
                            .frame(width: 15, height: .infinity)
                            .padding(.leading, -15)
                            .foregroundColor(isCompleted ? .gray.opacity(0.8) : Goals.goalColor)
                        
                        VStack(alignment: .leading, spacing: 3){
                            HStack{
                                Image(systemName: isCompleted ? "checkmark.circle" : "circle")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.gray)
                                
                                Text(Goals.subtaskName)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .strikethrough(isCompleted)
                                    .foregroundColor(isCompleted ? .gray.opacity(0.8) : .white)
                            }
                            
                            Text(Goals.subtaskDate)
                                .font(.caption)
                                .padding(.leading, 25)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Today's Tasks")
    }
}

struct TodayTaskView_Previews: PreviewProvider {
    static var previews: some View {
        TodayTaskView()
    }
}

