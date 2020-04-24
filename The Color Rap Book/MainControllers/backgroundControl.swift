//
//  backgroundControl.swift
//  The Color Rap Book
//
//  Created by 7744 on 2/20/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit

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
                self.pageNumberBackgroundDisplay(imageView: imageView, pageNum: state)
            }, completion: { finished in
                
                switch state{
                    
                    
                case 3,4,8,9,13,18,19,24,28,31,32,36,41:
                    self.pageNumberLabelDisplay(label: label, pageNum: state)
                    
                case 5:
                    self.image1.contentMode = .scaleToFill
                    self.image2.contentMode = .scaleToFill
                    self.image3.contentMode = .scaleToFill
                    self.image6.contentMode = .scaleToFill
                    self.image7.contentMode = .scaleToFill
                    self.showMoreButton.layer.removeAllAnimations()
                    self.previousButton.layer.removeAllAnimations()
                    self.nextButton.layer.removeAllAnimations()
                    self.orientationDetectorSwwitch(Bool: true)
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
                    
                case 11:
                    UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                        self.elementsEnteringStorage(state: state)}, completion: {(finished) in
                            self.firstLabelTask(state: 11, completion: {(success) -> Void in
                                if success {
                                    self.imageRotate(imageview: self.image1, x: 0.79276, y: 1 - 0.1635, state: 11)
                                }})
                    })
                    
                    
                    
                case 12:
                    UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [.curveEaseIn], animations: {
                        self.elementsEnteringStorage(state: state)
                    }, completion: {(finished) in
                        self.pageNumberLabelDisplay(label: label, pageNum: state)
                    })
                    
                case 22:
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
                    
                case 45:
                    UIView.animate(withDuration: 1.5, delay: 0, options: [.transitionFlipFromTop], animations: {
                        
                        
                        
                        
                        
                        
                        }, completion: nil)
                    
                    
                    
                default:
                    UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                        self.elementsEnteringStorage(state: state)}, completion: {(finished) in
                            self.pageNumberLabelDisplay(label: label, pageNum: state)
                    })
            }
            
        })
        
    }
    
    
    func backgroundChangeForward(imageView: UIImageView, delay: TimeInterval, state: Int, label: UILabel) {
        grestureRecognizerSwitch(Bool: false)
        UIView.animate(withDuration: 0.5, animations: {
            //            self.showMoreStack.transform = .identity
            self.showMoreButton.alpha = 1
        })
        
        testingTextfield.placeholder = "Page \(state)"
        UIView.transition(with: imageView, duration: 1.5, options: [.transitionCurlUp], animations: {
            UIView.transition(with: label, duration: 1.5, options: [.transitionCurlUp], animations: {
                self.labelTextDisappearing(label: label)
                self.imageDisappearing()
            },completion: nil)
            self.pageNumberBackgroundDisplay(imageView: imageView, pageNum: state)
        }, completion: { finished in
            
            switch state{
                
                
            case 3,4,8,9,13,18,19,24,28,31,32,36,41:
                self.pageNumberLabelDisplay(label: label, pageNum: state)
                
            case 5:
                self.image1.contentMode = .scaleToFill
                self.image2.contentMode = .scaleToFill
                self.image3.contentMode = .scaleToFill
                self.image6.contentMode = .scaleToFill
                self.image7.contentMode = .scaleToFill
                self.showMoreButton.layer.removeAllAnimations()
                self.previousButton.layer.removeAllAnimations()
                self.nextButton.layer.removeAllAnimations()
                self.orientationDetectorSwwitch(Bool: true)
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
                
            case 22:
                //                self.imageSpecialCase22()
                UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                    self.elementsEnteringStorage(state: state)
                    print("animation processed")
                    
                    
                }, completion: {(finished) in
                    self.pageNumberLabelDisplay(label: label, pageNum: state)
                })
                
                
            case 45:
                UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                    self.elementsEnteringStorage(state: state)
                    self.canvas.alpha = 1
                                        self.canvas.isHidden = false
                    //                    self.view.addSubview(self.canvas)
                    //                    self.canvas.frame = self.view.frame
                                        self.canvas.backgroundColor = .clear
                    self.stackView.alpha = 1
                    print("stackposition, ",self.stackView.frame)
                    print("animation processed")
                    
                    
                }, completion: {(finished) in
                    self.pageNumberLabelDisplay(label: label, pageNum: state)
                    self.grestureRecognizerSwitch(Bool: false)
                    self.edgePan.isEnabled = true
                })
//                UIView.animate(withDuration: 1.5, delay: 0, options: [.transitionFlipFromTop], animations: {
//                    self.canvas.alpha = 1
//                    self.canvas.isHidden = false
////                    self.view.addSubview(self.canvas)
////                    self.canvas.frame = self.view.frame
//                    self.canvas.backgroundColor = .white
//                    self.buttonsEnabled(Bool: true)
//                    self.edgePan.isEnabled = true
////                    self.grestureRecognizerSwitch(Bool: true)
//                    
//                    
//                    
//                    })
                
                
            default:
                UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                    self.elementsEnteringStorage(state: state)
                    print("animation processed")
                    
                    
                }, completion: {(finished) in
                    self.pageNumberLabelDisplay(label: label, pageNum: state)
                })
            }
        })
    }
    
    
    
    
    
    
    
    
    func animateBackgroundColor () {
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
            UIView.transition(with: self.label, duration: 2, options: .transitionCrossDissolve, animations: {
                if randomNum <= 1 {
                                   self.label.textColor = .black
                               } else {
                                   self.label.textColor = .white
                               }
            }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let randomNum = Int.random(in: 0...6)
                UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut], animations: { () -> Void in
                    self.backgroundImageView.backgroundColor =  self.backgroundColors[randomNum];
                })
                UIView.transition(with: self.label, duration: 2, options: .transitionCrossDissolve, animations: {
                               if randomNum <= 1 {
                                                  self.label.textColor = .black
                                              } else {
                                                  self.label.textColor = .white
                                              }
                           }, completion: nil)
            }})
        
    }
    func pageNumberBackgroundDisplay (imageView: UIImageView, pageNum: Int) {
        if myVariable.state == 41 {
                backgroundImageView.backgroundColor = .clear
        }
        
        imageView.image = UIImage(named: backgroundAtray[pageNum - 1])
    }
    
    
}
