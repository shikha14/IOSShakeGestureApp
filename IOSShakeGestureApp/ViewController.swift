//
//  ViewController.swift
//  IOSShakeGestureApp
//
//  Created by Shikha Gupta on 15/11/16.
//  Copyright © 2016 shikha. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player :AVAudioPlayer = AVAudioPlayer()
    
    var sounds = ["babbling_stream","fire_storm","snow_falling_on_leaves","storm_at_sea_on_boat"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake
        {
            print("Device shaken")
            
            let randomNumber = arc4random_uniform(UInt32(sounds.count + 1))
            
            let audioPath = Bundle.main.path(forResource: sounds[Int(randomNumber)], ofType: "mp3")
            
            do{
                try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
                player.play()
            }catch{
            
            }
            
            
        
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

