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
        ScrollView {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 330, height: 260)
                        .foregroundColor(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    VStack {
                        Text("Don't waste your time,")
                        Text("Make it On Going!")
                            .font(.title2)
                            .bold()
                    }
                    archiveRings(radius: 110, percent: 1, background: .gray.opacity(0.1), color: .gray)
                        .padding()
                }
                .padding(.bottom, 20)
    //            Picker("What is your favorite color?", selection: $goalStatus) {
    //                ForEach(status, id: \.self) {
    //                    Text($0)
    //                }
    //            }
    //            .pickerStyle(.segmented)
    //            .padding()
                
                CardArchive(background: Color.gray)
                CardArchive(background: Color.gray)
                CardArchive(background: Color.gray)
                Spacer()
            }
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

struct CardArchive: View {
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
                        .cornerRadius(8)
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color.black)
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.horizontal, 30)
    }
}