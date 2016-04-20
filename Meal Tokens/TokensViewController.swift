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

class TokensViewController: UIViewController
{
    private var tokenCalculator: Double? = 0.0
    private var tokenDifficulty: Double? = 1.0
    private var calendarBrain = CalendarBrain(delimiter: "/")
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    private let musicBrain = MusicBrain.init()
    
    @IBOutlet weak var cheatTokensNumber: UILabel!
    
    @IBAction func cheatButtonPressed(sender: UIButton)
    {
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
                self.saveTokenData(Double(-1 * self.tokenDifficulty!))
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
    
    @IBAction func addTokensButtons(sender: UIButton)
    {
        var selectedButton = 0
        switch Int((sender.titleLabel?.text)!)!
        {
        case 15:
            selectedButton = 15
            tokenAddBrain(selectedButton)
        case 30:
            selectedButton = 30
            tokenAddBrain(selectedButton)
        case 45:
            selectedButton = 45
            tokenAddBrain(selectedButton)
        case 60:
            selectedButton = 60
            tokenAddBrain(selectedButton)
        default:
            break
        }
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
            var addTokensAmount: Double = 0.0
            switch selectedButton
            {
            case 15:
                addTokensAmount += 0.5
            case 30:
                addTokensAmount += 1.0
            case 45:
                addTokensAmount += 1.5
            case 60:
                addTokensAmount += 2.0
            default:
                break
            }
            self.tokenCalculator = self.tokenCalculator! + addTokensAmount
            self.saveTokenData(addTokensAmount)
            self.savingData()
            self.musicBrain.playAddTokens()
        }))
        savingData()
        presentViewController(refreshAlert, animated: true, completion: nil)
    }
    
    func saveTokenData(addTokensAmount: Double)
    {
        calendarBrain.updateCurrentDate()
        var statsData = defaults.dictionaryForKey("statsData")!
        if let todaysTokenCount = statsData[calendarBrain.getCurrentDate()]?.doubleValue{
            statsData[calendarBrain.getCurrentDate()] = todaysTokenCount + addTokensAmount
        } else{
            statsData[calendarBrain.getCurrentDate()] = addTokensAmount
        }
        defaults.setValue(statsData, forKey: "statsData")
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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if (defaults.objectForKey("tokens") == nil || defaults.objectForKey("difficulty") == nil)
        {
            defaults.setValue(0.0, forKey: "tokens")
            defaults.setValue("easy", forKey: "difficulty")
        }
        if (defaults.objectForKey("statsData") == nil)
        {
            let statsData: [String: Double] = [calendarBrain.getCurrentDate(): 0.0]
            defaults.setValue(statsData, forKey: "statsData")
        }
        loadingData()
    }
    override func viewDidAppear(animated: Bool)
    {
        loadingData()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
















