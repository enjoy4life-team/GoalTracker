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
            VStack {
                
                ForEach(vm.goalProgress, id: \.goalID){ goal in
                    goalRing(radius: 22, percent: 0.6, background: Color.purple.opacity(0.2), color: Color.purple, goalName: goal.goalName, percentColor: Color.purple, subTaskColor: Color.purple)
                        .padding(.bottom, 12)
                    
                }
                //                goalRing(radius: 22, percent: 0.6, background: Color.purple.opacity(0.2), color: Color.purple, goalName: "Goal 1", percentColor: Color.purple, subTaskColor: Color.purple)
                //                    .padding(.bottom, 12)
                //
                //                goalRing(radius: 22, percent: 0.6, background: Color.mint.opacity(0.2), color: Color.mint, goalName: "Goal 2", percentColor: Color.mint, subTaskColor: Color.mint)
                //                    .padding(.bottom, 12)
                //
                //                goalRing(radius: 22, percent: 0.6, background: Color.red.opacity(0.2), color: Color.red, goalName: "Goal 3", percentColor: Color.red, subTaskColor: Color.red)
            }
            .navigationBarTitle("Progress")
            .padding(.top, 10)
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
                Text("60%")
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
                    .font(.subheadline)
                    .fontWeight(.medium)
                Text("Subtask: 10/20")
                    .font(.footnote)
                    .foregroundColor(subTaskColor)
            }
            Spacer()
        }
        .padding(.leading, 3)
        .navigationTitle("Goal Summary")
    }
}
