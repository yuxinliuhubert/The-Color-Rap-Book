//
//  ViewController.swift
//  The Color Rap Book
//
//  Created by 7744 on 2/6/20.
//  Copyright © 2020 7744. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    var imageInitialState: CGAffineTransform.Type?

    var timeControl = 2.0;
    var position = CGPoint()
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var frontCoverView: UIImageView!
    @IBOutlet var singleTap: UITapGestureRecognizer!
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    @IBOutlet weak var readButton: UIButton!
    @IBOutlet weak var tableOfContentButton: UIButton!
    @IBOutlet weak var developerButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if myVariable.state >= 3 {
            performSegue(withIdentifier: "ToDetailSegue", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getSavedData()
        screenWidth = UIScreen.main.bounds.width
        screenHeight = UIScreen.main.bounds.height
        introLabel.center = CGPoint(x: self.introLabel.center.x, y: self.screenHeight * 0.30)
        introLabel.text = "The Color Rap Book"
        introLabel.textColor = .red
        introLabel.font = UIFont(name: "Morgan_bold", size: 100)
        labelFadeIn(label: introLabel, delay: 0)
//        tableOfContentButton.backgroundColor = .red
        tableOfContentButton.alpha = 0.5
//        developerButton.backgroundColor = .red

        readButton.frame = CGRect(x: screenWidth * 0.4, y: screenHeight * 0.05, width: screenWidth * 0.19, height: screenHeight * 0.24)
        readButton.setTitle("Read", for: .normal)
        readButton.setTitleColor(.systemPink, for: .normal)
    
        readButton.titleLabel?.font = UIFont(name: "Morgan_bold-Regular", size: 50)
        readButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        tableOfContentButton.frame = CGRect(x: screenWidth * 0.13, y: screenHeight * 0.10, width: screenWidth * 0.19, height: screenHeight * 0.24)
        tableOfContentButton.setTitle("Table\nof\nContent", for: .normal)
        tableOfContentButton.setTitleColor(.blue, for: .normal)
        tableOfContentButton.titleLabel?.numberOfLines = 0
        tableOfContentButton.titleLabel?.textAlignment = .center
        tableOfContentButton.titleLabel?.font = UIFont(name: "Morgan_bold-Regular", size: 32)
        tableOfContentButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        developerButton.frame = CGRect(x: 0, y: 0, width: screenWidth * 0.135, height: screenHeight * 0.22)
        developerButton.setTitle("Beautiful\npeople\n\n", for: .normal)
        developerButton.setTitleColor(.white, for: .normal)
        developerButton.titleLabel?.numberOfLines = 0
        developerButton.titleLabel?.textAlignment = .center
        developerButton.titleLabel?.font = UIFont(name: "Morgan_bold-Regular", size: 32)
        developerButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
    }

//Commands to pop up the Title
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            position = touch.location(in: view)
//            print(position)
        }
    }
    
    
    
    @IBAction func readTap(_ sender: Any) {
         myVariable.state = 3
        self.performSegue(withIdentifier: "ToDetailSegue", sender: sender)
    }
    
    
    
    @IBAction func tableOfContentTap(_ sender: Any) {
        self.performSegue(withIdentifier: "ToTableOfContent", sender: sender)
    }
    
    
    
    @IBAction func leftSwipeHandler(_ sender: Any) {
        switch introLabel.alpha {
                case 0:
                    labelFadeIn(label: introLabel, delay: TimeInterval())
        //            state = 1;
                    
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
    
    
    func labelFadeIn(label : UILabel, delay: TimeInterval) {

        UIView.animate(withDuration: timeControl, delay: 0.25, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
            
            self.introLabel.alpha = 1
            self.introLabel.center = CGPoint(x: self.introLabel.center.x, y: self.screenHeight * 0.78)
        }, completion: nil)
 
    }
    
    func labelFadeOut(label : UILabel, delay : TimeInterval) {
        
        
        UILabel.animate(withDuration: timeControl - 0.3, delay: delay, options: .curveEaseInOut, animations: {                 label.alpha = 0
               self.introLabel.center = CGPoint(x: self.introLabel.center.x, y: self.screenHeight * 0.30)
        },
        completion: nil)
        
    }
    
    func viewcontrollerANimate() {
        
    }
//    func getSavedData() {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedData")
//        request.returnsObjectsAsFaults = false
//        do {
//            let result = try context.fetch(request)
//            for data in result as! [NSManagedObject]
//            {
//                myVariable.page = data.value(forKey: "page") as! Int
//            }
//        } catch {
//            print("failed to read")
//        }
//    }

  
    
//    override func segueForUnwinding(to toController: UIViewController, from fromController: UIViewController, identifier: String?) -> UIStoryboardSegue {
//            if let id = identifier{
//                if id == "BackToViewController" {
//                    let unwindSegue = ViewControllerSegueUnwind(identifier: id, source: fromController, destination: toController, performHandler: { () -> Void in
//
//                    })
//                    return unwindSegue
//                }
//            }

//        return super.segueForUnwinding(to: toController, from: fromController, identifier: identifier)!
//        }
    
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
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
        
    }
    }
    
 




