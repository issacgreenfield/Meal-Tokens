//
//  MusicBrain.swift
//  Meal Tokens
//
//  Created by Issac Greenfield on 3/7/16.
//  Copyright © 2016 Issac Greenfield. All rights reserved.
//

import Foundation
import AVFoundation

///This Class acts as a sound manager for wav files
public struct MusicBrain
{
    private var mySound: SystemSoundID
    
    init()
    {
        self.mySound = 0
    }
    
    internal func playAddTokens()
    {
        let soundURL = NSBundle.mainBundle().URLForResource("coindropA", withExtension: "wav")
        var mySound: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL!, &mySound)
        AudioServicesPlaySystemSound(mySound);
    }
    
    internal func playUseTokens()
    {
        let soundURL = NSBundle.mainBundle().URLForResource("nomnom", withExtension: "wav")
        var mySound: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL!, &mySound)
        AudioServicesPlaySystemSound(mySound);
    }
}