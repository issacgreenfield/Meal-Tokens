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
    let delimiter = "/"
    var currentDate: NSDate
    var components: NSDateComponents
    
    init()
    {
        calendar = NSCalendar.currentCalendar()
        currentDate = NSDate()
        components = calendar.components([.Year, .Month, .Day], fromDate: currentDate)
    }
    
    internal func updateCurrentDate()
    {
        currentDate = NSDate()
        components = calendar.components([.Year, .Month, .Day], fromDate: currentDate)
    }
    
    ///Returns a String, "date", which contains todays date in the format YYYY/MM/DD
    func getCurrentDate()-> String
    {
        updateCurrentDate()
        let stringDate: String = ("\(components.year)\(delimiter)\(components.month)\(delimiter)\(components.day)")
        return stringDate
    }
    
    //Takes a String, "date", which should be a date in the form YYYY/MM/DD and returns true if it matches today's date
    func compareDate(date: String)-> Bool
    {
        updateCurrentDate()
        
        let dateSeparated = date.componentsSeparatedByString(delimiter)
        
        //This may cause problems if reused elsewhere
        if(components.year == Int(dateSeparated[0]))
        {
            if(components.month == Int(dateSeparated[0]))
            {
                if(components.day == Int(dateSeparated[0]))
                {
                    return true
                }
            }
        }
        return false
    }
    
}














