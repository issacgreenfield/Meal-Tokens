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
    private let calendarBrain = CalendarBrain().getDate()
    
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
            switch selectedButton
            {
            case 1:
                self.tokenCalculator = self.tokenCalculator! + 1
            case 2:
                self.tokenCalculator = self.tokenCalculator! + 2
            case 3:
                self.tokenCalculator = self.tokenCalculator! + 1
            case 4:
                self.tokenCalculator = self.tokenCalculator! + 2
            default:
                break
            }
            self.savingData()
            
            self.musicBrain.playAddTokens()
            }))
        
        savingData()
        presentViewController(refreshAlert, animated: true, completion: nil)
    }
    
    /// Sets NSUserdefaults for tokens and dificulty
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
//        if (defaults.objectForKey("statsData") == nil)
//        {
//            defaults.setValue(, "statsData")
//        }
        loadingData()
    }
    override func viewDidAppear(animated: Bool) {
        loadingData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
















