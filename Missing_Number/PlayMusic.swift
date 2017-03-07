//
//  PlayMusic.swift
//  Missing_Number
//
//  Created by mac on 2017/3/1.
//  Copyright © 2017年 syi. All rights reserved.
//

import UIKit
import AVFoundation

class PlayMusic: NSObject {
    
    var player = AVAudioPlayer()
    
    static func playEffec(){
        let URL = Bundle.main.path(forResource: "yx", ofType: "mp3")
        var soundID: SystemSoundID = 0
        let baseURL = NSURL(fileURLWithPath: URL!)
        AudioServicesCreateSystemSoundID(baseURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
    func playBackMusic(){
        let URL = Bundle.main.url(forResource: "rhzyjn", withExtension: "mp3")
        do{
            try player = AVAudioPlayer(contentsOf: URL!)
        }catch{
            
        }
        player.volume = 1.2
        player.numberOfLoops = -1
        player.prepareToPlay()
        player.play()
    }

}
