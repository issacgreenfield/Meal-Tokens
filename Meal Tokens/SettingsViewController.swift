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
    
//    private var tokenDificulty: Bool? = false
    
    @IBOutlet weak var dificultySettingLabel: UISegmentedControl!

    
    @IBAction func dificultySettingButton(sender: UISegmentedControl) {
        
        savingData()
        
    }
    
    
    
    
    func savingData()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("dificulty") != nil) {
//            if (tokenDificulty == false)
//            {
//                dificultySettingLabel.selectedSegmentIndex = 0
//                
//            } else
//            {
//                dificultySettingLabel.selectedSegmentIndex = 1
//            }
        }
        loadingData()
    }
    
    func loadingData()
    {
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey("dificulty") != nil)
        {
            if(defaults.objectForKey("dificulty")!.containsString("2.0"))
            {
                dificultySettingLabel.selectedSegmentIndex = 0
            
            } else if(defaults.objectForKey("dificulty")!.containsString("1.0"))
            {
                dificultySettingLabel.selectedSegmentIndex = 1
            }
        } else if (defaults.objectForKey("dificulty") == nil)
        {
            defaults.setValue("dificulty", forKey: "1.0")
        }
        
        savingData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
