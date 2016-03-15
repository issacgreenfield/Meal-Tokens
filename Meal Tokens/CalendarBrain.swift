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
    var currentDate: NSDate
    var components: NSDateComponents
    
    init()
    {
        calendar = NSCalendar.currentCalendar()
        currentDate = NSDate()
        components = calendar.components([.Month, .Day, .Year], fromDate: currentDate)
    }
    
    internal func updateCurrentDate()
    {
        currentDate = NSDate()
        components = calendar.components([.Month, .Day, .Year], fromDate: currentDate)
    }
    
    ///Returns an Int, "date", which contains todays date in the format MMDDYYYY
    func getCurrentDate()-> String
    {
        updateCurrentDate()
        
        
        
        
        let stringDate: String = ("\(components.month)/\(components.day)/\(components.year)")
        let date = stringDate
        return date
    }
    
    //Takes an Int, "date", which should be a date in the form MM/DD/YYYY and returns true if it matches today's date
    func compareDate(date: String)-> Bool
    {
        updateCurrentDate()
        if (date == getCurrentDate())
        {
            return true
        }
        return false
    }
    
}














