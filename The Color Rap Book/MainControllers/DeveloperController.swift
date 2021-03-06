
//
//  DeveloperController.swift
//  The Color Rap Book
//
//  Created by 7744 on 3/6/20.
//  Copyright © 2020 7744. All rights reserved.

import Foundation
import UIKit

class DeveloperController: UIViewController,  UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
//    let nav = UINavigationController()
    
    let transition = TransitionCoordinator()
    
    var selectedIndexPath: IndexPath!
    
    var cardView: CardCell?
    
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
            "bottleName": "bottle1",
            "hexBackgroundColor": "761e30"
        ],
        [
            "bottleName": "bottle2",
            "hexBackgroundColor": "d86940"
        ],
        [
            "bottleName": "bottle4",
            "hexBackgroundColor": "ebb700"
        ],
        [
            "bottleName": "bottle3",
            "hexBackgroundColor": "363538"
        ],

        [
            "bottleName": "bottle5",
            "hexBackgroundColor": "8e5700"
        ],
        [
            "bottleName": "bottle6",
            "hexBackgroundColor": "44485b"
        ],
        [
            "bottleName": "bottle7",
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
               finalVC.selectedImage = dictionaryDataArray[indexPath.row]["bottleName"]!
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
    
}
