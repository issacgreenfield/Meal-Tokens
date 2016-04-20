//
//  MusicBrain.swift
//  Meal Tokens
//
//  Created by Issac Greenfield on 3/7/16.
//  Copyright © 2016 Issac Greenfield. All rights reserved.
//

import Foundation
import AVFoundation

/// A sound manager for wav files
public class MusicBrain
{
    private var mySound: SystemSoundID
    
    init()
    {
        self.mySound = 0
    }
    
    public func playAddTokens()
    {
        let soundURL = NSBundle.mainBundle().URLForResource("coindropA", withExtension: "wav")
        var mySound: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL!, &mySound)
        AudioServicesPlaySystemSound(mySound);
    }
    
    public func playUseTokens()
    {
        let soundURL = NSBundle.mainBundle().URLForResource("nomnom", withExtension: "wav")
        var mySound: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL!, &mySound)
        AudioServicesPlaySystemSound(mySound);
    }
}