//
//  ViewControllerSegueUnwind.swift
//  The Color Rap Book
//
//  Created by 7744 on 2/8/20.
//  Copyright © 2020 7744. All rights reserved.
//

import UIKit
import SwiftUI

class ViewControllerSegueUnwind: UIStoryboardSegue {
    override func perform() {
        //Assign the source and destination views to local variables
        var detailPageView = self.source.view as UIView
        var viewControllerView = self.destination.view as UIView
        
        //Get the screen wwidrth and height
        let screenwidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.height
        
        //Specify the initial position of the destination view
//        viewControllerView.frame = CGRect(x: 0.0, y: screenHeight, width: screenwidth, height: screenHeight)
//        detailPageView.frame = CGRect(x: 0.0, y: screenHeight, width: screenwidth, height: screenHeight)
        
        // Access the app's key window and insert the destination view above the current (source) one.
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(viewControllerView, aboveSubview: detailPageView)
        
        //Animate the trasition
        

        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [], animations: {
            
            detailPageView.frame = detailPageView.frame.offsetBy(dx: 0.0, dy: screenHeight)
            viewControllerView.frame = viewControllerView.frame.offsetBy(dx: 0.0, dy: screenHeight)}) { (Finished) -> Void in
                self.source.dismiss(animated: false, completion: nil)
            
        }
        
//        Alternative solution (straight up and down
 /*        UIView.animate(withDuration: 1.0, animations: { () -> Void in
             detailPageView.frame = detailPageView.frame.offsetBy(dx: 0.0, dy: screenHeight)
             viewControllerView.frame = viewControllerView.frame.offsetBy(dx: 0.0, dy: screenHeight)
        
         
                }) { (Finished) -> Void in
                 self.source.dismiss(animated: false, completion: nil)
            }
         */
    
    }
    

}
