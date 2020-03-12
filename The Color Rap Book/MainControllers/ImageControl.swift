//
//  ElementStorage.swift
//  The Color Rap Book
//
//  Created by 7744 on 2/20/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit


extension(DetailPageController) {
    

//Functions that stores the animation
   
   func elementsEnteringStorage(state: Int) {
       imageBackInPlace()

       switch state {
       case 5:
           self.image1.image = UIImage(named: "page5Tree")
           self.image1.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
           self.image1.addShadow()
           self.image5.image = UIImage(named: "page5CherrySmall")
           let universalWidth = screenWidth * 0.12991  //cherryImage.size.width / 3.3
           let universalHeight = screenHeight * 0.21070 //cherryImage.size.height / 3.3
//            print("width ", cherryImage.size.width)
//            print("height ",cherryImage.size.height)
           self.image5.frame = CGRect(x: screenWidth * 0.610, y: screenHeight * 0.313, width: universalWidth ,height: universalHeight)
           self.image5.addShadow()
           
           self.image6.image = UIImage(named: "page5SmallCherries")
           self.image6.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
           self.image6.addShadow()
           
           
           UIView.animate(withDuration: 1.5, delay: 0.4, options: .curveEaseIn, animations: {
               self.image2.image = UIImage(named: "page5CloudLeft")
               self.image2.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
               self.image2.addShadow()
           }, completion:nil)
           
           UIView.animate(withDuration: 1.5, delay: 0.8, options: .curveEaseIn, animations: {
                 self.image3.image = UIImage(named: "page5CloudRight")
               self.image3.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
               self.image3.addShadow()
           }, completion: nil)
           
           UIView.animate(withDuration: 1.5, delay: 1.2, options: .curveEaseIn, animations: {
                 self.image4.image = UIImage(named: "page5Sun")
               self.image4.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
               self.image4.addShadow()
           }, completion: {(finished) in
            // Get node of object to move

            self.imageFreeFall(imageView: self.image5, elasticity: 0.6)
               self.imageFloatingEffect(image1: self.image1, image2: self.image2, image3: self.image3, image4: self.image4, state: state)
           })
        
       case 6:
        self.image1.image = UIImage(named: "page6StopSign")
        self.image1.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        self.image1.addShadow()
        imageFloatingEffect(image1: self.image1, image2: self.image2, image3: self.image3, image4: self.image4, state: state)
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
           self.image1.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
           self.image1.addShadow()
           UIView.animate(withDuration: 1.5, delay: 0.4, options: .curveEaseIn, animations: {
                          self.image2.image = UIImage(named: "page10Sticker")
               self.image2.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
                          self.image2.addShadow()
           }, completion: {(finished) in
               self.imageFloatingEffect(image1: self.image1, image2: self.image2, image3: self.image3, image4: self.image4, state: state)
       })
        
       case 11:
        self.image1.image = UIImage(named: "page11Hat")
        self.image1.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        self.image1.addShadow()
        
        
       case 12:
        self.image6.image = UIImage(named: "page12CLoudLeft")
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
        
        UIView.animate(withDuration: 1.5, delay: 1.2, options: .curveEaseIn, animations: {
            self.image7.image = UIImage(named: "page12CLoudRight")
            self.image7.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
            self.image7.addShadow()
        }, completion: {(finished) in
            self.imageFloatingEffect(image1: self.image2, image2: self.image6, image3: self.image3, image4: self.image7, state: state)
        })
        
       case 14:
        self.image2.image = UIImage(named: "page14Sun")
        self.image2.frame = CGRect(x: screenWidth * 0.15, y: screenHeight * 0.03, width: screenHeight * 0.72, height: screenHeight * 0.72)
        self.image2.addShadow()
        
        UIView.animate(withDuration: 1.5, delay: 0.4, options: .curveEaseIn, animations: {
            self.image1.image = UIImage(named: "page14Clouds")
            self.image1.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
            self.image1.addShadow()
        }, completion: {_ in
            self.imageFloatingEffect(image1: self.image1, image2: self.image3, image3: self.image4, image4: self.image2, state: state)
        })
        
        
        
        
        
        
        
        
        
       case 20:
        image3.image = UIImage(named: "page20Leaf")
        image3.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
        image3.addShadow()
        UIView.animate(withDuration: 1.5, delay: 0.4, options: .curveEaseIn, animations: {
            self.image5.image = UIImage(named: "page20Frog")
            self.image5.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
            self.image5.addShadow()
        }, completion: {(finished) in
//            self.view.isUserInteractionEnabled = true
//            self.image5.isUserInteractionEnabled = true
//                   self.imageFloatingEffect(image1: self.label1, image2: self.image3, image3: self.image4, image4: self.image7, state: state)
            
               })
        
       case 22:
        image1.image = UIImage(named: "page22Mower")
        image1.frame = CGRect(x: 0, y: screenHeight * 0.55, width: screenWidth * 0.25, height: screenWidth * 0.185)
        image1.isUserInteractionEnabled = true
        image1.addShadow()
        let panGesture = CustomPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture))
        panGesture.object = self.image1
        panGesture.page = 22
        image1.addGestureRecognizer(panGesture)
        self.view.bringSubviewToFront(image1)
        
        image2.image = UIImage(named: "page22LeftGrass")
        image2.frame = CGRect(x: screenWidth * 0.323, y: screenHeight * 0.79, width: screenWidth * 0.06, height: screenHeight * 0.08)
        image2.backgroundColor = .red
        image2.addCustomImagePopShadow(radius: 50)
        
        
        
        
        
        
        
        
        
        
       case 25:
        image2.image = UIImage(named: "page25LeafOnTree")
        image2.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
        image3.image = UIImage(named: "page25LeafOnFloor")
        image3.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
        
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
        imageFloatingEffect(image1: label1, image2: image2, image3: image3, image4: image4, state: state)


        
        
        
   

       default:
           self.image1.image = nil
           self.image2.image = nil
           self.image3.image = nil
           self.image4.image = nil
           self.image5.image = nil
           self.image6.image = nil
           break;
           
       }
   }
    
    
    
    
      func imageDisappearing() {
            UIImageView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseInOut], animations: {
                self.imageBackInPlace()
                self.previousButton.alpha = 0
                self.nextButton.alpha = 0
                self.showMoreButton.alpha = 0
            }, completion: nil)
            timer.invalidate()

        }
        
        func imageFloatingEffect(image1: UIView, image2: UIView, image3: UIView, image4: UIView, state: Int){

            switch state {
            case 7:
                imageRotate(imageview: image1 as! UIImageView, x: 0.76276, y: 1 - 0.1435, state: state)
            case 10:
                imageRotate(imageview: image1 as! UIImageView, x: 0.32276, y: 1 - 0.4435, state: state)

            default:
                UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
                    image1.frame.origin.y -= 20
                    image1.isUserInteractionEnabled = true
                    }){_ in
                        UIView.animateKeyframes(withDuration: 1.0, delay: 0.25, options: [.autoreverse, .repeat, .allowUserInteraction], animations: {
                        image1.frame.origin.y += 20
                    })}
            }
            UIView.animate(withDuration: 1.0, delay: 0.15, options: [.curveEaseInOut,.allowUserInteraction], animations: {
                    image2.frame.origin.y -= 20
                image2.isUserInteractionEnabled = true
                        }){_ in
                            UIImageView.animateKeyframes(withDuration: 1.0, delay: 0.4, options: [.autoreverse, .repeat,.allowUserInteraction], animations: {
                                              image2.frame.origin.y += 20
                        })}
                    
            UIView.animate(withDuration: 1.0, delay: 0.25, options: [.curveEaseInOut], animations: {
                    image3.frame.origin.y -= 20
                        }){_ in
                            UIImageView.animateKeyframes(withDuration: 1.0, delay: 0.5, options: [.autoreverse, .repeat], animations: {
                                              image3.frame.origin.y += 20
                            })}
            
            
            UIView.animate(withDuration: 1.0, delay: 0.45, options: [.curveEaseInOut], animations: {
                               image4.frame.origin.y -= 20
                               }){_ in
                                UIImageView.animateKeyframes(withDuration: 1.0, delay: 0.7, options: [.autoreverse, .repeat], animations: {
                                              image4.frame.origin.y += 20
                                          })
                           }


        }
    
    
    func imageBackInPlace() {
        image1.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
        image2.frame = CGRect(x: 0, y: -screenHeight, width: screenWidth, height: screenHeight)
        image3.frame = CGRect(x: 0, y: -screenHeight, width: screenWidth, height: screenHeight)
        image4.frame = CGRect(x: -screenWidth, y: 0, width: screenWidth, height: screenHeight)
        image5.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
        image6.frame = CGRect(x: 0, y: -screenHeight, width: screenWidth, height: screenHeight)
        image7.frame = CGRect(x: 0, y: -screenHeight, width: screenWidth, height: screenHeight)
        image1.transform = .identity
        image2.transform = .identity
        image3.transform = .identity
        image4.transform = .identity
        image5.transform = .identity
        image6.transform = .identity
        image7.transform = .identity
        image1.alpha = 1
        image2.alpha = 1
        image2.image = nil
        image2.removeShadow()
        label1.transform = .identity
        itemsAnimator?.removeAllBehaviors()
        timer.invalidate()
    }
    
    func imageRotate(imageview: UIImageView, x: CGFloat, y: CGFloat, state: Int) {
            let anchorPoint = CGPoint(x: x, y: y)
            let oldAnchorPoint = imageview.layer.anchorPoint
            imageview.layer.anchorPoint = anchorPoint
//            print("old anchor point ", oldAnchorPoint)
//            print("anchorPoint ", anchorPoint)
            let offsetFromMovingAnchorPointsX = anchorPoint.x - oldAnchorPoint.x
            let offsetFromMovingAnchorPointsY = anchorPoint.y - oldAnchorPoint.y
//            print("CGRect ", imageview.frame)
            imageview.transform = imageview.transform.translatedBy(x: offsetFromMovingAnchorPointsX * screenWidth, y: offsetFromMovingAnchorPointsY * screenHeight)
//            print("CGRect ", imageview.frame)
        switch state {
            case 7:
                UIImageView.animateKeyframes(withDuration: 1.5, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                    imageview.transform = imageview.transform.rotated(by: .pi / 16)})
            case 10:
                timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: {_ in
                imageview.transform = imageview.transform.rotated(by: .pi / 12)})
        case 11:
            timer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true, block: {_ in
            imageview.transform = imageview.transform.rotated(by: .pi / 12)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            imageview.transform = imageview.transform.rotated(by: -.pi / 12)
                }
                
            })
            default:
                break;
            }
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
        itemsAnimator = UIDynamicAnimator(referenceView: self.view)
         
        let item = [imageView]
         // The gravity for our system
        gravityBehavior = UIGravityBehavior(items: item as [UIDynamicItem])
         
         // The collision between our items, and with the boundary of the containing view
        boundaryCollisionBehavior = UICollisionBehavior(items: item as [UIDynamicItem])
        boundaryCollisionBehavior?.translatesReferenceBoundsIntoBoundary = true
        
         // The elasticity for the blocks
        elasticityBehavior = UIDynamicItemBehavior(items: item as [UIDynamicItem])
        elasticityBehavior?.elasticity = elasticity
         
         // Add everything
         itemsAnimator?.addBehavior(self.gravityBehavior!)
         itemsAnimator?.addBehavior(self.boundaryCollisionBehavior!)
         itemsAnimator?.addBehavior(self.elasticityBehavior!)
        print("imageFreeFallProceed")
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
        let tappedImage = tapGestureRecognizer.view as! UIImageView
//        let testImage = UIImageView(frame: CGRect(x: screenWidth * 0.07, y: screenHeight * 0.54, width: screenWidth * 0.46, height: screenHeight * 0.29))
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
        // Your action
    }
    
   
}



