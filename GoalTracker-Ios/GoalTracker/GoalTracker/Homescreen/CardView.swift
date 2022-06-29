//
//  CardView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 23/06/22.
//

import SwiftUI

struct CardView: View {
    
    var body: some View {
        List( 1..<4 ) { item in
            card()
        }
        .listStyle(.insetGrouped)
        
    }
}

struct card: View {
    var goalName = "Presentation"
//    var background: Color
    
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
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color.white)
                }
            }
            .padding(.top)
            .padding(.bottom)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
