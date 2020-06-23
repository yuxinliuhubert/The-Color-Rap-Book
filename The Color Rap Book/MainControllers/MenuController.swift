//
//  MenuController.swift
//  The Color Rap Book
//
//  Created by 7744 on 4/16/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit



final class MenuController: UIViewController {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    

    let data = [
        CustomData(title: "red", image: #imageLiteral(resourceName: "2_red is red"), pageNum: 4),
        CustomData(title: "blue", image: #imageLiteral(resourceName: "11_blue is blue"), pageNum: 9),
        CustomData(title: "yellow", image: #imageLiteral(resourceName: "16_yellow is yellow 061319"), pageNum: 14),
        CustomData(title: "green", image: #imageLiteral(resourceName: "17_green is green new"), pageNum: 19),
        CustomData(title: "orange", image: #imageLiteral(resourceName: "22_orange is orange"), pageNum: 24),
        CustomData(title: "purple", image: #imageLiteral(resourceName: "26_purple is purple not spelled out new"), pageNum: 28),
        CustomData(title: "brown", image: #imageLiteral(resourceName: "30_brown is brown new"), pageNum: 32),
        CustomData(title: "black", image: #imageLiteral(resourceName: "38_back in black new"), pageNum: 36),
        CustomData(title: "white", image: #imageLiteral(resourceName: "39_white is white new"), pageNum: 41)
        
    ]
    
    fileprivate let collectionView: UICollectionView = {
        let layout = VegaScrollFlowLayout()
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
    }()
    
    
    
    lazy var backdropView: UIView = {
        let bdView = UIView(frame: self.view.bounds)
        bdView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return bdView
    }()
    let menuLabel = UILabel()
    let menuView = UIView()
    let menuWidth = UIScreen.main.bounds.width * 0.4
    let homeButton = UIButton()
    var isPresenting = false
    var exitDelegate: exitProtocol?
    var shapeLayer: CAShapeLayer!
    var shapeLayer1: CAShapeLayer!
    var shapeLayer2: CAShapeLayer!
    var shapeLayer3: CAShapeLayer!
    var shapeLayer4: CAShapeLayer!
    var shapeLayer5: CAShapeLayer!
    var shapeLayer6: CAShapeLayer!
    var shapeLayer7: CAShapeLayer!
    var shapeLayer8: CAShapeLayer!
    var shapeLayer9: CAShapeLayer!
    var trackLayer: CAShapeLayer!
    var pulsatingLayer: CAShapeLayer!
    let percentageLabel: UILabel = {
        let label = UILabel()
        //        label.text = "\nread"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        
        label.font = UIFont(name: "Morgan_bold", size: 32)
        return label
    }()

    
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    //    override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isExclusiveTouch = true
        homeButton.isExclusiveTouch = true
        collectionView.isExclusiveTouch = true

        setupNotificationObservers()
        view.addSubview(backdropView)
        
        //        create my track layer
        
       
        
        pulsatingLayer = createShapeLayer(strokeColor: .clear, fillColor: .cyan, lineWidth: height * 0.02)
        view.layer.addSublayer(pulsatingLayer)
        
        trackLayer = createShapeLayer(strokeColor: .lightGray, fillColor: .cyan, lineWidth: height * 0.04)
        view.layer.addSublayer(trackLayer)
        
        shapeLayer = createShapeLayer(strokeColor: .red, fillColor: .clear, lineWidth: height * 0.04)
              shapeLayer.strokeEnd = 0
              shapeLayer.strokeColor = setupStrokeColor()
              view.layer.addSublayer(shapeLayer)
//        set up rainbow pulsating layer
        if myVariable.state == 3 || myVariable.state == 47 {
            print("rainbow stroke code section")
            shapeLayer1 = createShapeLayer(strokeColor: .red, fillColor: .clear, lineWidth: height * 0.04)
            shapeLayer1.strokeEnd = 0
//            shapeLayer1.strokeColor = setupRainbowStrokeColor(color: "red")
            
//            shapeLayer2 = createShapeLayer(strokeColor: .blue, fillColor: .clear, lineWidth: height * 0.04)
//            shapeLayer2.strokeEnd = 0
////            shapeLayer2.strokeColor = setupRainbowStrokeColor(color: "blue")
//
//            shapeLayer3 = createShapeLayer(strokeColor: .yellow, fillColor: .clear, lineWidth: height * 0.04)
//            shapeLayer3.strokeEnd = 0
////            shapeLayer3.strokeColor = setupRainbowStrokeColor(color: "yellow")
//
//            shapeLayer4 = createShapeLayer(strokeColor: .green, fillColor: .clear, lineWidth: height * 0.04)
//            shapeLayer4.strokeEnd = 0
////            shapeLayer4.strokeColor = setupRainbowStrokeColor(color: "green")
//
//            shapeLayer5 = createShapeLayer(strokeColor: .orange, fillColor: .clear, lineWidth: height * 0.04)
//            shapeLayer5.strokeEnd = 0
////            shapeLayer5.strokeColor = setupRainbowStrokeColor(color: "orange")
//
//            shapeLayer6 = createShapeLayer(strokeColor: .purple, fillColor: .clear, lineWidth: height * 0.04)
//            shapeLayer6.strokeEnd = 0
////            shapeLayer6.strokeColor = setupRainbowStrokeColor(color: "purple")
//
//            shapeLayer7 = createShapeLayer(strokeColor: .brown, fillColor: .clear, lineWidth: height * 0.04)
//            shapeLayer7.strokeEnd = 0
////            shapeLayer7.strokeColor = setupRainbowStrokeColor(color: "brown")
//
//            shapeLayer8 = createShapeLayer(strokeColor: .black, fillColor: .clear, lineWidth: height * 0.04)
//            shapeLayer8.strokeEnd = 0
////            shapeLayer8.strokeColor = setupRainbowStrokeColor(color: "black")
//
//            shapeLayer9 = createShapeLayer(strokeColor: .white, fillColor: .clear, lineWidth: height * 0.04)
//            shapeLayer9.strokeEnd = 0
////            shapeLayer9.strokeColor = setupRainbowStrokeColor(color: "white")
//
//
////
//            view.layer.addSublayer(shapeLayer9)
//            view.layer.addSublayer(shapeLayer8)
//            view.layer.addSublayer(shapeLayer7)
//            view.layer.addSublayer(shapeLayer6)
//            view.layer.addSublayer(shapeLayer5)
//            view.layer.addSublayer(shapeLayer4)
//            view.layer.addSublayer(shapeLayer3)
//            view.layer.addSublayer(shapeLayer2)
            view.layer.addSublayer(shapeLayer1)
        }
//        else {
      
//        }
        
        
        view.backgroundColor = .clear

        view.addSubview(menuView)
        view.addSubview(menuLabel)
        view.addSubview(homeButton)
        view.addSubview(percentageLabel)
    
        
        
        percentageLabel.frame = CGRect(x: 0, y: 0, width: self.height * 0.25, height: self.height * 0.25)
        //        percentageLabel.backgroundColor = .red
        percentageLabel.center = shapeLayer.position
        
        //        animateStroke()
        
        
        
        menuView.backgroundColor = .clear
        
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.widthAnchor.constraint(equalToConstant: menuWidth).isActive = true
        menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MenuController.handleTap(_:)))
        backdropView.addGestureRecognizer(tapGesture)
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: width * 0.10 + 30).isActive = true
        //        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: width * 0.1267 + 60).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.widthAnchor.constraint(equalTo: menuView.widthAnchor, multiplier: 1).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -height * 0.01208).isActive = true
        
        
        
        homeButton.frame = CGRect(x: width * 0.01653, y: height * 0.02, width: width * 0.13, height: width * 0.10)
        homeButton.setImage(UIImage(named: "home"), for: .normal)
        homeButton.addTarget(self, action: #selector(handleHome(_:)), for: .touchUpInside)
        
        menuLabel.frame = CGRect(x: width * 0.1653, y: height * 0.02, width: width * 0.20, height: width * 0.10)
        menuLabel.text = "Menu"
        menuLabel.font = UIFont(name: "Morgan_bold", size: 80)
        menuLabel.adjustsFontSizeToFitWidth = true
        menuLabel.textAlignment = .center
        menuLabel.textColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        //        let displayIndexPathInInt = Int()
        //        let displayIndexPath = displayIndexPathInInt.setCollectionViewDisplayCell()
        //        print("displayIndexPath:", displayIndexPath)
        //        collectionView.scrollToItem(at: IndexPath(row: 0, section: displayIndexPath), at: [], animated: false)
    }
    
    
    override var prefersStatusBarHidden: Bool { return true }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
        
    }
    
    
    
    
    //    func
    
    private func createShapeLayer(strokeColor:UIColor, fillColor: UIColor, lineWidth: CGFloat) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let barCenter = CGPoint(x: width * 0.7, y: height * 0.3)
        let circularPath = UIBezierPath(arcCenter: .zero, radius: height * 0.2, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.position = barCenter
        layer.path = circularPath.cgPath
        layer.fillColor = fillColor.cgColor
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = lineWidth
        layer.lineCap = .round
        layer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
        return layer
    }
    
    
    
    
    private func animateStroke() {
        
        switch myVariable.state {
        case 3:
            //            rainbow bar set up
            
              let basicAnimation1 = setUpRainbowStrokeAnimation(percentage: Float(9.00/9.00))
            
//            let basicAnimation1 = setUpRainbowStrokeAnimation(percentage: Float(1.00/9.00))
//            let basicAnimation2 = setUpRainbowStrokeAnimation(percentage: Float(2.00/9.00))
//            let basicAnimation3 = setUpRainbowStrokeAnimation(percentage: Float(3.00/9.00))
//            let basicAnimation4 = setUpRainbowStrokeAnimation(percentage: Float(4.00/9.00))
//            let basicAnimation5 = setUpRainbowStrokeAnimation(percentage: Float(5.00/9.00))
//            let basicAnimation6 = setUpRainbowStrokeAnimation(percentage: Float(6.00/9.00))
//            let basicAnimation7 = setUpRainbowStrokeAnimation(percentage: Float(7.00/9.00))
//            let basicAnimation8 = setUpRainbowStrokeAnimation(percentage: Float(8.00/9.00))
//            let basicAnimation9 = setUpRainbowStrokeAnimation(percentage: Float(9.00/9.00))
            //            let percentage = Float(myVariable.state)/Float(47.0)
            
            percentageLabel.adjustsFontSizeToFitWidth = true
            //            let percentage100 = percentage.roundToTenth()
            //            percentageLabel.text = "\(percentage100)%\nread"
            shapeLayer1.add(basicAnimation1, forKey: "basic1")
            
            animateStrokeColor()
              
              
//            shapeLayer2.add(basicAnimation2, forKey: "basic2")
//            shapeLayer3.add(basicAnimation3, forKey: "basic3")
//            shapeLayer4.add(basicAnimation4, forKey: "basic4")
//            shapeLayer5.add(basicAnimation5, forKey: "basic5")
//            shapeLayer6.add(basicAnimation6, forKey: "basic6")
//            shapeLayer7.add(basicAnimation7, forKey: "basic7")
//            shapeLayer8.add(basicAnimation8, forKey: "basic8")
//            shapeLayer9.add(basicAnimation9, forKey: "basic9")
            
            
            
            percentageLabel.text = "Ready to start?"
//        case 47:
//            let basicAnimation1 = setUpRainbowStrokeAnimation(percentage: Float(1.00/9.00))
//            let basicAnimation2 = setUpRainbowStrokeAnimation(percentage: Float(2.00/9.00))
//            let basicAnimation3 = setUpRainbowStrokeAnimation(percentage: Float(3.00/9.00))
//            let basicAnimation4 = setUpRainbowStrokeAnimation(percentage: Float(4.00/9.00))
//            let basicAnimation5 = setUpRainbowStrokeAnimation(percentage: Float(5.00/9.00))
//            let basicAnimation6 = setUpRainbowStrokeAnimation(percentage: Float(6.00/9.00))
//            let basicAnimation7 = setUpRainbowStrokeAnimation(percentage: Float(7.00/9.00))
//            let basicAnimation8 = setUpRainbowStrokeAnimation(percentage: Float(8.00/9.00))
//            let basicAnimation9 = setUpRainbowStrokeAnimation(percentage: Float(9.00/9.00))
//            //            let percentage = Float(myVariable.state)/Float(47.0)
//
//            percentageLabel.adjustsFontSizeToFitWidth = true
//            //            let percentage100 = percentage.roundToTenth()
//            //            percentageLabel.text = "\(percentage100)%\nread"
//            shapeLayer1.add(basicAnimation1, forKey: "basic1")
//            shapeLayer2.add(basicAnimation2, forKey: "basic2")
//            shapeLayer3.add(basicAnimation3, forKey: "basic3")
//            shapeLayer4.add(basicAnimation4, forKey: "basic4")
//            shapeLayer5.add(basicAnimation5, forKey: "basic5")
//            shapeLayer6.add(basicAnimation6, forKey: "basic6")
//            shapeLayer7.add(basicAnimation7, forKey: "basic7")
//            shapeLayer8.add(basicAnimation8, forKey: "basic8")
//            shapeLayer9.add(basicAnimation9, forKey: "basic9")
//            percentageLabel.text = "Your page looks awesome!"
        default:
            
            let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
            let percentage = Float(myVariable.state)/Float(47.0)
            print("percentage", percentage)
            //        shapeLayer.strokeEnd = CGFloat(percentage)
            basicAnimation.toValue = CGFloat(percentage)
            basicAnimation.duration = 1
            basicAnimation.fillMode = .forwards
            basicAnimation.isRemovedOnCompletion = false
            percentageLabel.adjustsFontSizeToFitWidth = true
            let percentage100 = percentage.roundToTenth()
            percentageLabel.text = "\(percentage100)%\nread"
            shapeLayer.add(basicAnimation, forKey: "basic")
           
        }
    }
 
    private func setUpRainbowStrokeAnimation(percentage: Float) -> CABasicAnimation {
        print("didcreantemultiplelayers")
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
          //            print("percentage", percentage)
          //        shapeLayer.strokeEnd = CGFloat(percentage)
          basicAnimation.toValue = CGFloat(percentage)
          basicAnimation.duration = 1
          basicAnimation.fillMode = .forwards
          basicAnimation.isRemovedOnCompletion = false
        return basicAnimation
      }
    
    private func animatePulsatinglayer(){
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.3
        animation.duration = 1
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        pulsatingLayer.add(animation, forKey: "pulsating")
    }
    
    private func setupNotificationObservers() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    private func setupStrokeColor() -> CGColor {
        switch myVariable.state {
        case 4...8:
            return UIColor.red.cgColor
        case 9...13:
            return UIColor.blue.cgColor
        case 14...18:
            return UIColor.yellow.cgColor
        case 19...23:
            return UIColor.green.cgColor
        case 24...27:
            return UIColor.orange.cgColor
        case 28...31:
            return UIColor.purple.cgColor
        case 32...35:
            return UIColor.brown.cgColor
        case 36...40:
            return UIColor.black.cgColor
        case 41...44:
            return UIColor.white.cgColor
        default:
            return UIColor.red.cgColor
        }
    }
    
//    private func setupRainbowStrokeColor(color: String) -> CGColor {
//           switch color {
//           case "red":
//               return UIColor.red.cgColor
//           case "blue":
//               return UIColor.blue.cgColor
//           case "yellow":
//               return UIColor.yellow.cgColor
//           case "green":
//               return UIColor.green.cgColor
//           case "orange":
//               return UIColor.orange.cgColor
//           case "purple":
//               return UIColor.purple.cgColor
//           case "brown":
//               return UIColor.brown.cgColor
//           case "black":
//               return UIColor.black.cgColor
//           case "white":
//               return UIColor.white.cgColor
//           default:
//               return UIColor.red.cgColor
//           }
//       }

    
    func animateStrokeColor () {
        let backgroundColors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.orange.cgColor, UIColor.purple.cgColor, UIColor.brown.cgColor, UIColor.black.cgColor, UIColor.white.cgColor]
        let randomNum = Int.random(in: 0...8)
        self.shapeLayer1.strokeColor =  backgroundColors[randomNum];
        
        myVariable.timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: {_ in
           
            UIView.animate(withDuration: 1.5, delay: 0, options: [.curveEaseInOut, .repeat], animations: { () -> Void in
                 let randomNum = Int.random(in: 0...8)
                self.shapeLayer1.strokeColor =  backgroundColors[randomNum];
                
            })
        })
        
// 
              
    
            
            
            

           
       }
    
    
//    @objc functions
    
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        myVariable.timer.invalidate()
//        self.view.layer.removeAllAnimations()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleHome(_ sender: UIButton) {
         myVariable.timer.invalidate()
//        self.view.layer.removeAllAnimations()
        dismiss(animated: true, completion: {
            self.exitDelegate?.exitFromDetailPage()
        })
    }
    @objc func handleEnterForeground(){
        animatePulsatinglayer()
    }
}








extension MenuController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width * 0.95
        let cellHeight = cellWidth * 0.70
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("indexpath::", indexPath )
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        myVariable.state = cell.data!.pageNum
        dismiss(animated: true, completion: {
            self.exitDelegate?.updatePage()
        
        })
        
    }
    
    
    
}





extension MenuController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        guard let toVC = toViewController else { return }
        isPresenting = !isPresenting
        
        if isPresenting == true {
            containerView.addSubview(toVC.view)
            
            menuView.frame.origin.x -= menuWidth
            collectionView.frame.origin.x -= menuWidth
            menuLabel.frame.origin.x -= menuWidth
            homeButton.frame.origin.x -= menuWidth
            shapeLayer.opacity = 0
            
             if myVariable.state == 3 || myVariable.state == 47 {
            shapeLayer1.opacity = 0
//                self.animateStrokeColor()
//            shapeLayer2.opacity = 0
//            shapeLayer3.opacity = 0
//            shapeLayer4.opacity = 0
//            shapeLayer5.opacity = 0
//            shapeLayer6.opacity = 0
//            shapeLayer7.opacity = 0
//            shapeLayer8.opacity = 0
//            shapeLayer9.opacity = 0
            }
            
            backdropView.alpha = 0
            percentageLabel.alpha = 0
            trackLayer.opacity = 0
            pulsatingLayer.opacity = 0
            
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.x += self.menuWidth
                self.collectionView.frame.origin.x += self.menuWidth
                self.menuLabel.frame.origin.x += self.menuWidth
                self.homeButton.frame.origin.x += self.menuWidth
                self.shapeLayer.opacity = 1
                
                 if myVariable.state == 3 || myVariable.state == 47 {
                self.shapeLayer1.opacity = 1
//                    self.animateStrokeColor()
//                self.shapeLayer2.opacity = 1
//                self.shapeLayer3.opacity = 1
//                self.shapeLayer4.opacity = 1
//                self.shapeLayer5.opacity = 1
//                self.shapeLayer6.opacity = 1
//                self.shapeLayer7.opacity = 1
//                self.shapeLayer8.opacity = 1
//                self.shapeLayer9.opacity = 1
                }
                
                self.backdropView.alpha = 1
                self.percentageLabel.alpha = 1
                
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
                self.animateStroke()
                self.animatePulsatinglayer()
                UIView.animate(withDuration: 1, animations: {
                    self.trackLayer.opacity = 0.9
                    self.pulsatingLayer.opacity = 0.3
                })
            })
        } else {
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.x -= self.menuWidth
                self.collectionView.frame.origin.x -= self.menuWidth
                self.menuLabel.frame.origin.x -= self.menuWidth
                self.homeButton.frame.origin.x -= self.menuWidth
                self.shapeLayer.opacity = 0
                if myVariable.state == 3 || myVariable.state == 47 {
                    self.shapeLayer1.opacity = 0
//                    self.shapeLayer2.opacity = 0
//                    self.shapeLayer3.opacity = 0
//                    self.shapeLayer4.opacity = 0
//                    self.shapeLayer5.opacity = 0
//                    self.shapeLayer6.opacity = 0
//                    self.shapeLayer7.opacity = 0
//                    self.shapeLayer8.opacity = 0
//                    self.shapeLayer9.opacity = 0
                
                }
                self.backdropView.alpha = 0
                self.percentageLabel.alpha = 0
                self.trackLayer.opacity = 0
                self.pulsatingLayer.opacity = 0
                
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
            })
        }
    }
}


extension Float {
    
    func roundToTenth() -> Float {
        let percentage1000 = Int(self * 1000)
        let percentage100 = Float(percentage1000) / 10
        return percentage100
        
    }
    
}

extension Int {
    func setCollectionViewDisplayCell() -> Int{
    switch myVariable.state {
    case 4...8:
        return 0
    case 9...13:
        return 1
    case 14...18:
        return 2
    case 19...23:
        return 3
    case 24...27:
        return 4
    case 28...31:
        return 5
    case 32...35:
        return 6
    case 36...41:
        return 7
    case 41...44:
        return 8
    default:
        return 0
    }
    }
}

