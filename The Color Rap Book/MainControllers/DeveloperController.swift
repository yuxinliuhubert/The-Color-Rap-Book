
//
//  DeveloperController.swift
//  The Color Rap Book
//
//  Created by 7744 on 3/6/20.
//  Copyright © 2020 7744. All rights reserved.

import Foundation
import UIKit

class DeveloperController: UIViewController,  UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var goBackButton: UIButton!
    //    let nav = UINavigationController()
    
    let transition = TransitionCoordinator()
    
    var selectedIndexPath: IndexPath!
    
    var cardView: CardCell?
    
    var cellSize = CGSize(
        width: (UIScreen.main.bounds.width * 92) / 100,
        height: (UIScreen.main.bounds.height * 71) / 100
    )
    
    var dictionaryDataArray: [[String: String]] = [
//        [
//            "developerName": "goBack",
//            "hexBackgroundColor": "761e30",
//            "developerIntro": "This is Ann Harris Smith"
//        ],
//        [
//            "developerName": "goBack",
//            "hexBackgroundColor": "d86940",
//            "developerIntro": "This is Matt Smith"
//        ],
//        [
//            "developerName": "goBack",
//            "hexBackgroundColor": "ebb700",
//            "developerIntro": "This is Hubert Liu"
//        ]
        
        [
            "developerName": "page11Back",
            "hexBackgroundColor": "761e30"
        ],
        [
            "developerName": "bottle2",
            "hexBackgroundColor": "d86940"
        ],
        [
            "developerName": "bottle4",
            "hexBackgroundColor": "ebb700"
        ],
        [
            "developerName": "bottle3",
            "hexBackgroundColor": "363538"
        ],

        [
            "developerName": "bottle5",
            "hexBackgroundColor": "8e5700"
        ],
        [
            "developerName": "bottle6",
            "hexBackgroundColor": "44485b"
        ],
        [
            "developerName": "bottle7",
            "hexBackgroundColor": "d6622f"
        ]
    ]

//    fileprivate let collectionView: UICollectionView = {
//          let layout = AnimationCollectionViewLayout()
//
//          let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//          cv.translatesAutoresizingMaskIntoConstraints = false
//          cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
//
//          return cv
//      }()
      
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCellIdentifier")
        self.collectionView.register(UINib(nibName: "CardCell", bundle: nil), forCellWithReuseIdentifier: "cardCellIdentifier")
        self.collectionView.collectionViewLayout = AnimationCollectionViewLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        goBackButton.frame = CGRect(x: screenWidth * 0.01953, y: 30, width: screenWidth * 0.12, height: screenWidth * 0.090136)
               goBackButton.setImage(UIImage(named:"home"), for: .normal)
               goBackButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
               goBackButton.layer.cornerRadius = 20
        

        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "circlePictureMask"))
//        imageView.frame = CGRect(x: screenWidth / 2 - cellSize.height * 0.102, y: (screenHeight / 2 - cellSize.height * 0.102) - screenHeight * 0.0653, width: cellSize.height * 0.204, height: cellSize.height * 0.204)
          imageView.frame = CGRect(x: screenWidth / 2, y: screenHeight / 2, width: cellSize.height * 0.204, height: cellSize.height * 0.204)
        print("black imageciew frmae, ", imageView.frame)
        view.addSubview(imageView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
        
           if (collectionView.cellForItem(at: indexPath) as? CardCell) != nil {

               // Reference for the selected Cell
               self.selectedIndexPath = indexPath
               
               let finalVC = PushedViewController()
               finalVC.selectedImage = dictionaryDataArray[indexPath.row]["developerName"]!
               finalVC.topHexColor = dictionaryDataArray[indexPath.row]["hexBackgroundColor"]!
//                finalVC.selectedImage = dictionaryDataArray[indexPath.row]["developerIntro"]!

               navigationController?.delegate = transition
               navigationController?.pushViewController(finalVC, animated: true)
               
               
           }
           
       }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           
           var visibleRect = CGRect()
           visibleRect.origin = collectionView.contentOffset
           visibleRect.size = collectionView.bounds.size
           
           let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
           
           guard let indexPath = collectionView.indexPathForItem(at: visiblePoint) else { return }
           
           UIView.animate(withDuration: 0.3) {
               self.backgroundView.backgroundColor  =  self.dictionaryDataArray[indexPath.row]["hexBackgroundColor"]!.hexColor
           }
           

       }
    
    override var prefersStatusBarHidden: Bool { return true }
       override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .landscape }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

     (segue as! OHCircleSegue).circleOrigin = myVariable.center ?? CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.5)
    
    }
    
    @IBAction func goBackButtonTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "DeveloperUnwind", sender: self)
    }
}
