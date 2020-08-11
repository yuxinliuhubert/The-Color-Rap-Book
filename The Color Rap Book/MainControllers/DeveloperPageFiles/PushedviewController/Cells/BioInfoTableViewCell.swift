//
//  BioInfoTableViewCell.swift
//  The Color Rap Book
//
//  Created by 7744 on 6/28/20.
//  Copyright © 2020 7744. All rights reserved.
//

import UIKit

class BioInfoTableViewCell: UITableViewCell, UIScrollViewDelegate {
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellTextView: UITextView!

    @IBOutlet weak var scrollView: UIScrollView!
    
    var isDragged = false
//    @IBOutlet weak var aspectRatio: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        scrollView.delegate = self
     
//        scrollView.isScrollEnabled = false
        
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        //        lContent.textAlignment = .left
        //        lContent.backgroundColor = .red
        //        lContent.sizeToFit()
//        print("image, ", cellImage.image)
//        if cellImage.image == nil {
//            aspectRatio.isActive = false
//        } else {
//            cellImage.widthAnchor.constraint(equalTo: cellImage.heightAnchor, multiplier: 16.0/9.0).isActive = true
//        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        scrollView.isScrollEnabled = true
        return self.cellImage
    }
    
//    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
////        self.contentView.bringSubviewToFront(view!)
//                scrollView.isScrollEnabled = true
//    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        if isDragged == false {
            scrollView.zoom(to: scrollView.bounds, animated: true)
        }
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
         scrollView.isScrollEnabled = true
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isDragged = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        scrollView.isScrollEnabled = false
        scrollView.zoom(to: scrollView.bounds, animated: true)
    }
    
//    func scro
   
    
}

