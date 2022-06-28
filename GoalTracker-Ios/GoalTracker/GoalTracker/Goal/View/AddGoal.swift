//
//  AddGoal.swift
//  GoalTracker
//
//  Created by Mikhael Budi Mulya Marpaung on 28/06/22.
//

import SwiftUI

struct AddGoal: View {
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Image("Communication")
                        .resizable()
                        .frame(width: 330,
                               height: 120)
                        .cornerRadius(20)
                    
                    NavigationLink(destination: Communication(), label: {
                        Text("Communication")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                            .padding(.top, 60)
                            .padding(.trailing, 120)
                    })
                }
                ZStack{
                    Image("Collaboration")
                        .resizable()
                        .frame(width: 330,
                               height: 120)
                        .cornerRadius(20)
                    NavigationLink(destination: Communication(), label: {
                        Text("Collaboration")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                            .padding(.top, 60)
                            .padding(.trailing, 140)
                    })
                }
                ZStack{
                    Image("Presentation")
                        .resizable()
                        .frame(width: 330,
                               height: 120)
                        .cornerRadius(20)
                    
                    NavigationLink(destination: Communication(), label: {
                        Text("Presentation")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                            .padding(.top, 60)
                            .padding(.trailing, 145)
                    })
                }
                ZStack{
                    Image("Custom Goal")
                        .resizable()
                        .frame(width: 330, height: 120)
                        .cornerRadius(20)
                    NavigationLink(destination: Communication(), label: {
                        Text("+ Custom Goal")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                            .padding()
                    })
                }
            }
            .navigationTitle("Select Goal")
            .padding(.top, -150)
        }
    }
}

struct AddGoal_Previews: PreviewProvider {
    static var previews: some View {
        AddGoal()
    }
}
