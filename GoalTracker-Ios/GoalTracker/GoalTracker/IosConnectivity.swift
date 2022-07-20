//
//  IosConnectivity.swift
//  GoalTracker
//
//  Created by Agus Budianto on 18/07/22.
//

import Foundation
import WatchConnectivity

class IosConnectivity: NSObject, WCSessionDelegate, ObservableObject {
    
    var session: WCSession
    let dataStore: ActivityLocalDataSource
    let taskDataStore: TaskLocalDataSource
    
    init(session: WCSession = .default){
        self.session = session
        dataStore = ActivityDefaultLocalDataStore()
        taskDataStore = TaskLocalDefaultDataSource()
        
        super.init()
        self.session.delegate = self
        self.session.activate()
    }
    
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print(message)

    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        guard let key = message[msgKey] as? String else {
            return
        }
        
        switch key{
        case MessageKey.getGoalProgress.rawValue:
            replyHandler([dataKey: [GoalProgress(goalName: "A", completedTask: 10, totalTask: 20).encodeIt()]])
        case MessageKey.getTodayActivity.rawValue:
            if let todayActivity = getTodayActivities(){
                replyHandler([dataKey: todayActivity.encodeIt()])
            }
        case MessageKey.markTaskComplete.rawValue:
            guard let taskID = message["task_id"] as? String else {
                return
            }
            
            do {
                if let task = try taskDataStore.getTaskByID(taskId: taskID) {
                    task.finish.toggle()
                    taskDataStore.saveChanges()
                }
            }catch{
                print(error)
            }
            
        default:
            return
        }
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
     private func getTodayActivities() -> TodayActivity? {
                
        var todayActivity = TodayActivity()
        var activities = [Activity]()
        
         do{
             guard let data = try dataStore.getTodayActivities() else {
                 return nil
             }
             
             activities = data
             
         }catch{
             print(error)
         }
       
        let calendar = Calendar.current
                
        let today = Date()
        let midnight = calendar.startOfDay(for: today)
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: midnight)!

        activities = activities.filter{ activity in
            guard let activityDate = activity.date else{
                return false
            }
            
            return activityDate > today && activityDate < tomorrow
        }
                
        var goalName = ""
        for activity in activities {
            var activityItem = ActivityItem()
            
            goalName = activity.goal?.name ?? ""
            activityItem.activityName = activity.name
            activityItem.activityDate = activity.date
            
            let tasks = Array(activity.tasks as? Set<Task> ?? []).sorted(by: {$0.number > $1.number})
            
            for task in tasks {
                let taskDetail = TaskItem(taskID: task.id!, taskName: task.name ?? "", finish: task.finish, number: Int(task.number))
//                taskDetail.taskID = task.id
                
                activityItem.TaskList.append(taskDetail)
            }
            
            todayActivity.activityList.append(activityItem)
            
        }
                
         todayActivity.goalName = goalName
         
         return todayActivity
    }
    
}

