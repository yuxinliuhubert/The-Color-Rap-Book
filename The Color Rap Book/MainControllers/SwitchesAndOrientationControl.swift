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
            if UIDevice.current.orientation == .landscapeLeft {
                print("left orientation recognizer enabled")
                NotificationCenter.default.addObserver(self, selector:#selector(leftOrientationChanged(notification:)), name: UIDevice.orientationDidChangeNotification, object: UIDevice.current)
            } else if UIDevice.current.orientation == .landscapeRight {
                print("right orientation recognizer enabled")
                NotificationCenter.default.addObserver(self, selector:#selector(rightOrientationChanged(notification:)), name: UIDevice.orientationDidChangeNotification, object: UIDevice.current)
            }
        }
        
    }
    
    
    @objc func leftOrientationChanged(notification: NSNotification) {
        self.label1.alpha = 0
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
                print("stop")
                return
            }
        }
    }
    
    @objc func rightOrientationChanged(notification: NSNotification) {
        self.label1.alpha = 0
        if let device = notification.object as? UIDevice {
            switch device.orientation {
            case .portrait:
                portraitUpsideDownOrientationChange()
                print("left")
            case .portraitUpsideDown:
                portraitOrientationChange()
                print("right")
            case .landscapeRight:
                print("down")
                landscapeLeftOrientationChange()
            case .landscapeLeft:
                landscapeRightOrientationChange()
                print("up")
            default:
                flatOrientation()
                print("stop")
                return
            }
        }
    }
    
    func portraitOrientationChange() {
        // Change gravity direction
        myVariable.timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in self.gravityBehavior?.gravityDirection = self.regularGravityVectorCanceller})
        myVariable.timer.invalidate()
        gravityBehavior?.gravityDirection = regularGravityVector
    }
    
    
    func portraitUpsideDownOrientationChange() {
        // Flip our gravity
        myVariable.timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in self.gravityBehavior?.gravityDirection = self.invertedGravityVectorCanceller})
        myVariable.timer.invalidate()
        gravityBehavior?.gravityDirection = invertedGravityVector
    }
    
    func landscapeRightOrientationChange() {
        myVariable.timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in self.gravityBehavior?.gravityDirection = self.normalInvertGravityVectorCanceller})
        myVariable.timer.invalidate()
        gravityBehavior?.gravityDirection = normalInvertGravityVector
    }
    
    func landscapeLeftOrientationChange() {
        myVariable.timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in self.gravityBehavior?.gravityDirection = self.normalRegularGravityVectorCanceller})
        myVariable.timer.invalidate()
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
    
    @objc func randomColorGenerator() -> Int{
        let randomColor = Int(arc4random_uniform(6))
        return randomColor
    }
    
    
    
}
