//
//  labelControl.swift
//  The Color Rap Book
//
//  Created by 7744 on 2/20/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit

extension (DetailPageController) {
    
    func pageNumberLabelDisplay (label: UILabel, pageNum: Int){
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 2.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 3,height: 3)
        label.layer.masksToBounds = false
        label.adjustsFontSizeToFitWidth = true
        
        label1.layer.shadowColor = UIColor.black.cgColor
        label1.layer.shadowRadius = 2.0
        label1.layer.shadowOpacity = 1.0
        label1.layer.shadowOffset = CGSize(width: 3, height: 3)
        label1.layer.masksToBounds = false
        
        label2.layer.shadowColor = UIColor.black.cgColor
        label2.layer.shadowRadius = 2.0
        label2.layer.shadowOpacity = 1.0
        label2.layer.shadowOffset = CGSize(width: 3, height: 3)
        label2.layer.masksToBounds = false
        switch pageNum {
        case 3:
//            self.startButton.setTitle("Yes, let's go!", for: .normal)
            self.startButton.setImage(UIImage(named: "goButton"), for: .normal)
//            self.startButton.backgroundColor = .blue
            self.startButton.addTarget(self, action: #selector(startButtonTap), for: .touchUpInside)
            self.startButton.addButtonShadow()
            self.startButton.isEnabled = true
            self.startButton.frame = CGRect(x: screenWidth * 0.30, y: screenHeight * 0.805, width: screenWidth * 0.4, height: screenHeight * 0.17)
            view.addSubview(startButton)
            label.textAlignment = .center
//            label.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            label.textColor = .white
            label.frame = CGRect(x: screenWidth * 0.0572, y: screenHeight * 0.0981, width: screenWidth * 0.8856, height: screenHeight * 0.64375)
            label.font = UIFont(name: "Morgan_bold", size: 100)
//            self.labelAnimation(label: label, string: labelArray[pageNum-1], check: 0)
            UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseIn, animations: {
//                self.labelAnimation(label: label, string: self.labelArray, check: 0)
                self.labelAnimationNotPrinting(label: label, string: self.labelArray[pageNum-1])
                label.alpha = 1
            }, completion: {_ in
                UIView.animate(withDuration: 1.0, animations: {
                    self.startButton.alpha = 1
                },completion: nil)
            
            })
            self.backgroundImageView.backgroundColor = .systemPink
            self.animateBackgroundColor()
            
        //          For Red Text
        case 4,8,9,13,18,19,28,31,32,36,40:
            label.alpha = 1
            label.textAlignment = .center
            label.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            label.textColor = .white
            if UIDevice.current.userInterfaceIdiom == .phone {
//                label.frame = CGRect(x: 60, y: 40, width: screenWidth - 120, height: screenHeight - 80)
                                    label.frame = CGRect(x: screenWidth * 0.1172, y: screenHeight * 0.0781, width: screenWidth * 0.7656, height: screenHeight * 0.84375)
            }else {
                label.frame = CGRect(x: 60, y: 60, width: screenWidth - 120, height: screenHeight - 120)
            }
            label.font = UIFont(name: "Morgan_bold", size: 350)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
            
        case 5:
            label.alpha = 1
            label.textAlignment = .left
            //             label.backgroundColor = .blue
            label.textColor = .white
            label.frame = CGRect(x: screenWidth * 0.03, y: screenHeight * 0.72, width: screenWidth * 0.65
                , height: screenHeight * 0.20)
            label.font = UIFont(name: "Morgan_bold", size: 250)
            labelAnimation(label: label, string: labelArray[pageNum-1], check: 1)
            label1.alpha = 1
            label1.textAlignment = .left
            label1.textColor = .white
            label1.frame = CGRect (x: screenWidth * 0.04, y: screenHeight * 0.37, width: screenWidth * 0.5
                , height: screenHeight * 0.14)
            label1.text = "Turn your screen different ways to move the big cherries!"//\n\nMake sure the screen rotation lock is off!"
            label1.font = UIFont(name: "Morgan_bold", size: 120)
            label1.adjustsFontSizeToFitWidth = true
            
            
            
            
        case 6:
            label.alpha = 1
            label.textAlignment = .center
            label.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            label.textColor = .red
            label.frame = CGRect(x: screenWidth *  0.294013, y: screenHeight * 0.764244, width: screenWidth * 0.412567
                , height: screenHeight * 0.119644)
            label.font = UIFont(name: "Morgan_bold", size: 350)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
        case 7:
            label.alpha = 1
            label.textAlignment = .center
            label.textColor = .white
            label.frame = CGRect(x: screenWidth *  0.45, y: screenHeight * 0.15, width: screenWidth * 0.48567
                , height: screenHeight * 0.119644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
            
            
        case 11:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .white
            label.frame = CGRect(x: screenWidth *  0.07, y: screenHeight * 0.80, width: screenWidth * 0.55
                , height: screenHeight * 0.1519644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
        case 12:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .white
            label.frame = CGRect(x: screenWidth *  0.44, y: screenHeight * 0.84, width: screenWidth * 0.55
                , height: screenHeight * 0.1519644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
        case 14:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .yellow
            label.frame = CGRect(x: screenWidth * 0.02, y: screenHeight * 0.57, width: screenWidth * 0.45
                , height: screenHeight * 0.40519644)
            label.font = UIFont(name: "Morgan_bold", size: 150)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
            
        case 15:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .yellow
            label.frame = CGRect(x: screenWidth * 0.02, y: screenHeight * 0.67, width: screenWidth * 0.45
                , height: screenHeight * 0.1714)
            label.font = UIFont(name: "Morgan_bold", size: 100)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            label1.textAlignment = .left
            label1.textColor = .yellow
            label1.alpha = 1
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "Click on the banana ⤷"
            label1.frame = CGRect(x: screenWidth * 0.2, y: screenHeight * 0.2, width: screenWidth * 0.4, height: screenHeight * 0.12)
            label1.font = UIFont(name: "Morgan_bold", size: 100)
            
            
        case 16:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .yellow
            label.frame = CGRect(x: screenWidth * 0.45, y: screenHeight * 0.80, width: screenWidth * 0.55
                , height: screenHeight * 0.1714)
            label.font = UIFont(name: "Morgan_bold", size: 100)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
            
            
            
            
            
        case 17:
            label.alpha = 1
            label.textAlignment = .left
            //                label.backgroundColor = .red
            label.textColor = .yellow
//            label.numberOfLines = 1
            label.frame = CGRect(x: screenWidth *  0.10, y: screenHeight * 0.05, width: screenWidth * 0.80
                , height: screenHeight * 0.1419644)
            label.font = UIFont(name: "Morgan_bold", size: 100)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            label1.frame = CGRect(x: screenWidth * 0.60, y: screenHeight * 0.45, width: screenWidth * 0.35, height: screenHeight * 0.12)
            label1.textAlignment = .center
            label1.textColor = .yellow
            //                label1.alpha = 1
            label1.font = UIFont(name: "Morgan_bold", size: 100)
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "⤶ Click on the bird!"
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.label1.alpha = 1
            }, completion: nil)
            
            
            
            
            
            
        case 20:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .white
            label.frame = CGRect(x: screenWidth *  0.07, y: screenHeight * 0.05, width: screenWidth * 0.86
                , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            label1.frame = CGRect(x: screenWidth * 0.05, y: screenHeight * 0.85, width: screenWidth * 0.50, height: screenHeight * 0.10)
            label1.textAlignment = .left
            label1.textColor = .white
            label1.font = UIFont(name: "Morgan_bold", size: 200)
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "Swipe the frog to the left!"
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.label1.alpha = 1
            }, completion: nil)
            label2.frame = CGRect(x: screenWidth * 0.05, y: screenHeight * 0.85, width: screenWidth * 0.50, height: screenHeight * 0.10)
            label2.textAlignment = .left
            label2.textColor = .white
            label2.font = UIFont(name: "Morgan_bold", size: 40)
            label2.adjustsFontSizeToFitWidth = true
            label2.alpha = 0
            
            
        case 21: 
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .white
            label.frame = CGRect(x: screenWidth *  0.07, y: screenHeight * 0.05, width: screenWidth * 0.45
                , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
    
            
            
            
        case 22:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .white
            label.frame = CGRect(x: screenWidth *  0.44, y: screenHeight * 0.550, width: screenWidth * 0.54, height: screenHeight * 0.1619644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "☟ Move the mower to cut grass!"
            label1.alpha = 1
            
            label1.frame = CGRect(x: screenWidth *  0.15, y: screenHeight * 0.15, width: screenWidth * 0.70, height: screenHeight * 0.1219644)
            label1.textColor = .white
            label1.font = UIFont(name: "Morgan_bold", size: 150)
            
        case 23:
            label.alpha = 1
            label.textAlignment = .center
            label.textColor = .white
            label.frame = CGRect(x: screenWidth *  0.03, y: screenHeight * 0.80, width: screenWidth * 0.94
                , height: screenHeight * 0.1419644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "Click on the traffic light!"
            label1.alpha = 1
            label1.textAlignment = .center
            label1.frame = CGRect(x: screenWidth *  0.10, y: screenHeight * 0.05, width: screenWidth * 0.80
            , height: screenHeight * 0.1219644)
            label1.textColor = .white
            label1.font = UIFont(name: "Morgan_bold", size: 150)
            
            
        case 24:
            label.alpha = 1
            label.textAlignment = .center
            label.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            label.textColor = .white
            label.frame = CGRect(x: 60, y:screenHeight * 0.30 , width: screenWidth - 120
                , height: screenHeight * 0.40)
            label.font = UIFont(name: "Morgan_bold", size: 350)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
            
        case 25:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .orange
            label.frame = CGRect(x: screenWidth *  0.07, y: screenHeight * 0.05, width: screenWidth * 0.86
                , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            label1.frame = CGRect(x: screenWidth * 0.45, y: screenHeight * 0.45, width: screenWidth * 0.45, height: screenHeight * 0.12)
            label1.textAlignment = .center
            label1.textColor = .orange
            //                label1.alpha = 1
            label1.font = UIFont(name: "Morgan_bold", size: 100)
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "⤶ Click on the tree to shake it!"
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.label1.alpha = 1
            }, completion: nil)
            
            
        case 26:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .orange
            label.frame = CGRect(x: screenWidth * 0.07, y:screenHeight * 0.09 , width: screenWidth * 0.86
                , height: screenHeight * 0.1714)
            label.font = UIFont(name: "Morgan_bold", size: 350)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
        
            
        case 27:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .orange
            label.frame = CGRect(x: screenWidth *  0.07, y: screenHeight * 0.05, width: screenWidth * 0.86
                , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            label1.frame = CGRect(x: screenWidth * 0.05, y: screenHeight * 0.45, width: screenWidth * 0.45, height: screenHeight * 0.15)
            label1.textAlignment = .center
            label1.textColor = .orange
            //                label1.alpha = 1
            label1.font = UIFont(name: "Morgan_bold", size: 100)
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "Touch the orange!"
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.label1.alpha = 1
            }, completion: nil)
            
            
        case 29:
            label.alpha = 1
            label.textAlignment = .center
            label.textColor = .white
            label.frame = CGRect(x: screenWidth *  0.25, y: screenHeight * 0.80, width: screenWidth * 0.50
                , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
        case 30:
            label.alpha = 1
            label.textAlignment = .right
            label.textColor = .purple
            label.frame = CGRect(x: screenWidth *  0.55, y: screenHeight * 0.75, width: screenWidth * 0.40
                , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
            label1.alpha = 1
            label1.textAlignment = .center
            label1.textColor = .purple
            label1.frame = CGRect(x: screenWidth *  0.6, y: screenHeight * 0.10, width: screenWidth * 0.30
                , height: screenHeight * 0.1019644)
            label1.font = UIFont(name: "Morgan_bold", size: 100)
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "Swipe or click the bread to put jelly on!"
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.label1.alpha = 1
            }, completion: nil)
            
            
            
            
        case 33:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .brown
            label.frame = CGRect(x: screenWidth *  0.10, y: screenHeight * 0.05, width: screenWidth * 0.80
                , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            label1.frame = CGRect(x: screenWidth * 0.05, y: screenHeight * 0.45, width: screenWidth * 0.45, height: screenHeight * 0.15)
            label1.textAlignment = .center
            label1.textColor = .brown
            //                label1.alpha = 1
            label1.font = UIFont(name: "Morgan_bold", size: 100)
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "Stomp on the mud ↷"
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.label1.alpha = 1
            }, completion: nil)
            
            
            
            
        case 34:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .brown
            label.frame = CGRect(x: screenWidth *  0.10, y: screenHeight * 0.05, width: screenWidth * 0.80
                , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            label1.frame = CGRect(x: screenWidth * 0.70, y: screenHeight * 0.25, width: screenWidth * 0.20, height: screenHeight * 0.45)
            label1.textAlignment = .left
            label1.textColor = .brown
            label1.alpha = 1
            label1.font = UIFont(name: "Morgan_bold", size: 100)
            label1.adjustsFontSizeToFitWidth = true
//            label1.text = "yum,\n  yum,\n   yum."
            labelAnimation(label: label1, string: "yum,\n  yum,\n    yum.", check: 0)
//            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
//                self.label1.alpha = 1
//            }, completion: nil)
            
            
        case 35:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .brown
            label.frame = CGRect(x: screenWidth *  0.10, y: screenHeight * 0.10, width: screenWidth * 0.80
                , height: screenHeight * 0.1519644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            label1.alpha = 1
            label1.frame = CGRect(x: screenWidth * 0.30, y: screenHeight * 0.42, width: screenWidth * 0.50, height: screenHeight * 0.10)
            label1.textAlignment = .left
            label1.textColor = .brown
            label1.font = UIFont(name: "Morgan_bold", size: 200)
            label1.adjustsFontSizeToFitWidth = true
            //                label1.backgroundColor = .white
            label1.text = "☟ Click on the chocolate!"
            
            
        case 37:
            label.alpha = 1
            label.textAlignment = .center
            label.textColor = .black
            label.frame = CGRect(x: screenWidth *  0.03, y: screenHeight * 0.80, width: screenWidth * 0.94
                , height: screenHeight * 0.1419644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            label1.frame = CGRect(x: screenWidth * 0.3, y: screenHeight * 0.05, width: screenWidth * 0.40, height: screenHeight * 0.15)
            label1.textAlignment = .center
            label1.textColor = .black
            label1.alpha = 1
            label1.font = UIFont(name: "Morgan_bold", size: 100)
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "Click on the boots!"
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.label1.alpha = 1
            }, completion: nil)
            
            
        case 38:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .black
            label.frame = CGRect(x: screenWidth *  0.25, y: screenHeight * 0.05, width: screenWidth * 0.50
                , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            label1.frame = CGRect(x: screenWidth * 0.60, y: screenHeight * 0.40, width: screenWidth * 0.35, height: screenHeight * 0.15)
            label1.textAlignment = .center
            label1.textColor = .black
            label1.alpha = 1
            label1.font = UIFont(name: "Morgan_bold", size: 100)
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "Click the witch's hat!"
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.label1.alpha = 1
            }, completion: nil)
            
            
            
        case 39:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .black
            label.frame = CGRect(x: screenWidth *  0.10, y: screenHeight * 0.05, width: screenWidth * 0.5
                , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
            label1.frame = CGRect(x: screenWidth * 0.4, y: screenHeight * 0.80, width: screenWidth * 0.55
            , height: screenHeight * 0.1719644)
            label1.textAlignment = .right
            label1.textColor = .black
            label1.alpha = 1
            label1.font = UIFont(name: "Morgan_bold", size: 200)
            label1.adjustsFontSizeToFitWidth = true
            labelAnimation(label: label1, string: "and Halloween cats.", check: 0)
            
            label2.alpha = 1
            label2.textAlignment = .center
            label2.textColor = .black
            label2.frame = CGRect(x: screenWidth *  0.675, y: screenHeight * 0.10, width: screenWidth * 0.25
                , height: screenHeight * 0.1019644)
            label2.font = UIFont(name: "Morgan_bold", size: 100)
            label2.adjustsFontSizeToFitWidth = true
            label2.text = "Click on the bats and the cat!"
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.label2.alpha = 1
            }, completion: nil)
            
           
            
            

        case 41:
            label.alpha = 1
            label.textAlignment = .center
            label.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            label.textColor = .black
            label.frame = CGRect(x: 60, y: 60, width: screenWidth - 120
                , height: screenHeight - 120)
            label.font = UIFont(name: "Morgan_bold", size: 350)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
//            print(backgroundImageView.backgroundColor)
            
            
        case 42:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .white
            label.frame = CGRect(x: screenWidth * 0.4, y: screenHeight * 0.80, width: screenWidth * 0.55
            , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
            label1.frame = CGRect(x: screenWidth * 0.08, y: screenHeight * 0.05, width: screenWidth * 0.5
            , height: screenHeight * 0.1419644)
            label1.textAlignment = .left
            label1.textColor = .white
//            label1.alpha = 1
            label1.font = UIFont(name: "Morgan_bold", size: 100)
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "Click on different snow flakes!"
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.label1.alpha = 1
            }, completion: nil)
            
            
        case 43:
            label.alpha = 1
            label.textAlignment = .right
            label.textColor = .white
            label.frame = CGRect(x: screenWidth *  0.3, y: screenHeight * 0.05, width: screenWidth * 0.60
                , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
        case 44:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .white
            label.frame = CGRect(x: screenWidth *  0.10, y: screenHeight * 0.15, width: screenWidth * 0.50
                , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
            label1.frame = CGRect(x: screenWidth *  0.10, y: screenHeight * 0.45, width: screenWidth * 0.35
            , height: screenHeight * 0.1419644)
            label1.textAlignment = .center
            label1.textColor = .white
            label1.font = UIFont(name: "Morgan_bold", size: 40)
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "Click on the dress!"
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.label1.alpha = 1
            }, completion: nil)
            
            
        case 45:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .white
            label.frame = CGRect(x: screenWidth *  0.10, y: screenHeight * 0.15, width: screenWidth * 0.50
                , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
        case 46:
            label.alpha = 1
            label.textAlignment = .left
            label.textColor = .white
            label.frame = CGRect(x: screenWidth *  0.07, y: screenHeight * 0.05, width: screenWidth * 0.86
                , height: screenHeight * 0.1419644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            label.adjustsFontSizeToFitWidth = true
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            label1.frame = CGRect(x: screenWidth * 0.05, y: screenHeight * 0.85, width: screenWidth * 0.50, height: screenHeight * 0.10)
            label1.textAlignment = .left
            label1.textColor = .white
            label1.font = UIFont(name: "Morgan_bold", size: 200)
            label1.adjustsFontSizeToFitWidth = true
            label1.text = "Click on the campfire to cook the marshmallows!"
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.label1.alpha = 1
            }, completion: nil)
            
        case 47:
            label.alpha = 1
            label.textAlignment = .center
            label.textColor = .white
             label.frame = CGRect(x: screenWidth *  0.05, y: screenHeight * 0.05, width: screenWidth * 0.90
                           , height: screenHeight * 0.1719644)
            label.font = UIFont(name: "Morgan_bold", size: 200)
            label.text?.removeAll()
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
            
        case 48:
            label.alpha = 1
            label.textAlignment = .center
            label.textColor = .white
            label.frame = CGRect(x: screenWidth * 0.25, y: screenHeight * 0.45, width: screenWidth * 0.5, height: screenHeight * 0.2)
//            label.bottomAnchor.constraint(equalTo: self.lastPageButtonStack.topAnchor, constant: -screenHeight * 0.05).isActive = true
//            label.anchorCenterXToSuperview()
//            label.widthAnchor.constraint(equalToConstant: screenWidth * 0.5).isActive = true
//            label.heightAnchor.constraint(equalToConstant: screenHeight * 0.2).isActive = true
            label.font = UIFont(name: "Morgan_bold", size: 50)
            labelAnimation(label: label, string: labelArray[pageNum-1],check:0)
            
        default:
            break;
        }
        
        buttonsEnabled(Bool: true)
        grestureRecognizerSwitch(Bool: true)
        
    }
    
    func labelTextDisappearing(label: UILabel) {
        
        UILabel.animate(withDuration: 1.0, animations: {
            //        label.isHidden = true
            label.alpha = 0
            self.label1.alpha = 0
            self.label2.alpha = 0
        }, completion: {(finished) in
            label.text = ""
            self.label1.text = ""
            label.numberOfLines = 0
            self.label1.numberOfLines = 0
            self.label2.text = ""
            self.label2.numberOfLines = 0
        })
        
        
    }
    
    func labelAnimation(label: UILabel, string: String, check: Int) {
        var checkForNL = ""
        for i in string {
            if (i == "\\") {
                checkForNL += "\""
//                print("sense the backslash", checkForNL)
                continue
            }
            if (checkForNL == "\"" && i == "n"){
//                print("sense the n after backslash", checkForNL)
                label.text! += "\n"
                RunLoop.current.run(until: Date() + printingTimeControl)
            }else {
                checkForNL = ""
                label.text! += "\(i)"
                //                    print(i)
                RunLoop.current.run(until: Date() + printingTimeControl)
            }
        }
        //            labelFloating(label: label)
        
    }
    
    func labelAnimationNotPrinting(label: UILabel, string: String) {
           var checkForNL = ""
            var labelString = ""
           for i in string {
               if (i == "\\") {
                   checkForNL += "\""
                   print("sense the backslash", checkForNL)
                   continue
               }
               if (checkForNL == "\"" && i == "n"){
                   print("sense the n after backslash", checkForNL)
                  labelString += "\n"
//                RunLoop.current.run(until: Date() + 0.0)
               }else {
                   checkForNL = ""
                labelString += "\(i)"
                   //                    print(i)
//                RunLoop.current.run(until: Date() + 0.0)
               }
           }
            label.text = labelString
           //            labelFloating(label: label)
           
       }
    
    func labelFloating(label: UILabel) {
        UILabel.animate(withDuration: 1.0, delay: 0, options: [.curveEaseInOut], animations: {
            label.frame.origin.y -= 10
        }){_ in
            UILabel.animateKeyframes(withDuration: 1.0, delay: 0.35, options: [.autoreverse, .repeat], animations: {
                label.frame.origin.y += 10
                
            })
        }
        
    }
    
    
    
}



