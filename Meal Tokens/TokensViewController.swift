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
    let defaults = NSUserDefaults.standardUserDefaults()

    
    @IBOutlet weak var cheatTokensNumber: UILabel!
    
    @IBAction func cheatButtonPressed(sender: UIButton) {
        
        loadingData()
        if self.tokenCalculator! - tokenDificulty! >= 0
        {
            let refreshAlert = UIAlertController(title: "Are You sure", message: "you want to use a token?", preferredStyle: UIAlertControllerStyle.Alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Hmm... nah", style: .Default, handler: { (action: UIAlertAction) in
                //println("Handle Cancel Logic here")
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Yum!", style: .Default, handler: { (action: UIAlertAction) in
                //println("Handle Ok logic here")
                self.tokenCalculator = self.tokenCalculator! - self.tokenDificulty!
                self.savingData()
                self.loadingData()
                
                // Load AudioServices
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
        
                    // Load
                    let soundURL = NSBundle.mainBundle().URLForResource("coindropA", withExtension: "wav")
                    var mySound: SystemSoundID = 0
                    AudioServicesCreateSystemSoundID(soundURL!, &mySound)
        
                    // Play
                    AudioServicesPlaySystemSound(mySound);
                }))
                
                savingData()
                presentViewController(refreshAlert, animated: true, completion: nil)
        
            }
    
    /// Sets NSUserdefaults for tokens and dificulty
    func savingData()
    {
        //these main two "if" statements may be eliminated
        if (defaults.objectForKey("tokens") != nil) {
            defaults.setValue(tokenCalculator, forKey: "tokens" )
        }
        if (defaults.objectForKey("dificulty") != nil) {
            if (tokenDificulty! == 2.0)
            {
                defaults.setValue("Hard", forKey: "dificulty" )
            } else
            {
                defaults.setValue("Easy", forKey: "dificulty" )
            }
        }
        loadingData()
    }
    
    /// Updates the View, as well as its local variables
    func loadingData()
    {
        
        if (defaults.stringForKey("dificulty") == "hard")
        {
            tokenDificulty = 2.0
        } else
        {
            tokenDificulty = 1.0
        }
        tokenCalculator = defaults.doubleForKey("tokens")
        cheatTokensNumber.text = String(Int(tokenCalculator! / tokenDificulty!))
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        defaults.setValue("easy", forKey: "dificulty")
        if (defaults.objectForKey("tokens") == nil || defaults.objectForKey("dificulty") == nil) {
            defaults.setValue(0.0, forKey: "tokens")
            defaults.setValue("easy", forKey: "dificulty")
        }
        
        savingData()
//        if (defaults.objectForKey("dificulty") != nil) {
//            if (defaults.stringForKey("dificulty") == "hard")
//            {
//                tokenDificulty = 2.0
//            } else
//            {
//                tokenDificulty = 1.0
//            }
//        } else
//        {
//            defaults.setValue("easy", forKey: "dificulty")
//        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
