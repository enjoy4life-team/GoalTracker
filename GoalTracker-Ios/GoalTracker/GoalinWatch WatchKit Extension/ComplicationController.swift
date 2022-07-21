//
//  ComplicationController.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Agus Budianto on 14/07/22.
//

import ClockKit
import SwiftUI


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Complication Configuration
    @ObservedObject var vm = WatchConnectivity.shared
    
    
    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
        let descriptors = [
            CLKComplicationDescriptor(identifier: "complication", displayName: "GoalTracker", supportedFamilies: [CLKComplicationFamily.graphicRectangular])
            // Multiple complication support can be added here with more descriptors
        ]
        
        // Call the handler with the currently supported complication descriptors
        handler(descriptors)
    }
    
    func handleSharedComplicationDescriptors(_ complicationDescriptors: [CLKComplicationDescriptor]) {
        // Do any necessary work to support these newly shared complication descriptors
    }
    
    // MARK: - Timeline Configuration
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        // Call the handler with the last entry date you can currently provide or nil if you can't support future timelines
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        // Call the handler with your desired behavior when the device is locked
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        
        if let data  = vm.nextActivity(from: Date()) {
            if let ctemplate = makeTemplate(complication: complication, data: data){
                let entry = CLKComplicationTimelineEntry(
                    date: data.time,
                    complicationTemplate: ctemplate)
                handler(entry)
                
                return
            }
        }
        
        
        handler(CLKComplicationTimelineEntry(
            date: Date(),
            complicationTemplate:         CLKComplicationTemplateGraphicRectangularFullView(ComplicationViewEmpty())))
    }
    
    
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after the given date
        var entries: [CLKComplicationTimelineEntry] = []
        
        
        for d in vm.complicationData.reversed(){
            if entries.count < limit && d.time.timeIntervalSince(date) > 0 {
                if let ctemplate = makeTemplate(complication: complication, data: d){
                    let entry = CLKComplicationTimelineEntry(
                        date: d.time,
                        complicationTemplate: ctemplate)
                    
                    entries.append(entry)
                }
            }
        }
        
        handler(entries)
    }
    
    // MARK: - Sample Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        handler(nil)
    }
    
    func getNextRequestedUpdateDate(handler: @escaping (Date?) -> Void) {
        if let act = vm.nextActivity(from: Date()) {
            handler(act.time)
        }
    }
}


extension ComplicationController {
    func makeTemplate(
        complication: CLKComplication,
        data: Complication
    ) -> CLKComplicationTemplate? {
        switch complication.family {
        case .graphicRectangular:
            return CLKComplicationTemplateGraphicRectangularFullView(ComplicationViewRectangular(data: data))
        default:
            return nil
        }
    }
}
