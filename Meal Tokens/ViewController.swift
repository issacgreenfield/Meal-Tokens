//
//  ViewController.swift
//  Meal Tokens
//
//  Created by Issac Greenfield on 6/15/15.
//  Copyright (c) 2015 Issac Greenfield. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var tokenCalculator: Int? = 0

//    private let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
//    var money = defaults.valueForKey("money") as? String
//    dollarLabel.text! = money
//    
//    @IBAction func MoneyPress(sender: AnyObject) {
//        Money += 1
//        var MoneyNumberString:String = String(format: "Dollars:%i", Money)
//        self.DollarsLabel.text = (string: MoneyNumberString)
//        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults() //This class     variable needs to be defined every class where you set or fetch values from NSUserDefaults
//        defaults.setObject(MoneyNumberString, forKey: "money")
//        defaults.synchronize() //Call when you're done editing all defaults for the method.
//    }
    
    @IBOutlet weak var mealTokens: UILabel!
    
    @IBOutlet weak var snackTokens: UILabel!
    
    
    @IBAction func workout15Button(sender: UIButton)
    {
        tokenAddBrain(sender.currentTitle!.toInt()!)
    }
    
    @IBAction func workout30Button(sender: UIButton)
    {
        tokenAddBrain(sender.currentTitle!.toInt()!)
    }
    
    @IBAction func workout45Button(sender: UIButton)
    {
        tokenAddBrain(sender.currentTitle!.toInt()!)
    }
    
    @IBAction func workout60Button(sender: UIButton)
    {
        tokenAddBrain(sender.currentTitle!.toInt()!)
    }
    
    func tokenAddBrain(digit: Int)
    {
        var refreshAlert = UIAlertController(title: "Hold up", message: "Did you really work out for \(digit) minutes?", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "I did!", style: .Default, handler: { (action: UIAlertAction!) in
            //println("Handle Ok logic here")
            switch digit
            {
            case 15:
                self.tokenCalculator = self.tokenCalculator! + 1
            case 30:
                self.tokenCalculator = self.tokenCalculator! + 2
            case 45:
                self.tokenCalculator = self.tokenCalculator! + 3
            case 60:
                self.tokenCalculator = self.tokenCalculator! + 4
            default:
                break
            }
            self.mealTokens.text = String(self.tokenCalculator! / 4)
            self.snackTokens.text = String(self.tokenCalculator! % 4)
            
            //This is to add sound http://stackoverflow.com/questions/24043904/creating-and-playing-a-sound-in-swift
            // Load
            let soundURL = NSBundle.mainBundle().URLForResource("coindropA", withExtension: "wav")
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL, &mySound)
            
            // Play
            AudioServicesPlaySystemSound(mySound);
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Blch... no", style: .Default, handler: { (action: UIAlertAction!) in
            //println("Handle Cancel Logic here")
        }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func eatSnackButton(sender: UIButton)
    {
        if self.tokenCalculator! > 0
        {
            var refreshAlert = UIAlertController(title: "Are You sure", message: "you want to eat a meal?", preferredStyle: UIAlertControllerStyle.Alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Yum!", style: .Default, handler: { (action: UIAlertAction!) in
                //println("Handle Ok logic here")
                
                
                self.tokenCalculator = self.tokenCalculator! - 1
                self.mealTokens.text = String(self.tokenCalculator! / 4)
                self.snackTokens.text = String(self.tokenCalculator! % 4)
                
                //This is to add sound http://stackoverflow.com/questions/24043904/creating-and-playing-a-sound-in-swift
                // Load
                let soundURL = NSBundle.mainBundle().URLForResource("nomnom", withExtension: "wav")
                var mySound: SystemSoundID = 0
                AudioServicesCreateSystemSoundID(soundURL, &mySound)
                
                // Play
                AudioServicesPlaySystemSound(mySound);
                
                
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Hmm... nah", style: .Default, handler: { (action: UIAlertAction!) in
                //println("Handle Cancel Logic here")
            }))
            
            presentViewController(refreshAlert, animated: true, completion: nil)
        }else
        {
            self.displaySadNoTokenMessage()
        }
    }
    
    @IBAction func eatMealButton(sender: UIButton)
    {
        if self.tokenCalculator! >= 4
        {
            var refreshAlert = UIAlertController(title: "Are You sure", message: "you want to eat a meal?", preferredStyle: UIAlertControllerStyle.Alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Yum!", style: .Default, handler: { (action: UIAlertAction!) in
                //println("Handle Ok logic here")
                
                
                self.tokenCalculator = self.tokenCalculator! - 4
                self.mealTokens.text = String(self.tokenCalculator! / 4)
                self.snackTokens.text = String(self.tokenCalculator! % 4)
                
                //This is to add sound http://stackoverflow.com/questions/24043904/creating-and-playing-a-sound-in-swift
                // Load
                let soundURL = NSBundle.mainBundle().URLForResource("nomnom", withExtension: "wav")
                var mySound: SystemSoundID = 0
                AudioServicesCreateSystemSoundID(soundURL, &mySound)
                
                // Play
                AudioServicesPlaySystemSound(mySound);
                
                
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Hmm... nah", style: .Default, handler: { (action: UIAlertAction!) in
                //println("Handle Cancel Logic here")
            }))
            
            presentViewController(refreshAlert, animated: true, completion: nil)
        }else
        {
            self.displaySadNoTokenMessage()
        }
    }
    
    func displaySadNoTokenMessage()
    {
        let alertController = UIAlertController(title: "Oh No!!!", message:
            "You haven't worked out enough!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "I think I'll cry instead", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        self.mealTokens.text = String(self.tokenCalculator! / 4)
//        self.snackTokens.text = String(self.tokenCalculator! % 4)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

