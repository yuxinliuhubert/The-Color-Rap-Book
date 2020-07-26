//
//  BioInfoTableViewCell.swift
//  The Color Rap Book
//
//  Created by 7744 on 6/28/20.
//  Copyright © 2020 7744. All rights reserved.
//

import UIKit

class BioInfoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellTextView: UITextView!
    
    @IBOutlet weak var aspectConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        lContent.textAlignment = .left
//        lContent.backgroundColor = .red
//        lContent.sizeToFit()
        if cellImage.image == nil {
            aspectConstraint.isActive = false
        }

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
