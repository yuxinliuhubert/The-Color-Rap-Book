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
   
    
   
      @objc func orientationChanged(notification: NSNotification) {
               if let device = notification.object as? UIDevice {
                   switch device.orientation {
                   case .landscapeRight:
                    myVariable.orientation = 3
                   case .landscapeLeft:
                    myVariable.orientation = 4
                   default:
                       return
                   }
               }
           }
    
    func addOrientationObserver() {
         NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged(notification:)), name: UIDevice.orientationDidChangeNotification, object: UIDevice.current)
        
        isObserving = true
    }
    
    func removeOrientationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.orientationChanged(notification:)), name: UIDevice.orientationDidChangeNotification, object: UIDevice.current)
        isObserving = false
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
            myVariable.page = myVariable.state
            saveData()
            print("state: ", myVariable.state)
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
            edgePan.isEnabled = true
        }else if (Bool == false) {
            leftSwipeGesture.isEnabled = false
            rightSwipeGesture.isEnabled = false
            upSwipeGesture.isEnabled = false
            downSwipeGesture.isEnabled = false
            singleTap.isEnabled = false
            edgePan.isEnabled = false
        }
    }
    
    
    //    Buttons Control
    
    func buttonsEnabled(Bool: Bool) {
        switch Bool {
        case true:
            previousButton.isEnabled = true
            if myVariable.state != 48 {
                nextButton.isEnabled = true
            }
            showMoreButton.isEnabled = true
            UIView.animate(withDuration: 1.0, animations: {
                self.previousButton.alpha = 1
                if myVariable.state != 48 {
                    self.nextButton.alpha = 1
                }
                self.showMoreButton.alpha = 1
            })
            
            
        default:
            previousButton.isEnabled = false
            nextButton.isEnabled = false
            showMoreButton.isEnabled = false
            previousButton.alpha = 0.4
            if myVariable.state == 48 {
                self.nextButton.alpha = 0
            } else {
            nextButton.alpha = 0.4
            }
            showMoreButton.alpha = 0.4
            
        }
    }
    
    @objc func randomColorGenerator() -> Int{
        let randomColor = Int(arc4random_uniform(6))
        return randomColor
    }
    
    
    
}
