//
//  backgroundControl.swift
//  The Color Rap Book
//
//  Created by 7744 on 2/20/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension (DetailPageController) {
    
    func backgroundChangeBackward(imageView: UIImageView, delay: TimeInterval, state: Int, label: UILabel) {
        grestureRecognizerSwitch(Bool: false)
        UIView.animate(withDuration: 0.5, animations: {
            //            self.showMoreStack.transform = .identity
            self.showMoreButton.alpha = 1
        })
        testingTextfield.placeholder = "Page \(state)"
            self.labelTextDisappearing(label: label)
            self.imageDisappearing()
            UIView.transition(with: imageView, duration: 1.5, options: [.transitionCurlDown], animations: {
                self.pageFlipSound()
                self.pageNumberBackgroundDisplay(imageView: imageView, pageNum: state)
            }, completion: { finished in
                self.loadingViewChange(state: state, label: label)
                
            })
        
    }
    
    
    func backgroundChangeForward(imageView: UIImageView, delay: TimeInterval, state: Int, label: UILabel) {
        //        print("Notification Center observers, ", NotificationCenter.default.observationInfo)
        grestureRecognizerSwitch(Bool: false)
        UIView.animate(withDuration: 0.5, animations: {
            //            self.showMoreStack.transform = .identity
            self.showMoreButton.alpha = 1
        })
        
        testingTextfield.placeholder = "Page \(state)"
        UIView.transition(with: imageView, duration: 1.5, options: [.transitionCurlUp], animations: {
            self.pageFlipSound()
            UIView.transition(with: label, duration: 1.5, options: [.transitionCurlUp], animations: {
                self.labelTextDisappearing(label: label)
                self.imageDisappearing()
            },completion: nil)
            self.pageNumberBackgroundDisplay(imageView: imageView, pageNum: state)
        }, completion: { finished in
            
            self.loadingViewChange(state: state, label: label)
        })
    }
    
    
    
    func loadingViewChange(state: Int, label: UILabel) {
        //        self.pageNumberBackgroundDisplay(imageView: imageView, pageNum: state)
        
        
        //        self.imageBackInPlace()
        switch myVariable.state
        {
            
        case 3,4,8,9,13,18,19,24,28,31,32,36,41:
            self.pageNumberLabelDisplay(label: label, pageNum: state)
            
        case 5:
            //                print("Device orientation, ", UIDevice.current.orientation.rawValue)
            //                self.removeOrientationObserver()
            self.image1.contentMode = .scaleToFill
            self.image2.contentMode = .scaleToFill
            self.image3.contentMode = .scaleToFill
            self.image6.contentMode = .scaleToFill
            self.image7.contentMode = .scaleToFill
            let cloudHeight = self.screenHeight * 0.2
            let leftCloudWidth = cloudHeight * 1.14
            let rightCloudWidth = cloudHeight * 1.0952
            let sunHeight = self.screenHeight * 0.25
            let sunWidth = sunHeight * 0.9023
            self.image2.frame = CGRect(x: self.screenWidth * 0.18, y: -cloudHeight * 2, width: leftCloudWidth, height: cloudHeight)
            self.image3.frame = CGRect(x: self.screenWidth * 0.40, y: -cloudHeight * 2, width: rightCloudWidth, height: cloudHeight)
            self.image6.frame = CGRect(x: 0, y: -sunHeight * 2, width: sunWidth, height: sunHeight)
            UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                self.elementsEnteringStorage(state: state)
                print("animation processed")
                
                
            }, completion: {(finished) in
                self.pageNumberLabelDisplay(label: label, pageNum: state)
            })
            
            
            
            
        case 7:
            UIView.transition(with: self.image4, duration: 1.8, options:[.curveEaseIn], animations: {
                self.elementsEnteringStorage(state: state)
            }, completion: {(finished) in
                self.pageNumberLabelDisplay(label: label, pageNum: state)
            })
            
        case 11:
            UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                self.elementsEnteringStorage(state: state)
            }, completion: {(finished) in
                self.firstLabelTask(state: 11, completion: {(success) -> Void in
                    if success {
                        self.imageRotate(imageview: self.image1, x: 0.79276, y: 1 - 0.1635, state: 11)
                    }})
            })
            
            
        case 12:
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [.curveEaseIn], animations: {
                print("animation processed")
                self.elementsEnteringStorage(state: state)
            }, completion: {(finished) in
                self.pageNumberLabelDisplay(label: label, pageNum: state)
            })
            
            
        case 20:
            self.imageBackInPlace()
            
            UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                self.elementsEnteringStorage(state: state)
                print("animation processed")
                
                
            }, completion: {(finished) in
                self.pageNumberLabelDisplay(label: label, pageNum: state)
            })
            
        case 22:
            self.imageSpecialCase22()
            //                self.imageSpecialCase22()
            UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                self.elementsEnteringStorage(state: state)
                print("animation processed")
                
                
            }, completion: {(finished) in
                self.pageNumberLabelDisplay(label: label, pageNum: state)
            })
            
            
        case 35:
            UIView.animate(withDuration: 1.5, delay: 0, options: [.transitionFlipFromTop], animations: {
                self.elementsEnteringStorage(state: state)}, completion: {(finished) in
                    self.pageNumberLabelDisplay(label: label, pageNum: state)
                    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(tapGestureRecognizer:)))
                    self.image1.isUserInteractionEnabled = true
                    self.image1.addGestureRecognizer(tapGestureRecognizer)
                    let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.imagePop(longPress:)))
                    self.image1.addGestureRecognizer(longPressRecognizer)
                    
            })
            
        case 38:
            UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                self.elementsEnteringStorage(state: state)
            }, completion: {(finished) in
                self.firstLabelTask(state: 38, completion: {(success) -> Void in
                    if success {
                        self.imageRotate(imageview: self.image1, x: 0.5, y: 0.5, state: 11)
                    }})
            })
            
            
            
        case 47:
            UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                self.buttonsEnabled(Bool: true)
                //                    self.backgroundImageView.contentMode = .scaleAspectFit
                
                print("number, ", self.page47Phase)
                
                self.backgroundImageView.image = UIImage(named: "page47Blank")
                switch self.page47Phase {
                case 0:
                    self.drawingPageFirstSceneSetup()
                case 1:
                    self.drawingSceneAfterImageSelected()
                case 2:
                    self.canvas.alpha = 1
                    self.canvas.isHidden = false
                    self.backgroundImageView.image = self.drawingPageBackgroundImage
                    
                default:
                    self.drawingPageFirstSceneSetup()
                }
                
                
                
                
            }, completion: {(finished) in
                if self.page47Phase == 2 {
                    self.pageNumberLabelDisplay(label: label, pageNum: state)
                }
                self.grestureRecognizerSwitch(Bool: false)
                self.edgePan.isEnabled = true
                
            })
            
            
        case 48:
            firstPage48Task(completion: {(success) in
                if success == true {
                    
                    UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                        self.elementsEnteringStorage(state: state)
                        print("animation processed")
                    }, completion: nil)
                }
            })
            
            
        default:
            self.imageBackInPlace()
            UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                self.elementsEnteringStorage(state: state)
                print("animation processed")
                
                
            }, completion: {(finished) in
                self.pageNumberLabelDisplay(label: label, pageNum: state)
            })
        }
        
    }
    
    
    
    
    
    
    func animateBackgroundColor() {
        if #available(iOS 13.0, *) {
            backgroundColors = [UIColor.yellow, UIColor.green, UIColor.red, UIColor.orange, UIColor.blue, UIColor.systemIndigo, UIColor.purple]
        } else {
            // Fallback on earlier versions
            backgroundColors = [UIColor.yellow, UIColor.green, UIColor.red, UIColor.orange, UIColor.blue, UIColor.systemPink, UIColor.purple]
        }
        
        myVariable.timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: {_ in
            let randomNum = Int.random(in: 0...6)
            UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut], animations: { () -> Void in
                self.backgroundImageView.backgroundColor =  self.backgroundColors[randomNum];
               
            })

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let randomNum = Int.random(in: 0...6)
                UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut], animations: { () -> Void in
                    self.backgroundImageView.backgroundColor =  self.backgroundColors[randomNum];
                })

            }})
        
    }
    func pageNumberBackgroundDisplay (imageView: UIImageView, pageNum: Int) {
        
        
        switch myVariable.state {
        case 47:
            if self.page47Phase == 0 {
                imageView.backgroundColor = .white
                imageView.image = nil
            } else {
                imageView.image = self.drawingPageBackgroundImage
                imageView.backgroundColor = .clear
                
            }
            
        case 48:
            if UIDevice.current.userInterfaceIdiom == .pad {
                imageView.image = UIImage(named: "page48BackIPad")
            } else {
                if screenHeight / screenWidth < 0.50 {
                    imageView.image = UIImage(named: "page48BackIPhone896")
                } else {
                    imageView.image = UIImage(named: "page48BackIPhone736")
                }
            }
            
        default:
            imageView.image = UIImage(named: backgroundAtray[pageNum - 1])
            
            
            
            
        }
            
        
            
          
        
        

    }
    
    
    func firstPage48Task(completion: (_ success: Bool) -> Void) {
        self.pageNumberLabelDisplay(label: self.label, pageNum: myVariable.state)
        completion(true)
    }
    
    
   
    
}
