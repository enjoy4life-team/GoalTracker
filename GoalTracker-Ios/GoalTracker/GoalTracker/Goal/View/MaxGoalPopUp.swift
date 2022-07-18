//
//  MaxGoalPopUp.swift
//  GoalTracker
//
//  Created by Agus Budianto on 18/07/22.
//

import SwiftUI

struct MaxGoalPopUp: View{
    @Binding var isPresented: Bool

    var body: some View{
        VStack(spacing:10){
            Image("GoalSave")
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text("You Reach Max Ongoing Goal")
                .font(.title2.bold())

            Text("There only can be 3 active goals to be achive at the same time.")
                .font(.title3)
            Button{
                isPresented.toggle()
            }label: {
                Text("I Understand")
                    .foregroundColor(.black)
                    .font(.subheadline.weight(.semibold))
                    .frame(width: 300, height: 55)
                    .background{
                        RoundedRectangle(cornerRadius: 50, style: .continuous)
                            .foregroundColor(.teal)
                    }
            }
            .padding(.top, 50)

            

        }
        .padding(.horizontal, 30)
    }
}




struct MaxGoalPopUp_Previews: PreviewProvider {
    static var previews: some View {
        MaxGoalPopUp(isPresented: .constant(true))
    }
}
