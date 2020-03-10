//
//  ViewControllerSegue.swift
//  The Color Rap Book
//
//  Created by 7744 on 2/8/20.
//  Copyright © 2020 7744. All rights reserved.
//

import UIKit
import SwiftUI
import Foundation

class ViewControllerSegue: UIStoryboardSegue {

    override func perform() {
        //Assign the source and destination views to local variables
        var viewControllerView = self.source.view as UIView
        var detailPageView = self.destination.view as UIView
        
        //Get the screen wwidrth and height
        let screenwidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.height
        
        //Specify the initial position of the destination view
        detailPageView.frame = CGRect(x: 0.0, y: screenHeight, width: screenwidth, height: screenHeight)
        
        // Access the app's key window and insert the destination view above the current (source) one.
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(detailPageView, aboveSubview: viewControllerView)
        
        //Animate the trasition
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [], animations:  { viewControllerView.frame = viewControllerView.frame.offsetBy(dx: 0.0, dy: -screenHeight)
            detailPageView.frame = detailPageView.frame.offsetBy(dx: 0.0, dy: -screenHeight) })
        {(Finished) -> Void in
        self.source.present(self.destination as UIViewController,
        animated: false,
        completion: nil)
        }
        
       
        
//        This is an alternative, just straight up and down
  /*      UIView.animate(withDuration: 1.0, animations: { () -> Void in
                viewControllerView.frame = viewControllerView.frame.offsetBy(dx: 0.0, dy: -screenHeight)
                detailPageView.frame = detailPageView.frame.offsetBy(dx: 0.0, dy: -screenHeight)
        
               }) { (Finished) -> Void in
                self.source.present(self.destination as UIViewController,
                       animated: false,
                       completion: nil)
           }
    */
    }
    
    
}
