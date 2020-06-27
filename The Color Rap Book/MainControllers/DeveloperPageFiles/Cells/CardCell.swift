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

class CardCell: UICollectionViewCell {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var cellSize = CGSize(
        width: (UIScreen.main.bounds.width * 92) / 100,
        height: (UIScreen.main.bounds.height * 71) / 100
    )
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cellBackground: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()        
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    func setupCell(imgViewName: String) {
        imageView.image = UIImage(named: imgViewName)
    }
    
    func setupView() {
        
        self.cellBackground.layer.borderWidth = 0.0
        self.cellBackground.layer.borderColor = UIColor.clear.cgColor
        self.cellBackground.layer.cornerRadius = 10
        self.cellBackground.layer.masksToBounds = false
        
        
      
        
    
        
//
//        self.imageView.heightAnchor.constraint(equalToConstant: cellSize.height * 0.204).isActive = true
//        self.imageView.widthAnchor.constraint(equalToConstant: cellSize.height * 0.204).isActive = true
//        self.imageView.center = cellBackground.center
//        self.imageView.center.x = cellBackground.center.x
//        self.imageView.center.y = cellBackground.center.y
//        self.imageView.centerYAnchor.constraint(equalTo: superview?.centerYAnchor ?? , constant: -screenHeight * 0.0653).isActive = true
//        self.imageView.centerXAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>, constant: <#T##CGFloat#>)
        
        
        
        
        
//        print("cellbackground, ", cellBackground.frame)
        
//        self.imageView.frame = CGRect(x: screenWidth / 2 - cellSize.height * 0.102, y: (screenHeight / 2 - cellSize.height * 0.102) - screenHeight * 0.0653, width: cellSize.height * 0.204, height: cellSize.height * 0.204)
        self.imageView.frame = CGRect(x: screenWidth / 2, y: screenHeight / 2, width: cellSize.height * 0.204, height: cellSize.height * 0.204)
        print("cellsize, ", cellSize)
        print("imageview frame, ", imageView.frame)
        print("superview",self.contentView.frame)
        let imageViewMaskView = UIImageView(image: #imageLiteral(resourceName: "circlePictureMask"))
              imageViewMaskView.frame = imageView.bounds
            self.imageView.mask = imageViewMaskView
        self.imageView.contentMode = .scaleAspectFill
        
        
    }
    
    
    
}

extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        
    }
}
