//
//  GoalView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 24/06/22.
//

import SwiftUI

struct GoalView: View {
    
    @State private var goalStatus = "On Going"
    var status = ["On Going", "Completed", "Archive"]
    
    var body: some View{
        VStack {
            ZStack {
                Text("On Going")
                    .font(.title2)
                    .bold()
                
                goalRings(radius: 110, percent: 0.85,  color: .black)
                goalRings(radius: 90, percent: 0.45, color: .mint)
                goalRings(radius: 70, percent: 0.6, color: .red)
            }
            .padding()
            
            Picker("What is your favorite color?", selection: $goalStatus) {
                ForEach(status, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            CardView()
//            Text("Value: \(goalStatus)")
            
            Spacer()
        }
    }
}

struct goalRings: View {
    var radius: CGFloat
    var percent: CGFloat
    
    var background : Color = .gray
        .opacity(0.3)
    var color: Color = Color.red
    var lineWidth: CGFloat = 16
    var animationDuration: CGFloat = 0.5
    
    @State var trimRing = false
    
    var body: some View {
        Group {
            ZStack {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: self.lineWidth))
                    .foregroundColor(background)
                    .frame(width: self.radius * 2, height: self.radius * 2)
                
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
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
    }
}
