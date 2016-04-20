//
//  CalendarBrain.swift
//  Meal Tokens
//
//  Created by Issac Greenfield on 3/7/16.
//  Copyright © 2016 Issac Greenfield. All rights reserved.
//

import Foundation

class CalendarBrain
{

    let calendar: NSCalendar
    private let delimiter: String
    var currentDate: NSDate
    var components: NSDateComponents
    
    init(delimiter: String)
    {
        self.delimiter = delimiter
        calendar = NSCalendar.currentCalendar()
        currentDate = NSDate()
        components = calendar.components([.Year, .Month, .Day, .WeekdayOrdinal], fromDate: currentDate)
    }
    
    internal func updateCurrentDate()
    {
        currentDate = NSDate()
        components = calendar.components([.Year, .Month, .Day, .WeekdayOrdinal], fromDate: currentDate)
    }
    
    ///Takes an NSDate and returns a String in the format YYYY/MM/DD
    func getCurrentDateToString(nsDate: NSDate)-> String
    {
        components = calendar.components([.Year, .Month, .Day, .WeekdayOrdinal], fromDate: nsDate)
        let stringDate: String = ("\(components.year)\(delimiter)\(components.month)\(delimiter)\(components.day)")
        return stringDate
    }
    
    ///Returns a String, "date", which contains todays date in the format YYYY/MM/DD
    func getCurrentDate()-> String
    {
        updateCurrentDate()
        let stringDate: String = ("\(components.year)\(delimiter)\(components.month)\(delimiter)\(components.day)")
        return stringDate
    }
    
    //returns an Int between 1-7, such that 1 = Sunday, 2 = Monday, and so on
    func getDayOfWeek()-> Int{
        let dayOfTheWeek = components.weekdayOrdinal
        return dayOfTheWeek
    }
    
    ///Returns a dictionary of the past week with the date corresponding to the days of the week in the form [Int:NSDate]
    func getCurrentWeek()-> [Int:NSDate]
    {
        updateCurrentDate()
        var thisWeekDictionary: [Int:NSDate] = [:]
        let dayOfTheWeek = getDayOfWeek()
        
        let today = currentDate
        
        let todayPlusOne = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: 1,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        let todayPlusTwo = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: 2,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        let todayPlusThree = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: 3,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        let todayPlusFour = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: 4,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        let todayPlusFive = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: 5,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        let todayPlusSix = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: 6,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        let todayMinusOne = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: -1,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        let todayMinusTwo = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: -2,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        let todayMinusThree = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: -3,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        let todayMinusFour = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: -4,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        let todayMinusFive = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: -5,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        let todayMinusSix = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: -6,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        
        
        switch dayOfTheWeek {
        case 1:
            thisWeekDictionary = [1: today, 2: todayPlusOne!, 3: todayPlusTwo!, 4: todayPlusThree!, 5: todayPlusFour!, 6: todayPlusFive!, 7: todayPlusSix!]
        case 2:
            thisWeekDictionary = [1: todayMinusOne!, 2: today, 3: todayPlusOne!, 4: todayPlusTwo!, 5: todayPlusThree!, 6: todayPlusFour!, 7: todayPlusFive!]
        case 3:
            thisWeekDictionary = [1: todayMinusTwo!, 2: todayMinusOne!, 3: today, 4: todayPlusOne!, 5: todayPlusTwo!, 6: todayPlusThree!, 7: todayPlusFour!]
        case 4:
            thisWeekDictionary = [1: todayMinusThree!, 2: todayMinusTwo!,3: todayMinusOne!, 4: today, 5: todayPlusOne!, 6: todayPlusTwo!, 7: todayPlusThree!]
        case 5:
            thisWeekDictionary = [1: todayMinusFour!, 2: todayMinusThree!, 3: todayMinusTwo!, 4: todayMinusOne!, 5: today, 6: todayPlusOne!, 7: todayPlusTwo!]
        case 6:
            thisWeekDictionary = [1: todayMinusFive!, 2: todayMinusFour!, 3: todayMinusThree!, 4: todayMinusTwo!,5: todayMinusOne!, 6: today, 7: todayPlusOne!]
        case 7:
            thisWeekDictionary = [1: todayMinusSix!, 2: todayMinusFive!,3: todayMinusFour!, 4: todayMinusThree!, 5: todayMinusTwo!, 6: todayMinusOne!, 7: today]

        default:
            print("CalendarBrain having issues!")
        }
        
        return thisWeekDictionary

    }
    //Takes a String, "date", which should be a date in the form YYYY/MM/DD and returns true if it matches proposed date from another String
    func compareDates(correctDate: NSDate, dateToCheck: String)-> Bool
    {
        updateCurrentDate()
        
        let components = calendar.components([.Year, .Month, .Day, .WeekdayOrdinal], fromDate: correctDate)
        let dateSeparated = dateToCheck.componentsSeparatedByString(delimiter)

        
        //This may cause problems if reused elsewhere
        if(components.year == Int(dateSeparated[0]))
        {
            if(components.month == Int(dateSeparated[1]))
            {
                if(components.day == Int(dateSeparated[2]))
                {
                    return true
                }
            }
        }
        return false
    }

    
    //Takes a String, "date", which should be a date in the form YYYY/MM/DD and returns true if it matches today's date
    func compareDate(date: String)-> Bool
    {
        updateCurrentDate()
        
        let dateSeparated = date.componentsSeparatedByString(delimiter)
        
        //This may cause problems if reused elsewhere
        if(components.year == Int(dateSeparated[0]))
        {
            if(components.month == Int(dateSeparated[1]))
            {
                if(components.day == Int(dateSeparated[2]))
                {
                    return true
                }
            }
        }
        return false
    }
    
}














