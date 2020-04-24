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
import QuartzCore


struct myVariable {
    static var state = 0
    static var center: CGPoint?
    static var comingFromTableOfContent = false
    static var page = Int()
    static var timer = Timer()
}

protocol exitProtocol {
    func exitFromDetailPage()
    func updatePage()
}

class DetailPageController : UIViewController, UITextFieldDelegate,exitProtocol {
    
    
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
    @IBOutlet weak var canvas: Canvas!
    
    @IBOutlet var leftSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var upSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var rightSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var downSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var singleTap: UITapGestureRecognizer!
    //    @IBOutlet var panGesture: CustomPanGestureRecognizer!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var showMoreButton: UIButton!
    
    var labelArray = [String]() // do not use NSMutableArray in Swift
    var backgroundAtray = [String]()
    //    var dictClients = [String]()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label1: UILabel!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let edgePan = UIScreenEdgePanGestureRecognizer()
    let startButton = UIButton()
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = UIFont(name: "Morgan_bold", size: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleUndo() {
        print("undo the line drawn")
        canvas.undo()
        
    }
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = UIFont(name: "Morgan_bold", size: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()
    
//
//    let yellowButton: UIButton = {
//
//        let button = UIButton
//    }
//
    @objc func handleClear() {
        canvas.clear()
    }
    
    
    
    
    let stackView = UIStackView()
    
    

    var backgroundColors = [UIColor()]
    
    //    Override Functions
    
    
    
    fileprivate func setUpStackView() {
        view.addSubview(stackView)
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(undoButton)
        stackView.addArrangedSubview(clearButton)
        stackView.frame = CGRect(x: self.screenWidth * 0.2, y: self.screenHeight * 0.87, width: self.screenWidth * 0.6 , height: self.screenHeight * 0.1)
        //        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //        stackView.widthAnchor.constraint(equalToConstant: self.screenWidth * 0.6).isActive = true
        //        stackView.heightAnchor.constraint(equalToConstant: self.screenHeight * 0.3).isActive = true
        //        stackView.center.x = self.screenWidth / 2
//        stackView.addBackground(color: .red)
        stackView.alpha = 0
        print("stackLeadAnchor", stackView.leadingAnchor)
        print("stacktrailanchor", stackView.trailingAnchor)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        if UIDevice.current.userInterfaceIdiom == .pad
        print(myVariable.state)
          NotificationCenter.default.addObserver(self, selector: #selector(handleEnteringForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        setUpStackView()

        
        firstLabelTask(state: 0, completion: {(success) in
            if success == true {
    
                edgePan.addTarget(self, action: #selector(screenEdgeSwiped))
                edgePan.edges = .left
                view.addGestureRecognizer(edgePan)
                myVariable.page = myVariable.state
                cloudsFloatingEffect(leftCloud: previousButton, rightCloud: nextButton)
                label.isHighlighted = false
                label.alpha = 0
                startButton.alpha = 0
                grestureRecognizerSwitch(Bool: false)
                testingTextfield.backgroundColor = .white
                testingTextfield.textAlignment = .center
                testingTextfield.frame = CGRect(x: screenWidth * 0.63, y: screenHeight * 0.03, width: screenWidth * 0.2, height: 34)
                testingTextfield.attributedPlaceholder = NSAttributedString(string: "Page \(myVariable.state)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray.withAlphaComponent(0.8)])
                self.testingTextfield.delegate = self
                testingTextfield.textColor = .black
                self.previousButton.backgroundColor = .clear
                self.labelTextDisappearing(label: label)
                
                self.previousButton.frame = CGRect(x: screenWidth * 0.02, y: screenHeight * 0.02, width: screenWidth * 0.07, height: (screenWidth * 0.0724) * 0.7)
                self.previousButton.backgroundColor = .clear
                
                self.previousButton.setImage(UIImage(named: "goBack"), for: .normal)
                
                self.nextButton.frame = CGRect(x: screenWidth * 0.91, y: screenHeight * 0.02, width: screenWidth * 0.07, height: (screenWidth * 0.0724) * 0.7)
                self.nextButton.backgroundColor = .clear
                self.nextButton.setImage(UIImage(named: "nextPage"), for: .normal)
                
                self.showMoreButton.frame = CGRect(x: screenWidth * 0.48, y: screenHeight * 0.02, width: screenWidth * 0.0283, height: screenWidth * 0.03)
                showMoreButton.setImage(UIImage(named: "showMoreHouse"), for: .normal)
                print("pagenumberSaved ",myVariable.page)
            }
            
        })
        
        // Listen for orientation changes
    }
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
        saveData()
    }
    
    override open var shouldAutorotate: Bool {
        if myVariable.state == 5 {
            return false
        } else {
            return true
        }
    }
    
    
    
    override func didMove(toParent parent: UIViewController?) {
        motionManager.startAccelerometerUpdates()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            position = touch.location(in: view)
            //            print(position)
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.showMoreButton.alpha = 1
        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        
        print("here")
        if (sender is DetailPageController) {
            myVariable.state = 2
            (segue as! OHCircleSegue).circleOrigin = myVariable.center ?? CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.5)
        } else {
            if sender as! UIButton? === showMoreButton {
            } else if sender as AnyObject? === DetailPageController.self {
                
            } else{
                let button = sender as! UIButton
                (segue as! OHCircleSegue).circleOrigin = myVariable.center ?? button.center
            }
        }
    }
    
    
    
    override var prefersStatusBarHidden: Bool { return true }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .landscape }
    
    
    
    
    //    Read Data
    
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
    
    
    
    
    
    
    //    protocol functions called by Menu Controller
    func exitFromDetailPage() {
        print("exiting!!!!!")
        myVariable.page = myVariable.state
        saveData()
        
        performSegue(withIdentifier: "BackToViewController", sender: self)
    }
    
    func updatePage() {
        if myVariable.state > myVariable.page {
            backgroundChangeForward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
        } else if myVariable.state < myVariable.page {
            backgroundChangeBackward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
        }
        myVariable.page = myVariable.state
        saveData()
        
    }
    
    
    
    //    function calling the Menu Controller
    func gotoVCB() {
        let mc = MenuController()
        mc.exitDelegate = self
        mc.modalPresentationStyle = .custom
        self.present(mc, animated: true, completion: nil)
    }
    
    
    
    
    
    //    IBAction functions
    
    @IBAction func showMoreButtonTapped(_ sender: Any) {
        gotoVCB()
    }
    
    
    
    
    @IBAction func singleTapped(_ sender: Any) {
        singleTapHandler(state: myVariable.state)
    }
    
    
    
    @IBAction func nextPage(_ sender: Any) {
        orientationDetectorSwwitch(Bool: false)
        buttonsEnabled(Bool: false)
        myVariable.state += 1
        myVariable.page = myVariable.state
        saveData()
        if myVariable.state != 5 {
//            cloudsFloatingEffect(leftCloud: previousButton, rightCloud: nextButton)
        }
        print("on page ", myVariable.state)
        backgroundChangeForward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
    }
    
    
    
    
    @IBAction func lastPage(_ sender: Any) {
        myVariable.state -= 1
        myVariable.page = myVariable.state
        saveData()
        orientationDetectorSwwitch(Bool: false)
        buttonsEnabled(Bool: false)
        if myVariable.state != 5 {
//            cloudsFloatingEffect(leftCloud: previousButton, rightCloud: nextButton)
            
        }
        
        print("on page ", myVariable.state)
        switch myVariable.state{
        case 2:
            self.exitFromDetailPage()
            
        default:
            backgroundChangeBackward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
        }
    }
    
    
    @IBAction func rightSwipe(_ sender: Any) {
    }
    
    @IBAction func downSwipe(_ sender: Any) {
    }
    
    @IBAction func leftSwipe(_ sender: Any) {
        //        print("leftswiperecognize")
        leftSwipeHandler(state: myVariable.state)
        
    }
    
    @IBAction func upSwipe(_ sender: Any) {
    }
    
    
    
    
    
    //    first Task section: cannot move on until these functions are compelted
    func firstLabelTask(state: Int, completion: (_ success: Bool) -> Void) {
        // Do something
        if state == 0 {
            readAllData()
            if myVariable.state == 3 {
            self.backgroundImageView.backgroundColor = .systemPink
            }
//            view.addSubview(canvas)
            canvas.alpha = 0
            self.canvas.frame = self.view.frame
            canvas.isHidden = true
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
    

    
//    @objc functions
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
    if recognizer.state == .recognized {
        print("Screen edge swiped!")
        gotoVCB()
        }
        
    }
    
    @objc func handleEnteringForeground() {
        self.cloudsFloatingEffect(leftCloud: previousButton, rightCloud: nextButton)
    }
    
    
    @objc func startButtonTap() {
        myVariable.state += 1
        backgroundChangeForward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
        
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
    
    func addCustomImagePopShadow(radius: CGFloat) {
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = radius
        clipsToBounds = false
    }
    
    func removeShadow() {
        layer.shadowOpacity = 0
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




    
