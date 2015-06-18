//
//  ViewController.swift
//  Meal Tokens
//
//  Created by Issac Greenfield on 6/15/15.
//  Copyright (c) 2015 Issac Greenfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var tokenCalculator: Int? = 0
    
    
    @IBOutlet weak var mealTokens: UILabel!
    
    @IBOutlet weak var snackTokens: UILabel!
    
    
    @IBAction func workout15Button(sender: UIButton)
    {
        var digit: Int = sender.currentTitle!.toInt()!

        var refreshAlert = UIAlertController(title: "Hold up", message: "Did you really work out for 15 minutes?", preferredStyle: UIAlertControllerStyle.Alert)
        
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
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Blch... no", style: .Default, handler: { (action: UIAlertAction!) in
            //println("Handle Cancel Logic here")
        }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func workout30Button(sender: UIButton)
    {
        var digit: Int = sender.currentTitle!.toInt()!
        
        switch digit
        {
        case 15:
            tokenCalculator = tokenCalculator! + 1
        case 30:
            tokenCalculator = tokenCalculator! + 2
        case 45:
            tokenCalculator = tokenCalculator! + 3
        case 60:
            tokenCalculator = tokenCalculator! + 4
        default:
            break
        }
        
        mealTokens.text = String(tokenCalculator! / 4)
        snackTokens.text = String(tokenCalculator! % 4)

    }
    
    @IBAction func workout45Button(sender: UIButton)
    {
        var digit: Int = sender.currentTitle!.toInt()!
        
        switch digit
        {
        case 15:
            tokenCalculator = tokenCalculator! + 1
        case 30:
            tokenCalculator = tokenCalculator! + 2
        case 45:
            tokenCalculator = tokenCalculator! + 3
        case 60:
            tokenCalculator = tokenCalculator! + 4
        default:
            break
        }
        
        mealTokens.text = String(tokenCalculator! / 4)
        snackTokens.text = String(tokenCalculator! % 4)

    }
    
    @IBAction func workout60Button(sender: UIButton)
    {
        var digit: Int = sender.currentTitle!.toInt()!
        
        switch digit
        {
        case 15:
            tokenCalculator = tokenCalculator! + 1
        case 30:
            tokenCalculator = tokenCalculator! + 2
        case 45:
            tokenCalculator = tokenCalculator! + 3
        case 60:
            tokenCalculator = tokenCalculator! + 4
        default:
            break
        }
        
        mealTokens.text = String(tokenCalculator! / 4)
        snackTokens.text = String(tokenCalculator! % 4)

    }
    
    @IBAction func eatSnackButton(sender: UIButton)
    {
        if tokenCalculator! > 0
        {
        tokenCalculator = tokenCalculator! - 1
        mealTokens.text = String(tokenCalculator! / 4)
        snackTokens.text = String(tokenCalculator! % 4)
        }
    }
    
    @IBAction func eatMealButton(sender: UIButton)
    {
        if tokenCalculator! >= 4
        {
        tokenCalculator! = tokenCalculator! - 4
        mealTokens.text = String(tokenCalculator! / 4)
        snackTokens.text = String(tokenCalculator! % 4)
        }
    }
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

