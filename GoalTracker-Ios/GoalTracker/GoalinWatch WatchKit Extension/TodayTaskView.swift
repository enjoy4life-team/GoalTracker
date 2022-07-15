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
        var isCompleted: Bool
        let activityName: String
        let subtaskName: String
        let subtaskDate: String
        var id: String {activityName}
    }
    @State private var todayTasks = [
        Goals(goalColor: .purple, isCompleted: false, activityName: "Activity 1", subtaskName: "Subtask 1", subtaskDate: "17.00"),
        Goals(goalColor: .teal, isCompleted: false, activityName: "Activity 2", subtaskName: "Subtask 2", subtaskDate: "16.00"),
        Goals(goalColor: .red, isCompleted: false, activityName: "Activity 3", subtaskName: "Subtask 3", subtaskDate: "16.00")
    ]
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 3) {
                ForEach(todayTasks.indices, id: \.self) {idx in
                    Text(todayTasks[idx].activityName)
                        .font(.title3)
                        .fontWeight(.semibold)
                    ZStack{
                        HStack{
                            Rectangle()
                            .frame(width: 15, height: 65)
                            .cornerRadius(radius: 10, corners: [.topLeft, .bottomLeft])
                            .foregroundColor(todayTasks[idx].isCompleted ? .gray.opacity(0.8) : todayTasks[idx].goalColor)
                        Spacer()
                        }
                        Button{
                            todayTasks[idx].isCompleted.toggle()
                        } label: {
                            VStack(alignment: .leading, spacing: 3){
                                HStack{
                                    ZStack{
                                        Image(systemName: "circle")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.gray)
                                        Image(systemName: todayTasks[idx].isCompleted ? "circle.fill" : "")
                                            .resizable()
                                            .frame(width: 17, height: 17)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.leading, 10)
                                    
                                    Text(todayTasks[idx].subtaskName)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .strikethrough(todayTasks[idx].isCompleted)
                                        .foregroundColor(todayTasks[idx].isCompleted ? .gray.opacity(0.8) : .white)
                                }
                                
                                Text(todayTasks[idx].subtaskDate)
                                    .font(.caption)
                                    .padding(.leading, 35)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                        }
                        .cornerRadius(10)
                        .frame(width: .infinity, height: 65)
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

struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}
extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
