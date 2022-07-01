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
            Rectangle()
                .foregroundColor(self.chooseBgColor(goalName: goalName))
                .frame(height: 85)
                .cornerRadius(20)
            
            HStack {
                Text(goalName)
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
    
    func chooseBgColor(goalName: String) -> Color {
        switch goalName {
        case SmartGoalData.collaborationString:
            return Color.red
        case SmartGoalData.communicationString:
            return Color.blue
        case SmartGoalData.presentationString:
            return Color.yellow
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
