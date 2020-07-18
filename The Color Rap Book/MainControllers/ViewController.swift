//
//  ViewController.swift
//  The Color Rap Book
//
//  Created by 7744 on 2/6/20.
//  Copyright © 2020 7744. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation





class ViewController: UIViewController {
    
    var imageInitialState: CGAffineTransform.Type?
    
    var timeControl = 2.0;
    var position = CGPoint()
    @IBOutlet var leftSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var rightSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var frontCoverView: UIImageView!
    @IBOutlet var singleTap: UITapGestureRecognizer!
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height

    
    
    @IBOutlet weak var readButton: UIButton!
    @IBOutlet weak var tableOfContentButton: UIButton!
    @IBOutlet weak var developerButton: UIButton!
    @IBOutlet weak var treeButton: UIButton!
    @IBOutlet weak var keepReadingButton: UIButton!
    
    
    
    
//    override fucntions
    
    override func viewDidAppear(_ animated: Bool) {
        
        if !myVariable.musicControlPanelStack.isDescendant(of: view) {
            musicPanelSetUp()
        }
        
        if myVariable.state >= 3 {
            if #available(iOS 13.0, *) {
                self.performSegue(withIdentifier: "ToSplashSegue", sender: self)
            } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.performSegue(withIdentifier: "ToSplashSegue", sender: self)
            })
            }
            
        }
        UIView.transition(with: self.treeButton, duration: 1.5, options:[.transitionFlipFromTop], animations: {
            self.elementEntering()
            print("animation processed")
        }, completion: {(finished) in
            self.imageFloatingEffect(image1: self.introLabel, image2: self.readButton, image3: self.tableOfContentButton, image4: self.treeButton, image5: self.developerButton, state: 0)
            myVariable.timer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true, block: {_ in
                self.keepReadingButton.transform = self.keepReadingButton.transform.rotated(by: .pi / 12)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.keepReadingButton.transform = self.keepReadingButton.transform.rotated(by: -.pi / 12)
            }})
//            self.imageRotate(imageview: self.keepReadingButton, x: 0, y: 0, state: 11)
            self.setupNotificationObservers()
        })
    }
    
    
    
    fileprivate func musicPanelSetUp() {
        view.addSubview(myVariable.musicControlPanelStack)
        myVariable.musicControlPanelStack.backgroundMusicStack.slider.addTarget(self, action: #selector(backgroundMusicVolumeControl), for: .valueChanged)
        myVariable.musicControlPanelStack.soundControlStack.slider.addTarget(self, action: #selector(soundVolumeControl), for: .valueChanged)
        if UIDevice.current.userInterfaceIdiom == .phone {
            
            if self.screenHeight / self.screenWidth <= 0.47 {
                  myVariable.musicControlPanelStack.frame = CGRect(x: screenWidth * 0.25, y: screenHeight * 0.30, width: screenWidth * 0.38, height: screenHeight * 0.25)
            } else {

                 myVariable.musicControlPanelStack.frame = CGRect(x: screenWidth * 0.20, y: screenHeight * 0.30, width: screenWidth * 0.45, height: screenHeight * 0.25)
            }

            
        } else {
        myVariable.musicControlPanelStack.frame = CGRect(x: screenWidth * 0.2, y: screenHeight * 0.30, width: screenWidth * 0.38, height: screenHeight * 0.15)
        }
        myVariable.musicControlPanelStack.alpha = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpAudioInterruptionNotification()
        musicPanelSetUp()
        setUpBubblePlayer()
        setUpBackgroundPlayer()
        myVariable.backgroundPlayer?.setVolume(0.05, fadeDuration: 0)
        myVariable.backgroundPlayer?.play()
    
       
        
        
        view.isExclusiveTouch = true
        readButton.isExclusiveTouch = true
        tableOfContentButton.isExclusiveTouch = true
        treeButton.isExclusiveTouch = true
        developerButton.isExclusiveTouch = true

        self.getSavedData()
        screenWidth = UIScreen.main.bounds.width
        screenHeight = UIScreen.main.bounds.height
        introLabel.frame = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.3, width: screenWidth * 0.5, height: screenHeight * 0.19)
        introLabel.text = "The Color Rap Book"
        introLabel.numberOfLines = 1
        introLabel.minimumScaleFactor = 0.1
        introLabel.adjustsFontSizeToFitWidth = true
        introLabel.textColor = .red
        introLabel.textAlignment = .left
        introLabel.font = UIFont(name: "Morgan_bold", size: 80)
        
        
        frontCoverView.image = UIImage(named: "page5Back")
        //        frontCoverView.image = UIImage(named: "FrontCover")
        frontCoverView.alpha = 1
        
        let readBHeight = screenHeight * 0.20
        let readBWidth = readBHeight * 1.380723
        readButton.frame = CGRect(x: screenWidth * 0.42, y: -screenHeight * 0.40, width: readBWidth, height: readBHeight)
        readButton.setImage(UIImage(named: "readCloud"), for: .normal)
        
        
        let tOCHeight = screenHeight * 0.20
        let tOCWidth = tOCHeight * 1.32477
        tableOfContentButton.frame = CGRect(x: screenWidth * 0.15, y: -screenHeight * 0.40, width: tOCWidth, height: tOCHeight)
        tableOfContentButton.setImage(UIImage(named: "tableOfContentCloud"), for: .normal)
        
        let sunHeight = screenHeight * 0.24
        let sunWidth = sunHeight * 0.9022
        developerButton.frame = CGRect(x: 0, y: -screenHeight * 0.40, width: sunWidth, height: sunHeight)
        developerButton.setImage(UIImage(named: "viewControllerSun"), for: .normal)
        
        
        let treeHeight = screenHeight * 0.90
        let treeWidth = treeHeight * 0.56936
        var deviceTreePosition = screenWidth * 0.60
        if UIDevice.current.userInterfaceIdiom == .phone {
            deviceTreePosition = screenWidth * 0.67
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            deviceTreePosition = screenWidth * 0.60
        }
        treeButton.frame = CGRect(x: deviceTreePosition, y: screenHeight, width: treeWidth, height: treeHeight)
        treeButton.setImage((UIImage(named: "tree")), for: .normal)
        
        
        keepReadingButton.frame = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.45, width: screenHeight * 0.2, height: screenHeight * 0.2)
        keepReadingButton.alpha = 0
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            position = touch.location(in: view)
            //            print(position)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        
        if (sender is UIButton) {
            if (segue.destination is DeveloperController) {
            } else {
                // No problem to force unwrap in this case, since we know sender is an instance of UIButton
                let button = sender as! UIButton
                
                // Set the circleOrigin property of the segue to the center of the button
                (segue as! OHCircleSegue).circleOrigin = button.center
                myVariable.center = button.center
            }
        }
        else if (sender is ViewController) {
            let view = sender as! ViewController
            (segue as! OHCircleSegue).circleOrigin = view.readButton.center
            myVariable.center = readButton.center
        }

        
        labelFadeOut(label: introLabel, delay: 0)
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        myVariable.musicControlPanelStack.alpha = 0
        myVariable.timer.invalidate()
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    
    
    
    
//    IBAction functions
    
    
    @IBAction func readTap(_ sender: Any) {
        myVariable.state = 3
        myVariable.buttonSoundPlayer?.play()
        self.performSegue(withIdentifier: "ToSplashSegue", sender: sender)
    }
    
    
    
    @IBAction func tableOfContentTap(_ sender: Any) {
        myVariable.buttonSoundPlayer?.play()
        self.performSegue(withIdentifier: "ToTableOfContent", sender: sender)
    }
    
    @IBAction func developerTap(_ sender: Any) {
        myVariable.buttonSoundPlayer?.play()
    }
    
    @IBAction func treeTap(_ sender: Any) {
        myVariable.buttonSoundPlayer?.play()
        if myVariable.musicControlPanelStack.alpha == 0 {
            leftSwipeGesture.isEnabled = false
            rightSwipeGesture.isEnabled = false
            myVariable.musicControlPanelStack.alpha = 1
        } else {
            leftSwipeGesture.isEnabled = true
            rightSwipeGesture.isEnabled = true
            myVariable.musicControlPanelStack.alpha = 0
        }
        
    }
    
    @IBAction func keepReadingTap(_ sender: Any) {
        print("pagenumber, ", myVariable.page)
        if myVariable.page < 3 || myVariable.page > 48 {
            myVariable.page = 3
        }
        myVariable.state = myVariable.page
        myVariable.buttonSoundPlayer?.play()
        self.performSegue(withIdentifier: "ToSplashSegue", sender: sender)
    }
    
    
    @IBAction func leftSwipeHandler(_ sender: Any) {
        switch introLabel.alpha {
        case 0:
            
            labelFadeIn(label: introLabel, delay: TimeInterval())
        default:
            break;
        }
        
    }
    
    @IBAction func rightSwipeHandler(_ sender: Any) {
        if introLabel.alpha == 1{
            labelFadeOut(label: introLabel, delay: TimeInterval())
            introLabel.alpha = 0;
        }
    }
    
    
    
    
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue) {
        
        self.labelFadeIn(label: self.introLabel, delay: 0)
        
    }
    
    
    
    
    
    
    
    
//    functions for animation in View Controller
    
    func labelFadeIn(label : UILabel, delay: TimeInterval) {
        introLabel.adjustsFontSizeToFitWidth = true
        
        UIView.animate(withDuration: timeControl, delay: 0.25, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
            
            self.introLabel.alpha = 1
            self.introLabel.frame = CGRect(x: self.screenWidth * 0.10, y: self.screenHeight * 0.7, width: self.screenWidth * 0.5, height: self.screenHeight * 0.19)
        }, completion: {(finished) in
        })
        
        
    }
    
    func labelFadeOut(label : UILabel, delay : TimeInterval) {
        introLabel.adjustsFontSizeToFitWidth = true
        
        UILabel.animate(withDuration: timeControl - 0.3, delay: delay, options: .curveEaseInOut, animations: {
            label.alpha = 0
            self.introLabel.frame = CGRect(x: self.screenWidth * 0.10, y: self.screenHeight * 0.3, width: self.screenWidth * 0.5, height: self.screenHeight * 0.19)
        },
                        completion: nil)
        
    }
    
    
  
    
    
    func elementEntering() {
        let treeHeight = screenHeight * 0.90
        let treeWidth = treeHeight * 0.56936
        var deviceTreePosition = screenWidth * 0.60
        if UIDevice.current.userInterfaceIdiom == .phone {
            deviceTreePosition = screenWidth * 0.67
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            deviceTreePosition = screenWidth * 0.60
        }
        treeButton.frame = CGRect(x: deviceTreePosition, y: screenHeight * 0.08, width: treeWidth, height: treeHeight)
        
        
        let tOCHeight = screenHeight * 0.20
        let tOCWidth = tOCHeight * 1.32477
        UIView.animate(withDuration: 0.2, delay: 0.6, options: .curveEaseIn, animations: {
            self.tableOfContentButton.frame = CGRect(x: self.screenWidth * 0.15, y: self.screenHeight * 0.10, width: tOCWidth, height: tOCHeight)
        }, completion: nil)
        
        let readBHeight = screenHeight * 0.20
        let readBWidth = readBHeight * 1.380723
        UIView.animate(withDuration: 0.2, delay: 0.9, options: .curveEaseIn, animations: {
            self.readButton.frame = CGRect(x: self.screenWidth * 0.42, y: self.screenHeight * 0.05, width: readBWidth, height: readBHeight)
        }, completion:nil)
        
        
        let sunHeight = screenHeight * 0.24
        let sunWidth = sunHeight * 0.9022
        UIView.animate(withDuration: 0.2, delay: 1.2, options: .curveEaseIn, animations: {
            self.developerButton.frame = CGRect(x: 0, y: 0, width: sunWidth, height: sunHeight)
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.2, delay: 1.4, options: .curveEaseIn, animations: {
//            self.keepReadingButton.frame = CGRect(x: self.screenWidth * 0.2, y: self.screenHeight * 0.45, width: self.screenHeight * 0.2, height: self.screenHeight * 0.2)
            self.keepReadingButton.alpha = 1
               }, completion: {(finished) in
                   self.labelFadeIn(label: self.introLabel, delay: 0)
               })
        
        
        
    }
    
    
    private func setupNotificationObservers() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(viewReappearFloating), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        
    }
    
    
    @objc func viewReappearFloating() {
        view.layer.removeAllAnimations()
         self.imageFloatingEffect(image1: self.introLabel, image2: self.readButton, image3: self.tableOfContentButton, image4: self.treeButton, image5: self.developerButton, state: 0)
    }
    
    @objc func backgroundMusicVolumeControl() {
        if myVariable.backgroundPlayer?.isPlaying == false {
            myVariable.backgroundPlayer?.play()
        }
        let value = 0.05 * ((Float)(myVariable.musicControlPanelStack.backgroundMusicStack.slider.index) / 4.00)
        myVariable.backgroundPlayer?.volume = value
        
    }

    @objc func soundVolumeControl() {
            
        myVariable.allSoundVolume = (Float)(myVariable.musicControlPanelStack.soundControlStack.slider.index) / 4.00
        myVariable.buttonSoundPlayer?.volume = myVariable.allSoundVolume
           
       }
}





extension UIViewController {
    func setUpAudioInterruptionNotification() {
        let nc = NotificationCenter.default
        nc.addObserver(self,
                       selector: #selector(handleInterruption),
                       name: AVAudioSession.interruptionNotification,
                       object: nil)
    }
    
    @objc func handleInterruption(notification: Notification) {
        myVariable.backgroundPlayer?.play()
    }
    
}



