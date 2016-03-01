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

class TokensViewController: UIViewController {
    
    private var tokenCalculator: Double? = 0.0
    private var tokenDificulty: Double? = 1.0

    
    @IBOutlet weak var cheatTokensNumber: UILabel!
    
    @IBAction func cheatButtonPressed(sender: UIButton) {
        
        loadingData()
        if self.tokenCalculator! / tokenDificulty! >= 1
        {
            let refreshAlert = UIAlertController(title: "Are You sure", message: "you want to use a token?", preferredStyle: UIAlertControllerStyle.Alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Hmm... nah", style: .Default, handler: { (action: UIAlertAction) in
                //println("Handle Cancel Logic here")
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Yum!", style: .Default, handler: { (action: UIAlertAction) in
                //println("Handle Ok logic here")
                
                
                self.tokenCalculator = self.tokenCalculator! - (1 * self.tokenDificulty!)
                self.savingData()
                
                // Load
                let soundURL = NSBundle.mainBundle().URLForResource("nomnom", withExtension: "wav")
                var mySound: SystemSoundID = 0
                AudioServicesCreateSystemSoundID(soundURL!, &mySound)
                
                // Play
                AudioServicesPlaySystemSound(mySound);
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
            selectedButton = 2
        case 4:
            selectedButton = 4
        default:
            break
        }
        tokenAddBrain(selectedButton)
    }
    
    
//    @IBAction func eatMealButton(sender: UIButton)
//            {
//                loadingData()
//                if self.tokenCalculator! >= 4
//                {
//                    let refreshAlert = UIAlertController(title: "Are You sure", message: "you want to eat a meal?", preferredStyle: UIAlertControllerStyle.Alert)
//        
//                    refreshAlert.addAction(UIAlertAction(title: "Hmm... nah", style: .Default, handler: { (action: UIAlertAction) in
//                        //println("Handle Cancel Logic here")
//                    }))
//        
//                    refreshAlert.addAction(UIAlertAction(title: "Yum!", style: .Default, handler: { (action: UIAlertAction) in
//                        //println("Handle Ok logic here")
//        
//        
//                        self.tokenCalculator = self.tokenCalculator! - 4
//                        self.savingData()
//        
//                        // Load
//                        let soundURL = NSBundle.mainBundle().URLForResource("nomnom", withExtension: "wav")
//                        var mySound: SystemSoundID = 0
//                        AudioServicesCreateSystemSoundID(soundURL!, &mySound)
//        
//                        // Play
//                        AudioServicesPlaySystemSound(mySound);
//                    }))
//        
//                    presentViewController(refreshAlert, animated: true, completion: nil)
//                }else
//                {
//                    self.displaySadNoTokenMessage()
//                }
//            }


    func savingData()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tokenCalculator!, forKey: "tokens")
        loadingData()
    }

    func loadingData()
        {
    //        self.numberOfTokensLabel.text = String(self.tokenCalculator! % self.dificultyLevel)
            cheatTokensNumber.text = String(Int(tokenCalculator! / tokenDificulty!))
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
                loadingData()
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
                        self.tokenCalculator = self.tokenCalculator! + 3
                    case 4:
                        self.tokenCalculator = self.tokenCalculator! + 4
                    default:
                        break
                    }
                    self.savingData()
        
                    // Load
                    let soundURL = NSBundle.mainBundle().URLForResource("coindropA", withExtension: "wav")
                    var mySound: SystemSoundID = 0
                    AudioServicesCreateSystemSoundID(soundURL!, &mySound)
        
                    // Play
                    AudioServicesPlaySystemSound(mySound);
                }))
        
                presentViewController(refreshAlert, animated: true, completion: nil)
        
            }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey("tokens") != nil) {
            tokenCalculator = defaults.doubleForKey("tokens")
        }
        if (defaults.objectForKey("dificulty") != nil) {
            if (defaults.boolForKey("dificulty") == true)
            {
                tokenDificulty = 2.0
            }
        } else
        {
            defaults.setValue("dificulty", forKey: "0")
        }

        savingData()
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
