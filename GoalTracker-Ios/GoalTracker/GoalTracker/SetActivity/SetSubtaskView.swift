//
//  SetSubtaskView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 25/06/22.
//

import SwiftUI

//struct subtaskArray {
//    let id = UUID()
//    let activity: String
//}

struct SetSubtaskView: View {
    @State private var subtask = 0
    @State private var isDateOn = false
    @State private var isTimeOn = false
    @State private var repeatTask = "0"
    @State private var notes = ""
    @State private var activity = ""
    
    @State private var subtaskArray: [String] = []

    
    private func addRow() {
        if activity != "" {
//            subtaskArray.removeLast()
            subtaskArray.append("\(activity)")
//            activity = ""
        }else{
            self.subtaskArray.append("\(activity)")
        }
    }
    
    private func remRow() {
        self.subtaskArray.removeLast()
    }
    
//    var results = [
//        subtaskArray(activity: "makan"),
//        subtaskArray(activity: "minum"),
//        subtaskArray(activity: "jog")
//    ]
    
    var body: some View {
        List {
            Section {
                Stepper("Subtask", onIncrement: {
                    subtask += 1
                    self.addRow()
                }, onDecrement: {
                    subtask -= 1
                    self.remRow()
                })

//                ForEach(results, id: \.id) { result in
//                    Text(result.activity)
//                }
                
                ForEach($subtaskArray, id: \.self) { location in
//                    Text(location)
                    TextField("New Activity", text: $activity)
                }
            }
            
            Section {
                //DATE
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: 30, height: 30)
                            .cornerRadius(5)
                            .padding(.vertical)
                        
                        Label("", systemImage: "calendar")
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                            .padding(.bottom, 2)
                    }
                    VStack (alignment: .leading){
                        Text("Date")
                            .font(.body)
                            
                        Text("Today")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    
                    Toggle("", isOn: $isDateOn)
                }
                
                //TIME
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: 30, height: 30)
                            .cornerRadius(5)
                            .padding(.vertical)
                        
                        Label("", systemImage: "clock")
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                            .padding(.bottom, 2)
                    }
                    VStack(alignment: .leading) {
                        Text("Time")
                            .font(.body)
                            
                        Text("4:00 AM")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    
                    Toggle("", isOn: $isTimeOn)
                }
                
            }
            //REPEAT
            Section {
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.5)
                            .frame(width: 30, height: 30)
                            .cornerRadius(5)
                            .padding(.vertical)
                        
                        Label("", systemImage: "repeat")
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                            .padding(.bottom, 2)
                    }
                    
                    Picker("Repeat", selection: $repeatTask){
                        Text("Never").tag("0")
                        Text("Daily").tag("1")
                        Text("Weekly").tag("2")
                        Text("Monthly").tag("3")
                    }
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            
            Section {
                HStack{
                    VStack {
                        TextField("Notes", text: $notes)
                            .padding(.bottom, 60)
                    }
                    .frame(height: 118)
                }
            }
        }
        .listStyle(.insetGrouped)
    }
    
}

struct SetSubtaskView_Previews: PreviewProvider {
    static var previews: some View {
        SetSubtaskView()
    }
}
