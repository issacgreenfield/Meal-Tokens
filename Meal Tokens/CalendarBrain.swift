//
//  CalendarBrain.swift
//  Meal Tokens
//
//  Created by Issac Greenfield on 3/7/16.
//  Copyright © 2016 Issac Greenfield. All rights reserved.
//

import Foundation

struct CalendarBrain
{

    let calendar: NSCalendar
    let currentDate: NSDate
    let components: NSDateComponents
    
    init()
    {
        calendar = NSCalendar.currentCalendar()
        currentDate = NSDate()
        components = calendar.components([.Month, .Day], fromDate: currentDate)
    }
    
    ///Returns a String, date, which contains todays date in the format MM/DD/YYYY
    func getDate()->String
    {
        let date: String = ("\(components.month)/\(components.day)/\(components.year)")
        
        return date
    }
}
