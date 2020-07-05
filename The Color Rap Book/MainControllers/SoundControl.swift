//
//  SoundControl.swift
//  The Color Rap Book
//
//  Created by 7744 on 7/1/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension DetailPageController {


    func pageFlipSound() {
           let urlString = Bundle.main.path(forResource: "pageTurn2", ofType: "m4a")
           do {
               try AVAudioSession.sharedInstance().setMode(.default)
               try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
               
               guard let urlString = urlString else {
                   return
               }
               
            
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = player else {
                return
            }
            player.numberOfLoops = 0
            player.play()
            
           }
           catch {
            print("audio player error")
        }
    }
    
    func birdChirpingSound() {
        
        
        let urlString = Bundle.main.path(forResource: "birdChirping", ofType: "m4a")
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            
    
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = player else {
                return
            }
            player.numberOfLoops = 0
            player.play()
            
        }
        catch {
            print("audio player error")
        }
        
    }
    
    
    func frogCallSound(stop: Bool) {
        let urlString = Bundle.main.path(forResource: "page20FrogCall", ofType: "m4a")
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else {
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else {
                    return
                }
                if stop == false {
                player.numberOfLoops = -1
                player.play()
                } else {
                    player.numberOfLoops = 0
                    player.stop()
                }
                
            }
            catch {
                print("audio player error")
            }
            
        }
    
    func waterSplashSound() {
        let urlString = Bundle.main.path(forResource: "page20WaterSplashSound", ofType: "m4a")
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            
            
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = player else {
                return
            }
            player.numberOfLoops = 0
            player.volume = 0.6
            player.play()
            player.delegate = self
            
        }
        catch {
            print("audio player error")
        }
    }
    
    
    func lawnMowerTouchDownSound() {

        let urlString = Bundle.main.path(forResource: "page22MowerStartSound", ofType: "m4a")
               do {
                   try AVAudioSession.sharedInstance().setMode(.default)
                   try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                   
                   guard let urlString = urlString else {
                       return
                   }
                   
                   
                   player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                   
                   guard let player = player else {
                       return
                   }
//                lawnMowerOperatingPrepareSound()
                   player.numberOfLoops = 0
                   player.volume = 1
                   player.play()
                player.delegate = self
                
                
                   
               }
               catch {
                   print("audio player error")
               }
    }
    
    
    func lawnMowerOperatingSound(){
    
    let urlString = Bundle.main.path(forResource: "page22MowerOperatingSound", ofType: "m4a")
                  do {
                      try AVAudioSession.sharedInstance().setMode(.default)
                      try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                      
                      guard let urlString = urlString else {
                          return
                      }
                      
                      
                      player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                      
                      guard let player = player else {
                          return
                      }
                      player.numberOfLoops = -1
                      player.volume = 1
                      player.play()
                   player.delegate = self
                   
                      
                  }
                  catch {
                      print("audio player error")
                  }
    
    
    
    
    
    }
    func lawnMowerShutdownSound() {
        
        let urlString = Bundle.main.path(forResource: "page22MowerShutdownSound", ofType: "m4a")
               do {
                   try AVAudioSession.sharedInstance().setMode(.default)
                   try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                   
                   guard let urlString = urlString else {
                       return
                   }
                   
                   
                   player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                   
                   guard let player = player else {
                       return
                   }
                   player.numberOfLoops = 0
                   player.volume = 1
                   player.play()
                
                player.delegate = self
                
                   
               }
               catch {
                   print("audio player error")
               }
    }
        
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
      
       
        if myVariable.state == 22 {
//
        if flag == true {
           guard let playerUrl = player.url?.absoluteString else {
                      print("player url error")
                      return
                  }
                  if playerUrl.contains("page22MowerStartSound.m4a") {
                      print("contains")
//                    lawnMowerOperatingPrepareSound()
                    lawnMowerOperatingSound()
                  }


        }
        }
    }
    
    func page25ShakingTreeSound() {
        let urlString = Bundle.main.path(forResource: "page25ShakeSound", ofType: "m4a")
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            
            
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = player else {
                return
            }
            player.numberOfLoops = 0
            player.volume = 1
            player.play()
            
            player.delegate = self
            
            
        }
        catch {
            print("audio player error")
        }
    }
    
    
    
    func page27SqueezingOrangeSound() {
           let urlString = Bundle.main.path(forResource: "page27OrangeSqueezSound", ofType: "m4a")
           do {
               try AVAudioSession.sharedInstance().setMode(.default)
               try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
               
               guard let urlString = urlString else {
                   return
               }
               
               
               player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
               
               guard let player = player else {
                   return
               }
               player.numberOfLoops = 0
               player.volume = 1
               player.play()
               
               player.delegate = self
               
               
           }
           catch {
               print("audio player error")
           }
       }
    
}


extension UIViewController {
    
    func setUpBubblePlayer() {
          
                 let urlString = Bundle.main.path(forResource: "buttonSound", ofType: "m4a")
                 do {
                     try AVAudioSession.sharedInstance().setMode(.default)
                     try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                     
                     guard let urlString = urlString else {
                         return
                     }
                     
             
                    myVariable.buttonSoundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                     
                    guard let player = myVariable.buttonSoundPlayer else {
                         return
                     }
                     player.numberOfLoops = 0
                     player.prepareToPlay()
                     
                 }
                 catch {
                     print("audio player error")
                 }
          
        
        
        
          
          
          
          
      }
    
    
    
    
}
    
       















