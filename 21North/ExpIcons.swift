//
//  ExpIcons.swift
//  21North
//
//  Created by Sachin Tomar on 08/03/17.
//  Copyright © 2017 Sachin Tomar. All rights reserved.
//

import Foundation

class ExpIcon {
    
    func addFuelExp(buttonText: String)-> UIImageView{
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 121, height: 25), false, 0)
        
        //// Color Declarations
        let textForeground = UIColor(red: 0.349, green: 0.356, blue: 0.364, alpha: 1.000)
        let strokeColor = UIColor(red: 0.779, green: 0.783, blue: 0.793, alpha: 1.000)
        
        //// Page-1
        //// Label Drawing
        let labelRect = CGRect(x: 9.11, y: 5.42, width: 110.36, height: 14)
        let labelStyle = NSMutableParagraphStyle()
        labelStyle.alignment = .left
        
        let labelFontAttributes = [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue", size: 11)!, NSAttributedStringKey.foregroundColor: textForeground, NSAttributedStringKey.paragraphStyle: labelStyle]
        
        buttonText.draw(in: labelRect, withAttributes: labelFontAttributes)
        
        
        //// Stroke-1 Drawing
        let stroke1Path = UIBezierPath()
        stroke1Path.move(to: CGPoint(x: 117.85, y: 9.97))
        stroke1Path.addLine(to: CGPoint(x: 110.61, y: 2.73))
        stroke1Path.addCurve(to: CGPoint(x: 107.38, y: 1.51), controlPoint1: CGPoint(x: 109.72, y: 1.84), controlPoint2: CGPoint(x: 108.54, y: 1.44))
        stroke1Path.addCurve(to: CGPoint(x: 5.1, y: 1.5), controlPoint1: CGPoint(x: 107.3, y: 1.51), controlPoint2: CGPoint(x: 5.1, y: 1.5))
        stroke1Path.addCurve(to: CGPoint(x: 0.5, y: 6.1), controlPoint1: CGPoint(x: 2.56, y: 1.5), controlPoint2: CGPoint(x: 0.5, y: 3.56))
        stroke1Path.addLine(to: CGPoint(x: 0.5, y: 19.76))
        stroke1Path.addCurve(to: CGPoint(x: 5.1, y: 24.36), controlPoint1: CGPoint(x: 0.5, y: 22.3), controlPoint2: CGPoint(x: 2.56, y: 24.36))
        stroke1Path.addCurve(to: CGPoint(x: 107.38, y: 24.35), controlPoint1: CGPoint(x: 5.1, y: 24.36), controlPoint2: CGPoint(x: 107.3, y: 24.35))
        stroke1Path.addCurve(to: CGPoint(x: 110.61, y: 23.13), controlPoint1: CGPoint(x: 108.54, y: 24.42), controlPoint2: CGPoint(x: 109.72, y: 24.02))
        stroke1Path.addLine(to: CGPoint(x: 117.85, y: 15.89))
        stroke1Path.addCurve(to: CGPoint(x: 117.85, y: 9.97), controlPoint1: CGPoint(x: 119.48, y: 14.25), controlPoint2: CGPoint(x: 119.48, y: 11.6))
        stroke1Path.addLine(to: CGPoint(x: 117.85, y: 9.97))
        stroke1Path.close()
        stroke1Path.miterLimit = 4;
        
        stroke1Path.usesEvenOddFillRule = true;
        
        strokeColor.setStroke()
        stroke1Path.lineWidth = 1
        stroke1Path.stroke()
        
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imageViewtool
    }
}
