//
//  CardView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 23/06/22.
//

import SwiftUI

//struct CardView: View {
//    
//    var body: some View {
//        List( 1..<4 ) { item in
//            card()
//        }
//        .listStyle(.insetGrouped)
//        
//    }
//
//}


struct card: View {
    var goalName: String
    
    var body: some View {
        ZStack {
            HStack {
                Text(goalName)
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.black)
                        .cornerRadius(12)
                    
                    Label("", systemImage: "arrow.right")
                        .padding(.leading, 10)
                        .padding(.bottom, 2)
                        .foregroundColor(.white)
                }
            }
            
        }.padding()
            .padding(.horizontal, 30)
            .background(self.chooseBgColor(goalName: goalName))
            .cornerRadius(20)
            
            
    }
    
    func chooseBgColor(goalName: String) -> Color {
        switch goalName {
        case SmartGoalData.collaborationString:
            return Color.red
        case SmartGoalData.communicationString:
            return Color.blue
        case SmartGoalData.presentationString:
            return Color.black
        default:
            return Color.green
        }
        
        
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        card(goalName: "test")
    }
}
