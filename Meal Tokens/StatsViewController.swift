//
//  StatsViewController.swift
//  Meal Tokens
//
//  Created by Issac Greenfield on 2/24/16.
//  Copyright © 2016 Issac Greenfield. All rights reserved.
//

import UIKit
import AVFoundation
import Charts

class StatsViewController: UIViewController {
    @IBOutlet weak var statsChartView: BarChartView!
    
//    let dificultyLevel = 2
    private var tokenCalculator: Double? = 0.0
    
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func dismissChartPage(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func CheatTokensButton(sender: UIButton) {
        
    }
    
    
    var date: [String]!
    
    
    func setChart() {
        let calendarBrain = CalendarBrain(delimiter: "/")
        var tokensEarned = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        statsChartView.noDataText = "You need to provide data for the chart."
        date = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
        
        statsChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        
        statsChartView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        statsChartView.setDescriptionTextPosition(x: -100, y: -100)
        
        statsChartView.xAxis.labelPosition = .Bottom
        
        
        //Must fetch data from NSDefaults and cross-check with this weeks dates in CalendarBrain
        calendarBrain.getCurrentWeek()
        
        var statsData = defaults.dictionaryForKey("statsData")!
        
        
//        var lastStatsEntry: String = statsData[statsData.count - 1]
//        let componentsLastStatsEntry: [String] = lastStatsEntry.componentsSeparatedByString("/")

//        if (calendarBrain.compareDates(calendarBrain.getCurrentDate(), statsData))
//        {
//            lastStatsEntry = "\(lastStatsEntry)/\(calendarBrain.getCurrentDate()))"
//            statsData[statsData.count - 1] = lastStatsEntry
//            
//        } else
//        {
////            statsData.append("\(calendarBrain.getCurrentDate())/\(addTokensAmount)")
//        }
//        
        

        
//        var statsData = defaults.dictionaryForKey("statsData")!
        
//        var setDataInWeekday: Double
        var dateOfTheWeek: String
        //Set sunday "1"
        dateOfTheWeek = String(calendarBrain.getCurrentWeek()[1]!)
        if let setSundayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[0] = setSundayData
        }else{
            tokensEarned[0] = 5.0
        }
    
        //Set monday "2"
        dateOfTheWeek = String(calendarBrain.getCurrentWeek()[2]!)
        if let setMondayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[1] = setMondayData
        }else{
            tokensEarned[1] = 5.0
        }

        //Set tuesday "3"
        dateOfTheWeek = String(calendarBrain.getCurrentWeek()[3]!)
        if let setTuesdayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[2] = setTuesdayData
        }else{
            tokensEarned[2] = 5.0
        }

        //Set wednesday "4"
        dateOfTheWeek = String(calendarBrain.getCurrentWeek()[4]!)
        if let setWednesdayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[3] = setWednesdayData
        }else{
            tokensEarned[3] = 5.0
        }

        //Set wednesday "5"
        dateOfTheWeek = String(calendarBrain.getCurrentWeek()[5]!)
        if let setThursdayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[4] = setThursdayData
        }else{
            tokensEarned[4] = 5.0
        }

        //Set friday "6"
        dateOfTheWeek = String(calendarBrain.getCurrentWeek()[6]!)
        if let setFridayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[5] = setFridayData
        }else{
            tokensEarned[5] = 5.0
        }

        //Set saturday "7"
        dateOfTheWeek = String(calendarBrain.getCurrentWeek()[7]!)
        if let setSaturdayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[6] = setSaturdayData
        }else{
            tokensEarned[6] = 5.0
        }

    
        
        
        
        
        
        
        
//        var i = 0
//        var dayOfTheWeek = calendarBrain.getDayOfWeek()
//        while i < 7 {
//            
//            if dayOfTheWeek <= 0
//            {
//                break
//            }else
//            {
//                
//                
//                
//                if ((statsData[calendarBrain.getCurrentWeek()[dayOfTheWeek]!]) != nil)
//                {
//                    tokensEarned[7 - i] = stats
//                }
//                
//                
//                tokensEarned
//            }
//        }

    
        
        
        //This section distributes the data points as they allign to the current week
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<date.count {
            let dataEntry = BarChartDataEntry(value: tokensEarned[i], xIndex: i)
            dataEntries.append(dataEntry)
       }
    
        
        
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Tokens Earned")
        let chartData = BarChartData(xVals: date, dataSet: chartDataSet)
        statsChartView.data = chartData
    }
    
    func savingData()
    {
//        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tokenCalculator!, forKey: "tokens")
        loadingData()
    }
    
    func loadingData()
    {
        ///TODO: populate with values from earned tokens
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (defaults.objectForKey("tokens") != nil) {
            tokenCalculator = defaults.doubleForKey("tokens")
        }
        savingData()
        
        
        //chart setup
        statsChartView.noDataText = "You need to provide data for the chart."
        
//        var tokensEarned = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        
        
        setChart()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
