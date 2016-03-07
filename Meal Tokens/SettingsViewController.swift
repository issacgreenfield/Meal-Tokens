//
//  SettingsViewController.swift
//  Meal Tokens
//
//  Created by Issac Greenfield on 2/24/16.
//  Copyright © 2016 Issac Greenfield. All rights reserved.
//

import UIKit
import AVFoundation
import Charts

class SettingsViewController: UIViewController {
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    @IBOutlet weak var dificultySettingLabel: UISegmentedControl!

    
    @IBAction func dificultySettingButton(sender: UISegmentedControl)
    {
        savingData()
    }
 
    func savingData()
    {
        if (dificultySettingLabel.selectedSegmentIndex == 0)
        {
            defaults.setValue("easy", forKey: "difficulty")
        } else if (dificultySettingLabel.selectedSegmentIndex == 1)
        {
            defaults.setValue("hard", forKey: "difficulty")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (defaults.objectForKey("difficulty") != nil)
        {
            if(defaults.stringForKey("difficulty") == "easy")
            {
                dificultySettingLabel.selectedSegmentIndex = 0
            
            } else if(defaults.stringForKey("difficulty") == "hard")
            {
                dificultySettingLabel.selectedSegmentIndex = 1
            }
        } else
        {
            defaults.setValue("easy", forKey: "difficulty")
        }
        
        savingData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
