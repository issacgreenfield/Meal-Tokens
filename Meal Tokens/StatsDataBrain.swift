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
    private var tokensUsedToday: String = ""
    private var tokensEarnedToday: String = ""
    private let todaysDate: String
    private let delimiter: String
    
    init(dataPoints: [String], todaysDate: String, delimiter: String)
    {
        self.delimiter = delimiter
        self.todaysDate = todaysDate
//        parseDataPoints(d , todaysDate: <#T##String#>)
        
        
        
        
        self.tokensUsedToday = ""
        self.tokensEarnedToday = ""
        
    }
    
    func parseDataPoints(dataPoints: [String], todaysDate: String)
    {
        let parsedDataPoints: [String] = (dataPoints[dataPoints.count - 1]).componentsSeparatedByString(delimiter)
        
        
    }
    
    
    
}