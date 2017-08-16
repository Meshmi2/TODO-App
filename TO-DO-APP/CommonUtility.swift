//
//  CommonUtility.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 7/31/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit


final class CommonUtility {
    enum Months: Int {case January = 1, February, March, April, May, June, July, August, September, October, November, December}
    
    static func formatToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
    
    static func formatTimeToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }

    static func formatStringToTime(_ date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.date(from: date)!
    }
    
    static func formatStringToDate(_ date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: date)!
    }

    static func currentTime () -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }

    static func getDayName() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }

    static func getDayName(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }

    static func getNumberDay(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date)
    }

    static func getMonthInYear(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MMMM, yyyy"
        return dateFormatter.string(from: date)
    }

    static func getDayInTheDay() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        var dayInTheDay = "Welcome"
        if 6 < hour && hour <= 11 {
            dayInTheDay = "Good morning"
        } else if 12 <= hour && hour < 18 {
            dayInTheDay = "Good afternoon"
        } else {
            dayInTheDay = "Good evening"
        }
        return dayInTheDay
    }

    static func getCurrenMonth () -> String {
        let date = Date()
        let calendar = Calendar.current
        return String(calendar.component(.month, from: date))
    }

    static func getMonth (_ month: Months) -> String {
        switch month {
        case .January:
            return "January"
        case .February:
            return "February"
        case .March:
            return "March"
        case .April:
            return "April"
        case .May:
            return "May"
        case .June:
            return "June"
        case .July:
            return "July"
        case .August:
            return "August"
        case .September:
            return "September"
        case .October:
            return "October"
        case .November:
            return "November"
        case .December:
            return "December"
        }
    }
}
