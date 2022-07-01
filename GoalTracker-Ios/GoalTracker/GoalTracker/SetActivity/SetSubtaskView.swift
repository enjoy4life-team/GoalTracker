//
//  SetSubtaskView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 25/06/22.
//

import SwiftUI
import Combine

struct Subtask: Identifiable {
    var id = UUID()
    var subtaskName: String
}

struct SetSubtaskView: View {
    
    @State private var notes: String = "Notes"
    @State private var subtaskName = ""
    @State private var newActivity = ""
    @State private var activityName : String = ""
//    @State private var editMode = true
    @State private var editMode: EditMode = .active
    
    @State var subtask: [String] = []
    
    var placeholderString = "Notes"
    
    var body: some View {
        List {
            
            //Activity Name
            Section {
                TextField("Activity Name", text: $activityName)
            }
            
            //Subtask
            Section {
                HStack {
                    Text("Subtask")
                    Spacer()
                    ZStack {
                        Rectangle()
                            .frame(width: 50, height: 35)
                            .foregroundColor(Color.blue)
                            .cornerRadius(10)
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                addSubtask()
                            }
                    }
                }
                ForEach(subtask.indices, id: \.self) { index in
                    TextField("New Subtask", text: $subtask[index])
                }
                
                .onDelete(perform: delete)
                .onMove(perform: moveItem)
                .environment(\.editMode, $editMode)
            }
            
            Section {
                //DATE
                DateActivity()
                
                //TIME
                TimeActivity()
            }
            Section {
                //REPEAT
                RepeatActivity()
            }
            Section {
                //NOTES
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
    
    func addSubtask() {
        subtask.append("")
    }
    
    func delete(indexSet: IndexSet) {
        subtask.remove(atOffsets: indexSet)
    }
    
    func moveItem(indices: IndexSet, newOffset: Int) {
        subtask.move(fromOffsets: indices, toOffset: newOffset)
    }
}

struct SetSubtaskView_Previews: PreviewProvider {
    static var previews: some View {
        SetSubtaskView()
    }
}

struct DateActivity: View {
    
    @State private var isDateOn = false
    
    var body: some View {
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
    }
}

struct TimeActivity: View {
    
    @State private var isTimeOn = false
    
    var body: some View {
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
}

struct RepeatActivity: View {
    
    @State private var repeatActivity = "0"
    
    var body: some View {
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
                Picker("", selection: $repeatActivity){
                    Text("Never").tag("0")
                    Text("Daily").tag("1")
                    Text("Weekly").tag("2")

                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
