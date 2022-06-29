//
//  SetSubtaskView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 25/06/22.
//

import SwiftUI
import Combine

struct Item: Identifiable {
    let id = UUID()
    var activity: String
}

struct SetSubtaskView: View {
    @State private var subtask = 0
    @State private var isDateOn = false
    @State private var isTimeOn = false
    @State private var repeatTask = "0"
    @State private var notes: String = "Notes"
    @State private var activity = ""
    @State private var newActivity = ""
    @State private var activityName = ""
    
    @State private var subtaskArray: [Item] = []
    
    var placeholderString = "Notes"

    
    private func onAdd(activity: String){
        subtaskArray.append(Item(activity: activity))
        self.newActivity = ""
    }
    
    private func remRow() {
        self.subtaskArray.removeLast()
    }
    
    var body: some View {
        List {
            Section {
                TextField("Activity Name", text: $activityName)
            }
            
            Section {
                Stepper("Subtask", onIncrement: {
                    subtask += 1
                    self.onAdd(activity: activity)
                }, onDecrement: {
                    subtask -= 1
                    self.remRow()
                })
                
                ForEach(subtaskArray, id: \.id) { result in
                    HStack {
                        TextField("New Activity", text: $activity)
                    }
                }
            }
            .navigationTitle("Scripting")
            
            
            Section {
                //DATE
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.red)
                            .frame(width: 30, height: 30)
                            .cornerRadius(5)
                            .padding(.vertical, 10)
                        
                        Image(systemName: "calendar")
                            .foregroundColor(Color.white)
                    }
                    .padding(.leading, 5)
                    .padding(.trailing, 10)
                    
                    VStack (alignment: .leading){
                        Text("Date")
                            .font(.body)
                            
                        Text("Today")
                            .font(.subheadline)
                            .foregroundColor(Color.blue)
                    }
                    Spacer()
                    
                    Toggle("", isOn: $isDateOn)
                }
                
                //TIME
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.blue)
                            .frame(width: 30, height: 30)
                            .cornerRadius(5)
                            .padding(.vertical, 10)
                        
                        Image(systemName: "clock")
                            .foregroundColor(Color.white)
                    }
                    .padding(.leading, 5)
                    .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Time")
                            .font(.body)
                            
                        Text("4:00 AM")
                            .font(.subheadline)
                            .foregroundColor(Color.blue)
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
                            .foregroundColor(Color.gray)
                            .opacity(0.5)
                            .frame(width: 30, height: 30)
                            .cornerRadius(5)
                            .padding(.vertical, 10)
                        
                        Image(systemName: "repeat")
                            .foregroundColor(Color.white)
                    }
                    .padding(.leading, 5)
                    .padding(.trailing, 10)
                    
                    HStack {
                        Text("Repeat")
                        Picker("", selection: $repeatTask){
                            Text("Never").tag("0")
                            Text("Daily").tag("1")
                            Text("Weekly").tag("2")
                            Text("Monthly").tag("3")
                        }
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            
            //NOTES
            Section {
                TextEditor(text: self.$notes)
                    .frame(height: 118)
                    .foregroundColor(self.notes == placeholderString ? .gray : .primary)
                    .onTapGesture {
                        if self.notes == placeholderString {
                            self.notes = ""
                        }
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
