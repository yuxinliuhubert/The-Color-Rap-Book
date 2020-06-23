//
//  GestureHandling.swift
//  The Color Rap Book
//
//  Created by 7744 on 3/11/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit

extension (DetailPageController) {
    
    func singleTapHandler(state: Int) {
        switch state {
        case 15:
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
            
            
            
        default:
            break;
        }
        
        
        
        
        
        
        
    }
    
    
    func leftSwipeHandler(state: Int) {
        
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
            
            print("Pan Gesture Began");
            
            //            print("before drag: ", gesture.object!.center)
        } else if (gesture.state == .changed) {
            
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

