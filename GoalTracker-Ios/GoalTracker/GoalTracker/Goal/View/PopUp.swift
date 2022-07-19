//
//  PopUp.swift
//  GoalTracker
//
//  Created by Agus Budianto on 18/07/22.
//

import SwiftUI

struct PopUp: View{
    @Binding var isPresented: Bool
    @Binding var route: GoalViewMainScreen.Route?

    var body: some View{
        VStack(spacing:10){
            Image("GoalSave")
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text("There’s something to fill")
                .font(.title2.bold())

            Text("You still need to fill activities in order to reach your target more detail")
                .font(.title3)
            Button{
                isPresented.toggle()
                route = .NewGoalsAddActivity
            }label: {
                Text("Fill Now")
                    .foregroundColor(.black)
                    .font(.subheadline.weight(.semibold))
                    .frame(width: 300, height: 55)
                    .background{
                        RoundedRectangle(cornerRadius: 50, style: .continuous)
                            .foregroundColor(.teal)
                    }
            }

            Button{
                isPresented.toggle()
                route = nil
            }label: {
                Text("Next Time")
                    .foregroundColor(.black)
                    .font(.subheadline.weight(.semibold))
                    .frame(width: 300, height: 55)
                    .background{
                        RoundedRectangle(cornerRadius: 50, style: .continuous)
                            .foregroundColor(.teal)
                    }
            }

        }
        .padding(.horizontal, 30)
    }
}


