//
//  IosConnectivity.swift
//  GoalTracker
//
//  Created by Agus Budianto on 18/07/22.
//

import Foundation
import WatchConnectivity

class IosConnectivity: NSObject, WCSessionDelegate, ObservableObject {
    
    static let shared = IosConnectivity()

    var goalSummaryViewModel: GoalSummaryViewModel?
    var session: WCSession
    let taskDataStore: TaskLocalDataSource
    let activityStore: ActivityLocalDataSource
    let goalStore: GoalLocalDataSource

    init(session: WCSession = .default){
        self.session = session
        taskDataStore = TaskLocalDefaultDataSource()
        activityStore = ActivityDefaultLocalDataStore()
        goalStore = GoalDefaultLocalDataStore()

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
                    self.goalSummaryViewModel?.getData()

                }
            }catch{
                print(error)
            }


        case MessageKey.getComplicationData.rawValue:

            var complication = [Data]()
            guard let data = try! goalStore.getAllGoalsData() else{
                return
            }
            for goal in data.filter({!$0.isFinished()}) {

                if let activities = goal.activities {
                    for activitiy in activities {
                        let activityData = activitiy as! Activity

                        let calendar = Calendar.current
                        let today = Date()
                        let midnight = calendar.startOfDay(for: today)
                        let tomorrow = calendar.date(byAdding: .day, value: 1, to: midnight)!

                        if let dateActivity = activityData.date{
                            if dateActivity < today || dateActivity > tomorrow{
                                continue
                            }
                        }

                        let cmp = Complication(goalName: goal.name ?? "", activityName: activityData.name ?? "" , time: activityData.date ?? Date.now)

                        complication.append(cmp.encodeIt())
                    }
                }

            }

            print(complication.count)

            replyHandler([dataKey: complication])
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
             guard let data = try activityStore.getTodayActivities() else {
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

            return activityDate > Date.yesterday && activityDate < tomorrow
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


    func updateOnWatch(){
        session.sendMessage(["ping":"pong"], replyHandler: nil)
    }
}

