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
    case Custom
    
    func getGoals() -> Goal {
        let data = SmartGoalData()
        
        switch self {
        case .Communication:
            return data.getCommunicationGoal()
        case .Collaboration:
            return data.getCollaborationGoal()
        case .Presentation:
            return data.getPresentationGoal()
        case .Custom:
            return data.getCustomGoal()
        }
    }
}


struct SmartGoalData {
    static let communicationString = "Communication"
    static let collaborationString = "Collaboration"
    static let presentationString = "Presentation"
    
    func getCommunicationGoal() -> Goal{
        let ctx = PersistenceController.shared.container.viewContext
        let goal = Goal(context: ctx)
        
        goal.name = SmartGoalData.communicationString
        goal.startDate = Date.now
        goal.id = UUID.init()

        
        let acttivity1 = Activity(context: ctx)
        acttivity1.id = UUID.init()
        acttivity1.name = "Body Language"
        acttivity1.date = Date.now
        acttivity1.number = 1
        acttivity1.goal_id = goal.id
        

        let acttivity2 = Activity(context: ctx)
        acttivity2.id = UUID.init()
        acttivity2.name = "Active Listening"
        acttivity2.date = Date.now
        acttivity2.number = 2
        acttivity2.goal_id = goal.id



        let acttivity3 = Activity(context: ctx)
        acttivity3.id = UUID.init()
        acttivity3.name = "Feedback"
        acttivity3.date = Date.now
        acttivity3.number = 3
        acttivity3.goal_id = goal.id



        let acttivity4 = Activity(context: ctx)
        acttivity4.id = UUID.init()
        acttivity4.name = "Delivery Information"
        acttivity4.date = Date.now
        acttivity4.number = 4
        acttivity4.goal_id = goal.id



        goal.addToActivities(acttivity1)
        goal.addToActivities(acttivity2)
        goal.addToActivities(acttivity3)
        goal.addToActivities(acttivity4)
        
        
        let q1 = Question(context: ctx)
        q1.id = UUID.init()
        q1.text = "What will you prepare and do to master this skill?"
        q1.number = 1
        goal.addToQuestions(q1)

        let q2 = Question(context: ctx)
        q2.text = "What is your goal after mastering this skill?"
        q2.id = UUID.init()
        q2.number = 2
        goal.addToQuestions(q2)

        let q3 = Question(context: ctx)
        q3.text = "why do you have to master this skill?"
        q3.id = UUID.init()
        q3.number = 3
        goal.addToQuestions(q3)
        
        return goal
    }
    
    
    func getCollaborationGoal() -> Goal {
        let ctx = PersistenceController.shared.container.viewContext
        let goal = Goal(context: ctx)
        goal.id = UUID.init()
        goal.name = SmartGoalData.collaborationString
        goal.startDate = Date.now
        
        let acttivity1 = Activity(context: ctx)
        acttivity1.id = UUID.init()
        acttivity1.name = "Team Goal"
        acttivity1.date = Date.now
        acttivity1.number = 1
        acttivity1.goal_id = goal.id
        

        let acttivity2 = Activity(context: ctx)
        acttivity2.id = UUID.init()
        acttivity2.name = "Active Listening"
        acttivity2.date = Date.now
        acttivity2.number = 2
        acttivity2.goal_id = goal.id



        let acttivity3 = Activity(context: ctx)
        acttivity3.id = UUID.init()
        acttivity3.name = "Decision Making"
        acttivity3.date = Date.now
        acttivity3.number = 3
        acttivity3.goal_id = goal.id



        let acttivity4 = Activity(context: ctx)
        acttivity4.id = UUID.init()
        acttivity4.name = "FeedBack / Evaluation"
        acttivity4.date = Date.now
        acttivity4.number = 4
        acttivity4.goal_id = goal.id



        goal.addToActivities(acttivity1)
        goal.addToActivities(acttivity2)
        goal.addToActivities(acttivity3)
        goal.addToActivities(acttivity4)
        
        
        let q1 = Question(context: ctx)
        q1.id = UUID.init()
        q1.text = "What will you prepare and do to master this skill?"
        q1.number = 1
        
        let q2 = Question(context: ctx)
        q2.text = "What is your goal after mastering this skill?"
        q2.id = UUID.init()
        q2.number = 2

        
        let q3 = Question(context: ctx)
        q3.text = "Why do you have to master this skill?"
        q3.id = UUID.init()
        q3.number = 3

        
        goal.addToQuestions(q1)
        goal.addToQuestions(q2)
        goal.addToQuestions(q3)
        
        return goal
    }

    
    func getPresentationGoal() -> Goal {
        let ctx = PersistenceController.shared.container.viewContext
        let goal = Goal(context: ctx)
        goal.id = UUID.init()
        goal.name = SmartGoalData.presentationString
        goal.startDate = Date.now
        
        let acttivity1 = Activity(context: ctx)
        acttivity1.id = UUID.init()
        acttivity1.name = "Scripting"
        acttivity1.date = Date.now
        acttivity1.number = 1
        acttivity1.goal_id = goal.id
        

        let acttivity2 = Activity(context: ctx)
        acttivity2.id = UUID.init()
        acttivity2.name = "Public Speaking"
        acttivity2.date = Date.now
        acttivity2.number = 2
        acttivity2.goal_id = goal.id



        let acttivity3 = Activity(context: ctx)
        acttivity3.id = UUID.init()
        acttivity3.name = "Keynote / Presentation slide"
        acttivity3.date = Date.now
        acttivity3.number = 3
        acttivity3.goal_id = goal.id



        let acttivity4 = Activity(context: ctx)
        acttivity4.id = UUID.init()
        acttivity4.name = "Hands on presentation"
        acttivity4.date = Date.now
        acttivity4.number = 4
        acttivity4.goal_id = goal.id



        goal.addToActivities(acttivity1)
        goal.addToActivities(acttivity2)
        goal.addToActivities(acttivity3)
        goal.addToActivities(acttivity4)
        
        
        let q1 = Question(context: ctx)
        q1.id = UUID.init()
        q1.text = "What will you prepare and do to master this skill?"
        q1.number = 1
        
        let q2 = Question(context: ctx)
        q2.text = "What is your goal after mastering this skill?"
        q2.id = UUID.init()
        q2.number = 2

        
        let q3 = Question(context: ctx)
        q3.text = "Why do you have to master this skill?"
        q3.id = UUID.init()
        q3.number = 3

        
        goal.addToQuestions(q1)
        goal.addToQuestions(q2)
        goal.addToQuestions(q3)
        
        return goal
    }

    
    func getCustomGoal() -> Goal {
        let ctx = PersistenceController.shared.container.viewContext
        let goal = Goal(context: ctx)
        goal.id = UUID.init()
        goal.startDate = Date.now
        goal.isTemplate = false
        
        let q1 = Question(context: ctx)
        q1.id = UUID.init()
        q1.text = "What will you prepare and do to master this skill?"
        q1.number = 1
        
        let q2 = Question(context: ctx)
        q2.text = "What is your goal after mastering this skill?"
        q2.id = UUID.init()
        q2.number = 2

        
        let q3 = Question(context: ctx)
        q3.text = "Why do you have to master this skill?"
        q3.id = UUID.init()
        q3.number = 3

        
        goal.addToQuestions(q1)
        goal.addToQuestions(q2)
        goal.addToQuestions(q3)
        
        return goal
    }
}

