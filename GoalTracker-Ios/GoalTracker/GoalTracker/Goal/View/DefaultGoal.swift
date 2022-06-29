//
//  DefaultGoal.swift
//  GoalTracker
//
//  Created by Mikhael Budi Mulya Marpaung on 28/06/22.
//

import SwiftUI

struct Communication: View{
    @State var startDate = Date()
    @State var targetDate = Date()
    @State var smart1 = String()
    @State var smart2 = String()
    @State var smart3 = String()
    
    var body: some View{
        NavigationView{
            VStack(spacing: 15){
                ZStack{
                    Image("Communication")
                        .resizable()
                        .frame(width: .infinity,
                               height: 187)
                    
                    Text("Communication")
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.top, 120)
                        .padding(.trailing, 150)
                }
                
                Group{
                    DatePicker("Start Date",
                               selection: $startDate,
                               in: Date()...,
                               displayedComponents: [DatePickerComponents.date, DatePickerComponents.hourAndMinute])
                    
                    Divider()
                    
                    DatePicker("Target Date",
                               selection: $targetDate,
                               in: Date()...,
                               displayedComponents: [DatePickerComponents.date, DatePickerComponents.hourAndMinute])
                }
                .padding(.horizontal, 30)
                
                
                Group{
                    Text("Why do you have to master this skill?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.bottom, -10)
                        .padding(.top)
                    TextField("write it down here", text: $smart1)
                        .onChange(of: smart1) { newValue in
                            if newValue.count > 10 {
                                self.smart1 = String(newValue.prefix(256))
                            }
                        }
                        .frame(width: 320, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10,
                                             style: .continuous)
                            .fill(.gray.opacity(0.2))
                            .frame(width: 350, height: 50))
                    
                    Text("Who, what resources, or what else do you need?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.bottom, -10)
                    TextField("write it down here", text: $smart2)
                        .onChange(of: smart1) { newValue in
                            if newValue.count > 10 {
                                self.smart1 = String(newValue.prefix(256))
                            }
                        }
                        .frame(width: 320, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10,
                                             style: .continuous)
                            .fill(.gray.opacity(0.2))
                            .frame(width: 350, height: 50))
                    
                    Text("What is the your first step?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.bottom, -10)
                    TextField("write it down here", text: $smart3)
                        .onChange(of: smart1) { newValue in
                            if newValue.count > 10 {
                                self.smart1 = String(newValue.prefix(256))
                            }
                        }
                        .frame(width: 320, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10,
                                             style: .continuous)
                            .fill(.gray.opacity(0.2))
                            .frame(width: 350, height: 50))
                }
            }
            .navigationTitle("Set Goal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        
                    } label: {
                        Text("Save")
                    }
                    .tint(.blue)
                }
            }
        }
    }
}

struct Communication_Previews: PreviewProvider {
    static var previews: some View {
        Communication()
    }
}

