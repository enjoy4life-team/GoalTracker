//
//  GoalTemplateDummy.swift
//  GoalTracker
//
//  Created by Agus Budianto on 23/06/22.
//

import Foundation
import CoreData

enum SmartGoalTemplate{
    case Communication
    case Collaboration
    case Presentation
    
    func getGoals() -> Goal {
        let data = SmartGoalData()
        
        switch self {
        case .Communication:
            return data.getCommunicationGoal()
        case .Collaboration:
            return data.getCollaborationGoal()
        case .Presentation:
            return data.getPresentationGoal()
        }
    }
}


struct SmartGoalData {
    static var communicationString = "Communication"
    static var collaborationString = "Collaboration"
    static var presentationString = "Presentation"
    
    func getCommunicationGoal() -> Goal{
        let ctx = PersistenceController.shared.container.viewContext
        let goal = Goal(context: ctx)
        
        goal.name = "Communication"
        goal.startDate = Date.now
        goal.id = UUID.init()

        
        let acttivity1 = Activity(context: ctx)
        acttivity1.id = UUID.init()
        acttivity1.name = "Activity 1"
        acttivity1.date = Date.now
        acttivity1.number = 1
        acttivity1.goal_id = goal.id
        
        let activity1Task1 = Task(context: ctx)
        activity1Task1.id = UUID.init()
        activity1Task1.name = "task 1"

        let activity1Task2 = Task(context: ctx)
        activity1Task2.id = UUID.init()
        activity1Task2.name = "task 2"

        acttivity1.addToTasks(activity1Task1)
        acttivity1.addToTasks(activity1Task2)


        let acttivity2 = Activity(context: ctx)
        acttivity2.id = UUID.init()
        acttivity2.name = "Activity 2"
        acttivity2.date = Date.now
        acttivity2.number = 2
        acttivity2.goal_id = goal.id



        let acttivity3 = Activity(context: ctx)
        acttivity3.id = UUID.init()
        acttivity3.name = "Activity 3"
        acttivity3.date = Date.now
        acttivity3.number = 3
        acttivity3.goal_id = goal.id



        let acttivity4 = Activity(context: ctx)
        acttivity4.id = UUID.init()
        acttivity4.name = "Activity 4"
        acttivity4.date = Date.now
        acttivity4.number = 4
        acttivity4.goal_id = goal.id



        goal.addToActivities(acttivity1)
        goal.addToActivities(acttivity2)
        goal.addToActivities(acttivity3)
        goal.addToActivities(acttivity4)
        return goal
    }
    
    
    func getCollaborationGoal() -> Goal {
        let ctx = PersistenceController.shared.container.viewContext
        let goal = Goal(context: ctx)
        goal.id = UUID.init()
        goal.name = "Collaboration"
        goal.startDate = Date.now
        
//        let acttivity1 = Activity(context: ctx)
//        let acttivity2 = Activity(context: ctx)
//        let acttivity3 = Activity(context: ctx)
//        let acttivity4 = Activity(context: ctx)
//
//
//        goal.addToActivities(acttivity1)
//        goal.addToActivities(acttivity2)
//        goal.addToActivities(acttivity3)
//        goal.addToActivities(acttivity4)
        return goal
    }

    
    func getPresentationGoal() -> Goal {
        let ctx = PersistenceController.shared.container.viewContext
        let goal = Goal(context: ctx)
        goal.id = UUID.init()
        goal.name = "Presentation"
        goal.startDate = Date.now
        
//        let acttivity1 = Activity(context: ctx)
//        let acttivity2 = Activity(context: ctx)
//        let acttivity3 = Activity(context: ctx)
//        let acttivity4 = Activity(context: ctx)
//
//
//        goal.addToActivities(acttivity1)
//        goal.addToActivities(acttivity2)
//        goal.addToActivities(acttivity3)
//        goal.addToActivities(acttivity4)
        return goal
    }

}

