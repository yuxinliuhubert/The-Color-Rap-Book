//
//  DetailPage.swift
//  The Color Rap Book
//
//  Created by 7744 on 2/8/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import simd
import CoreMotion
import CoreData

struct myVariable {
    static var state = 0
    static var center: CGPoint?
    static var comingFromTableOfContent = false
    static var page = 3
}

class DetailPageController : UIViewController, UITextFieldDelegate {
    
    
       // MARK: - Dynamics properties
    // Animator for all of the components
    var itemsAnimator: UIDynamicAnimator?
    
    // Gravity for the system
    var gravityBehavior: UIGravityBehavior?
    
    lazy var regularGravityVector: CGVector = {
        CGVector(dx: 1, dy: 0)
    }()
    
    lazy var regularGravityVectorCanceller: CGVector = {
        CGVector(dx: 1000, dy: 0)
    }()
    
    lazy var invertedGravityVector: CGVector = {
        CGVector(dx: -1, dy: 0)
    }()
    
    lazy var invertedGravityVectorCanceller: CGVector = {
        CGVector(dx: -1000, dy: 0)
    }()
    
    lazy var normalRegularGravityVector: CGVector = {
        CGVector(dx: 0, dy: 1)
    }()
    
    lazy var normalRegularGravityVectorCanceller: CGVector = {
        CGVector(dx: 0, dy: 1000)
    }()

    
    lazy var normalInvertGravityVector: CGVector = {
        CGVector(dx: 0, dy: -1)
    }()
    
    lazy var normalInvertGravityVectorCanceller: CGVector = {
        CGVector(dx: 0, dy: -1000)
    }()
    
    lazy var zeroGravityVector: CGVector = {
        CGVector(dx: 0, dy: 0)
    }()
    // Collisions
    var boundaryCollisionBehavior: UICollisionBehavior?
    
    // Elasticity
    var elasticityBehavior: UIDynamicItemBehavior?


    
    let motionManager: CMMotionManager = CMMotionManager()
    
    
    var printingTimeControl = 0.12
    
    var position = CGPoint()
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var testingTextfield: UITextField!
    
    @IBOutlet var leftSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var upSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var rightSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var downSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var singleTap: UITapGestureRecognizer!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var showMoreButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var showMoreStack: UIStackView!
    
    var labelArray = [String]() // do not use NSMutableArray in Swift
    var backgroundAtray = [String]()
//    var dictClients = [String]()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label1: UILabel!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var timer = Timer()
    
    
        
    
    
    
    
    
    override func viewDidLoad() {
        print(myVariable.state)
        firstLabelTask(state: 0, completion: {(success) in
            if success == true {
                imageFloatingEffect(image1: self.nextButton, image2: self.previousButton, image3: self.image3, image4: self.image6, state: 1)
                imageBackInPlace()
                label.isHighlighted = false
                label.alpha = 1
                grestureRecognizerSwitch(Bool: true)
                testingTextfield.backgroundColor = .white
                testingTextfield.textAlignment = .center
                testingTextfield.attributedPlaceholder = NSAttributedString(string: "Currently on page \(myVariable.state)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray.withAlphaComponent(0.8)])
                self.testingTextfield.delegate = self
                testingTextfield.textColor = .black
                self.previousButton.frame = CGRect(x: screenWidth * 0.02, y: screenHeight * 0.02, width: screenWidth * 0.1, height: screenWidth * 0.0724)
                self.previousButton.backgroundColor = .clear
                self.labelTextDisappearing(label: label)
                
                self.previousButton.frame = CGRect(x: screenWidth * 0.02, y: screenHeight * 0.02, width: screenWidth * 0.1, height: screenWidth * 0.0724)
                self.previousButton.backgroundColor = .clear
                
                self.previousButton.setImage(UIImage(named: "goBack"), for: .normal)
                
                self.nextButton.frame = CGRect(x: screenWidth * 0.88, y: screenHeight * 0.02, width: screenWidth * 0.1, height: screenWidth * 0.0724)
                self.nextButton.backgroundColor = .clear
                self.nextButton.setImage(UIImage(named: "nextPage"), for: .normal)
                
                self.showMoreButton.frame = CGRect(x: screenWidth * 0.48, y: screenHeight * 0.02, width: screenWidth * 0.03, height: screenWidth * 0.009)
                
                
                self.testingTextfield.frame = CGRect(x: screenWidth * 0.78, y: screenHeight * 0.9, width: screenWidth * 0.2, height: 34)
                self.showMoreStack.distribution = .fillEqually
                showMoreStack.spacing = screenWidth * 0.05
                homeButton.setImage(UIImage(named: "home"), for: .normal)
                continueButton.setImage(UIImage(named: "continue"), for: .normal)
            
//                showMoreStack.addBackground(color: .red)
                defineStackPosition()
                print("pagenumberSaved ",myVariable.page)
            }
            
        })
        
        // Listen for orientation changes
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "SavedData", in: context)
            let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        
        newEntity.setValue(myVariable.page, forKey: "page")
        
        
        do{
            try context.save()
            print("saved")
        } catch {
            print("failed saving")
        }
    }

    
    override open var shouldAutorotate: Bool {
        if myVariable.state == 5{
          return false
        } else {
            return true
        }
      }
    
    override func didMove(toParent parent: UIViewController?) {
        motionManager.startAccelerometerUpdates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            position = touch.location(in: view)
//            print(position)
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.showMoreStack.transform = .identity
            self.showMoreButton.alpha = 1
        })
    }
    
    @IBAction func showMoreButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.showMoreStack.transform = self.showMoreStack.transform.translatedBy(x: 0, y: self.screenHeight * 0.1124)
            self.showMoreButton.alpha = 0
        },completion: {_ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.showMoreStack.transform = .identity
                    self.showMoreButton.alpha = 1
                })
            })
        })
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        firstLabelTask(state: 1, completion: { (success) in
            if success == true {
            myVariable.state = 2
            }
        })
        self.performSegue(withIdentifier: "BackToViewController", sender: sender)
    }
    
    
    
    
    
    
    
    
    @IBAction func nextPage(_ sender: Any) {
        orientationDetectorSwwitch(Bool: false)
        buttonsEnabled(Bool: false)
        

        myVariable.state += 1
        print("on page ", myVariable.state)
        switch myVariable.state{
        case 5:
            orientationDetectorSwwitch(Bool: true)
            backgroundChangeForward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
            
        case 7:
            orientationDetectorSwwitch(Bool: true)
            backgroundChangeForward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
            
        default:
            backgroundChangeForward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
        }
        
    }
    
    @IBAction func lastPage(_ sender: Any) {
        myVariable.state -= 1
        orientationDetectorSwwitch(Bool: false)
        buttonsEnabled(Bool: false)

        print("on page ", myVariable.state)
            switch myVariable.state{
            case 2:
                self.performSegue(withIdentifier: "BackToViewController", sender: sender)
                
                
            case 5:
                orientationDetectorSwwitch(Bool: true)
                backgroundChangeBackward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)

            default:
                backgroundChangeBackward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
            }
    }
    

    
    func buttonsEnabled(Bool: Bool) {
        switch Bool {
        case true:
            previousButton.isEnabled = true
            nextButton.isEnabled = true
            showMoreButton.isEnabled = true
            UIView.animate(withDuration: 1.0, animations: {
                self.previousButton.alpha = 1
                self.nextButton.alpha = 1
                self.showMoreButton.alpha = 1
            })

            
        default:
            previousButton.isEnabled = false
            nextButton.isEnabled = false
            showMoreButton.isEnabled = false
            previousButton.alpha = 0.4
            nextButton.alpha = 0.4
            showMoreButton.alpha = 0.4
            
        }
    }



    
    func orientationDetectorSwwitch(Bool: Bool) {
        switch Bool {
        case false:
            NotificationCenter.default.removeObserver(self)
        default:
            print("orientation recognizer enabled")
            NotificationCenter.default.addObserver(self, selector:#selector(orientationChanged(notification:)), name: UIDevice.orientationDidChangeNotification, object: UIDevice.current)
        }
        
    }
    
    
    func readAllData() {
        if let url = Bundle.main.url(forResource:"Data", withExtension: "rtf") {
            do {
                let data = try Data(contentsOf:url)
                let attibutedString = try NSAttributedString(data: data, documentAttributes: nil)
                let fullText = attibutedString.string
                labelArray = fullText.components(separatedBy: CharacterSet.newlines)
            } catch {
                print(error)
            }
            print("labelArray ", labelArray)
        }
        
        if let url = Bundle.main.url(forResource:"BackGroundDisplay", withExtension: "rtf") {
            do {
                let data = try Data(contentsOf:url)
                let attibutedString = try NSAttributedString(data: data, documentAttributes: nil)
                let fullText = attibutedString.string
                backgroundAtray = fullText.components(separatedBy: CharacterSet.newlines)
            } catch {
                print(error)
            }
            print("backgroundArray ", backgroundAtray)
        }
        
        getSavedData()
    }
    
    
    func grestureRecognizerSwitch(Bool: Bool) {
            if (Bool == true) {
                leftSwipeGesture.isEnabled = true
                rightSwipeGesture.isEnabled = true
                upSwipeGesture.isEnabled = true
                downSwipeGesture.isEnabled = true
                singleTap.isEnabled = true
            }else if (Bool == false) {
                leftSwipeGesture.isEnabled = false
                rightSwipeGesture.isEnabled = false
                upSwipeGesture.isEnabled = false
                downSwipeGesture.isEnabled = false
                singleTap.isEnabled = false
            }
        }
    
    
    
    
    
    
    //orientation secion
    
    @objc func orientationChanged(notification: NSNotification) {
        if let device = notification.object as? UIDevice {
            switch device.orientation {
            case .portrait:
                portraitOrientationChange()
                print("right")
            case .portraitUpsideDown:
                portraitUpsideDownOrientationChange()
                print("left")
            case .landscapeRight:
                print("up")
                landscapeRightOrientationChange()
            case .landscapeLeft:
                landscapeLeftOrientationChange()
                print("down")
            default:
                flatOrientation()
                print("ha stop")
                return
            }
        }
    }
    
    func portraitOrientationChange() {
        // Change gravity direction
       timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in self.gravityBehavior?.gravityDirection = self.regularGravityVectorCanceller})
        timer.invalidate()
        gravityBehavior?.gravityDirection = regularGravityVector
    }
    

    func portraitUpsideDownOrientationChange() {
        // Flip our gravity
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in self.gravityBehavior?.gravityDirection = self.invertedGravityVectorCanceller})
        timer.invalidate()
        gravityBehavior?.gravityDirection = invertedGravityVector
    }
    
    func landscapeRightOrientationChange() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in self.gravityBehavior?.gravityDirection = self.normalInvertGravityVectorCanceller})
        timer.invalidate()
        gravityBehavior?.gravityDirection = normalInvertGravityVector
    }
    
    func landscapeLeftOrientationChange() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { _ in self.gravityBehavior?.gravityDirection = self.normalRegularGravityVectorCanceller})
        timer.invalidate()
        gravityBehavior?.gravityDirection = normalRegularGravityVector
    }
    
    func flatOrientation() {
        gravityBehavior?.gravityDirection = zeroGravityVector

    }
    
    
    
    
    
    
//    first Task section
    func firstLabelTask(state: Int, completion: (_ success: Bool) -> Void) {
        // Do something
        if state == 0 {
            readAllData()
            self.backgroundChangeForward(imageView: backgroundImageView, delay: 0.2, state: myVariable.state, label: label)
        }else if state == 1{
            myVariable.page = myVariable.state
        } else{
        pageNumberLabelDisplay(label: label, pageNum: state)
        // Call completion, when finished, success or faliure
        }
        completion(true)
    }
    func loadingViewTask(state: Int, completion: (_ success: Bool) -> Void) {
        // Do something
        self.backgroundChangeForward(imageView: backgroundImageView, delay: 0.2, state: myVariable.state, label: label)
        // Call completion, when finished, success or faliure
        completion(true)
    }
    
    func textFieldShouldReturn(_ testingTextfield: UITextField) -> Bool {
        testingTextfield.resignFirstResponder()
        guard let compareNum = Int(testingTextfield.text ?? "3") else { return true}
        testingTextfield.text = nil
        if compareNum >= 3 && compareNum <= 50 {
            if myVariable.state < compareNum {
                myVariable.state = compareNum
            backgroundChangeForward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
            } else if myVariable.state > compareNum {
                myVariable.state = compareNum
            backgroundChangeBackward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
        }
            print("state; ", myVariable.state)
        }
        
        return true
    }
    
    
    override var prefersStatusBarHidden: Bool { return true }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .landscape }
//    override var prefersHomeIndicatorAutoHidden: Bool { return true }
    
    
    @IBAction func rightSwipe(_ sender: Any) {
    }
    
    @IBAction func downSwipe(_ sender: Any) {
    }
    
    @IBAction func leftSwipe(_ sender: Any) {
        print("leftswiperecognize")
    
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
                
                }
//            }
        )}
    }
            
            
            
    @IBAction func upSwipe(_ sender: Any) {
        if myVariable.state == 20 {
        UIImageView.animate(withDuration: 2.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [.curveEaseIn], animations: {
            self.image2.frame.origin.y -= self.screenHeight
        }, completion: nil)
        }
    }
    
    
    func defineStackPosition () {
            showMoreStack.topAnchor.constraint(equalTo: view.topAnchor, constant: -screenHeight * 0.0924).isActive = true
            showMoreStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: screenWidth * 0.375).isActive = true
            showMoreStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -screenWidth * 0.375).isActive = true
            showMoreStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -screenHeight).isActive = true
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
               
       print("here")
           let button = sender as! UIButton
        (segue as! OHCircleSegue).circleOrigin = myVariable.center ?? button.center
       }
       
    
    
    
    
    func getSavedData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedData")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                myVariable.page = data.value(forKey: "page") as! Int
            }
        } catch {
            print("failed to read")
        }
    }
    
    
    
}
extension UIImageView {

    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5
        clipsToBounds = false
    }
    
    func addImagePopShadow() {
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 10
        clipsToBounds = false
    }
}

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}




    
