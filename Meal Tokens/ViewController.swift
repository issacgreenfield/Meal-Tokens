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
        
        mealTokens.text = String(tokenCalculator! / 3)
        snackTokens.text = String(tokenCalculator! % 3)
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
        
        mealTokens.text = String(tokenCalculator! / 3)
        snackTokens.text = String(tokenCalculator! % 3)

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
        
        mealTokens.text = String(tokenCalculator! / 3)
        snackTokens.text = String(tokenCalculator! % 3)

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
        
        mealTokens.text = String(tokenCalculator! / 3)
        snackTokens.text = String(tokenCalculator! % 3)

    }
    
    @IBAction func eatSnackButton(sender: UIButton)
    {
        tokenCalculator = tokenCalculator! - 1
        mealTokens.text = String(tokenCalculator! / 3)
        snackTokens.text = String(tokenCalculator! % 3)
    }
    
    @IBAction func eatMealButton(sender: UIButton)
    {
        tokenCalculator = tokenCalculator! - 3
        mealTokens.text = String(tokenCalculator! / 3)
        snackTokens.text = String(tokenCalculator! % 3)
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

