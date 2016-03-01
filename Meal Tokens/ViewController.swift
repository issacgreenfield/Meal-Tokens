////
////  ViewController.swift
////  Meal Tokens
////
////  Created by Issac Greenfield on 6/15/15.
////  Copyright (c) 2015 Issac Greenfield. All rights reserved.
////
//
//import UIKit
//import AVFoundation
//import Charts
//
//class ViewController: UIViewController {
////    @IBOutlet weak var numberOfTokensLabel: UILabel!
//    @IBOutlet weak var statsChartView: BarChartView!
//
//    let dificultyLevel = 2
//    private var tokenCalculator: Int? = 0
//    
//    @IBAction func dismissChartPage(sender: UIButton) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    @IBAction func CheatTokensButton(sender: UIButton) {
//        
//    }
//    
//    
//    
//        
//    var date: [String]!
//    
//    
//    //
//    func savingData()
//    {
//        let defaults = NSUserDefaults.standardUserDefaults()
//        defaults.setInteger(tokenCalculator!, forKey: "tokens")
//        loadingData()
//    }
//
//    func loadingData()
//    {
////        self.numberOfTokensLabel.text = String(self.tokenCalculator! % self.dificultyLevel)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let defaults = NSUserDefaults.standardUserDefaults()
//        
//        if (defaults.objectForKey("tokens") != nil) {
//            tokenCalculator = defaults.integerForKey("tokens")
//        }
//        savingData()
//        
//        
//        //chart setup
//        statsChartView.noDataText = "You need to provide data for the chart."
//        
//        date = ["1/13", "1/14", "1/15", "1/16", "1/17", "1/18"]
//        let tokensEarned = [1.0, 0.5, 2.0, 1.0, 3.0, 0.0]
//        
//        setChart(date, values: tokensEarned)
//        
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    
//    //
//    //
//    //
//    //
//    //    @IBOutlet weak var mealTokens: UILabel!
//    //
//    //    @IBOutlet weak var snackTokens: UILabel!
//    //
//    //
//    //    @IBAction func workout15Button(sender: UIButton)
//    //    {
//    //        tokenAddBrain(Int(sender.currentTitle!)!)
//    //    }
//    //
//    //    @IBAction func workout30Button(sender: UIButton)
//    //    {
//    //        tokenAddBrain(Int(sender.currentTitle!)!)
//    //    }
//    //
//    //    @IBAction func workout45Button(sender: UIButton)
//    //    {
//    //        tokenAddBrain(Int(sender.currentTitle!)!)
//    //    }
//    //
//    //    @IBAction func workout60Button(sender: UIButton)
//    //    {
//    //        tokenAddBrain(Int(sender.currentTitle!)!)
//    //    }
//    //
//    //    func tokenAddBrain(digit: Int)
//    //    {
//    //        loadingData()
//    //        let refreshAlert = UIAlertController(title: "Hold up", message: "Did you really work out for \(digit) minutes?", preferredStyle: UIAlertControllerStyle.Alert)
//    //
//    //        refreshAlert.addAction(UIAlertAction(title: "Blech... no", style: .Default, handler: { (action: UIAlertAction) in
//    //            //println("Handle Cancel Logic here")
//    //        }))
//    //
//    //        refreshAlert.addAction(UIAlertAction(title: "I did!", style: .Default, handler: { (action: UIAlertAction) in
//    //            //println("Handle Ok logic here")
//    //            switch digit
//    //            {
//    //            case 15:
//    //                self.tokenCalculator = self.tokenCalculator! + 1
//    //            case 30:
//    //                self.tokenCalculator = self.tokenCalculator! + 2
//    //            case 45:
//    //                self.tokenCalculator = self.tokenCalculator! + 3
//    //            case 60:
//    //                self.tokenCalculator = self.tokenCalculator! + 4
//    //            default:
//    //                break
//    //            }
//    //            self.savingData()
//    //
//    //            // Load
//    //            let soundURL = NSBundle.mainBundle().URLForResource("coindropA", withExtension: "wav")
//    //            var mySound: SystemSoundID = 0
//    //            AudioServicesCreateSystemSoundID(soundURL!, &mySound)
//    //
//    //            // Play
//    //            AudioServicesPlaySystemSound(mySound);
//    //        }))
//    //
//    //        presentViewController(refreshAlert, animated: true, completion: nil)
//    //
//    //    }
//    //
//    //
//    //    @IBAction func eatSnackButton(sender: UIButton)
//    //    {
//    //        loadingData()
//    //        if self.tokenCalculator! > 0
//    //        {
//    //            let refreshAlert = UIAlertController(title: "Are You sure", message: "you want to eat a snack?", preferredStyle: UIAlertControllerStyle.Alert)
//    //
//    //            refreshAlert.addAction(UIAlertAction(title: "Hmm... nah", style: .Default, handler: { (action: UIAlertAction) in
//    //                //println("Handle Cancel Logic here")
//    //            }))
//    //
//    //            refreshAlert.addAction(UIAlertAction(title: "Yum!", style: .Default, handler: { (action: UIAlertAction) in
//    //                //println("Handle Ok logic here")
//    //
//    //
//    //                self.tokenCalculator = self.tokenCalculator! - 1
//    //                self.mealTokens.text = String(self.tokenCalculator! / 4)
//    //                self.snackTokens.text = String(self.tokenCalculator! % 4)
//    //                self.savingData()
//    //
//    //                // Load
//    //                let soundURL = NSBundle.mainBundle().URLForResource("nomnom", withExtension: "wav")
//    //                var mySound: SystemSoundID = 0
//    //                AudioServicesCreateSystemSoundID(soundURL!, &mySound)
//    //
//    //                // Play
//    //                AudioServicesPlaySystemSound(mySound);
//    //            }))
//    //            presentViewController(refreshAlert, animated: true, completion: nil)
//    //        }else
//    //        {
//    //            self.displaySadNoTokenMessage()
//    //        }
//    //    }
//    //
//    //    @IBAction func eatMealButton(sender: UIButton)
//    //    {
//    //        loadingData()
//    //        if self.tokenCalculator! >= 4
//    //        {
//    //            let refreshAlert = UIAlertController(title: "Are You sure", message: "you want to eat a meal?", preferredStyle: UIAlertControllerStyle.Alert)
//    //
//    //            refreshAlert.addAction(UIAlertAction(title: "Hmm... nah", style: .Default, handler: { (action: UIAlertAction) in
//    //                //println("Handle Cancel Logic here")
//    //            }))
//    //
//    //            refreshAlert.addAction(UIAlertAction(title: "Yum!", style: .Default, handler: { (action: UIAlertAction) in
//    //                //println("Handle Ok logic here")
//    //
//    //
//    //                self.tokenCalculator = self.tokenCalculator! - 4
//    //                self.mealTokens.text = String(self.tokenCalculator! / 4)
//    //                self.snackTokens.text = String(self.tokenCalculator! % 4)
//    //                self.savingData()
//    //
//    //                // Load
//    //                let soundURL = NSBundle.mainBundle().URLForResource("nomnom", withExtension: "wav")
//    //                var mySound: SystemSoundID = 0
//    //                AudioServicesCreateSystemSoundID(soundURL!, &mySound)
//    //
//    //                // Play
//    //                AudioServicesPlaySystemSound(mySound);
//    //            }))
//    //
//    //            presentViewController(refreshAlert, animated: true, completion: nil)
//    //        }else
//    //        {
//    //            self.displaySadNoTokenMessage()
//    //        }
//    //    }
//    //    
//    //    func displaySadNoTokenMessage()
//    //    {
//    //        let alertController = UIAlertController(title: "Oh No!!!", message:
//    //            "You haven't worked out enough!", preferredStyle: UIAlertControllerStyle.Alert)
//    //        alertController.addAction(UIAlertAction(title: "I think I'll cry instead", style: UIAlertActionStyle.Default,handler: nil))
//    //        self.presentViewController(alertController, animated: true, completion: nil)
//    //    }
//   
//}
//
