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


struct DateView: View {
    @Binding var date : Date
    
    var body: some View {
        DatePicker(
            "Start Date",
            selection: $date,
            displayedComponents: [.date, .hourAndMinute]
        )
    }
}

struct TaskView: View {
    
    @ObservedObject var viewModel: SetTaskViewModel
    @State private var editMode: EditMode = .active
    
    var placeholderString = "Notes"
    
    var body: some View {
        List {
            Section(header: Text("Activity Name")) {
                TextField("Activity Name", text: $viewModel.activity.name.toUnwrapped(defaultValue: ""))
            }
            
            //Subtask
            Section(header: Text("Subtask")) {
                HStack {
                    Text("Add Subtask")
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
                ForEach(0..<viewModel.tasks.count, id: \.self) { index in
                    TextField("New Subtask", text: $viewModel.tasks[index].name.toUnwrapped(defaultValue: ""))
                }
                .onMove(perform: { from, to in
                    viewModel.moveData(fromOffsets: from, toOffset: to)
                    viewModel.refreshData()
                })
                .onDelete(perform: { deletedOffsets in
                    viewModel.deleteData(idx: deletedOffsets)
                    viewModel.refreshData()
                })
                
            }
            
            Section(header: Text("Activity Schedule")) {
                
                if let dateActivity = viewModel.activity.date {
                    DateView(date: $viewModel.activity.date.toUnwrapped(defaultValue: dateActivity))
                }
            }
            
//            Section {
//                //DATE
//                DateActivity()
//
//                //TIME
//                TimeActivity()
//            }
//            Section {
//                //REPEAT
//                RepeatActivity()
//            }
            Section(header: Text("Notes")) {
                //NOTES
                TextEditor(text: self.$viewModel.activity.note.toUnwrapped(defaultValue: ""))
                    .frame(height: 118)
                    .foregroundColor(.primary)


            }
            
        }
        .listStyle(.insetGrouped)
        .background(Color.red)
        .environment(\.editMode, $editMode)
        
    }
    
    func addSubtask() {
        let task = Task(context: PersistenceController.shared.container.viewContext)
        task.name = "new subtask"
        task.id = UUID.init()
        task.finish = false
        task.number = Int16(viewModel.tasks.count + 1)
        
        
        viewModel.activity.addToTasks(task)
        viewModel.refreshData()
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
