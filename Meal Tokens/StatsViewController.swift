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
    private var tokenDifficulty: Double? = 1.0
    
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
        
        
        if (defaults.stringForKey("difficulty") == "hard")
        {
            tokenDifficulty = 2.0
        } else
        {
            tokenDifficulty = 1.0
        }

        
        
        statsChartView.noDataText = "You need to provide data for the chart."
        date = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
        
        statsChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        
        statsChartView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        statsChartView.setDescriptionTextPosition(x: -100, y: -100)
        
        statsChartView.xAxis.labelPosition = .Bottom
        
        
        //Fetch data from NSDefaults and cross-check with this weeks dates in CalendarBrain
        calendarBrain.getCurrentWeek()
        var statsData = defaults.dictionaryForKey("statsData")!
        var dateOfTheWeek: String
        
        //Set sunday "1"
        dateOfTheWeek = calendarBrain.getCurrentDateToString(calendarBrain.getCurrentWeek()[1]!)
        if let setSundayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[0] = setSundayData / tokenDifficulty!
        }else{
            tokensEarned[0] = 0.0
        }
        //Set monday "2"
        dateOfTheWeek = calendarBrain.getCurrentDateToString(calendarBrain.getCurrentWeek()[2]!)
        if let setMondayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[1] = setMondayData / tokenDifficulty!
        }else{
            tokensEarned[1] = 0.0
        }
        //Set tuesday "3"
        dateOfTheWeek = calendarBrain.getCurrentDateToString(calendarBrain.getCurrentWeek()[3]!)
        if let setTuesdayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[2] = setTuesdayData / tokenDifficulty!
        }else{
            tokensEarned[2] = 0.0
        }
        //Set wednesday "4"
        dateOfTheWeek = calendarBrain.getCurrentDateToString(calendarBrain.getCurrentWeek()[4]!)
        if let setWednesdayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[3] = setWednesdayData / tokenDifficulty!
        }else{
            tokensEarned[3] = 0.0
        }
        //Set wednesday "5"
        dateOfTheWeek = calendarBrain.getCurrentDateToString(calendarBrain.getCurrentWeek()[5]!)
        if let setThursdayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[4] = setThursdayData / tokenDifficulty!
        }else{
            tokensEarned[4] = 0.0
        }

        //Set friday "6"
        dateOfTheWeek = calendarBrain.getCurrentDateToString(calendarBrain.getCurrentWeek()[6]!)
        if let setFridayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[5] = setFridayData / tokenDifficulty!
        }else{
            tokensEarned[5] = 0.0
        }

        //Set saturday "7"
        dateOfTheWeek = calendarBrain.getCurrentDateToString(calendarBrain.getCurrentWeek()[7]!)
        if let setSaturdayData = (statsData[dateOfTheWeek]) as? Double
        {
            tokensEarned[6] = setSaturdayData / tokenDifficulty!
        }else{
            tokensEarned[6] = 0.0
        }
        
        
        //This section distributes the data points as they allign to the current week
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<date.count {
            let dataEntry = BarChartDataEntry(value: tokensEarned[i], xIndex: i)
            dataEntries.append(dataEntry)
       }
    
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Net Tokens Earned")
        let chartData = BarChartData(xVals: date, dataSet: chartDataSet)
        statsChartView.data = chartData
    }
    
    func savingData()
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (defaults.objectForKey("tokens") != nil) {
            tokenCalculator = defaults.doubleForKey("tokens")
        }
        
        savingData()
        
        
        //chart setup
        statsChartView.noDataText = "You need to provide data for the chart."
        
        setChart()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        setChart()
    }
    
}
