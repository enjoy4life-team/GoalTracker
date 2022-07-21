//
//  Homescreen.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Imam Sutria on 14/07/22.
//

import SwiftUI

struct Homescreen: View {
    
    @ObservedObject var vm = WatchConnectivity.shared
    
    var body: some View {
        ScrollView {
            if vm.goalProgress.isEmpty {
                BlankHomescreen()
                    .navigationBarTitle("Progress")
                    .padding(.top, 10)
            }else{
                
            VStack {
                
                ForEach(vm.goalProgress, id: \.goalID){ goal in
                    goalRing(totaltask: goal.totalTask, completeTask: goal.completedTask, radius: 22, percent: goal.getProgressPercentage() , background: chooseColor(goalName: goal.goalName).opacity(0.2), color: chooseColor(goalName: goal.goalName), goalName: goal.goalName, percentColor: chooseColor(goalName: goal.goalName), subTaskColor: chooseColor(goalName: goal.goalName))
                        .padding(.bottom, 12)
                    
                }
            
            }
            .navigationBarTitle("Progress")
            .padding(.top, 10)
        }
    }
        .task {
            WatchConnectivity.shared.getGoalProgress()
            print(WatchConnectivity.shared.goalProgress)
        }
        
        
    }
}

struct Homescreen_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen()
    }
}

struct goalRing: View {
    
    var totaltask: Int
    var completeTask: Int
    
    var radius: CGFloat
    var percent: CGFloat
    
    var background : Color = .red.opacity(0.05)
    var color: Color = Color.red
    var lineWidth: CGFloat = 5
    var animationDuration: CGFloat = 0.5
    
    @State var trimRing = false
    
    var goalName : String
    var percentColor : Color = Color.purple
    var subTaskColor : Color = Color.purple
    
    var body: some View {
        HStack {
            ZStack {
                Text("\(Int(percent * 100))%")
                    .foregroundColor(percentColor)
                    .font(.caption2)
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
                        .onAppear(){
                            self.trimRing.toggle()
                        }
                }
            }
            .padding(.trailing)
            
            VStack (alignment: .leading){
                Text(goalName)
                    .font(.footnote)
//                    .font(.subheadline)
                    .fontWeight(.medium)
                Text("Subtask: \(completeTask)/\(totaltask)")
                    .font(.footnote)
                    .foregroundColor(subTaskColor)
            }
            Spacer()
        }
        .padding(.leading, 3)
        .navigationTitle("Goal Summary")
    }
}
