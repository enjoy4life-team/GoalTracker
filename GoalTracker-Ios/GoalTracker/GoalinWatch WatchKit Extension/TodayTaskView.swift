//
//  TodayTaskView.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Mikhael Budi Mulya Marpaung on 15/07/22.
//

import SwiftUI


struct TodayTaskView: View {
    @ObservedObject var viewModel = WatchConnectivity.shared
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 5) {
                ForEach($viewModel.todayActivity, id: \.ID) {activity in
                    
                    HStack{
                        Text(activity.activityName.toUnwrapped(defaultValue: "").wrappedValue)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .padding(.leading, 8)
                            .frame(maxWidth: 250, maxHeight: 25)
                        
                        Spacer()
                        
                        Text(activity.activityDate.toUnwrapped(defaultValue: .now).wrappedValue, style: .time)
                            .font(.footnote)
                            .padding(.trailing, 8)
                            .foregroundColor(.gray)
                    }
                    .background{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 25)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(chooseColor(goalName: activity.goalName.wrappedValue).opacity(0.5))
                    }
                    .padding(.top)
                    
                    ForEach(activity.TaskList, id: \.taskID){ task in
                        ZStack{
                            HStack{
                                Rectangle()
                                .frame(width: 15, height: 44)
                                .cornerRadius(radius: 10, corners: [.topLeft, .bottomLeft])
                                .foregroundColor(chooseColor(goalName: activity.goalName.wrappedValue))
                                .padding(.leading, 20)
                            Spacer()
                            }
                            Button{
                                viewModel.markTaskComplete(taskID: task.taskID.wrappedValue)
                                task.finish.wrappedValue.toggle()
                            } label: {
                                    HStack{
                                        ZStack{
                                            Image(systemName: "circle")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.gray)
                                            Image(systemName: task.finish.wrappedValue ? "circle.fill" : "")
                                                .resizable()
                                                .frame(width: 17, height: 17)
                                                .foregroundColor(.white)
                                        
                                        }
                                        Text(task.taskName.wrappedValue)
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .strikethrough(task.finish.wrappedValue)
                                            .foregroundColor(task.finish.wrappedValue ? .gray.opacity(0.8) : .white)
                                        }
                                        .padding(.leading, 10)
                                
                                Spacer()
                            }
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity, maxHeight: 40)
                            .padding(.leading, 20)
                        }
                    }
                }
            }
        }
        .navigationTitle("Today's Tasks")
        .task {
            viewModel.getTodayActivity()
        }
    }
}

struct EmptyTaskView: View {
    
    var body: some View {
        VStack(spacing: 5){
            Image("bnwlogo")
                .resizable()
                .frame(width: 80, height: 80)
                .padding(.top)
            
            Text("There's no task for you today")
                .font(.title3)
                .multilineTextAlignment(.center)
        }
        .padding()
        .navigationTitle("Today's Tasks")
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
