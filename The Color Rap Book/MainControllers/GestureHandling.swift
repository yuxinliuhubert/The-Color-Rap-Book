//
//  GestureHandling.swift
//  The Color Rap Book
//
//  Created by 7744 on 3/11/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
extension (DetailPageController) {
    
    func singleTapHandler(state: Int) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        
        switch state {
        case 15:
            image1.shake(duration: 0.5, rotationDivision: nil)
            if image1.frame.contains(position) {
                switch self.image1.image {
                    
                case UIImage(named: "page15UnPeeledBanana"):
                    self.image1.image = UIImage(named: "page15HalfPeeledBanana")
                    label1.text = "Click it again ⤷"
                    
                case UIImage(named: "page15HalfPeeledBanana"):
                    self.image1.image = UIImage(named: "page15PeeledBanana")
                    label1.text = "Wow! Peeled!\nClick it one more time ⤷"
                    
                case UIImage(named: "page15PeeledBanana"):
                    self.image1.image = UIImage(named: "page15UnPeeledBanana")
                    label1.text = "Click on the banana ⤷"
                default:
                    break;
                }}
            
            
        case 23:
            let circularPath = UIBezierPath(arcCenter: .zero, radius: screenHeight * 0.085, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
            if image5.frame.contains(position) {
                switch page23Phase {
                case 0:
                   
                    page23Phase = 1
                    label1.text = "Red means Stop"
                    label1.textColor = .red
                    CATransaction.begin()
                    CATransaction.setDisableActions(true)
                    self.page23LightLayer.fillColor = UIColor.red.cgColor
                        self.page23LightLayer.position = CGPoint(x: self.screenWidth * 0.495, y: self.screenHeight * 0.31)
                    CATransaction.commit()
                case 1:
                    page23Phase = 2
                     label1.text = "Yellow be slow"
                    label1.textColor = .yellow
                    CATransaction.begin()
                    CATransaction.setDisableActions(true)
                    self.page23LightLayer.fillColor = UIColor.yellow.cgColor
                        self.page23LightLayer.position = CGPoint(x: self.screenWidth * 0.495, y: self.screenHeight * 0.5)
                    CATransaction.commit()
                    
                case 2:
                    page23Phase = 0
                    label1.text = "Green can pass"
                    label1.textColor = .green
                    CATransaction.begin()
                    CATransaction.setDisableActions(true)
                    self.page23LightLayer.fillColor = UIColor.green.cgColor
                        self.page23LightLayer.position = CGPoint(x: self.screenWidth * 0.495, y: self.screenHeight * 0.7)
                    CATransaction.commit()
                    
                    
                default:
                    break;
                    
                }
                page23LightLayer.path = circularPath.cgPath
                page23LightLayer.opacity = 1
            }
            
        case 25:
            if image5.frame.contains(position) {
                self.page25ShakingTreeSound()
                self.image5.shake(duration: 0.5, rotationDivision: nil)
                UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseIn, animations: {
                    self.image6.alpha = 1
                    let leafHeight = self.screenHeight * 0.25
                    let leafWidth = leafHeight * (273/311)
                    self.image6.frame = CGRect(x: self.screenWidth * 0.26, y: self.screenHeight * 0.72, width: leafWidth, height: leafHeight)
                    //                self.image6.addShadow()
                }, completion: { (finished) in
                    self.imageFloatingEffect(image1: self.image6, image2: nil, image3: nil, image4: nil, image5: nil, state: state)})
                
                label1.text = ""
                
            }
            
            
        case 27:
            
            if image1.frame.contains(position) {
                self.page27SqueezingOrangeSound()
                self.image1.shake(duration: 1.5, rotationDivision: nil)
                label1.text = "📣 Did you hear the juicy sound?"
            
            }
            
        default:
            break;
        }
        
        
        
        
        
        
        
    }
    
    
    @objc func leftSwipeHandler() {
        
        print("sense the left swipe")
        if myVariable.state == 20 {
           
            self.grestureRecognizerSwitch(Bool: false)
            self.label1.alpha = 0
            
            //            self.image5.backgroundColor = .red
            
            
            
            UIView.animateKeyframes(withDuration: 2.65, delay: 0, options: [], animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1, animations: {
                    self.image5.transform = self.image5.transform.translatedBy(x: self.screenWidth * 0.1, y: 0)
                    
                })
                
                UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.4, animations: {
                    self.image5.transform = CGAffineTransform(rotationAngle: .pi/16)
                    self.image5.transform = self.image5.transform.translatedBy(x: -self.screenWidth * 0.2, y: -self.screenHeight * 0.2)
                })
                
                
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2, animations: {
                    self.image5.transform = CGAffineTransform(rotationAngle: -.pi/16)
                    self.image5.transform = self.image5.transform.translatedBy(x: -self.screenWidth * 0.2, y: 0)
                    
                })
                
                
                UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 1.8, animations: {
                    self.image5.transform = CGAffineTransform(rotationAngle: -.pi/2.3)
                    self.image5.transform = self.image5.transform.translatedBy(x: -self.screenWidth * 0.8, y: 0)
                })
                
                UIView.addKeyframe(withRelativeStartTime: 2.05, relativeDuration: 0.6, animations: {
                    
                    self.image1.image = UIImage(named: "page20Splash")
                    let universalWidth = self.screenWidth * 0.72991  //cherryImage.size.width / 3.3
                    let universalHeight = self.screenHeight * 0.61070 //cherryImage.size.height / 3.3
                    //                    self.view.bringSubviewToFront(self.image1)
                    self.image1.layer.zPosition = 7
                    //            print("width ", cherryImage.size.width)
                    //            print("height ",cherryImage.size.height)
                    UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
                        
                        self.image1.alpha = 1
                        self.image1.frame = CGRect(x: -self.screenWidth * 0.019, y: self.screenHeight * (1 - 0.5070), width: universalWidth ,height: universalHeight)
                        self.image1.addShadow()
                    })
                    
                    UIView.animate(withDuration: 0.2, delay: 2.05, options: [.curveEaseOut], animations: {
                    
                        self.label1.frame = CGRect(x: self.screenWidth * 0.08, y: self.screenHeight * 0.24, width: self.screenWidth * 0.6, height: self.screenHeight * 0.27)
                        self.label1.transform = CGAffineTransform(rotationAngle: -.pi/6)
                        self.label1.adjustsFontSizeToFitWidth = true
                        self.label1.text = "Plop!"
                        self.label1.alpha = 1
                    })
                    
                })
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.8, execute: {
//                    print("operated")
                    self.frogCallSound(stop: true)
                    self.waterSplashSound()
                })
            }, completion: {(completed) in
                 
                UIView.animateKeyframes(withDuration: 0.8, delay: 1.0, options: [], animations: {
                    self.image1.alpha = 0
                    self.label1.alpha = 0
                },completion: {_ in
                    self.grestureRecognizerSwitch(Bool: true)
                    self.image1.frame = CGRect(x: 0, y: self.screenHeight * 2, width: self.screenWidth, height: self.screenHeight)
                })
                
            })
            
        }
    }
    
    
    
    @objc func handlePanGesture(gesture: CustomPanGestureRecognizer) {
        
        
        if (gesture.state == .began) {
            
            print("mower Pan Gesture Began");
            self.lawnMowerTouchDownSound()
            
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            
            //            print("before drag: ", gesture.object!.center)
        } else if (gesture.state == .changed) {
            
            print("Pan Gesture change");
            switch gesture.page{
                
            case 22:
                
                //                label1 change to indicate movement
                let viewsForAnimation: [UIImageView] = [image2, image3, image4,image5, image6, image7]
                var count = 0
                //                compare see if there is any grass that is not mowed
                for imageSubView in viewsForAnimation {
                    if imageSubView.frame != gesture.page22ImageFrameArray[count] {
                        count += 1
                    }
                }
                if count < 6 {
                    label1.text = "Look for grass..."
                } else {
                    label1.text = "YAY! All done!"
                }

                //            measure the finger movement
                gesture.translation = gesture.translation(in: self.view)
                //            transform the object in accordance to the movement
                gesture.object?.transform = CGAffineTransform(translationX: gesture.translation?.x ?? 0, y: gesture.translation?.y ?? 0)
                
                
                
                //                iterate through all the grass images see if the mower overlaps the grass
                for imageSubView in viewsForAnimation {
                    if (gesture.object?.frame.contains(imageSubView.frame) == true) {
                        
//                        print("contain")
                        
                        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseInOut, animations: {
                            imageSubView.alpha = 0
                            imageSubView.transform = CGAffineTransform.identity.translatedBy(x: -self.screenHeight * 0.5, y: 0).rotated(by: -.pi / 1.3)
                        }, completion: nil)
                        
                        
                    }
                }
                
                
                
            default:
                break;
            }
            //                set the final location
            gesture.finalPoint = CGPoint(x: (gesture.object?.center.x)! + gesture.translation!.x, y: (gesture.object?.center.y)! + gesture.translation!.y)
        } else if (gesture.state == .ended) {
            self.lawnMowerShutdownSound()
            print("Pan Gesture ended");
            switch gesture.page {
            case 22:
                let viewsForAnimation: [UIImageView] = [image2, image3, image4,image5, image6, image7]
                var count = 0
                //                compare see if there is any grass that is not mowed
                for imageSubView in viewsForAnimation {
                    if imageSubView.frame != gesture.page22ImageFrameArray[count] {
                        count += 1
                    }
                }
                if count < 6 {
                    label1.text = "Keep going, YOU CAN DO IT"
                } else {
                    label1.text = "YAY! All done!"
                }
            default:
                break
            }
            //            reset the coordinate system back to original place
            gesture.object?.transform = .identity
            //            let the object center equal to the final point
            gesture.object!.center = gesture.finalPoint!
            
            //            print("after drag: ", gesture.object!.center)
        }
        
    }
    
    
    
    
    
    
    
    @objc func drawingToolsDragged(gesture: CustomPanGestureRecognizer) {
        

        //        let bottomBox = CGRect(x: 0, y: 0 , width: self.screenWidth, height: self.screenHeight)
        let bottomBox = CGRect(x: 0, y: self.screenHeight * 0.5 , width: self.screenWidth, height: self.screenHeight * 0.5)
        let topBox = CGRect(x: 0, y: 0 , width: self.screenWidth, height: self.screenHeight * 0.5)
        var topPosition =  CGPoint()
        var bottomPosition = CGPoint()
        if UIDevice.current.userInterfaceIdiom == .pad {
         topPosition = CGPoint(x: self.screenWidth * 0.5, y: self.screenHeight * 0.12)
         bottomPosition = CGPoint(x: self.screenWidth * 0.5, y: self.screenHeight * 0.87)
        }
        if UIDevice.current.userInterfaceIdiom == .phone {
         topPosition = CGPoint(x: self.screenWidth * 0.5, y: self.screenHeight * 0.15)
         bottomPosition = CGPoint(x: self.screenWidth * 0.5, y: self.screenHeight * 0.84)
        }
        
        
        
        switch gesture.state {
            
        case .began:
            print("Pan Gesture Began");
            gesture.finalPoint = gesture.object?.center
            
        case .changed:
        
                //            measure the finger movement
                gesture.translation = gesture.translation(in: self.view)
                gesture.object?.transform = CGAffineTransform(translationX: gesture.translation?.x ?? 0, y: gesture.translation?.y ?? 0)
                gesture.finalPoint = CGPoint(x: (gesture.object?.center.x)! + gesture.translation!.x, y: (gesture.object?.center.y)! + gesture.translation!.y)
                
        
        case .ended:
            //            reset the coordinate system back to original place
                if bottomBox.contains(gesture.finalPoint!) || bottomBox.intersects(gesture.object!.frame){
                    print("contains")
                    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.4, options: [.curveEaseOut, .allowUserInteraction], animations: {
                        gesture.object?.transform = .identity
                        //                    gesture.objectMovingAlong?.transform = .identity
                        gesture.object!.center = bottomPosition

                    }, completion: {_ in
                    })
                    
                    
                } else if topBox.contains(gesture.finalPoint!) || topBox.intersects(gesture.object!.frame){
                    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.4, options: [.curveEaseOut, .allowUserInteraction], animations: {
                        gesture.object?.transform = .identity
                        gesture.objectMovingAlong?.transform = .identity
                        gesture.object!.center = topPosition
                    }, completion: {_ in
                    })
                    
                } else {
                    print("The third drawing tool situation (unexpected)")
                    //                            let the object center equal to the final point
                    gesture.object?.transform = .identity
                    
                    gesture.object!.center = bottomPosition


                
            }
            break;
            
        default:
            break;
            
            
            
            
        
        
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

class CustomPanGestureRecognizer: UIPanGestureRecognizer {
    var object: UIView?
    var objectMovingAlong: UIView?
    var translation: CGPoint?
    var finalPoint: CGPoint?
    var page = Int()
    var page22ImageFrameArray = [CGRect]()
}

extension UIView {
    func shake(duration: CFTimeInterval, rotationDivision: Double?) {
        let shakeValues = [-5, 5, -5, 5, -3, 3, -2, 2, 0]

        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x");
        translation.timingFunction = CAMediaTimingFunction(name: .linear)
        translation.values = shakeValues
        
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotation.values = shakeValues.map { Double((Int(Double.pi) * $0)) / (rotationDivision ?? 180.00) }
        
        let shakeGroup = CAAnimationGroup()
        shakeGroup.animations = [translation, rotation]
        shakeGroup.duration = duration
        layer.add(shakeGroup, forKey: "shakeIt")
    }
}
