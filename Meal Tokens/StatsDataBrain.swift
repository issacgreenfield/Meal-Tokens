//
//  StatsDataBrain.swift
//  Meal Tokens
//
//  Created by Issac Greenfield on 3/10/16.
//  Copyright © 2016 Issac Greenfield. All rights reserved.
//

import Foundation

class StatsDataBrain
{
    private var tokensEarnedToday: String = ""
    private var todaysDate: String
    private let delimiter: String
    
    init(dataPoints: [String], todaysDate: String, delimiter: String)
    {
        self.delimiter = delimiter
        self.todaysDate = todaysDate
        self.tokensEarnedToday = ""
        
    }
    
//    func parseDataPoints(dataPoints: [String], todaysDate: String)-> [Int: Int]
//    {
//        let parsedDataPoints: [String] = (dataPoints[dataPoints.count - 1]).componentsSeparatedByString(delimiter)
//        
//        
//    }
    
    
    
}