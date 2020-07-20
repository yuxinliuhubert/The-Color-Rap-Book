//
//  ElementStorage.swift
//  The Color Rap Book
//
//  Created by 7744 on 2/20/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit
import CoreMotion
import QuartzCore
import AVFoundation
//import ScratchCard

extension(DetailPageController) {
    
    
    //Functions that stores the animation
    
    func elementsEnteringStorage(state: Int) {
        //       imageBackInPlace()
        
        switch state {
            
        case 5:
            
            
            self.SpriteView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
//            view.addSubview(SpriteView)
            view.insertSubview(SpriteView, aboveSubview: image7)
            let treeHeight = screenHeight * 0.9
            let treeWidth = treeHeight * 0.568656
            self.image1.image = UIImage(named: "page5Tree")
            self.image1.frame = CGRect(x: screenWidth * 0.60, y: screenHeight * 0.03, width: treeWidth , height: treeHeight)
            self.image1.addShadow()
            
            
            
    
//             print("image 1 image after set up, ", self.image1.image)
            
            let cloudHeight = screenHeight * 0.2
            let leftCloudWidth = cloudHeight * 1.14
            UIView.animate(withDuration: 0.2, delay: 0.6, options: .curveEaseIn, animations: {
                self.image2.image = UIImage(named: "page5CloudLeft")
                self.image2.frame = CGRect(x: self.screenWidth * 0.18, y: self.screenHeight * 0.09, width: leftCloudWidth, height: cloudHeight)
                self.image2.addShadow()
            }, completion:nil)
            
            let rightCloudWidth = cloudHeight * 1.0952
            UIView.animate(withDuration: 0.2, delay: 0.9, options: .curveEaseIn, animations: {
                self.image3.image = UIImage(named: "page5CloudRight")
                self.image3.frame = CGRect(x: self.screenWidth * 0.40, y: self.screenHeight * 0.05, width: rightCloudWidth, height: cloudHeight)
                self.image3.addShadow()
            }, completion: nil)
            
            
            let sunHeight = screenHeight * 0.25
            let sunWidth = sunHeight * 0.9023
            UIView.animate(withDuration: 0.2, delay: 1.2, options: .curveEaseIn, animations: {
                self.image6.image = UIImage(named: "page5Sun")
                self.image6.frame = CGRect(x: 0, y: 0, width: sunWidth, height: sunHeight)
                self.image6.addShadow()
            }, completion: {(finished) in
                // Get node of object to move
            
                let scene = GKScene(fileNamed: "Page5Scene")
                                      
                                      // Get the SKScene from the loaded GKScene
                if let sceneNode = scene!.rootNode as! Page5Scene? {
                                          
                    // Copy gameplay related content over to the scene
//                    sceneNode.entities = scene!.entities
//                    sceneNode.graphs = scene!.graphs
                    
                    // Set the scale mode to scale to fit the window
                    sceneNode.scaleMode = .resizeFill
                    
                    // Present the scene
                    if let view = self.SpriteView as SKView? {
                            view.isHidden = false
                            view.alpha = 1
                            view.presentScene(sceneNode)
                            view.ignoresSiblingOrder = true
    
                    }
                }
                
                           

                self.imageFreeFall(imageView: self.image5, elasticity: 0.6)
                //            self.imageFloatingEffect(image1: nil, image2: self.image2, image3: self.image3, image4: self.image4, state: state)
            })
            
        case 6:
            self.image1.image = UIImage(named: "page6StopSign")
            self.image1.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
            self.image1.addShadow()
            imageFloatingEffect(image1: self.image1, image2: self.image2, image3: self.image3, image4: self.image4, image5: nil, state: state)
            //        imagePop(imageView: image1, state: state)
            //        self.imageFloatingEffect(image1: self.image1, image2: self.image2, image3: self.image3, image4: self.image4, state: self.state)
            
        case 7:
            self.image4.image = UIImage(named: "page7Basket")
            self.image4.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
            self.image4.addShadow()
            
            self.image2.image = UIImage(named: "page7MidStrawberries")
            self.image2.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
            self.image2.addShadow()
            print("image2Position", image2.frame)
            //            imageFreeFall(imageView: self.image2, elasticity: 0.5)
            
            UIView.animate(withDuration: 0.8, delay: 0.8, options: .curveEaseIn, animations: {
                self.image3.image = UIImage(named: "page7RightStrawberry")
                self.image3.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
                self.image3.addShadow()
            }, completion: {finished in
                self.imageRotate(imageview: self.image3, x: 0.79276, y: 1 - 0.1635, state: 7)
            })
            
            
            
            
        case 10:
            self.image1.image = UIImage(named: "page10Pie")
            self.image1.frame = CGRect(x: screenHeight * 0.13, y: screenHeight * 0.18, width: screenHeight * 0.74799, height: screenHeight * 0.76)
            self.image1.addShadow()
            UIView.animate(withDuration: 1.5, delay: 0.4, options: .curveEaseIn, animations: {
                self.image2.image = UIImage(named: "page10Sticker")
                self.image2.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
                self.image2.addShadow()
            }, completion: {(finished) in
                self.imageFloatingEffect(image1: self.image1, image2: self.image2, image3: self.image3, image4: self.image4, image5: nil, state: state)
            })
            
        case 11:
            self.image1.image = UIImage(named: "page11Hat")
            self.image1.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
            self.image1.addShadow()
            
            
        case 12:
            self.image6.image = UIImage(named: "page12CLoudLeft")
            self.image6.contentMode = .scaleToFill
            self.image6.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
            self.image6.addShadow()
            
            UIView.animate(withDuration: 1.5, delay: 0.4, options: .curveEaseIn, animations: {
                self.image2.image = UIImage(named: "page12CloudMidLeft")
                self.image2.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
                self.image2.addShadow()
            }, completion:nil)
            
            UIView.animate(withDuration: 1.5, delay: 0.8, options: .curveEaseIn, animations: {
                self.image3.image = UIImage(named: "page12CLoudMidRight")
                self.image3.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
                self.image3.addShadow()
            }, completion: nil)
            image7.contentMode = .scaleToFill
            
            UIView.animate(withDuration: 1.5, delay: 1.2, options: .curveEaseIn, animations: {
                self.image7.image = UIImage(named: "page12CLoudRight")
                self.image7.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
                self.image7.addShadow()
            }, completion: {(finished) in
                self.imageFloatingEffect(image1: self.image2, image2: self.image6, image3: self.image3, image4: self.image7, image5: nil, state: state)
            })
            
        case 14:
            self.image1.image = UIImage(named: "page14Sun")
            self.image1.frame = CGRect(x: screenWidth * 0.15, y: screenHeight * 0.03, width: screenHeight * 0.72, height: screenHeight * 0.72)
            self.image1.addShadow()
            image1.layer.zPosition = 2
            image6.contentMode = .scaleAspectFill
            UIView.animate(withDuration: 1.5, delay: 0.4, options: .curveEaseIn, animations: {
                self.image6.image = UIImage(named: "page14Clouds")
                self.image6.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
                self.image6.addShadow()
            }, completion: {_ in
                self.imageFloatingEffect(image1: self.image6, image2: self.image1, image3: nil, image4: nil, image5: nil, state: state)
            })
            
            
            
            
            
        case 15:
            self.image1.image = UIImage(named: "page15UnPeeledBanana")
            self.image1.frame = CGRect(x: screenWidth * 0.55, y: screenHeight * 0.2, width: screenHeight * 0.5324, height: screenHeight * 0.6)
            self.image1.addShadow()
            
            
        case 16:
            self.image1.image = UIImage(named:"page16CornLeft")
            let leftCornHeight = screenHeight * 0.5
            let leftCornWidth = leftCornHeight * (980/646)
//            self.image1.frame = CGRect(x: screenWidth * 0.005, y: screenHeight * 0.4, width: leftCornWidth , height: leftCornHeight)
            
            if UIDevice.current.userInterfaceIdiom == .phone {
                if self.screenHeight / self.screenWidth <= 0.47 {
                    self.image1.frame = CGRect(x: screenWidth * 0.10, y: screenHeight * 0.4, width: leftCornWidth , height: leftCornHeight)
                } else {
                    self.image1.frame = CGRect(x: screenWidth * 0.03, y: screenHeight * 0.4, width: leftCornWidth , height: leftCornHeight)
                }
            } else {
                self.image1.frame = CGRect(x: screenWidth * 0.005, y: screenHeight * 0.4, width: leftCornWidth , height: leftCornHeight)
            }
            
            let rightCornHeight = self.screenHeight * 0.77
            let rightCornWidth = rightCornHeight * (980/872)
            UIView.animate(withDuration: 1.5, delay: 0.8, options: .curveEaseIn, animations: {
                self.image5.image = UIImage(named: "page16CornRight")
                if UIDevice.current.userInterfaceIdiom == .phone {
                    if self.screenHeight / self.screenWidth <= 0.47 {
                       self.image5.frame = CGRect(x: self.screenWidth * 0.6, y: self.screenHeight * 0.10, width: rightCornWidth , height: rightCornHeight)
                    } else {
                        self.image5.frame = CGRect(x: self.screenWidth * 0.55, y: self.screenHeight * 0.10, width: rightCornWidth , height: rightCornHeight)
                    }
                } else {
                    self.image5.frame = CGRect(x: self.screenWidth * 0.4, y: self.screenHeight * 0.10, width: rightCornWidth , height: rightCornHeight)
                }
                
                
        
                

            }, completion: {_ in
                self.imageFloatingEffect(image1: self.image1, image2: self.image5, image3: nil, image4: nil, image5: nil, state: state)
            })
            
           
            
        case 17:
            let cageHeight = screenHeight * 0.79
            let cageWidth = cageHeight * 0.7511
            image2.image = UIImage(named: "page17Cage")
            //        image2.backgroundColor = .blue
            image2.frame = CGRect(x: screenWidth * 0.10, y: screenHeight * 0.21, width: cageWidth, height: cageHeight)
            image2.removeShadow()
//            image2.addShadow()
            
            let birdHeight = screenHeight * 0.36
            let birdWidth = birdHeight * 0.5922
            let wingHeight = screenHeight * 0.08
            let wingWidth = wingHeight * 1.291
            let lowerBeakHeight = screenHeight * 0.032
            let lowerBeakWidth = lowerBeakHeight * 0.942
            let upperBeakHeight = screenHeight * 0.04
            let upperBeakWidth = upperBeakHeight * 0.9366
            UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseIn, animations: {
                self.image1.image = UIImage(named: "page17Bird")
                self.image3.image = UIImage(named: "page17Wing")
                self.image4.image = UIImage(named: "page17LowerBeak")
                self.image6.image = UIImage(named: "page17UpperBeak")
                //                        self.image1.backgroundColor = .red
                if UIDevice.current.userInterfaceIdiom == .phone {
                    self.image1.frame = CGRect(x: self.screenWidth * 0.19, y: self.screenHeight * 0.4, width: birdWidth, height: birdHeight)
                    self.image3.frame = CGRect(x: self.screenWidth * 0.225, y: self.screenHeight * 0.58, width: wingWidth, height: wingHeight)
                    
                    if self.screenHeight / self.screenWidth <= 0.47 {
                        self.image4.frame = CGRect(x: self.screenWidth * 0.289, y: self.screenHeight * 0.51, width: lowerBeakWidth, height: lowerBeakHeight)
                        self.image6.frame = CGRect(x: self.screenWidth * 0.287, y: self.screenHeight * 0.46, width: upperBeakWidth, height: upperBeakHeight)
                    } else {
                        self.image4.frame = CGRect(x: self.screenWidth * 0.309, y: self.screenHeight * 0.51, width: lowerBeakWidth, height: lowerBeakHeight)
                        self.image6.frame = CGRect(x: self.screenWidth * 0.307, y: self.screenHeight * 0.46, width: upperBeakWidth, height: upperBeakHeight)
                    }
                } else {
                    self.image1.frame = CGRect(x: self.screenWidth * 0.21, y: self.screenHeight * 0.4, width: birdWidth, height: birdHeight)
                    self.image3.frame = CGRect(x: self.screenWidth * 0.26, y: self.screenHeight * 0.58, width: wingWidth, height: wingHeight)
                    self.image4.frame = CGRect(x: self.screenWidth * 0.368, y: self.screenHeight * 0.51, width: lowerBeakWidth, height: lowerBeakHeight)
                    self.image6.frame = CGRect(x: self.screenWidth * 0.366, y: self.screenHeight * 0.46, width: upperBeakWidth, height: upperBeakHeight)
                }
                
                
//                self.image1.removeShadow()
                self.image3.removeShadow()
//                self.image4.removeShadow()
                self.image6.removeShadow()
                
                self.image1.addShadow()
//                self.image3.addShadow()
//                self.image4.addShadow()
                

                
            }, completion: {(finished) in
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(tapGestureRecognizer:)))
                self.image1.isUserInteractionEnabled = true
                self.image1.addGestureRecognizer(tapGestureRecognizer)
                self.imageFloatingEffect(image1: self.image4, image2: self.image6, image3: nil, image4: nil, image5: nil, state: 17)
                
                
            })
            
            
            
            
        case 20:
            image3.image = UIImage(named: "page20Leaf")
            image3.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
            image3.addShadow()
            UIView.animate(withDuration: 1.5, delay: 0.4, options: .curveEaseIn, animations: {
                self.image5.image = UIImage(named: "page20Frog")
                print("image 5 frame, ",self.image5.frame)
                self.image5.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
//                let tapTheFrog = UITapGestureRecognizer(target: self, action: #selector(self.leftSwipeHandler))
//                self.image5.addGestureRecognizer(tapTheFrog)
                self.image5.addShadow()
            }, completion: {(finished) in
                self.frogCallSound(stop: false)
                //            self.view.isUserInteractionEnabled = true
                //            self.image5.isUserInteractionEnabled = true
                self.imageFloatingEffect(image1: self.label1, image2: self.image5, image3: nil, image4: self.image3, image5: nil, state: state)
                
            })
            
        case 21:
            image6.image = UIImage(named: "page21Leaf")
            let leafHeight = screenHeight * 0.55
            let leafWidth = leafHeight * (1024/1055)
            image6.frame = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.35, width: leafWidth, height: leafHeight)
            image6.addShadow()
            UIView.animate(withDuration: 1.5, delay: 0.4, options: .transitionFlipFromTop, animations: {
                let treeHeight = self.screenHeight * 0.80
                let treeWidth = treeHeight * (1024/1512)
                self.image5.image = UIImage(named: "page21Tree")
                self.image5.frame = CGRect(x: self.screenWidth * 0.55, y: self.screenHeight * 0.07, width: treeWidth, height: treeHeight)
                self.image5.addShadow()
            }, completion: {(finished) in
                self.imageFloatingEffect(image1: self.image6, image2: nil, image3: self.image5, image4: nil, image5: nil, state: state)
                
            })
            
            
            
            
        case 22:
            self.image5.transform = .identity
            image1.image = UIImage(named: "page22Mower")
            image1.frame = CGRect(x: 0, y: screenHeight * 0.55, width: screenWidth * 0.25, height: screenWidth * 0.185)
            image1.isUserInteractionEnabled = true
            self.image1.layer.zPosition = 1
            image1.addShadow()
            let panGesture = CustomPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
            panGesture.object = self.image1
            panGesture.page = 22
            image1.addGestureRecognizer(panGesture)
            
            
            
            image2.image = UIImage(named: "page22Grass3")
            image2.frame = CGRect(x: screenWidth * 0.323, y: screenHeight * 0.77, width: screenWidth * 0.06, height: screenHeight * 0.08)
            image2.addCustomImagePopShadow(radius: 50)
            
            image3.image = UIImage(named: "page22Grass1")
            let grassWidth = screenWidth * 0.06
            image3.frame = CGRect(x: screenWidth * 0.0525, y: screenHeight * 0.848, width: grassWidth, height: grassWidth * 1.089)
            
            image4.image = UIImage(named: "page22Grass2")
            image4.frame = CGRect(x: screenWidth * 0.155, y: screenHeight * 0.68, width: grassWidth, height: grassWidth * 0.79255)
            
            
            
            image5.image = UIImage(named: "page22Grass4")
            image5.frame = CGRect(x: screenWidth * 0.49, y: screenHeight * 0.85, width: grassWidth, height: grassWidth * 0.941799)
            
            
            
            image6.image = UIImage(named: "page22Grass5")
            image6.frame = CGRect(x: screenWidth * 0.65, y: screenHeight * 0.83, width: grassWidth, height: grassWidth * 1.3054)
            
            image7.image = UIImage(named: "page22Grass6")
            image7.frame = CGRect(x: screenWidth * 0.82, y: screenHeight * 0.73, width: grassWidth, height: grassWidth * 1.203)
            
            panGesture.page22ImageFrameArray = [self.image2.frame, self.image3.frame, self.image4.frame, self.image5.frame, self.image6.frame, self.image7.frame]
            
            
            
        case 23:
            page23Phase = 0
            image5.image = UIImage(named: "page23Light")
            let lightHeight = screenHeight * 0.6
            let lightWidth = lightHeight * (1024.0/1170.0)
            image5.frame = CGRect(x: 0, y: screenHeight * 0.15, width: lightWidth, height: lightHeight)
            image5.addShadow()
            image5.center = view.convert(view.center, from: view)
            
            
            
        case 25:
            image5.image = UIImage(named: "page25Tree")
            let treeHeight = screenHeight * 0.70
            let treeWidth = treeHeight * (980.0/1379.0)
            image5.frame = CGRect(x: screenWidth * 0.05, y: screenHeight * 0.23, width: treeWidth, height: treeHeight)
            image5.addShadow()
            
            self.image6.alpha = 0
            UIView.animate(withDuration: 1.5, delay: 1.0, options: .transitionFlipFromTop, animations: {
                self.image6.image = UIImage(named: "page25LeafOnFloor")
                let leafHeight = self.screenHeight * 0.25
                let leafWidth = leafHeight * (273/311)
                self.image6.frame = CGRect(x: self.screenWidth * 0.21, y: self.screenHeight * 0.40, width: leafWidth, height: leafHeight)
//                self.image6.addShadow()
            }, completion: {(finished) in
                self.imageFloatingEffect(image1: self.image6, image2: nil, image3: self.image5, image4: nil, image5: nil, state: state)
                
            })
            
            
            
            
        case 26:
            let pumpkinProportion = screenHeight * 0.65
            image1.image = UIImage(named: "page26Pumpkin")
            image1.frame = CGRect(x: screenWidth * 0.08, y: screenHeight * 0.30, width: pumpkinProportion * 0.9596, height: pumpkinProportion)
            image5.image = UIImage(named: "page26Face")
            image5.frame = CGRect(x: screenWidth * 0.08, y: screenHeight * 0.30, width: pumpkinProportion * 0.9596, height: pumpkinProportion)
            if myVariable.state == 26 {
                UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseInOut], animations: {
                    self.image5.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                }){_ in
                    UIView.animateKeyframes(withDuration: 1.0, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                        self.image5.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                    })}}
            
            
            
        case 27:
            let orangeHeight = screenHeight * 0.45
            let orangeWidth = orangeHeight * (1024.0/906.0)
            image1.image = UIImage(named: "page27Orange")
            if self.screenHeight / self.screenWidth <= 0.47 {
                  image1.frame = CGRect(x: screenWidth * 0.65, y: screenHeight * 0.4, width: orangeWidth, height: orangeHeight)
            } else {
            image1.frame = CGRect(x: screenWidth * 0.50, y: screenHeight * 0.4, width: orangeWidth, height: orangeHeight)
            }
            image1.addShadow()
            imageFloatingEffect(image1: self.image1, image2: nil, image3: nil, image4: nil, image5: nil, state: state)
            
            
            
        case 29:
            let grapeHeight = screenHeight * 0.48
            let grapeWidth = grapeHeight * (1039.0/1461.0)
            image1.image = UIImage(named: "page29Grapes")
            if self.screenHeight / self.screenWidth <= 0.47 {
                self.image1.frame = CGRect(x: screenWidth * 0.16, y: screenHeight * 0.32, width: grapeWidth , height: grapeHeight)
            } else {
                image1.frame = CGRect(x: screenHeight * 0.1, y: screenHeight * 0.32, width: grapeWidth, height: grapeHeight)
            }
            UIView.animate(withDuration: 1.5, delay: 1.0, options: .transitionFlipFromTop, animations: {
                self.image5.image = UIImage(named: "page29Bottle")
                let bottleHeight = self.screenHeight * 0.46
                let bottleWidth = bottleHeight * (980/1256)
                self.image5.frame = CGRect(x: self.screenWidth * 0.7, y: self.screenHeight * 0.33, width: bottleWidth, height: bottleHeight)
                //                self.image6.addShadow()
            }, completion: {(finished) in
                self.imageFloatingEffect(image1: self.image1, image2: nil, image3: self.image5, image4: nil, image5: nil, state: state)
                
            })
            
        case 30:
//            page30ScratchCard.alpha = 1
            let breadHeight = screenHeight * 0.60
            let breadWidth = breadHeight * (980.0/973.0)
            image4.image = UIImage(named: "page30NoJelly")
            image4.frame = CGRect(x: screenWidth * 0.15, y: screenHeight * 0.25, width: breadWidth, height: breadHeight)
//            let page30PanGesture = UISwipeGestureRecognizer(target: self, action: #selector(page30ScratchForJelly(gesture:)))
//            page30PanGesture.direction = [.down, .up, .left, .right]
//            image4.addGestureRecognizer(page30PanGesture)
            
            
        case 33:
            let mudHeight = screenHeight * 0.25
            let mudWidth = mudHeight * (980/412)
            image1.image = UIImage(named: "page33Mud")
            image1.frame = CGRect(x: screenWidth * 0.5, y: screenHeight * 0.73, width: mudWidth, height: mudHeight)
            
            
            
        case 34:
            let plateHeight = screenHeight * 0.7
            let plateWidth = plateHeight * (980/897)
            image1.image = UIImage(named: "page34Plate")
            image1.frame = CGRect(x: screenWidth * 0.10, y: screenHeight * 0.25, width: plateWidth, height: plateHeight)
        
//            print("page34supposeframe,", CGRect(x: screenWidth * 0.10, y: screenHeight * 0.25, width: plateWidth, height: plateHeight))
//            print("page34actualframe,", image1.frame)
            
            UIView.animate(withDuration: 1.5, delay: 0.5, options: .transitionFlipFromTop, animations: {
                self.image6.image = UIImage(named: "page34Brownies")
                let browniesHeight = self.screenHeight * 0.65
                let browniesWidth = browniesHeight * (980/736)
                self.image6.frame = CGRect(x: self.screenWidth * 0.7, y: self.screenHeight * 0.33, width: browniesWidth, height: browniesHeight)
//                print("image1 center", self.image1.center)
                self.image6.center = self.image1.center
//                print
                //                self.image6.addShadow()
            }, completion: {(finished) in
                self.imageFloatingEffect(image1: self.image1, image2: nil, image3: self.image6, image4: nil, image5: nil, state: state)
                
            })
            
            
        case 35:
            self.image1.image = UIImage(named: "page35Chocolate")
            self.image1.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
            self.image1.addShadow()
            self.image5.image = UIImage(named: "page35Bite")
            self.image5.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
            self.image5.addShadow()
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(tapGestureRecognizer:)))
            self.image1.isUserInteractionEnabled = true
            self.image1.addGestureRecognizer(tapGestureRecognizer)
            let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.imagePop(longPress:)))
            self.image1.addGestureRecognizer(longPressRecognizer)
            imageFloatingEffect(image1: label1, image2: image2, image3: image3, image4: image4, image5: nil, state: state)
            
        case 37:
            let bootHeight = screenHeight * 0.5
            let bootWidth = bootHeight * (980.0/1125.0)
            image1.image = UIImage(named: "page37LeftBoot")
            image5.image = UIImage(named: "page37RightBoot")
            image1.frame = CGRect(x: screenWidth * 0.15, y: screenHeight * 0.25, width: bootWidth, height: bootHeight)
            image5.frame = CGRect(x: screenWidth * 0.6, y: screenHeight * 0.25, width: bootWidth, height: bootHeight)
            image1.center = CGPoint(x: screenWidth * 0.5 - bootWidth / 2 - 30, y: screenHeight * 0.25 + bootHeight / 2)
            image5.center = CGPoint(x: screenWidth * 0.5 + bootWidth / 2 + 30, y: screenHeight * 0.25 + bootHeight / 2)

            
        case 38:
            let hatHeight = screenHeight * 0.5
            let hatWidth = hatHeight * (980/763)
            image1.image = UIImage(named: "page38Hat")
            image1.frame = CGRect(x: screenWidth * 0.10, y: screenHeight * 0.40, width: hatWidth, height: hatHeight)
            
        case 39:
            let bigBatsHeight = screenHeight * 0.4
            let bigBatsWidth = bigBatsHeight * (980/572)
            image2.image = UIImage(named: "page39BigBats")
            if screenHeight / screenWidth <= 0.47 {
                 image2.frame = CGRect(x: screenWidth * 0.25, y: screenHeight * 0.2, width: bigBatsWidth, height: bigBatsHeight)
            } else {
            image2.frame = CGRect(x: screenWidth * 0.18, y: screenHeight * 0.2, width: bigBatsWidth, height: bigBatsHeight)
            }
            image2.addShadow()
            
            UIView.animate(withDuration: 1.5, delay: 1.0, options: .transitionFlipFromTop, animations: {
                let smallBatsHeight = self.screenHeight * 0.32
                let smallBatsWidth = smallBatsHeight * (650.0/883.0)
                 self.image6.image = UIImage(named: "page39SmallBats")
                self.image6.frame = CGRect(x: self.screenWidth * 0.74, y: self.screenHeight * 0.37, width: smallBatsWidth, height: smallBatsHeight)
                self.image6.addShadow()
            }, completion: {(finished) in
                let catHeight = self.screenHeight * 0.14
                let catWidth = catHeight * (956.0/474.0)
                 self.image3.image = UIImage(named: "page38CatLookR")
                self.image3.frame = CGRect(x: -self.screenWidth * 0.20 , y: self.screenHeight * 0.22, width: catWidth, height: catHeight)
                self.soundPlay(forResource: "page38WitchSound", ofType: "m4a")
                UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: .calculationModeCubic, animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3, animations: {
                        self.image3.frame = CGRect(x: 0 , y: self.screenHeight * 0.22, width: catWidth, height: catHeight)
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                        self.image3.frame = CGRect(x: self.screenWidth * 0.1 , y: self.screenHeight * 0.46, width: catWidth, height: catHeight)
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.9, animations: {
                        self.image3.frame = CGRect(x: self.screenWidth
                            * 0.2, y: self.screenHeight, width: catWidth, height: catHeight)
                    })
                }, completion: {(finished) in
                    self.image3.image = nil
                    UIView.animate(withDuration: 1.5, delay: 0.5, options: .transitionFlipFromTop, animations: {
                        self.image5.image = UIImage(named: "page39Cat")
                        let catHeight = self.screenHeight * 0.32
                        let catWidth = catHeight * (980.0/881.0)
//                        if self.screenHeight / screenWidth <= 0.47 {
//
//                        }
                        self.image5.frame = CGRect(x: self.screenWidth * 0.10, y: self.screenHeight * 0.63, width: catWidth, height: catHeight)
                        self.image5.addShadow()
                    }, completion: {(finished) in
                        self.imageFloatingEffect(image1: self.image2, image2: nil, image3: self.image6, image4: nil, image5: self.image5, state: state)
                        
                    })
                })
                
            })
            
        case 42:
            let snowMidHeight = screenHeight * 0.4
            let snowMidWidth = snowMidHeight * (1196.0/1095.0)
            image2.image = UIImage(named: "page42SnowMid")
            image2.frame = CGRect(x: 0, y: 0, width: snowMidWidth, height: snowMidHeight)
            image2.center = CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.5)
            image2.addShadow()
            
            let snowLeftHeight = screenHeight * 0.3
            let snowLeftWidth = snowLeftHeight * (852.0/776.0)
            UIView.animate(withDuration: 1.5, delay: 0.3, options: .transitionFlipFromTop, animations: {
                self.image1.image = UIImage(named: "page42SnowLeft")
                self.image1.frame = CGRect(x: 0, y: 0, width: snowLeftWidth, height: snowLeftHeight)
//                self.image1.center = CGPoint(x: self.screenWidth * 0.5 - (snowMidWidth + snowLeftWidth) / 2.0, y: self.screenHeight * 0.75)
                self.image1.center = CGPoint(x: self.screenWidth * 0.15, y: self.screenHeight * 0.75)
            }, completion: nil)
            
            let snowRightHeight = screenHeight * 0.3
            let snowRightWidth = snowRightHeight * (892.0/911.0)
            UIView.animate(withDuration: 1.5, delay: 0.6, options: .transitionFlipFromTop, animations: {
                self.image3.image = UIImage(named: "page42SnowRight")
                self.image3.frame = CGRect(x: 0, y: 0, width: snowRightWidth, height: snowRightHeight)
//                self.image3.center = CGPoint(x: self.screenWidth * 0.5 + (snowMidWidth + snowRightWidth) / 2.0, y: self.screenHeight * 0.25)
                self.image3.center = CGPoint(x: self.screenWidth * 0.85, y: self.screenHeight * 0.25)
            }, completion: { _ in
                
                self.imageFloatingEffect(image1: self.image2, image2: nil, image3: self.image3, image4: nil, image5: self.image1, state: 42)
            })
            
            
        case 43:
            let lighthouseWidth = screenWidth * 0.35
            let lighthouseHeight = lighthouseWidth * (1028.0/980.0)
            image5.image = UIImage(named: "page43Lighthouse")
            image5.frame = CGRect(x: 0, y: screenHeight - lighthouseHeight, width: lighthouseWidth, height: lighthouseHeight)
            
            let beamWidth = screenWidth * 0.25
            let beamHeight = beamWidth * (985.0/980)
            image1.alpha = 0
//            image1.backgroundColor = .blue
            image1.image = UIImage(named: "page43Beam")
             image1.frame = CGRect(x: screenWidth * 0.182, y: screenHeight * 1.05 - lighthouseHeight , width: beamWidth, height: beamHeight)
             UIView.animate(withDuration: 1.5, delay: 0.6, options: .transitionFlipFromTop, animations: {
                self.image1.alpha = 1
                        }, completion: { _ in
                            self.imageRotate(imageview: self.image1, x: 0.05, y: 0.16, state: 43)
//                            self.imageRotate(imageview: self.image1, x: 0, y: 0, state: 43)
                        })
           
            
        case 44:
            let dressHeight = screenHeight * 0.55
            let dressWidth = dressHeight * (980.0/1201.0)
            image3.image = UIImage(named: "page44Dress")
            image3.frame = CGRect(x: screenWidth * 0.6, y: screenHeight * 0.35, width: dressWidth, height: dressHeight)

        case 45:
            let ghostWidth = screenWidth * 0.3
            let ghostHeight = ghostWidth * (842.0/980.0)
//             image4.image = UIImage(named: "page45Ghost")
            image4.frame = CGRect(x: screenWidth, y: screenHeight * 0.40, width: ghostWidth, height: ghostHeight)
            

            //            The ghost's translation is in the background section
           
            
            
            
        case 48:
            self.lastPageButtonStack.anchorCenterXToSuperview()
            self.lastPageButtonStack.anchorCenterYToSuperview(constant: screenHeight * 0.3)
            self.lastPageButtonStack.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.6).isActive = true
            self.lastPageButtonStack.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2).isActive = true
            self.lastPageButtonStack.alpha = 1

            
           
            
            
//            self.lastPageButtonStack.backgroundColor = .blue
          
            
            
        default:
            self.image1.image = nil
            self.image2.image = nil
            self.image3.image = nil
            self.image4.image = nil
            self.image5.image = nil
            self.image6.image = nil
            self.image7.image = nil
            break;
            
        }
    }
    
    
    
    
    func imageDisappearing() {
        myVariable.timer.invalidate()
        myVariable.backgroundPlayer?.play()
//        print("MyVariable.timer, ", myVariable.timer)
//        myVariable.timer = nil
        UIImageView.animate(withDuration:  1.0, delay: 0, options: [.curveEaseInOut], animations: {
            //                    The grass images needs to be back in place without going to the top of the screen
            
            switch myVariable.state{
            case 4,6:
                self.imageSpecialCase5()
                
            case 16,17,18,21,22,23:
                self.imageSpecialCase22()
                
            default:
                self.imageBackInPlace()
            }
//            self.backgroundImageView.layer.removeAllAnimations()
            self.view.layer.removeAllAnimations()

//            self.frogCallSound(stop: true)
            self.page5Delegate?.dismissPage5Scene()
            self.scene?.dismissPage5Scene()
            self.previousButton.alpha = 0
            self.nextButton.alpha = 0
            self.showMoreButton.alpha = 0
            self.startButton.alpha = 0
            self.noPictureButton.alpha = 0
            self.lastPageButtonStack.alpha = 0
//            self.label.removeConstraints(self.label.constraints)

                self.canvas.alpha = 0
                self.canvas.isHidden = true
            
            self.startButton.isEnabled = false
            self.colorSlider.alpha = 0
            self.drawingToolPanel.alpha = 0
            self.SpriteView.alpha = 0
            self.page23LightLayer.opacity = 0
    
        }, completion: { (finished) in
            self.startButton.removeTarget(self, action: #selector(self.startButtonTap), for: .touchUpInside)
            self.image1.image = nil
            self.image2.image = nil
            self.image3.image = nil
            self.image4.image = nil
            self.image5.image = nil
            self.image6.image = nil
            self.image7.image = nil
            self.image1.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            self.image2.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            self.image3.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            self.image4.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            self.image5.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            self.image6.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            self.image7.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            self.label1.layer.removeAllAnimations()
            self.image5.layer.removeAllAnimations()
            self.backgroundImageView.layer.removeAllAnimations()
            //            self.backgroundImageView.contentMode = .scaleAspectFill
            self.image1.contentMode = .scaleAspectFit
            self.image2.contentMode = .scaleAspectFit
            self.image3.contentMode = .scaleAspectFit
            self.image4.contentMode = .scaleAspectFit
            self.image5.contentMode = .scaleAspectFit
            self.image6.contentMode = .scaleAspectFit
            self.SpriteView.isHidden = true
//            self.SpriteView.frame = CGRect(x: 0, y: self.screenHeight * 2, width: self.screenWidth, height: self.screenHeight)
    
            
            self.SpriteView.scene?.isPaused = true
            self.SpriteView.scene?.removeFromParent()
            self.SpriteView.removeFromSuperview()
            Motion.instance.motionManager.stopAccelerometerUpdates()

//            self.page30ScratchCard = ScratchUIView(frame: CGRect(x: -self.screenWidth, y: 0, width: 0, height: 0), Coupon: "", MaskImage: "", ScratchWidth: 0)
                


        })
        
        
    }
    
    
    func imageBackInPlace() {
        image1.transform = .identity
             image2.transform = .identity
             image3.transform = .identity
             image4.transform = .identity
             image5.transform = .identity
             image6.transform = .identity
             image7.transform = .identity
        
        image1.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
        image2.frame = CGRect(x: 0, y: -screenHeight, width: screenWidth, height: screenHeight)
        image3.frame = CGRect(x: 0, y: -screenHeight, width: screenWidth, height: screenHeight)
        image4.frame = CGRect(x: -screenWidth, y: 0, width: screenWidth, height: screenHeight)
        image5.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
        image6.frame = CGRect(x: 0, y: -screenHeight, width: screenWidth, height: screenHeight)
        image7.frame = CGRect(x: 0, y: -screenHeight, width: screenWidth, height: screenHeight)
//        page30ScratchCard.frame = CGRect(x: -screenWidth, y: 0, width: screenWidth, height: screenHeight)
//        image1.transform = .identity
//        image2.transform = .identity
//        image3.transform = .identity
//        image4.transform = .identity
//        image5.transform = .identity
//        image6.transform = .identity
//        image7.transform = .identity
//        page30ScratchCard.transform = .identity
        image1.layer.zPosition = 0
        if let recognizers = image1.gestureRecognizers {
            for recognizer in recognizers {
                image1.removeGestureRecognizer(recognizer as UIGestureRecognizer)
            }
        }
        if let recognizers = image4.gestureRecognizers {
            for recognizer in recognizers {
                image4.removeGestureRecognizer(recognizer as UIGestureRecognizer)
            }
        }
        if let recognizers = image5.gestureRecognizers {
            for recognizer in recognizers {
                image5.removeGestureRecognizer(recognizer as UIGestureRecognizer)
            }
        }
        image1.alpha = 1
        image2.alpha = 1
        image3.alpha = 1
        image4.alpha = 1
        image5.alpha = 1
        image6.alpha = 1
        image7.alpha = 1
        image2.removeShadow()
        label1.transform = .identity
        myVariable.timer.invalidate()
        
    }
    
    
    func imageSpecialCase5() {
        let cloudHeight = self.screenHeight * 0.2
        let leftCloudWidth = cloudHeight * 1.14
        let rightCloudWidth = cloudHeight * 1.0952
        let sunHeight = screenHeight * 0.25
        let sunWidth = sunHeight * 0.9023
        image1.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
        image2.frame = CGRect(x: self.screenWidth * 0.18, y: -cloudHeight * 2, width: leftCloudWidth, height: cloudHeight)
        image3.frame = CGRect(x: self.screenWidth * 0.40, y: -cloudHeight * 2, width: rightCloudWidth, height: cloudHeight)
        image5.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
        image6.frame = CGRect(x: 0, y: -sunHeight * 2, width: sunWidth, height: sunHeight)
        image7.frame = CGRect(x: 0, y: -screenHeight, width: screenWidth, height: screenHeight)
//        page30ScratchCard.frame = CGRect(x: -screenWidth, y: 0, width: screenWidth, height: screenHeight)
        image1.transform = .identity
        image2.transform = .identity
        image3.transform = .identity
        image4.transform = .identity
        image5.transform = .identity
        image6.transform = .identity
        image7.transform = .identity
//        page30ScratchCard.transform = .identity
        image1.layer.zPosition = 0
        if let recognizers = image1.gestureRecognizers {
            for recognizer in recognizers {
                image1.removeGestureRecognizer(recognizer as UIGestureRecognizer)
            }
        }
        if let recognizers = image4.gestureRecognizers {
                   for recognizer in recognizers {
                       image4.removeGestureRecognizer(recognizer as UIGestureRecognizer)
                   }
               }
        if let recognizers = image5.gestureRecognizers {
            for recognizer in recognizers {
                image5.removeGestureRecognizer(recognizer as UIGestureRecognizer)
            }
        }
        image1.alpha = 1
        image2.alpha = 1
        image3.alpha = 1
        image4.alpha = 1
        image5.alpha = 1
        image6.alpha = 1
        image7.alpha = 1
        image2.removeShadow()
        label1.transform = .identity
        myVariable.timer.invalidate()
    }
    
    
    func imageSpecialCase22() {
        image1.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
        image2.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
        image3.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
        image4.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
        image5.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
        image6.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
        image7.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
//        page30ScratchCard.frame = CGRect(x: -screenWidth, y: 0, width: screenWidth, height: screenHeight)
        image1.transform = .identity
        image2.transform = .identity
        image3.transform = .identity
        image4.transform = .identity
        image5.transform = .identity
        image6.transform = .identity
        image7.transform = .identity
        label1.transform = .identity
//        page30ScratchCard.transform = .identity
        image1.alpha = 1
        image2.alpha = 1
        image3.alpha = 1
        image4.alpha = 1
        image5.alpha = 1
        image6.alpha = 1
        image7.alpha = 1
        image1.layer.zPosition = 0
        if let recognizers = image1.gestureRecognizers {
            for recognizer in recognizers {
                image1.removeGestureRecognizer(recognizer as UIGestureRecognizer)
            }
        }
        if let recognizers = image4.gestureRecognizers {
                   for recognizer in recognizers {
                       image4.removeGestureRecognizer(recognizer as UIGestureRecognizer)
                   }
               }
        if let recognizers = image5.gestureRecognizers {
                   for recognizer in recognizers {
                       image5.removeGestureRecognizer(recognizer as UIGestureRecognizer)
                   }
               }
  
        myVariable.timer.invalidate()
    }
    
    
    @objc func imagePop(longPress: UILongPressGestureRecognizer) {
        if longPress.state == .began {
            self.image1.frame = CGRect(x: -screenWidth * 0.05, y: -screenHeight * 0.05, width: screenWidth * 1.1, height: screenHeight * 1.1)
            self.image5.frame = CGRect(x: -screenWidth * 0.05, y: -screenHeight * 0.05, width: screenWidth * 1.1, height: screenHeight * 1.1)
            self.image1.addImagePopShadow()
            
            
        } else if longPress.state == .ended || longPress.state == .cancelled || longPress.state == .failed {
            self.image1.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
            self.image1.addShadow()
            self.image5.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
            self.image5.addShadow()
        }
        
    }
    
    
    
    func imageFreeFall(imageView: UIImageView, elasticity: CGFloat) {
        self.SpriteView.isHidden = false
    }
    
    
    func drawTestCircle(center: CGPoint) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.screenWidth * center.x, y: self.screenHeight * center.y), radius: CGFloat(20), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.red.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.red.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        
        self.view.layer.addSublayer(shapeLayer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        //        let tappedImage = tapGestureRecognizer.view as! UIImageView
        switch myVariable.state {
            
        case 17:
            self.soundPlay(forResource: "birdChirping", ofType: "m4a")
            self.imageRotate(imageview: image3, x: 0.8, y: 0.2, state: 17)
            let notes = ["♩♪♫♩♫♪♫♬", "♬♫♩♩♪♫♬♬", "♫♪♩♬♫♩♯♩♫"]
            label1.text = notes.randomElement()
            label1.numberOfLines = 1

        case 35:
//                    let testImage = UIImageView(frame: CGRect(x: screenWidth * 0.07, y: screenHeight * 0.54, width: screenWidth * 0.46, height: screenHeight * 0.29))
            //        testImage.backgroundColor = .red
            //        testImage.alpha = 0.3
            //        self.view.addSubview(testImage)
            if ((position.x >= screenWidth * 0.07 && position.x <= screenWidth * 0.53) && (position.y >= screenHeight * 0.54 && position.y <= screenHeight * 0.83)){
                
                print("image5shoulddisappear")
                if self.image5.alpha == 1 {
                    self.image5.alpha = 0
                } else if self.image5.alpha == 0 {
                    self.image5.alpha = 1
                }
                
            }
        default:
            break;
        }
        
    }
    
    
}


extension (UIViewController) {
    
    
    
    
    
    func imageRotate(imageview: UIView, x: CGFloat, y: CGFloat, state: Int) {
        
        let anchorPoint = CGPoint(x: x, y: y)
        let oldAnchorPoint = imageview.layer.anchorPoint
//        print("old anchor point ", oldAnchorPoint)
//        print("anchorPoint ", anchorPoint)
        //        print("omage original point", imageview.frame.origin)
        let offsetFromMovingAnchorPointsX = anchorPoint.x - oldAnchorPoint.x
        let offsetFromMovingAnchorPointsY = anchorPoint.y - oldAnchorPoint.y
        
         imageview.layer.anchorPoint = anchorPoint
                imageview.transform = imageview.transform.translatedBy(x: offsetFromMovingAnchorPointsX * imageview.bounds.width, y: offsetFromMovingAnchorPointsY * imageview.bounds.height)
        print("CGRect ", imageview.bounds)

        
        print("CGRect ", imageview.frame)
        switch state {
        case 7:
            UIImageView.animateKeyframes(withDuration: 1.5, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                imageview.transform = imageview.transform.rotated(by: .pi / 16)})
        case 10:
            myVariable.timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: {_ in
                imageview.transform = imageview.transform.rotated(by: .pi / 12)})
        case 11:
            myVariable.timer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true, block: {_ in
                imageview.transform = imageview.transform.rotated(by: .pi / 12)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    imageview.transform = imageview.transform.rotated(by: -.pi / 12)
                }
                
            })
            
        case 17:
            UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
                imageview.transform = imageview.transform.rotated(by: .pi / 4)
            }){_ in
                UIView.animateKeyframes(withDuration: 0.1, delay: 0.15, options: [.autoreverse, .allowUserInteraction], animations: {
                    imageview.transform = imageview.transform.rotated(by: -.pi / 4)
                })}
            
            
        case 43:
            if #available(iOS 13, *) {
                UIView.animate(withDuration: 3, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                    imageview.transform = imageview.transform.rotated(by: -.pi / 4)
                }, completion: nil)
                // use UICollectionViewCompositionalLayout
            } else {
                myVariable.timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true, block: {_ in
                    imageview.transform = imageview.transform.rotated(by: -.pi / 4)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                        
                        imageview.transform = imageview.transform.rotated(by: .pi / 4)
                        
                    }
                    })
                
            }

            
        default:
            break;
        }
    }
    
    
   func imageFloatingEffect(image1: UIView?, image2: UIView?, image3: UIView?, image4: UIView?, image5: UIView?, state: Int){
        self.view.isUserInteractionEnabled = true
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
        if myVariable.state == 17 {
            
            let floatingConstant = UIScreen.main.bounds.height * 0.02604
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
                image1?.frame.origin.y -= floatingConstant * 0.3
                image2?.frame.origin.y += floatingConstant * 0.3
            }){_ in
                UIView.animateKeyframes(withDuration: 0.2, delay: 0.25, options: [.autoreverse, .repeat, .allowUserInteraction], animations: {
                    image1?.frame.origin.y += floatingConstant * 0.3
                    image2?.frame.origin.y -= floatingConstant * 0.3
                })}
        } else {
            let floatingConstant = UIScreen.main.bounds.height * 0.02604
            switch state {
            case 7:
                imageRotate(imageview: image1 as! UIImageView, x: 0.76276, y: 1 - 0.1435, state: state)
            case 10:
//                imageRotate(imageview: image1 as! UIImageView, x: 0.32276, y: 1 - 0.4435, state: state)
                imageRotate(imageview: image1 as! UIImageView, x: 0.5, y: 0.5, state: state)
            case 45:
                UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
                    image1?.frame.origin.y -= 50
                }){_ in
                    UIView.animateKeyframes(withDuration: 1.0, delay: 0.25, options: [.autoreverse, .repeat, .allowUserInteraction], animations: {
                        image1?.frame.origin.y += 50
                    })}
                
            default:
                UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
                    image1?.frame.origin.y -= floatingConstant
                }){_ in
                    UIView.animateKeyframes(withDuration: 1.0, delay: 0.25, options: [.autoreverse, .repeat, .allowUserInteraction], animations: {
                        image1?.frame.origin.y += floatingConstant
                    })}
            }
            UIView.animate(withDuration: 1.0, delay: 0.15, options: [.curveEaseInOut,.allowUserInteraction], animations: {
                image2?.frame.origin.y -= floatingConstant
            }){_ in
                UIImageView.animateKeyframes(withDuration: 1.0, delay: 0.4, options: [.autoreverse, .repeat,.allowUserInteraction], animations: {
                    image2?.frame.origin.y += floatingConstant
                })}
            
            UIView.animate(withDuration: 1.0, delay: 0.25, options: [.curveEaseInOut,.allowUserInteraction], animations: {
                image3?.frame.origin.y -= floatingConstant
            }){_ in
                UIImageView.animateKeyframes(withDuration: 1.0, delay: 0.5, options: [.autoreverse,.repeat,.allowUserInteraction], animations: {
                    image3?.frame.origin.y += floatingConstant
                })}
            
            
            UIView.animate(withDuration: 1.0, delay: 0.45, options: [.curveEaseInOut,.allowUserInteraction], animations: {
                image4?.frame.origin.y -= floatingConstant
            }){_ in
                UIImageView.animateKeyframes(withDuration: 1.0, delay: 0.7, options: [.autoreverse, .repeat,.allowUserInteraction], animations: {
                    image4?.frame.origin.y += floatingConstant
                })
            }
            
            UIView.animate(withDuration: 1.0, delay: 0.65, options: [.curveEaseInOut,.allowUserInteraction], animations: {
                image5?.frame.origin.y -= floatingConstant
            }){_ in
                UIImageView.animateKeyframes(withDuration: 1.0, delay: 0.7, options: [.autoreverse, .repeat,.allowUserInteraction], animations: {
                    image5?.frame.origin.y += floatingConstant
                })
            }
            
            
        }
    }
    
    
    func cloudsFloatingEffect(leftCloud: UIView?, rightCloud: UIView?) {
        let floatingConstant = UIScreen.main.bounds.height * 0.02604
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
            leftCloud?.frame.origin.y -= floatingConstant
        }){_ in
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.25, options: [.autoreverse, .repeat, .allowUserInteraction], animations: {
                leftCloud?.frame.origin.y += floatingConstant
            })}
        
        UIView.animate(withDuration: 1.0, delay: 0.15, options: [.curveEaseInOut,.allowUserInteraction], animations: {
            rightCloud?.frame.origin.y -= floatingConstant
        }){_ in
            UIImageView.animateKeyframes(withDuration: 1.0, delay: 0.4, options: [.autoreverse, .repeat,.allowUserInteraction], animations: {
                rightCloud?.frame.origin.y += floatingConstant
            })}
    }
    
    
    
}



