/*
 * Copyright (c) Francisco Obarrio - fobarrio@gmail.com -  https://twitter.com/fran_obarrio
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * Basically ... Feel Free to use this code as you want !
 * BTW I'm available for freelance work :D
 */

import UIKit


class PushedViewController: UIViewController {
    
    @IBOutlet weak var imageBottle: UIImageView!
    @IBOutlet weak var topBackground: UIView!
    @IBOutlet weak var bottomBackground: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let screenWidth = UIScreen.main.bounds.width
    
    let screenHeight = UIScreen.main.bounds.height
    var selectedImage: String?
    var nameCheck:String?
    var topHexColor: String?
    var specificAuthorDataArray: [String:[String:String]]?
    

    
    
    let imageArr = ["page4Back","goBack","page17Back","page20Back","page21Back","page22Back"]
    
    fileprivate func setUpImageBottle() {
        self.imageBottle.translatesAutoresizingMaskIntoConstraints = false
        self.imageBottle.frame = CGRect(x: 0, y: 0, width: screenHeight * 0.204, height: screenHeight * 0.204)
        self.imageBottle.heightAnchor.constraint(equalToConstant: screenHeight * 0.204).isActive = true
        self.imageBottle.widthAnchor.constraint(equalToConstant: screenHeight * 0.204).isActive = true
        self.imageBottle.anchorCenterXToSuperview()
        self.imageBottle.topAnchor.constraint(equalTo: view.topAnchor, constant: screenHeight * 0.05780).isActive = true
        self.imageBottle.makeRounded()
        //        let imageViewMaskView = UIImageView(image: #imageLiteral(resourceName: "circlePictureMask"))
        //        imageViewMaskView.frame = imageBottle.bounds
        //        self.imageBottle.mask = imageViewMaskView
        self.imageBottle.contentMode = .scaleAspectFill
    }
    
    fileprivate func setUpBottomView() {
        self.bottomView.translatesAutoresizingMaskIntoConstraints = false
        self.bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        self.bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    fileprivate func setUpTopView() {
        //        imageBottle.makeRounded()
        
        self.topView.translatesAutoresizingMaskIntoConstraints = false
        self.topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.topView.heightAnchor.constraint(equalToConstant: screenHeight * 0.1293).isActive = true
        self.topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    
    
    fileprivate func constraintTableView() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: imageBottle.bottomAnchor, constant: 20).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor).isActive = true
    }
    
    fileprivate func setUpTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 30
        self.tableView.register(UINib(nibName: "BioInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "BioInfoTableViewCell")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 50
        let headerInset: CGFloat = tableView.frame.size.width * 0.2
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: headerInset, bottom: 0, right: 0)

        if #available(iOS 13.0, *) {
                   self.overrideUserInterfaceStyle = .light
               }
        constraintTableView()
        
       

        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTopView()
        setUpBottomView()
        setUpImageBottle()
        setUpTableView()
        
        print("customized number of section headers", tableView.numberOfSections)

        
        if let topColor = topHexColor {
            topBackground.backgroundColor =  topColor.hexColor
        }
        if let imageToLoad = selectedImage {
            imageBottle.image  = UIImage(named: imageToLoad)
        }
        
    
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissTap))
        self.view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
//    func addDeveloperInfoVC() {
//        addChild(annSmithInfoVC)
//        view.addSubview(annSmithInfoVC.view)
//        setUpDeveloperInfoVCConstraints()
////        pass all the information to the child controller here
////        annSmithInfoVC.view.backgroundColor = .red
//        annSmithInfoVC.didMove(toParent: self)
//    }
    
//    func setUpDeveloperInfoVCConstraints() {
//
//        annSmithInfoVC.view.translatesAutoresizingMaskIntoConstraints = false
//        annSmithInfoVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        annSmithInfoVC.view.topAnchor.constraint(equalTo: imageBottle.bottomAnchor, constant: screenHeight * 0.04).isActive = true
//        annSmithInfoVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: screenWidth * 0.03).isActive = true
//         annSmithInfoVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -screenWidth * 0.03).isActive = true
//    }
    
}

// MARK: - Protocol for Transition
extension PushedViewController : animTransitionable
{
    var cellImageView: UIImageView {
        return imageBottle
    }
    
    var backgroundColor: UIView {
        return topBackground
    }
    
    var cellBackground: UIView {
        return bottomBackground
    }
    
}

extension PushedViewController : UITableViewDelegate, UITableViewDataSource  {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = BioInfoTableViewCell(style: .default, reuseIdentifier: "BioInfoTableViewCell")

        let cell = tableView.dequeueReusableCell(withIdentifier: "BioInfoTableViewCell", for: indexPath) as! BioInfoTableViewCell
    
        switch indexPath.section {
        case 0:
            cell.lContent.text = specificAuthorDataArray!["basicInfo"]!["text"]
            cell.cellImage.image = UIImage(named: imageArr[indexPath.section])
            
        case 1:
            cell.lContent.text = specificAuthorDataArray!["bookCreation"]!["text"]
            cell.cellImage.image = UIImage(named: imageArr[indexPath.section])
            
        case 2:
            cell.lContent.text = specificAuthorDataArray!["favoritePage"]!["text"]
            cell.cellImage.image = UIImage(named: imageArr[indexPath.section])
            
        default:
            break;
        }
    
        

        
        
        return cell
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return specificAuthorDataArray?.count ?? 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UIView(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        let label = UILabel.init(frame: CGRect.init(x: headerView.frame.size.width * 0.1, y: 0, width: headerView.frame.size.width * 0.8, height: 30))
        headerView.addSubview(label)
        label.anchorCenterSuperview()
        label.font = UIFont(name: "Morgan_bold", size: 20)
        label.textColor = .darkGray
        switch section {
        case 0:
            label.text = "General Info"

        case 1:
            label.text = "Efforts in Creating this Book"

        case 2:
            label.text = "Favorite Page(s)"

        default:
            break;
        }
        
      
        return headerView

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }


}
