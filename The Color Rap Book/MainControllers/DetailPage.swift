//
//  DetailPage.swift
//  The Color Rap Book
//
//  Created by 7744 on 2/8/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit
import simd
import CoreMotion
import CoreData
import QuartzCore
import ColorSlider
import SpriteKit
import GameplayKit
import AVFoundation
//import ScratchCard

struct myVariable {
    static var state = 0
    static var allSoundVolume = Float(1.00)
    static var center: CGPoint?
    static var comingFromTableOfContent = false
    static var page = Int()
    static var timer = Timer()
    static var orientation = 4
    static var buttonSoundPlayer: AVAudioPlayer?
    static var backgroundPlayer: AVAudioPlayer?
    static let musicControlPanelStack = MusicPanelControlStack()
}

protocol exitProtocol {
    func exitFromDetailPage()
    func updatePage()
}

class DetailPageController : UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate,exitProtocol, ImagePickerDelegate, AVAudioPlayerDelegate {

    
    
    var printingTimeControl = 0.12
//    var printingTimeControl = 0.0
    
    var position = CGPoint()
    weak var page5Delegate: page5SceneProtocol?
    
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
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet var leftSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var rightSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var upSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var downSwipeGesture: UISwipeGestureRecognizer!
    
    @IBOutlet var singleTap: UITapGestureRecognizer!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var showMoreButton: UIButton!
    
    var scene: Page5Scene?
    
    
    var labelArray = [String]() // do not use NSMutableArray in Swift
    var backgroundAtray = [String]()
    //    var dictClients = [String]()
    
    var player: AVAudioPlayer?
    
    var page23Phase = 0
    
    var page25LeafFalling = false
    

  
    let page23LightLayer = CAShapeLayer()
    
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    

    var drawingToolConstraintsIPhone = [NSLayoutConstraint]()
    var drawingToolConstraintsIPad = [NSLayoutConstraint]()
    
    
//    bottom position is 0, top potision is 1
    var drawingToolPanConstraintsIPhone : [NSLayoutConstraint]?
    var drawingToolPanConstraintsIPad : [NSLayoutConstraint]?
    
    let edgePan = UIScreenEdgePanGestureRecognizer()
    let startButton: UIButton = {
        let button = UIButton()
        button.isExclusiveTouch = true
        return button
    }()
    
    lazy var SpriteView: SKView = {
        let view = SKView()
        view.allowsTransparency  = true
        view.backgroundColor = .clear
        return view
    }()
    
    
    lazy var noPictureButton: UIButton = {
        let button = UIButton()
        button.isExclusiveTouch = true
        return button
    }()
    
   
    lazy var panGesture: CustomPanGestureRecognizer = {
        let gesture = CustomPanGestureRecognizer(target: self, action: #selector(drawingToolsDragged))
        return gesture
    }()
    
    
    let drawingToolPanel: DrawingToolPanel = {
        let panel = DrawingToolPanel()
        panel.undoButton.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        panel.redoButton.addTarget(self, action: #selector(handleRedo), for: .touchUpInside)
        panel.clearButton.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        panel.completeButton.addTarget(self, action: #selector(handleComplete), for: .touchUpInside)
        panel.backgroundChangeButton.addTarget(self, action: #selector(handleChangeBackground), for: .touchUpInside)
        panel.pencilButton.addTarget(self, action: #selector(pencilButtonClicked), for: .touchUpInside)
        panel.penButton.addTarget(self, action: #selector(penButtonClicked), for: .touchUpInside)
        panel.brushButton.addTarget(self, action: #selector(brushButtonClicked), for: .touchUpInside)
        return panel
    }()
    

    lazy var colorSlider: ColorSlider = {
        let slider = ColorSlider(orientation: .horizontal, previewSide: .top)
        slider.addTarget(self, action: #selector(changedColor), for: .valueChanged)

        slider.addTarget(self, action: #selector(touchUpFinished), for: [.touchUpInside, .touchUpOutside])

        slider.isExclusiveTouch = true
        return slider
    }()
    
            
       
       lazy var startOverButton: UIButton = {
           let button = UIButton(type: .custom)
           button.setImage(UIImage(named: "startOver"), for: .normal)
           button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(startOverTap), for: .touchUpInside)
           return button
       }()
       
       lazy var readLaterButton: UIButton = {
              let button = UIButton(type: .custom)
              button.setImage(UIImage(named: "readLater"), for: .normal)
              button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(readLaterTap), for: .touchUpInside)
              return button
          }()
    
    lazy var lastPageButtonStack: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.distribution = .fillProportionally
//            stackView.spacing = UIScreen.main.bounds.height * 0.2
            stackView.alpha = 0
        stackView.addArrangedSubview(self.startOverButton)
        stackView.addArrangedSubview(self.readLaterButton)
            return stackView
        }()

    lazy var backgroundColors = [UIColor()]
//    var alertStyle: UIAlertController.Style = .actionSheet
    var imagePicker: ImagePicker!
   
    var page47Phase = 0
//    0 represents the setup if the user visit page 47 for the first time
//    1 represents when the user chooses and image and starts drawing
//    2 represents when the user hits "complete" button and enters in to the last phase of page 47

    var drawingPageBackgroundImage: UIImage?
  
    
    var isObserving = Bool()

   
    
       
//    let alert = UIAlertController( title: "Title", message: "Message", preferredStyle: .alert)
    
//    set up functions

    
    fileprivate func setUpDetailPageNotifications() {
        self.setUpAudioInterruptionNotification()
        
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged(notification:)), name: UIDevice.orientationDidChangeNotification, object: UIDevice.current)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleEnteringForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    fileprivate func setUpTextField() {
          //
          testingTextfield.backgroundColor = .white
          testingTextfield.textAlignment = .center
          testingTextfield.frame = CGRect(x: screenWidth * 0.63, y: screenHeight * 0.03, width: screenWidth * 0.2, height: 34)
          testingTextfield.attributedPlaceholder = NSAttributedString(string: "Page \(myVariable.state)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray.withAlphaComponent(0.8)])
          self.testingTextfield.delegate = self
          testingTextfield.textColor = .black
      }
    
    
      //    Override Functions
  
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
//        print("views, ", view.subviews)
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)

        nextButton.isExclusiveTouch = true
        previousButton.isExclusiveTouch = true
        showMoreButton.isExclusiveTouch = true
        setUpDetailPageNotifications()
        
        print(myVariable.state)
        
        setUpStackView()

        
        
        firstLabelTask(state: 0, completion: {(success) in
            if success == true {
                

                testingTextfield.alpha = 0
                edgePan.addTarget(self, action: #selector(screenEdgeSwiped))
                edgePan.edges = .left
                view.addGestureRecognizer(edgePan)
                myVariable.page = myVariable.state
                cloudsFloatingEffect(leftCloud: previousButton, rightCloud: nextButton)
                label.isHighlighted = false
                label.alpha = 0
                startButton.alpha = 0
                noPictureButton.alpha = 0
                
                grestureRecognizerSwitch(Bool: false)
                
                setUpTextField()
                
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
                 view.addSubview(lastPageButtonStack)
                print("pagenumberSaved ",myVariable.page)
                
                
        
            
            }
            
        })
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.pageNumberBackgroundDisplay(imageView: backgroundImageView, pageNum: myVariable.state)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        buttonsEnabled(Bool: false)
        self.loadingViewChange(state: myVariable.state, label: self.label)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
        removeOrientationObserver()
        saveData()
    }
    
    override open var shouldAutorotate: Bool {
        if myVariable.state == 5 {
            return false
        } else {
            return true
        }
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            position = touch.location(in: view)
//                        print(position)
        }
//        If you click the screen, house button shows up
//        UIView.animate(withDuration: 0.5, animations: {
//
//            self.showMoreButton.alpha = 1
//        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        
        print("here")
        if (sender is DetailPageController) {
//            myVariable.state = 2
//            (segue as! OHCircleSegue).circleOrigin = myVariable.center ?? CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.5)
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
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
         return [.top]
    }
    
    
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
//            print("labelArray ", labelArray)
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
//            print("backgroundArray ", backgroundAtray)
        }
        
        getSavedData()
    }
    
    
    
    
   
    
    //    protocol functions called by Menu Controller
    @objc func exitFromDetailPage() {
        print("exiting!!!!!")
        if myVariable.state != 48 {
             myVariable.page = myVariable.state
                  
        } else {
             myVariable.page = 3
        }
        saveData()
        self.SpriteView.scene?.isPaused = true
        self.SpriteView.scene?.removeFromParent()
        
        performSegue(withIdentifier: "BackToSplashScreen", sender: self)
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
        myVariable.buttonSoundPlayer?.play()
        gotoVCB()
    }
    
    
    
    
    @IBAction func singleTapped(_ sender: Any) {
        singleTapHandler(state: myVariable.state)
    }
    
    
    
    @IBAction func nextPage(_ sender: Any) {
        buttonsEnabled(Bool: false)
        myVariable.state += 1
        myVariable.page = myVariable.state
        if myVariable.state != 48 {
             myVariable.page = myVariable.state
                  
        } else {
             myVariable.page = 3
        }
        saveData()
        if myVariable.state != 5 {
//            cloudsFloatingEffect(leftCloud: previousButton, rightCloud: nextButton)
        }
        print("on page ", myVariable.state)
        backgroundChangeForward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
    }
    
    
    
    
    @IBAction func lastPage(_ sender: Any) {
        myVariable.state -= 1
        if myVariable.state != 48 {
                    myVariable.page = myVariable.state
                         
               } else {
                    myVariable.page = 3
               }
        saveData()
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
    
    

    
    
    
    
    @IBAction func leftSwipe(_ sender: Any) {
        print("leftswiperecognize")
        
        if myVariable.state == 20 {
            leftSwipeHandler()
        }
//        if myVariable.state == 30 {
//            singleTapHandler(state: myVariable.state)
//        }
        
    }
    
    @IBAction func rightSwipeGesture(_ sender: Any) {
        print("Rightswiperecognize")
//
//        if myVariable.state == 30 {
//            singleTapHandler(state: myVariable.state)
//        }
    }
    
    
    @IBAction func upSwipeGesture(_ sender: Any) {
        print("upSwiperecognize")

        if myVariable.state == 30 {
            singleTapHandler(state: myVariable.state)
        }
    }
    
    
    @IBAction func downSwipeGesture(_ sender: Any) {
        print("downSwiperecognize")
        if myVariable.state == 30 {
            singleTapHandler(state: myVariable.state)
        }
    }
    
    
    
    
    //    first Task section: cannot move on until these functions are compelted
    func firstLabelTask(state: Int, completion: (_ success: Bool) -> Void) {
        // Do something
        if state == 0 {
            readAllData()
            if myVariable.state == 3 {
            self.backgroundImageView.backgroundColor = .systemPink
            }
            canvas.alpha = 0
            self.canvas.frame = self.view.frame
            canvas.isHidden = true

            self.SpriteView.isHidden = true
            self.SpriteView.alpha = 0
            self.SpriteView.backgroundColor =  .clear
            self.SpriteView.frame = CGRect(x: 0, y: screenHeight * 2, width: screenWidth, height: screenHeight)
            view.layer.addSublayer(page23LightLayer)
            
//            view.addSubview(page30ScratchCard)
//            page30ScratchCard.alpha = 0
        
        
        }else if state == 1{
            myVariable.page = myVariable.state
        } else{
            pageNumberLabelDisplay(label: label, pageNum: state)
            // Call completion, when finished, success or faliure
        }
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
        myVariable.buttonSoundPlayer?.play()
        myVariable.state += 1
        backgroundChangeForward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
        
    }
    @objc func startOverTap() {
           myVariable.buttonSoundPlayer?.play()
           exitFromDetailPage()
       }
    
    @objc func readLaterTap() {
        myVariable.buttonSoundPlayer?.play()
        exitApp()
    }
    
    @objc func exitApp() {
        exit(0)
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

extension UIView {

    func addShadow(size: CGFloat) {
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 50, height: 50)
    layer.shadowOpacity = 0.8
    layer.shadowRadius = size
    clipsToBounds = false
}
    
    func addButtonShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5
        clipsToBounds = false
    }

}



    
