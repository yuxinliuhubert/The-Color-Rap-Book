
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
    
    let developerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Morgan_bold", size: 100)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Swipe left & right to see all book creators\nClick on each block for more information"
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    //    let nav = UINavigationController()
    
    let transition = TransitionCoordinator()
    
    var selectedIndexPath: IndexPath!
    
    var cardView: CardCell?

    
    var dictionaryDataArray: [[String: String]] = [
        
        [
            "developerName": "AnnSmith",
            "hexBackgroundColor": "761e30",
            "quickIntro": "Mrs. Ann Smith is the author of the book."
        ],
        [
            "developerName": "SmithFamily",
            "hexBackgroundColor": "d86940",
            "quickIntro": "The Smith family has given Ann tremendous support and published the book."
        ],
        [
            "developerName": "YuxinLiu",
            "hexBackgroundColor": "87ceeb",
            "quickIntro": "Yuxin Liu, or Hubert, is the creator of this digital book."
        ],
        [
            "developerName": "JennieBaughman",
            "hexBackgroundColor": "800080",
            "quickIntro": "Ms. Jennie Baughman is the magician artist who put together all the picture magic in this book."
        ],
        [
            "developerName": "Others",
            "hexBackgroundColor": "8e5700",
            "quickIntro": "Special Shout out to these people; without their efforts, the Color Rap Book would never be as it is today."
        ],
        [
            "developerName": "Credits",
            "hexBackgroundColor": "44485b",
            "quickIntro": "We have borrowed resources from these websites. Thanks for creating such useful content!"
        ]
        
    ]
    
    var developerDetailArray: [[String:[String:String]]] = [
        
        //        Ann Smith 0
        [
            "basicInfo" : ["text": "",
                           "image": ""],
            "bookCreation" : [ "text": "",
                               "image": ""],
            "favoritePage" : ["text": "",
                              "image": ""]
        ],
        
        //      Smith Family 1
        [
            "basicInfo" : ["text": "",
                           "image": ""],
            "bookCreation" : [ "text": "",
                               "image": ""],
            "favoritePage" : ["text": "",
                              "image": ""]
        ],
        
        //        Yuxin Liu 2
        [
            "basicInfo" : ["text": "",
                           "image": ""],
            "bookCreation" : [ "text": "",
                               "image": ""],
            "favoritePage" : ["text": "",
                              "image": ""]
        ],
        
        //        Jennie 3
        [
            "basicInfo" : ["text": "",
                           "image": ""],
            "bookCreation" : [ "text": "",
                               "image": ""],
            "favoritePage" : ["text": "",
                              "image": ""]
        ],
        
        //        Others 4
        [
            "basicInfo" : ["text": "",
                           "image": ""],
            "bookCreation" : [ "text": "",
                               "image": ""],
            "favoritePage" : ["text": "",
                              "image": ""]
        ],
        
        //        Credits 5
        [
            "basicInfo" : ["text": "",
                           "image": ""],
            "bookCreation" : [ "text": "",
                               "image": ""],
            "favoritePage" : ["text": "",
                              "image": ""]
        ],
        
        
        
        
    ]
    
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    fileprivate func readDeveloperData() {
        if let url = Bundle.main.url(forResource:"DeveloperData", withExtension: "rtf") {
            do {
                let data = try Data(contentsOf:url)
                let attibutedString = try NSAttributedString(data: data, documentAttributes: nil)
                let fullText = attibutedString.string
                for sectionCount in 0...5 {
                    for lineCount in 0...6 {
                        var unProcessedText = String()
                        var processedText = String()
                        if lineCount != 6 {
                            unProcessedText = fullText.components(separatedBy: .newlines)[lineCount + sectionCount * 7]
                            processedText = unProcessedText.sortTextWithNewLine()
                        }
                        switch lineCount {
                        case 0:
                            
                            developerDetailArray[sectionCount]["basicInfo", default: ["text":"", "image":""]]["text"] = processedText
                            
                        case 1:
                            developerDetailArray[sectionCount]["basicInfo", default: ["text":"", "image":""]]["image"] = processedText
                            
                        case 2:
                            developerDetailArray[sectionCount]["bookCreation", default: ["text":"", "image":""]]["text"] = processedText
                            
                            
                        case 3:
                            
                            developerDetailArray[sectionCount]["bookCreation", default: ["text":"", "image":""]]["image"] = processedText
                        case 4:
                            developerDetailArray[sectionCount]["favoritePage", default: ["text":"", "image":""]]["text"] = processedText
                            
                        case 5:
                            developerDetailArray[sectionCount]["favoritePage", default: ["text":"", "image":""]]["image"] = processedText
                            
                        case 6:
                            continue;
                            
                        default:
                            print("something went terribly wrong with writing dicitonary, check coding grammar")
                        }
                        //                        print("developer[\(sectionCount)]", developerDetailArray[sectionCount])
                    }
                }
            } catch {
                print(error)
            }
            //            print("labelArray ", labelArray)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpAudioInterruptionNotification()
        
        readDeveloperData()
        
        
        //        print("dictionary, ", dictionaryDataArray)
        print("detaildictioinary array, ", developerDetailArray)
        //        self.collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCellIdentifier")
        self.collectionView.register(UINib(nibName: "CardCell", bundle: nil), forCellWithReuseIdentifier: "cardCellIdentifier")
        self.collectionView.collectionViewLayout = AnimationCollectionViewLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        goBackButton.frame = CGRect(x: screenWidth * 0.01953, y: 30, width: screenWidth * 0.12, height: screenWidth * 0.090136)
        goBackButton.setImage(UIImage(named:"home"), for: .normal)
        goBackButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        goBackButton.layer.cornerRadius = 20
        
        view.addSubview(developerLabel)
        developerLabel.frame = CGRect(x: screenWidth * 0.16, y: 30, width: screenWidth * 0.80, height: screenHeight * 0.15)
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.goBackButton.alpha = 1
        self.developerLabel.alpha = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
        
        UIView.animate(withDuration: 0.5, animations: {
            self.goBackButton.alpha = 0
            self.developerLabel.alpha = 0
            
        }, completion: {_ in
             if (collectionView.cellForItem(at: indexPath) as? CardCell) != nil {

                           // Reference for the selected Cell
                           self.selectedIndexPath = indexPath
                           
                           let finalVC = PushedViewController()
                finalVC.selectedImage = self.dictionaryDataArray[indexPath.row]["developerName"]!
                finalVC.topHexColor = self.dictionaryDataArray[indexPath.row]["hexBackgroundColor"]!
                finalVC.nameCheck = self.dictionaryDataArray[indexPath.row]["developerName"]
                
                finalVC.specificAuthorDataArray = self.developerDetailArray[indexPath.row]
    
                

            //                finalVC.selectedImage = self.dictionaryDataArray[indexPath.row]["developerIntro"]!

                self.navigationController?.delegate = self.transition
                self.navigationController?.pushViewController(finalVC, animated: true)
                           
                           
                       }
            
            
        })
          
           
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
        myVariable.buttonSoundPlayer?.play()
        self.performSegue(withIdentifier: "DeveloperUnwind", sender: self)
    }
}



extension String {
    
    func sortTextWithNewLine() -> String {
               var checkForNL = ""
                var labelString = ""
               for i in self {
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
        return labelString
//                label.text = labelString
               //            labelFloating(label: label)
               
           }
    
    
    
    
    
    
    
}
