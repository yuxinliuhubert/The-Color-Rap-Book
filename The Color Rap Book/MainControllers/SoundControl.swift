//
//  SoundControl.swift
//  The Color Rap Book
//
//  Created by 7744 on 7/1/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit
import StepSlider
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
            player.volume = myVariable.allSoundVolume
            player.numberOfLoops = 0
            player.play()
            
           }
           catch {
            print("audio player error")
        }
    }
    
    
    
    func frogCallSound() {
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
                player.volume = myVariable.allSoundVolume
                player.numberOfLoops = -1
                player.play()
    
                
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
            player.volume = myVariable.allSoundVolume * 0.6
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
                   player.volume = myVariable.allSoundVolume
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
                      player.volume = myVariable.allSoundVolume
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
                   player.volume = myVariable.allSoundVolume
                   player.play()
                
                player.delegate = self
                
                   
               }
               catch {
                   print("audio player error")
               }
    }
        
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
      
       
        switch myVariable.state {
//
        case 22:
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
            
        case 42:
            if flag == true {
                myVariable.backgroundPlayer?.play()
                label1.text = "Click on different snow flakes!"
            }
            
        case 44:
            if flag == true{
                myVariable.backgroundPlayer?.play()
            }
            
        default:
            break
        }
    }
    
    
    func soundPlay(forResource: String, ofType: String) {
        
        let urlString = Bundle.main.path(forResource: forResource, ofType: ofType)
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
                     player.volume = myVariable.allSoundVolume
                     player.play()
                     
                     player.delegate = self
                     
                     
                 }
                 catch {
                     print("audio player error")
                 }
    }
    
}


extension UIViewController {
    
    
    func setUpBackgroundPlayer() {
        let urlString = Bundle.main.path(forResource: "backgroundMusic", ofType: "m4a")
                      do {
                          try AVAudioSession.sharedInstance().setMode(.default)
                          try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                          
                          guard let urlString = urlString else {
                              return
                          }
                          
                  
                         myVariable.backgroundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                          
                         guard let player = myVariable.backgroundPlayer else {
                              return
                          }
                          player.numberOfLoops = -1
                          player.prepareToPlay()
                          
                      }
                      catch {
                          print("audio player error")
                      }
    }
    
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
                    player.volume = myVariable.allSoundVolume
                     player.numberOfLoops = 0
                    
                     player.prepareToPlay()
                     
                 }
                 catch {
                     print("audio player error")
                 }
          
        
        
        
          
          
          
          
      }
    
    
    
    
}




class MusicPanelControlStack: UIStackView {
    
    var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.alpha = 0.4
        return view
    }()
    
    var backgroundMusicStack: MusicVolumeStack = {
        let stack = MusicVolumeStack()
        stack.label.text = "Music"
        stack.slider.maxCount = 5
        stack.slider.setIndex(5, animated: false)
//        stack.slider.addTarget(self, action: #selector(backgroundMusicVolumeControl), for: .valueChanged)
        return stack
    }()
    
    var soundControlStack: MusicVolumeStack = {
        let stack = MusicVolumeStack()
        stack.label.text = "Sound"
        stack.slider.maxCount = 5
        stack.slider.setIndex(5, animated: false)
        //        stack.slider.addTarget(self, action: #selector(soundVolumeControl), for: .valueChanged)
        return stack
        
    }()
    

    fileprivate func setUpBackgroundView() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor,constant: -20).isActive = true
          backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true
          backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -10).isActive = true
          backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 30).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundView)
        setUpBackgroundView()
        self.addArrangedSubview(backgroundMusicStack)
        self.addArrangedSubview(soundControlStack)
        backgroundMusicStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
         backgroundMusicStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

         soundControlStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
         soundControlStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        
        axis = .vertical
        distribution = .fillProportionally
        alignment = .center
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}




class MusicVolumeStack: UIStackView {
    
    
    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Morgan_bold", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    var slider: StepSlider = {
        let slider = StepSlider()
//        slider.sliderCircleImage = UIImage(named: "imageCopy")
        slider.contentMode = .scaleAspectFit
        slider.trackHeight = 7
        slider.trackCircleRadius = 8
//        slider.adjustLabel = true
        slider.labelOffset = 4
        slider.labels = ["Mute", "Quiet", "Alright", "Loud","Very Loud"]
        slider.labelFont = UIFont(name: "Morgan_bold", size: 15)
    
//        slider.setTrackCircleImage(UIImage(named: "goBack"), for: .normal)
        return slider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addArrangedSubview(label)
        self.addArrangedSubview(slider)
//        slider.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        label.widthAnchor.constraint(equalTo: slider.widthAnchor, multiplier: 0.2).isActive = true
        label.heightAnchor.constraint(equalTo: slider.heightAnchor, multiplier: 1).isActive = true
        spacing = 5
        axis = .horizontal
        distribution = .fill
        alignment = .center
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
    
       















