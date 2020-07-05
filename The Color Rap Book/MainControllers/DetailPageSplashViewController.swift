//
//  DetailPageSplashViewController.swift
//  The Color Rap Book
//
//  Created by 7744 on 6/22/20.
//  Copyright © 2020 7744. All rights reserved.
import Foundation
import UIKit
import LBTAComponents
import RevealingSplashView




class DetailPageSplashViewController: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var isUnwind = false
    let splashIcon = UIImageView()
    let splashBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let revealingSplashView = RevealingSplashView(iconImage: #imageLiteral(resourceName: "splashIcon"), iconInitialSize: CGSize(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.width * 0.2), backgroundImage: #imageLiteral(resourceName: "transitionBackIPad"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        splashIcon.frame = CGRect(x: screenWidth * 0.4, y: screenHeight * 0.4, width: screenWidth * 0.2, height: screenWidth * 0.2)
        splashIcon.center = CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.5)
        splashIcon.image = UIImage(named: "splashIcon")

        splashBackground.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        print("UIDevice current userinterface, ", UIDevice.current.userInterfaceIdiom)
        if UIDevice.current.userInterfaceIdiom == .pad {
            splashBackground.image = UIImage(named: "transitionBackIPad")
            revealingSplashView.backgroundImageView?.image = UIImage(named: "transitionBackIPad")
        } else {
            if screenHeight / screenWidth < 0.50 {
                splashBackground.image = UIImage(named: "transition_896")
                revealingSplashView.backgroundImageView?.image = UIImage(named: "transition_896")
            } else {
               splashBackground.image = UIImage(named: "transition_736")
                revealingSplashView.backgroundImageView?.image = UIImage(named: "transition_736")
            
        }
            
        }
        
//
        view.addSubview(splashBackground)
         view.addSubview(splashIcon)
        splashBackground.alpha = 0
        splashIcon.alpha = 0
        view.addSubview(revealingSplashView)
        randomRevealing()
        revealingSplashView.duration = 1.8
        revealingSplashView.startAnimation()
//         print("all the views, ", view.subviews)
//
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
//            print("ayyyyyyy")
//            self.revealingSplashView.layer.removeAllAnimations()
//            self.revealingSplashView.removeFromSuperview()
//            self.revealingSplashView.heartAttack = true
             self.performSegue(withIdentifier: "ToDetailPageSegue", sender: self)

        })
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.revealingSplashView.heartAttack = true
    }
   
    

    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue) {
        isUnwind = true
        splashBackground.alpha = 1
        splashIcon.alpha = 1
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            
            self.performSegue(withIdentifier: "BackToViewController", sender: self)
                      
        })
          
    
           
       }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if isUnwind == true {
        myVariable.state = 2
        (segue as! OHCircleSegue).circleOrigin = myVariable.center ?? CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.5)
        }
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
        
    
    }
    
    func randomRevealing() {
        let revealingRandomNum = Int.random(in: 0...5)
       
        switch revealingRandomNum {
        case 0:
            revealingSplashView.animationType = .heartBeat
//            self.revealingSplashView.heartAttack = true
        case 1:
            revealingSplashView.animationType = .popAndZoomOut
        case 2:
//            revealingSplashView.animationType = .rotateOut
            revealingSplashView.animationType = .woobleAndZoomOut
        case 3:
            revealingSplashView.animationType = .squeezeAndZoomOut
        case 4:
            revealingSplashView.animationType = .swingAndZoomOut
        case 5:
            revealingSplashView.animationType = .twitter
//            self.revealingSplashView.heartAttack = true
        default:
            revealingSplashView.animationType = .twitter
        }

    }
    
    
    
    
}
