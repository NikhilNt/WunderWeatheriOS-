//
//  DrawLine.swift
//  WunderWeatheriOS
//
//  Created by Nikhil Patil on 9/18/17.
//  Copyright © 2017 Nikhil Patil. All rights reserved.
//

import  UIKit

@IBDesignable
class DrawLine: UIView {
    
    @IBInspectable var lineWidth: CGFloat = 1.0
    @IBInspectable var lineColor: UIColor? {
        didSet {
            lineCGColor = lineColor?.cgColor
        }
    }
    var lineCGColor: CGColor?
    
    override func draw(_ rect: CGRect) {
        let midpoint = self.bounds.size.height / 2.0
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(lineWidth)
        if let lineCGColor = self.lineCGColor {
            context?.setStrokeColor(lineCGColor)
        }
        else {
            context?.setStrokeColor(UIColor.black.cgColor)
        }
        context?.move(to: CGPoint(x: 0.0, y: midpoint))
        context?.addLine(to: CGPoint(x: self.bounds.size.width, y: midpoint))
        context?.strokePath()
    }
    
}
