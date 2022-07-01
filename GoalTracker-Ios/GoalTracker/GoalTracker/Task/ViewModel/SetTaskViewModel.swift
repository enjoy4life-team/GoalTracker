//
//  SetTaskViewModel.swift
//  GoalTracker
//
//  Created by Agus Budianto on 01/07/22.
//

import Foundation

class SetTaskViewModel: ObservableObject {
    var activity: Activity

    @Published var tasks = [Task]()

    init(activity: Activity){
        self.activity = activity
        tasks = Array(activity.tasks as? Set<Task> ?? []).sorted(by: {$0.number > $1.number})
    }
    
    func refreshData(){
        tasks = Array(activity.tasks as? Set<Task> ?? []).sorted(by: {$0.number > $1.number})
    }
    
    
    func moveData(fromOffsets source: IndexSet, toOffset destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func saveChanges(){
        var i  = 0
        tasks.forEach{ _ in
            tasks[i].number = (Int16(i + 1))
            i = i+1
        }
        
    }
    
    func deleteData(idx: IndexSet) {
        tasks.remove(atOffsets: idx)
        activity.tasks = NSSet(array: tasks)
    }
    
}
   
