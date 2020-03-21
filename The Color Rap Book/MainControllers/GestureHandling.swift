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
                
            case UIImage(named: "page15HalfPeeledBanana"):
                self.image1.image = UIImage(named: "page15PeeledBanana")
                
            case UIImage(named: "page15PeeledBanana"):
                self.image1.image = UIImage(named: "page15UnPeeledBanana")
                
            default:
                break;
            }
            }
            
        default:
            break;
        }
        
        
        
        
        
        
        
    }
    
    
    func leftSwipeHandler(state: Int) {
        
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
                    self.view.bringSubviewToFront(self.image1)
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
                print("aye")
    //            print("before drag: ", gesture.object!.center)
            } else if (gesture.state == .changed) {
                
                switch gesture.page{
                    
                case 22:
                    
                    //                label1 change to indicate movement
                    label1.text = "Look for grass..."
                    //            measure the finger movement
                    gesture.translation = gesture.translation(in: self.view)
                    //            transform the object in accordance to the movement
                    gesture.object?.transform = CGAffineTransform(translationX: gesture.translation?.x ?? 0, y: gesture.translation?.y ?? 0)
                    
                    if (gesture.object?.frame.contains(self.image2.frame) == true) {
                        
                        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseInOut, animations: {
                            //                            self.image2.transform = CGAffineTransform(translationX: -self.screenHeight * 0.5, y: 0 )
                            self.image2.alpha = 0
                            self.image2.transform = CGAffineTransform.identity.translatedBy(x: -self.screenHeight * 0.5, y: 0).rotated(by: -.pi / 1.3)
                            //                            self.image2.transform = self.image2.transform.rotated(by: .pi / 1.3)
                        }, completion: nil)
                    }
                    if (gesture.object?.frame.contains(self.image3.frame) == true) {
                        
                        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseInOut, animations: {
                            //                            self.image2.transform = CGAffineTransform(translationX: -self.screenHeight * 0.5, y: 0 )
                            self.image3.alpha = 0
                            self.image3.transform = CGAffineTransform.identity.translatedBy(x: -self.screenHeight * 0.5, y: 0).rotated(by: -.pi / 1.3)
                            //                            self.image2.transform = self.image2.transform.rotated(by: .pi / 1.3)
                        }, completion: nil)
                    }
                    if (gesture.object?.frame.contains(self.image4.frame) == true) {
                        
                        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseInOut, animations: {
                            //                            self.image2.transform = CGAffineTransform(translationX: -self.screenHeight * 0.5, y: 0 )
                            self.image4.alpha = 0
                            self.image4.transform = CGAffineTransform.identity.translatedBy(x: -self.screenHeight * 0.5, y: 0).rotated(by: -.pi / 1.3)
                            //                            self.image2.transform = self.image2.transform.rotated(by: .pi / 1.3)
                        }, completion: nil)
                    }
                    if (gesture.object?.frame.contains(self.image5.frame) == true) {
                        
                        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseInOut, animations: {
                            //                            self.image2.transform = CGAffineTransform(translationX: -self.screenHeight * 0.5, y: 0 )
                            self.image5.alpha = 0
                            self.image5.transform = CGAffineTransform.identity.translatedBy(x: -self.screenHeight * 0.5, y: 0).rotated(by: -.pi / 1.3)
                            //                            self.image2.transform = self.image2.transform.rotated(by: .pi / 1.3)
                        }, completion: nil)
                    }
                    if (gesture.object?.frame.contains(self.image6.frame) == true) {
                        
                        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseInOut, animations: {
                            //                            self.image2.transform = CGAffineTransform(translationX: -self.screenHeight * 0.5, y: 0 )
                            self.image6.alpha = 0
                            self.image6.transform = CGAffineTransform.identity.translatedBy(x: -self.screenHeight * 0.5, y: 0).rotated(by: -.pi / 1.3)
                            //                            self.image2.transform = self.image2.transform.rotated(by: .pi / 1.3)
                        }, completion: nil)
                    }
                    
                    if (gesture.object?.frame.contains(self.image7.frame) == true) {
                        
                        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseInOut, animations: {
                            //                            self.image2.transform = CGAffineTransform(translationX: -self.screenHeight * 0.5, y: 0 )
                            self.image7.alpha = 0
                            self.image7.transform = CGAffineTransform.identity.translatedBy(x: -self.screenHeight * 0.5, y: 0).rotated(by: -.pi / 1.3)
                            //                            self.image2.transform = self.image2.transform.rotated(by: .pi / 1.3)
                        }, completion: nil)
                    }
                    
                    
                default:
                    break;
                }
                //                set the final location
                gesture.finalPoint = CGPoint(x: (gesture.object?.center.x)! + gesture.translation!.x, y: (gesture.object?.center.y)! + gesture.translation!.y)
            } else if (gesture.state == .ended) {
                switch gesture.page {
                case 22:
                    if (self.image2.frame != gesture.page22ImageFrameArray[0] && self.image3.frame != gesture.page22ImageFrameArray[1] && self.image4.frame != gesture.page22ImageFrameArray[2] && self.image5.frame != gesture.page22ImageFrameArray[3] && self.image6.frame != gesture.page22ImageFrameArray[4] && self.image7.frame != gesture.page22ImageFrameArray[5])
                    {
                        print("image7 frame after mower:", image7.frame)
//                  setting label text back to finished
                    label1.text = "YAY! All done!"
                    } else {
                        label1.text = "Keep going, YOU CAN DO IT" 
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
    
    
    
    
    
    
    
    
    
    
    
}

class CustomPanGestureRecognizer: UIPanGestureRecognizer {
    var object: UIView?
    var translation: CGPoint?
    var finalPoint: CGPoint?
    var page = Int()
    var page22ImageFrameArray = [CGRect]()
}
