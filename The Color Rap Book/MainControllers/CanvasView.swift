//
//  CanvasView.swift
//  The Color Rap Book
//
//  Created by 7744 on 4/22/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit
import ColorSlider

class Canvas: UIView {
    
    fileprivate var strokeColor = UIColor.red
    fileprivate var strokeWidth: Float = 10
    fileprivate var didMove: Bool = false
    
    func setStrokeColor(color: UIColor) {
        self.strokeColor = color
    }
    
    
    func setStrokeWidth(width: Float) {
        self.strokeWidth = width
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return}
        
        context.setLineCap(.round)
        
        
        lines.forEach { (line) in
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(line.strokeWidth))
            context.setFillColor(line.color.cgColor)
            var dotRect = CGRect()
            var count = -1
            for (i, p) in line.points.enumerated() {
                count += 1
                if i == 0 {
                    //    draw a dot here if there is no line
                    
                    dotRect = CGRect(x: p.x - CGFloat(line.strokeWidth / 2), y: p.y - CGFloat(line.strokeWidth / 2), width: CGFloat(line.strokeWidth), height: CGFloat(line.strokeWidth))
                    
                    context.move(to: p)
                    
                } else {
                    context.addLine(to: p)
                }
                
                
                
            }
            if count <= 0 {
                context.fillEllipse(in: dotRect)
            } else {
                
                context.strokePath()
            }
            
        }
        
    }
    
    
    var redoLineStorage = [Line]()
    
    var lines = [Line]()
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didMove = false
        redoLineStorage.removeAll()
        lines.append(Line.init(strokeWidth: strokeWidth, color: strokeColor, points: []))
//        print("count touches begin", touches.count)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if didMove == false {
            guard let point = touches.first?.location(in: nil) else { return }
            //        print("canvasviewfingertouch", point)
            
            guard var lastLine = lines.popLast() else { return }
            lastLine.points.append(point)
            lines.append(lastLine)
            
            setNeedsDisplay()
        }
//        print("count touches end", touches.count)
    }
    //    track finger movement
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        didMove = true
        guard let point = touches.first?.location(in: nil) else { return }
        //        print("canvasviewfingertouch", point)
        
        guard var lastLine = lines.popLast() else { return }
        lastLine.points.append(point)
        lines.append(lastLine)
        
        setNeedsDisplay()
    }
    
    
    
    func undo() {
        guard let lastElement = lines.popLast() else { return }
//            redoLineStorage.insert(lastElement, at: 0)
        redoLineStorage.append(lastElement)
//        print("last element", lastElement)
        print("redoLineStorage ", redoLineStorage)
        setNeedsDisplay()
    }
    
    func redo() {
        guard let redoElement = redoLineStorage.popLast() else { return }
            lines.append(redoElement)
        print("lines, " ,lines)
        setNeedsDisplay()
    }
    
    func clear() {
        lines.removeAll()
        redoLineStorage.removeAll()
        setNeedsDisplay()
    }
    
 
}


