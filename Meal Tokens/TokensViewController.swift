//
//  TokensViewController.swift
//  Meal Tokens
//
//  Created by Issac Greenfield on 2/24/16.
//  Copyright © 2016 Issac Greenfield. All rights reserved.
//

import UIKit
import AVFoundation
import Charts
import Foundation

class TokensViewController: UIViewController {
    
    private var tokenCalculator: Double? = 0.0
    private var tokenDifficulty: Double? = 1.0
    private var calendarBrain = CalendarBrain()
    
    let defaults = NSUserDefaults.standardUserDefaults()
    private let musicBrain = MusicBrain.init()

    @IBOutlet weak var cheatTokensNumber: UILabel!
    
    @IBAction func cheatButtonPressed(sender: UIButton) {
        loadingData()
        if self.tokenCalculator! - tokenDifficulty! >= 0
        {
            let refreshAlert = UIAlertController(title: "Are You sure", message: "you want to use a token?", preferredStyle: UIAlertControllerStyle.Alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Hmm... nah", style: .Default, handler: { (action: UIAlertAction) in
                //println("Handle Cancel Logic here")
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Yum!", style: .Default, handler: { (action: UIAlertAction) in
                //println("Handle Ok logic here")
                self.tokenCalculator = self.tokenCalculator! - self.tokenDifficulty!
                self.savingData()
                self.loadingData()
                
                self.musicBrain.playUseTokens()
            }))
            
            presentViewController(refreshAlert, animated: true, completion: nil)
        }else
        {
            self.displaySadNoTokenMessage()
        }
    }
    
    @IBAction func addTokensButtons(sender: UIButton) {
        var selectedButton = 0
        switch Int((sender.titleLabel?.text)!)!
        {
        case 1:
            selectedButton = 1
        case 2:
            selectedButton = 2
        case 3:
            selectedButton = 3
        case 4:
            selectedButton = 4
        default:
            break
        }
        tokenAddBrain(selectedButton)
    }

    
    func displaySadNoTokenMessage()
    {
        let alertController = UIAlertController(title: "Oh No!!!", message:
            "You haven't worked out enough!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "I think I'll cry instead", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func tokenAddBrain(selectedButton: Int)
    {
        ///TODO fix so the appropriate message displays for chores
        let refreshAlert = UIAlertController(title: "Hold up", message: "Did you really work out for \(selectedButton) minutes?", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Blech... no", style: .Default, handler: { (action: UIAlertAction) in
            //println("Handle Cancel Logic here")
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "I did!", style: .Default, handler: { (action: UIAlertAction) in
            //println("Handle Ok logic here")
            var addTokensAmount: Double = 0.0
            switch selectedButton
            {
            case 1:
                addTokensAmount += 1.0
            case 2:
                addTokensAmount += 2.0
            case 3:
                addTokensAmount += 1.0
            case 4:
                addTokensAmount += 2.0
            default:
                break
            }
            self.tokenCalculator = self.tokenCalculator! + addTokensAmount
            self.saveTokenData(Int(addTokensAmount))
            self.savingData()
            
            self.musicBrain.playAddTokens()
            }))
        
        savingData()
        presentViewController(refreshAlert, animated: true, completion: nil)
    }
    
    func saveTokenData(addTokensAmount: Int)
    {
        calendarBrain.updateCurrentDate()
        
        var statsData: [String] = defaults.stringArrayForKey("statsData")!
        var lastStatsEntry: String = statsData[statsData.count - 1]
        let componentsLastStatsEntry: [String] = lastStatsEntry.componentsSeparatedByString("/")
        let lastStatsEntryDate = (componentsLastStatsEntry[0] + componentsLastStatsEntry[1] + componentsLastStatsEntry[2])
        
        if (calendarBrain.compareDate(lastStatsEntryDate))
        {
            lastStatsEntry = "\(lastStatsEntry)/\(calendarBrain.getCurrentDate()))"
            statsData[statsData.count - 1] = lastStatsEntry
            
        } else
        {
            statsData.append("\(calendarBrain.getCurrentDate())/\(addTokensAmount)")
        }
        defaults.setObject(statsData, forKey: "statsData")
    }
    
    /// Sets NSUserdefaults for tokens and statsData
    func savingData()
    {
        
        self.defaults.setValue(self.tokenCalculator!, forKey: "tokens")
        loadingData()
    }
    
    /// Updates the View, as well as its local variables
    func loadingData()
    {
        
        if (defaults.stringForKey("difficulty") == "hard")
        {
            tokenDifficulty = 2.0
        } else
        {
            tokenDifficulty = 1.0
        }
        tokenCalculator = defaults.doubleForKey("tokens")
        cheatTokensNumber.text = String(Int(tokenCalculator! / tokenDifficulty!))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (defaults.objectForKey("tokens") == nil || defaults.objectForKey("difficulty") == nil) {
            defaults.setValue(0.0, forKey: "tokens")
            defaults.setValue("easy", forKey: "difficulty")
        }
        if (defaults.objectForKey("statsData") == nil)
        {
            var statsData: [NSString] = [NSString]()
                statsData.append(NSString(string: String(calendarBrain.getCurrentDate())))
            defaults.setValue(statsData, forKey: "statsData")
        } else
        {
            var statsData: [AnyObject] = defaults.arrayForKey("statsData")!
            statsData.append(String(calendarBrain.getCurrentDate()))
            defaults.setValue(statsData, forKey: "statsData")
        }
        loadingData()
    }
    override func viewDidAppear(animated: Bool) {
        loadingData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func fakeStatsNumbers()
    {
        var statsData: [AnyObject] = defaults.arrayForKey("statsData")!
        statsData.append(String(calendarBrain.getCurrentDate()))
        defaults.setValue(statsData, forKey: "statsData")


    }
}
















