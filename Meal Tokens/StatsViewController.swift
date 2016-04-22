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

class StatsViewController: UIViewController
{
    private var tokenCalculator: Double? = 0.0
    private var tokenDifficulty: Double? = 1.0
    private var date: [String]!
    private let defaults = NSUserDefaults.standardUserDefaults()
 
    @IBOutlet weak var statsChartView: BarChartView!

    @IBAction func dismissChartPage(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func setChart() {
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
        var dayOfTheWeek = 1
        while(dayOfTheWeek <= 7)
        {
            dateOfTheWeek = calendarBrain.getCurrentDateToString(calendarBrain.getCurrentWeek()[dayOfTheWeek]!)
            if let setSundayData = (statsData[dateOfTheWeek]) as? Double
            {
                tokensEarned[dayOfTheWeek - 1] = setSundayData / tokenDifficulty!
            }else{
                tokensEarned[dayOfTheWeek - 1] = 0.0
            }
            dayOfTheWeek += 1
        }
        
        //This section distributes the data points as they allign to the current week
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<date.count
        {
            let dataEntry = BarChartDataEntry(value: tokensEarned[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Net Tokens Earned")
        let chartData = BarChartData(xVals: date, dataSet: chartDataSet)
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        chartData.setValueFormatter(formatter)
        statsChartView.data = chartData
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if (defaults.objectForKey("tokens") != nil)
        {
            tokenCalculator = defaults.doubleForKey("tokens")
        }
        
        statsChartView.noDataText = "You need to provide data for the chart."
        setChart()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool)
    {
        setChart()
    }
}
