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
        let activityDate: String
        let subtaskName: String
        var id: String {activityName}
    }
    @State private var todayTasks = [
        Goals(goalColor: .purple, isCompleted: false, activityName: "Activity 1", activityDate: "17.00", subtaskName: "Subtask 1"),
        Goals(goalColor: .teal, isCompleted: false, activityName: "Activity 2", activityDate: "16.00",subtaskName: "Subtask 2"),
        Goals(goalColor: .red, isCompleted: false, activityName: "Activity 3", activityDate: "18.00",subtaskName: "Subtask 3")
    ]
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0) {
                ForEach(todayTasks.indices, id: \.self) {idx in
                    HStack{
                        Text(todayTasks[idx].activityName)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Text(todayTasks[idx].activityDate)
                            .font(.caption)
                            .padding(.trailing, 10)
                            .foregroundColor(.gray)
                    }
                    .background{
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: .infinity, height: 30)
                            .foregroundColor(todayTasks[idx].goalColor.opacity(0.5))
                    }
                    
                    ZStack{
                        HStack{
                            Rectangle()
                            .frame(width: 15, height: 48)
                            .cornerRadius(radius: 10, corners: [.topLeft, .bottomLeft])
                            .foregroundColor( todayTasks[idx].goalColor)
                            .padding(.leading, 15)
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
                            }
                            Spacer()
                        }
                        .cornerRadius(10)
                        .frame(width: .infinity, height: 65)
                        .padding(.leading, 15)
                        
                    }
                    .padding(.bottom,10)
                }
            }
        }
        .navigationTitle("Today's Tasks")
    }
}

struct EmptyTaskView: View {
    
    var body: some View {
        VStack(spacing: 5){
            Image(systemName: "scribble.variable")
                .resizable()
                .frame(width: 50, height: 50)
            
            Text("There's no task for you today")
                .font(.title3)
                .multilineTextAlignment(.center)
        }
    }
}

struct TodayTaskView_Previews: PreviewProvider {
    static var previews: some View {
        TodayTaskView()
    }
}

struct EmptyTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyTaskView()
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
