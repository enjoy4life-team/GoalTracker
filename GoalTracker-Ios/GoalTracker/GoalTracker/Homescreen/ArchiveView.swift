//
//  ArchiveView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 25/06/22.
//

import SwiftUI

struct ArchiveView: View {
    @State private var goalStatus = "Archive"
    var status = ["On Going", "Completed", "Archive"]
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Text("Don't waste your time,")
                    Text("Make it On Going!")
                        .font(.title2)
                        .bold()
                }
                archiveRings(radius: 110, percent: 10, color: .gray)
                    .padding()
            }
            Picker("What is your favorite color?", selection: $goalStatus) {
                ForEach(status, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            CardView()
            Spacer()
        }
        
    }
}

struct archiveRings: View {
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

struct ArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        ArchiveView()
    }
}
