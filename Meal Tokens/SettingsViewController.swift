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

    
    @IBAction func dificultySettingButton(sender: UISegmentedControl) {
        
        savingData()
        
    }
    
    
    
    
    func savingData()
    {
        loadingData()
    }
    
    func loadingData()
    {
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (defaults.objectForKey("dificulty") != nil)
        {
            if(defaults.stringForKey("dificulty") == "easy")
            {
                dificultySettingLabel.selectedSegmentIndex = 0
            
            } else if(defaults.stringForKey("dificulty") == "hard")
            {
                dificultySettingLabel.selectedSegmentIndex = 1
            }
        } else if (defaults.objectForKey("dificulty") == nil)
        {
            defaults.setValue("easy", forKey: "dificulty")
        }
        
        savingData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
