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
            self.showMoreStack.transform = .identity
            self.showMoreButton.alpha = 1
        })
        testingTextfield.placeholder = "Currently on page \(state)"
        UILabel.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut], animations: {
            //                label.alpha = 0
            //                self.label1.alpha = 0
        }, completion: { finished in
            self.labelTextDisappearing(label: label)
            self.imageDisappearing()
            UIImageView.transition(with: imageView, duration: 1.5, options: [.transitionCurlDown], animations: {
                self.pageNumberBackgroundDisplay(imageView: imageView, pageNum: state)
            }, completion: { finished in
                
                switch state{
                    
                    
                case 3,4,8,9,13,18,19,24,28,31,32,36,41:
                    self.pageNumberLabelDisplay(label: label, pageNum: state)
                    
                case 5:
                    self.orientationDetectorSwwitch(Bool: true)
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
                    
                    
                            
                            
                        default:
                            UIView.transition(with: self.image1, duration: 1.5, options:[.transitionFlipFromTop], animations: {
                                self.elementsEnteringStorage(state: state)}, completion: {(finished) in
                                    self.pageNumberLabelDisplay(label: label, pageNum: state)
                            })
                                }
                })
                
            })
            
    }
           
        
    func backgroundChangeForward(imageView: UIImageView, delay: TimeInterval, state: Int, label: UILabel) {
        grestureRecognizerSwitch(Bool: false)
        UIView.animate(withDuration: 0.5, animations: {
            self.showMoreStack.transform = .identity
            self.showMoreButton.alpha = 1
        })
        
        testingTextfield.placeholder = "Currently on page \(state)"
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
                self.orientationDetectorSwwitch(Bool: true)
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
    
    
    func pageNumberBackgroundDisplay (imageView: UIImageView, pageNum: Int) {
        imageView.image = UIImage(named: backgroundAtray[pageNum - 1])
        //            if let image = UIImage(named: backgroundAtray[pageNum - 1]){
        //                print("width ", image.size.width)
        //                print("height ", image.size.height)
        //                print(imageView.frame)
        //            }
    }
    
    
}
