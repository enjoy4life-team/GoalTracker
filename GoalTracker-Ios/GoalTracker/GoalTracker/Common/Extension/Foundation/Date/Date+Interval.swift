//
//  Date+Interval.swift
//  GoalTracker
//
//  Created by Agus Budianto on 14/07/22.
//

import Foundation

extension Date {

    static func -(recent: Date, previous: Date) -> (month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?) {
            let day = Calendar.current.dateComponents([.day], from: previous, to: recent).day
            let month = Calendar.current.dateComponents([.month], from: previous, to: recent).month
            let hour = Calendar.current.dateComponents([.hour], from: previous, to: recent).hour
            let minute = Calendar.current.dateComponents([.minute], from: previous, to: recent).minute
            let second = Calendar.current.dateComponents([.second], from: previous, to: recent).second

            return (month: month, day: day, hour: hour, minute: minute, second: second)
        }

}


extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}
