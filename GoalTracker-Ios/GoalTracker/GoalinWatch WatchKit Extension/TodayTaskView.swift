//
//  TodayTaskView.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Mikhael Budi Mulya Marpaung on 15/07/22.
//

import SwiftUI

struct TodayTaskView: View {
    
    @State var isTapped: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 3) {
                ForEach((1...3), id: \.self) {
                    Text("Activity \($0)")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Button{
                        isTapped.toggle()
                    } label: {
                        Image(systemName: "rectangle.fill")
                            .resizable()
                            .frame(width: 15, height: .infinity)
                            .padding(.leading, -15)
                            .foregroundColor(isTapped ? .gray.opacity(0.8) : .white)
                        
                        VStack(alignment: .leading, spacing: 3){
                            HStack{
                                Image(systemName: isTapped ? "checkmark.circle" : "circle")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.gray)
                                
                                Text("Subtask 1")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .strikethrough(isTapped)
                                    .foregroundColor(isTapped ? .gray.opacity(0.8) : .white)
                            }
                            
                            Text("17.50")
                                .font(.caption)
                                .padding(.leading, 25)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Today's Tasks")
    }
}

struct TodayTaskView_Previews: PreviewProvider {
    static var previews: some View {
        TodayTaskView()
    }
}

