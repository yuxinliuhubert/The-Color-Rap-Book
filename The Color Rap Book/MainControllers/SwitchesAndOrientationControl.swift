//
//  Switches.swift
//  The Color Rap Book
//
//  Created by 7744 on 3/11/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import  UIKit


extension (DetailPageController) {
    
//    Orientation Control
    func orientationDetectorSwwitch(Bool: Bool) {
           switch Bool {
           case false:
               NotificationCenter.default.removeObserver(self)
           default:
               print("orientation recognizer enabled")
               NotificationCenter.default.addObserver(self, selector:#selector(orientationChanged(notification:)), name: UIDevice.orientationDidChangeNotification, object: UIDevice.current)
           }
           
       }
    
    @objc func orientationChanged(notification: NSNotification) {
          if let device = notification.object as? UIDevice {
              switch device.orientation {
              case .portrait:
                  portraitOrientationChange()
                  print("right")
              case .portraitUpsideDown:
                  portraitUpsideDownOrientationChange()
                  print("left")
              case .landscapeRight:
                  print("up")
                  landscapeRightOrientationChange()
              case .landscapeLeft:
                  landscapeLeftOrientationChange()
                  print("down")
              default:
                  flatOrientation()
                  print("ha stop")
                  return
              }
          }
      }
      
      func portraitOrientationChange() {
          // Change gravity direction
         timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in self.gravityBehavior?.gravityDirection = self.regularGravityVectorCanceller})
          timer.invalidate()
          gravityBehavior?.gravityDirection = regularGravityVector
      }
      

      func portraitUpsideDownOrientationChange() {
          // Flip our gravity
          timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in self.gravityBehavior?.gravityDirection = self.invertedGravityVectorCanceller})
          timer.invalidate()
          gravityBehavior?.gravityDirection = invertedGravityVector
      }
      
      func landscapeRightOrientationChange() {
          timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in self.gravityBehavior?.gravityDirection = self.normalInvertGravityVectorCanceller})
          timer.invalidate()
          gravityBehavior?.gravityDirection = normalInvertGravityVector
      }
      
      func landscapeLeftOrientationChange() {
          timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in self.gravityBehavior?.gravityDirection = self.normalRegularGravityVectorCanceller})
          timer.invalidate()
          gravityBehavior?.gravityDirection = normalRegularGravityVector
      }
      
      func flatOrientation() {
          gravityBehavior?.gravityDirection = zeroGravityVector

      }
    
    
    
    
    
    func textFieldShouldReturn(_ testingTextfield: UITextField) -> Bool {
           testingTextfield.resignFirstResponder()
           guard let compareNum = Int(testingTextfield.text ?? "3") else { return true}
           testingTextfield.text = nil
           if compareNum >= 3 && compareNum <= 50 {
               if myVariable.state < compareNum {
                   myVariable.state = compareNum
               backgroundChangeForward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
               } else if myVariable.state > compareNum {
                   myVariable.state = compareNum
               backgroundChangeBackward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
           }
               print("state; ", myVariable.state)
           }
           
           return true
       }
    
    
    
    
//  Gesture Control
    func grestureRecognizerSwitch(Bool: Bool) {
          if (Bool == true) {
              leftSwipeGesture.isEnabled = true
              rightSwipeGesture.isEnabled = true
              upSwipeGesture.isEnabled = true
              downSwipeGesture.isEnabled = true
              singleTap.isEnabled = true
          }else if (Bool == false) {
              leftSwipeGesture.isEnabled = false
              rightSwipeGesture.isEnabled = false
              upSwipeGesture.isEnabled = false
              downSwipeGesture.isEnabled = false
              singleTap.isEnabled = false
          }
      }
      
    
//    Buttons Control
    
    func buttonsEnabled(Bool: Bool) {
          switch Bool {
          case true:
              previousButton.isEnabled = true
              nextButton.isEnabled = true
              showMoreButton.isEnabled = true
              UIView.animate(withDuration: 1.0, animations: {
                  self.previousButton.alpha = 1
                  self.nextButton.alpha = 1
                  self.showMoreButton.alpha = 1
              })

              
          default:
              previousButton.isEnabled = false
              nextButton.isEnabled = false
              showMoreButton.isEnabled = false
              previousButton.alpha = 0.4
              nextButton.alpha = 0.4
              showMoreButton.alpha = 0.4
              
          }
      }

    
    
    
}