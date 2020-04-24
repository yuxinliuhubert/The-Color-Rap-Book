//
//  CanvasView.swift
//  The Color Rap Book
//
//  Created by 7744 on 4/22/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit

class Canvas: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return}
        
        
//        here are my lines
        
//        let startPoint = CGPoint(x: 0, y: 0)
//        let endPoint = CGPoint (x: 100, y: 100)
//        context.move(to: startPoint)
//        context.addLine(to: endPoint)
     
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(10)
        context.setLineCap(.butt)
        
        lines.forEach {(line) in
            for (i, p) in line.enumerated() {
                    if i == 0 {
                        context.move(to: p)
                    } else {
                    context.addLine(to: p)
                    }
                }
                context.strokePath()
            }
        }
    
 
    
    
    var lines = [[CGPoint]]()
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
//    track finger movement
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        print("canvasviewfingertouch", point)
        
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(point)
        lines.append(lastLine)
        
        setNeedsDisplay()
    }
    
    
    
    func undo() {
       _ = lines.popLast()
        setNeedsDisplay()
    }
    
    func clear() {
        lines.removeAll()
        setNeedsDisplay()
    }
    
}




extension DetailPageController {
    
    
    
    
    
    
    
    
    
    
    
    
}
