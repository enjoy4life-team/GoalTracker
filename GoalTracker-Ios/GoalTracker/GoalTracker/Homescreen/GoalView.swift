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
        ScrollView{
            VStack {
                ZStack {
                    Text("On Going")
                        .font(.title2)
                        .bold()
                    
                    Group {
                        goalRings(radius: 110, percent: 0.85, background: .black.opacity(0.1), color: .black)
                        goalRings(radius: 90, percent: 0.45, background: .mint.opacity(0.1), color: .mint)
                        goalRings(radius: 70, percent: 0.6, background: .red.opacity(0.1), color: .red)
                    }
                }
                .padding()
                
                Picker("", selection: $goalStatus) {
                    ForEach(status, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
//                CardView()
                CardNew(background: .black)
                CardNew(background: .mint)
                CardNew(background: .red)
                
                
//                Spacer()
            }
        }
            
        
    }
}

struct goalRings: View {
    var radius: CGFloat
    var percent: CGFloat
    
    var background : Color = .red.opacity(0.05)
    var color: Color = Color.red
    var lineWidth: CGFloat = 16
    var animationDuration: CGFloat = 0.5
    
    @State var trimRing = false
    
    var body: some View {
        Group {
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
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
    }
}

struct CardNew: View {
    var background: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(background)
                .frame(height: 85)
                .cornerRadius(20)
            
            HStack {
                Text("Presentation")
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .cornerRadius(12)
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color.black)
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.horizontal, 30)
    }
}
