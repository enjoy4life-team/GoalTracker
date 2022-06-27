//
//  ActivityTask.swift
//  GoalTracker
//
//  Created by Agus Budianto on 25/06/22.
//

import SwiftUI

struct ActivityTask: View {
    var viewModel: GoalDetailViewModel
    var activity: Activity
    var body: some View {
        VStack{
            ForEach(Array(activity.tasks as? Set<Task> ?? []), id: \.self){ task in
                Text("\(task.name ?? "")" )
                Text("\(task.finish ? "finish" : "unfinish")" )
                
                if !task.finish
                    {Button(action: {
                        viewModel.changeActivvityTaskStatus(task: task)
                    }){
                        Text("masrk finish")
                    }
                }
            }
            
            Button(action: {
                let ctx = PersistenceController.shared.container.viewContext
                
                let activity1Task1 = Task(context: ctx)
                activity1Task1.id = UUID.init()
                activity1Task1.name = "task 555"
                
                activity1Task1.activity = activity
            }){
                Text("add")
            }
        }
    }
}



