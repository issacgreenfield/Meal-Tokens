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
    
    let dificultyLevel = 2
    private var tokenCalculator: Double? = 0.0
    
    @IBAction func dismissChartPage(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func CheatTokensButton(sender: UIButton) {
        
    }
    
    
    var date: [String]!
    
    
    func setChart(values: [Double]) {
        statsChartView.noDataText = "You need to provide data for the chart."
        date = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        
        statsChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        
        statsChartView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        statsChartView.setDescriptionTextPosition(x: -100, y: -100)
        
        statsChartView.xAxis.labelPosition = .Bottom
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<date.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Tokens Earned")
        let chartData = BarChartData(xVals: date, dataSet: chartDataSet)
        statsChartView.data = chartData
    }
    
    func savingData()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tokenCalculator!, forKey: "tokens")
        loadingData()
    }
    
    func loadingData()
    {
        ///TODO: populate with values from earned tokens
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey("tokens") != nil) {
            tokenCalculator = defaults.doubleForKey("tokens")
        }
        savingData()
        
        
        //chart setup
        statsChartView.noDataText = "You need to provide data for the chart."
        
        let tokensEarned = [1.0, 2.0, 1.5, 1.0, 2.0, 1.0, 0.5]
        
        setChart(tokensEarned)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
