//
//  TableOfContentController.swift
//  The Color Rap Book
//
//  Created by 7744 on 3/4/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit
import VegaScrollFlowLayout
import CoreData

struct CustomData {
    var title: String
    var image: UIImage
    var pageNum: Int
}

class TableOfContentController: UIViewController {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var tableLabel: UILabel!
    
    @IBOutlet var goBackButton: UIButton!
    let data = [
        CustomData(title: "keepReading", image: #imageLiteral(resourceName: "keep reading"), pageNum: myVariable.page),
        CustomData(title: "red", image: #imageLiteral(resourceName: "2_red is red"), pageNum: 4),
        CustomData(title: "blue", image: #imageLiteral(resourceName: "11_blue is blue"), pageNum: 9),
        CustomData(title: "yellow", image: #imageLiteral(resourceName: "16_yellow is yellow 061319"), pageNum: 18),
        CustomData(title: "green", image: #imageLiteral(resourceName: "17_green is green new"), pageNum: 19),
        CustomData(title: "orange", image: #imageLiteral(resourceName: "22_orange is orange"), pageNum: 24),
        CustomData(title: "purple", image: #imageLiteral(resourceName: "26_purple is purple not spelled out new"), pageNum: 28),
        CustomData(title: "brown", image: #imageLiteral(resourceName: "30_brown is brown new"), pageNum: 32),
        CustomData(title: "black", image: #imageLiteral(resourceName: "38_back in black new"), pageNum: 36),
        CustomData(title: "white", image: #imageLiteral(resourceName: "39_white is white new"), pageNum: 41)
    
    ]
    var pageNum1: Int?
    

    fileprivate let collectionView: UICollectionView = {
        let layout = VegaScrollFlowLayout()
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
    }()
    
    
    
    override var prefersStatusBarHidden: Bool { return true }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
        
    }
    
    override func viewDidLoad() {
        getSavedData()
        print("page", myVariable.page)
        
        tableLabel.frame = CGRect(x: width * 0.165235, y: 30, width: width * 0.80, height: width * 0.11267)
        tableLabel.text = "Table Of Content"
        tableLabel.font = UIFont(name: "Morgan_bold", size: 100)
        tableLabel.adjustsFontSizeToFitWidth = true
        tableLabel.textAlignment = .center
        tableLabel.textColor = .white
        
        goBackButton.frame = CGRect(x: width * 0.01953, y: 30, width: width * 0.15, height: width * 0.11267)
        goBackButton.setImage(UIImage(named:"home"), for: .normal)
        goBackButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        goBackButton.layer.cornerRadius = 20
        
        
        backgroundImageView.image = UIImage(named: "page20Back")
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: width, height: UIScreen.main.bounds.height)
        
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
            self.goBackButton.frame.origin.y -= 20
            self.goBackButton.isUserInteractionEnabled = true
        }){_ in
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.25, options: [.autoreverse, .repeat, .allowUserInteraction], animations: {
                self.goBackButton.frame.origin.y += 20
        })}
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [.curveEaseInOut,.allowUserInteraction], animations: {
            self.tableLabel.frame.origin.y -= 10
            self.tableLabel.isUserInteractionEnabled = true
                }){_ in
                    UIImageView.animateKeyframes(withDuration: 1.0, delay: 0.4, options: [.autoreverse, .repeat,.allowUserInteraction], animations: {
                        self.tableLabel.frame.origin.y += 10
                })}
    
        
        view.addSubview(collectionView)
            collectionView.backgroundColor = .clear
        

        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: width * 0.1267 + 30).isActive = true
//        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: width * 0.1267 + 60).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: width * 0.078125).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -width * 0.078125).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -height * 0.05208).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -height * 0.01208).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func goBackTap(_ sender: Any) {
        self.performSegue(withIdentifier: "returnToMainController", sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
                 
        if (sender is UIButton) {
         print("here")
             // No problem to force unwrap in this case, since we know sender is an instance of UIButton
             let button = sender as! UIButton
                 
             // Set the circleOrigin property of the segue to the center of the button
            (segue as! OHCircleSegue).circleOrigin = myVariable.center ?? button.center
        } else if (sender is CustomCell) {
            let cell = sender as! CustomCell
            (segue as! OHCircleSegue).circleOrigin = cell.center
            
        }
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

extension TableOfContentController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width/2.5, height: height/2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        myVariable.state = cell.data!.pageNum
        myVariable.comingFromTableOfContent = true
        performSegue(withIdentifier: "returnToMainController", sender: cell)
    }

    
    
}


class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image
            
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "2_red is red")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 20
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
