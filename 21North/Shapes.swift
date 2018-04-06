//
//  Shapes.swift
//  21North
//
//  Created by Sachin Tomar on 28/05/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit

class Shapes: UIViewController {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    func drawShapes(type:String)->UIImage{
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 40, height: 30), false, 0)
        
        //// Color Declarations
        let fillColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
        
        if(type == "blackPlus"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 40, height: 40), false, 0)
            var fillColor = UIColor()
            
            fillColor = UIColor(red: 0.100, green: 0.099, blue: 0.144, alpha: 1.000)
            
            //// Rectangle-1 Drawing
            let rectangle1Path = UIBezierPath(rect: CGRect(x: 10, y: 19, width: 20, height: 3))
            fillColor.setFill()
            rectangle1Path.fill()
            
            //// Rectangle- 3 Drawing
            let rectangle3Path = UIBezierPath(rect: CGRect(x: 18.5, y: 10.5, width: 3, height: 20))
            fillColor.setFill()
            rectangle3Path.fill()
        }
            
        else if(type == "ambCall"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 34, height: 34), false, 0)
            let strokeColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
            
            //// Group-3
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 21.89, y: 15.81))
            shapePath.addLine(to: CGPoint(x: 21.98, y: 15.72))
            shapePath.addCurve(to: CGPoint(x: 20.92, y: 14.84), controlPoint1: CGPoint(x: 21.6, y: 15.45), controlPoint2: CGPoint(x: 21.25, y: 15.16))
            shapePath.addLine(to: CGPoint(x: 21.89, y: 15.81))
            shapePath.addLine(to: CGPoint(x: 21.89, y: 15.81))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 26.54, y: 16.74))
            shapePath.addCurve(to: CGPoint(x: 22.12, y: 21.6), controlPoint1: CGPoint(x: 26.72, y: 17.65), controlPoint2: CGPoint(x: 24.7, y: 19.05))
            shapePath.addCurve(to: CGPoint(x: 16.8, y: 25.84), controlPoint1: CGPoint(x: 19.02, y: 24.7), controlPoint2: CGPoint(x: 18.15, y: 25.63))
            shapePath.addCurve(to: CGPoint(x: 15.72, y: 21.98), controlPoint1: CGPoint(x: 16.83, y: 24.46), controlPoint2: CGPoint(x: 16.45, y: 23.15))
            shapePath.addCurve(to: CGPoint(x: 14.84, y: 20.92), controlPoint1: CGPoint(x: 15.45, y: 21.6), controlPoint2: CGPoint(x: 15.16, y: 21.25))
            shapePath.addLine(to: CGPoint(x: 11.92, y: 18))
            shapePath.addCurve(to: CGPoint(x: 7.94, y: 18.06), controlPoint1: CGPoint(x: 10.83, y: 16.92), controlPoint2: CGPoint(x: 9.05, y: 16.95))
            shapePath.addLine(to: CGPoint(x: 4.89, y: 21.1))
            shapePath.addLine(to: CGPoint(x: 1.85, y: 24.14))
            shapePath.addCurve(to: CGPoint(x: 1.79, y: 28.12), controlPoint1: CGPoint(x: 0.74, y: 25.25), controlPoint2: CGPoint(x: 0.71, y: 27.04))
            shapePath.addLine(to: CGPoint(x: 4.72, y: 31.05))
            shapePath.addCurve(to: CGPoint(x: 5.77, y: 31.92), controlPoint1: CGPoint(x: 5.04, y: 31.37), controlPoint2: CGPoint(x: 5.39, y: 31.66))
            shapePath.addCurve(to: CGPoint(x: 12.97, y: 32.1), controlPoint1: CGPoint(x: 7.91, y: 33.3), controlPoint2: CGPoint(x: 10.72, y: 33.36))
            shapePath.addCurve(to: CGPoint(x: 25.34, y: 24.05), controlPoint1: CGPoint(x: 15.54, y: 31.6), controlPoint2: CGPoint(x: 19.64, y: 29.76))
            shapePath.addCurve(to: CGPoint(x: 32.65, y: 11.65), controlPoint1: CGPoint(x: 31.72, y: 17.68), controlPoint2: CGPoint(x: 32.83, y: 13.75))
            shapePath.addCurve(to: CGPoint(x: 31.92, y: 5.77), controlPoint1: CGPoint(x: 33.3, y: 9.69), controlPoint2: CGPoint(x: 33.04, y: 7.53))
            shapePath.addCurve(to: CGPoint(x: 31.05, y: 4.72), controlPoint1: CGPoint(x: 31.66, y: 5.39), controlPoint2: CGPoint(x: 31.37, y: 5.04))
            shapePath.addLine(to: CGPoint(x: 28.12, y: 1.79))
            shapePath.addCurve(to: CGPoint(x: 24.14, y: 1.85), controlPoint1: CGPoint(x: 27.04, y: 0.71), controlPoint2: CGPoint(x: 25.25, y: 0.74))
            shapePath.addLine(to: CGPoint(x: 21.1, y: 4.89))
            shapePath.addLine(to: CGPoint(x: 18.06, y: 7.94))
            shapePath.addCurve(to: CGPoint(x: 18, y: 11.92), controlPoint1: CGPoint(x: 16.95, y: 9.05), controlPoint2: CGPoint(x: 16.92, y: 10.83))
            shapePath.addLine(to: CGPoint(x: 20.92, y: 14.84))
            shapePath.addCurve(to: CGPoint(x: 21.98, y: 15.72), controlPoint1: CGPoint(x: 21.25, y: 15.16), controlPoint2: CGPoint(x: 21.6, y: 15.45))
            shapePath.addCurve(to: CGPoint(x: 26.54, y: 16.74), controlPoint1: CGPoint(x: 23.35, y: 16.6), controlPoint2: CGPoint(x: 24.96, y: 16.95))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 31.92, y: 5.77))
            shapePath.addLine(to: CGPoint(x: 32.01, y: 5.68))
            shapePath.addLine(to: CGPoint(x: 31.05, y: 4.72))
            shapePath.addCurve(to: CGPoint(x: 31.92, y: 5.77), controlPoint1: CGPoint(x: 31.37, y: 5.04), controlPoint2: CGPoint(x: 31.66, y: 5.39))
            shapePath.addLine(to: CGPoint(x: 31.92, y: 5.77))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 5.68, y: 32.01))
            shapePath.addLine(to: CGPoint(x: 5.77, y: 31.92))
            shapePath.addCurve(to: CGPoint(x: 4.72, y: 31.05), controlPoint1: CGPoint(x: 5.39, y: 31.66), controlPoint2: CGPoint(x: 5.04, y: 31.37))
            shapePath.addLine(to: CGPoint(x: 5.68, y: 32.01))
            shapePath.addLine(to: CGPoint(x: 5.68, y: 32.01))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 15.72, y: 21.98))
            shapePath.addLine(to: CGPoint(x: 15.81, y: 21.89))
            shapePath.addLine(to: CGPoint(x: 14.84, y: 20.92))
            shapePath.addCurve(to: CGPoint(x: 15.72, y: 21.98), controlPoint1: CGPoint(x: 15.16, y: 21.25), controlPoint2: CGPoint(x: 15.45, y: 21.6))
            shapePath.addLine(to: CGPoint(x: 15.72, y: 21.98))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            shapePath.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
        }
        else if(type == "ambLocation"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 31, height: 42), false, 0)
            let strokeColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
            
            //// Group 2
            //// Page-1 Drawing
            let page1Path = UIBezierPath()
            page1Path.move(to: CGPoint(x: 15.88, y: 23.75))
            page1Path.addCurve(to: CGPoint(x: 7.07, y: 14.5), controlPoint1: CGPoint(x: 11.27, y: 23.75), controlPoint2: CGPoint(x: 7.07, y: 18.98))
            page1Path.addCurve(to: CGPoint(x: 15.93, y: 6.07), controlPoint1: CGPoint(x: 7.07, y: 10.01), controlPoint2: CGPoint(x: 11.32, y: 6.07))
            page1Path.addCurve(to: CGPoint(x: 24.75, y: 14.52), controlPoint1: CGPoint(x: 20.54, y: 6.07), controlPoint2: CGPoint(x: 24.75, y: 10.07))
            page1Path.addCurve(to: CGPoint(x: 15.88, y: 23.75), controlPoint1: CGPoint(x: 24.75, y: 19.01), controlPoint2: CGPoint(x: 20.52, y: 23.75))
            page1Path.addLine(to: CGPoint(x: 15.88, y: 23.75))
            page1Path.close()
            page1Path.move(to: CGPoint(x: 2, y: 14.17))
            page1Path.addCurve(to: CGPoint(x: 15.93, y: 41.53), controlPoint1: CGPoint(x: 2, y: 21.47), controlPoint2: CGPoint(x: 15.93, y: 41.53))
            page1Path.addCurve(to: CGPoint(x: 29.86, y: 14.17), controlPoint1: CGPoint(x: 15.93, y: 41.53), controlPoint2: CGPoint(x: 29.86, y: 21.47))
            page1Path.addCurve(to: CGPoint(x: 15.93, y: 1), controlPoint1: CGPoint(x: 29.86, y: 6.9), controlPoint2: CGPoint(x: 23.63, y: 1))
            page1Path.addCurve(to: CGPoint(x: 2, y: 14.17), controlPoint1: CGPoint(x: 8.23, y: 1), controlPoint2: CGPoint(x: 2, y: 6.9))
            page1Path.close()
            page1Path.miterLimit = 4;
            
            page1Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            page1Path.lineWidth = 1
            page1Path.stroke()
        }
            
        else if(type == "locationIcon"){
            let page1Path = UIBezierPath()
            page1Path.move(to: CGPoint(x: 8.88, y: 13.9))
            page1Path.addCurve(to: CGPoint(x: 3.88, y: 8.65), controlPoint1: CGPoint(x: 6.27, y: 13.9), controlPoint2: CGPoint(x: 3.88, y: 11.19))
            page1Path.addCurve(to: CGPoint(x: 8.91, y: 3.86), controlPoint1: CGPoint(x: 3.88, y: 6.1), controlPoint2: CGPoint(x: 6.29, y: 3.86))
            page1Path.addCurve(to: CGPoint(x: 13.92, y: 8.66), controlPoint1: CGPoint(x: 11.53, y: 3.86), controlPoint2: CGPoint(x: 13.92, y: 6.13))
            page1Path.addCurve(to: CGPoint(x: 8.88, y: 13.9), controlPoint1: CGPoint(x: 13.92, y: 11.21), controlPoint2: CGPoint(x: 11.52, y: 13.9))
            page1Path.addLine(to: CGPoint(x: 8.88, y: 13.9))
            page1Path.close()
            page1Path.move(to: CGPoint(x: 1, y: 8.46))
            page1Path.addCurve(to: CGPoint(x: 8.91, y: 24), controlPoint1: CGPoint(x: 1, y: 12.61), controlPoint2: CGPoint(x: 8.91, y: 24))
            page1Path.addCurve(to: CGPoint(x: 16.83, y: 8.46), controlPoint1: CGPoint(x: 8.91, y: 24), controlPoint2: CGPoint(x: 16.83, y: 12.61))
            page1Path.addCurve(to: CGPoint(x: 8.91, y: 0.98), controlPoint1: CGPoint(x: 16.83, y: 4.33), controlPoint2: CGPoint(x: 13.29, y: 0.98))
            page1Path.addCurve(to: CGPoint(x: 1, y: 8.46), controlPoint1: CGPoint(x: 4.54, y: 0.98), controlPoint2: CGPoint(x: 1, y: 4.33))
            page1Path.close()
            page1Path.miterLimit = 4;
            
            fillColor.setStroke()
            page1Path.lineWidth = 1
            page1Path.stroke()
            
        }
            
        else if(type == "calendar"){
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 9.84, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 1))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 1))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 2.79))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 6.3, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 6.3, y: 1))
            shapePath.addLine(to: CGPoint(x: 4.53, y: 1))
            shapePath.addLine(to: CGPoint(x: 4.53, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 4.53, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 6.3, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 6.3, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 6.3, y: 2.79))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 20.44, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 20.44, y: 1))
            shapePath.addLine(to: CGPoint(x: 18.67, y: 1))
            shapePath.addLine(to: CGPoint(x: 18.67, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 18.67, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 20.44, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 20.44, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 20.44, y: 2.79))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 16.9, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 1))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 1))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 2.79))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 13.37, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 1))
            shapePath.addLine(to: CGPoint(x: 11.6, y: 1))
            shapePath.addLine(to: CGPoint(x: 11.6, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 11.6, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 2.79))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 8.07, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 13.5))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 13.5))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 20.64))
            shapePath.addLine(to: CGPoint(x: 11.6, y: 20.64))
            shapePath.addLine(to: CGPoint(x: 11.6, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 11.71))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 13.37, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 13.5))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 13.5))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 20.64))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 20.64))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 11.71))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 1, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 1, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 1, y: 8.14))
            shapePath.addLine(to: CGPoint(x: 1, y: 24.21))
            shapePath.addLine(to: CGPoint(x: 2.77, y: 26))
            shapePath.addLine(to: CGPoint(x: 22.21, y: 26))
            shapePath.addLine(to: CGPoint(x: 23.97, y: 24.21))
            shapePath.addLine(to: CGPoint(x: 23.97, y: 8.14))
            shapePath.addLine(to: CGPoint(x: 23.97, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 23.97, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 22.21, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 22.21, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 22.21, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 20.44, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 18.67, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 11.6, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 6.3, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 4.53, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 2.77, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 2.77, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 2.77, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 1, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 1, y: 4.57))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 2.77, y: 8.14))
            shapePath.addLine(to: CGPoint(x: 4.53, y: 8.14))
            shapePath.addLine(to: CGPoint(x: 6.3, y: 8.14))
            shapePath.addLine(to: CGPoint(x: 22.21, y: 8.14))
            shapePath.addLine(to: CGPoint(x: 22.21, y: 24.21))
            shapePath.addLine(to: CGPoint(x: 2.77, y: 24.21))
            shapePath.addLine(to: CGPoint(x: 2.77, y: 8.14))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            fillColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
        }
            
        else if(type == "cross"){
            let context = UIGraphicsGetCurrentContext()
            
            //// Color Declarations
            let fillColor = UIColor(red: 0.100, green: 0.099, blue: 0.144, alpha: 1.000)
            
            //// Group 2
            //// Rectangle-1 Drawing
            context?.saveGState()
            context?.translateBy(x: 12.5, y: 12)
            context?.rotate(by: 45 * CGFloat(Double.pi) / 180)
            
            let rectangle1Path = UIBezierPath(rect: CGRect(x: -7.5, y: -1, width: 15, height: 2))
            fillColor.setFill()
            rectangle1Path.fill()
            
            context?.restoreGState()
            
            
            //// Rectangle- 3 Drawing
            context?.saveGState()
            context?.translateBy(x: 12.5, y: 12)
            context?.rotate(by: 45 * CGFloat(Double.pi) / 180)
            
            let rectangle3Path = UIBezierPath(rect: CGRect(x: -1, y: -7.5, width: 2, height: 15))
            fillColor.setFill()
            rectangle3Path.fill()
            
            context?.restoreGState()
        }
            
        else if(type == "Settings"){
            let strokeColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
            
            //// Bezier Drawing
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 28.03, y: 16.91))
            bezierPath.addCurve(to: CGPoint(x: 27.36, y: 19.84), controlPoint1: CGPoint(x: 27.79, y: 17.87), controlPoint2: CGPoint(x: 27.59, y: 18.83))
            bezierPath.addCurve(to: CGPoint(x: 25.3, y: 19.96), controlPoint1: CGPoint(x: 26.68, y: 19.88), controlPoint2: CGPoint(x: 25.98, y: 19.92))
            bezierPath.addCurve(to: CGPoint(x: 25.07, y: 19.96), controlPoint1: CGPoint(x: 25.22, y: 19.96), controlPoint2: CGPoint(x: 25.15, y: 19.97))
            bezierPath.addCurve(to: CGPoint(x: 23.31, y: 20.87), controlPoint1: CGPoint(x: 24.31, y: 19.92), controlPoint2: CGPoint(x: 23.71, y: 20.16))
            bezierPath.addCurve(to: CGPoint(x: 22.55, y: 21.79), controlPoint1: CGPoint(x: 23.12, y: 21.21), controlPoint2: CGPoint(x: 22.82, y: 21.5))
            bezierPath.addCurve(to: CGPoint(x: 22.23, y: 22.93), controlPoint1: CGPoint(x: 22.25, y: 22.12), controlPoint2: CGPoint(x: 22.15, y: 22.49))
            bezierPath.addCurve(to: CGPoint(x: 22.66, y: 25.48), controlPoint1: CGPoint(x: 22.39, y: 23.78), controlPoint2: CGPoint(x: 22.53, y: 24.62))
            bezierPath.addCurve(to: CGPoint(x: 22.55, y: 25.74), controlPoint1: CGPoint(x: 22.68, y: 25.56), controlPoint2: CGPoint(x: 22.62, y: 25.71))
            bezierPath.addCurve(to: CGPoint(x: 19.73, y: 27.11), controlPoint1: CGPoint(x: 21.62, y: 26.2), controlPoint2: CGPoint(x: 20.69, y: 26.65))
            bezierPath.addCurve(to: CGPoint(x: 17.93, y: 25.07), controlPoint1: CGPoint(x: 19.12, y: 26.43), controlPoint2: CGPoint(x: 18.51, y: 25.76))
            bezierPath.addCurve(to: CGPoint(x: 16.73, y: 24.57), controlPoint1: CGPoint(x: 17.6, y: 24.7), controlPoint2: CGPoint(x: 17.23, y: 24.54))
            bezierPath.addCurve(to: CGPoint(x: 15.22, y: 24.57), controlPoint1: CGPoint(x: 16.23, y: 24.6), controlPoint2: CGPoint(x: 15.72, y: 24.6))
            bezierPath.addCurve(to: CGPoint(x: 14.11, y: 25.04), controlPoint1: CGPoint(x: 14.75, y: 24.54), controlPoint2: CGPoint(x: 14.4, y: 24.7))
            bezierPath.addCurve(to: CGPoint(x: 12.27, y: 27.11), controlPoint1: CGPoint(x: 13.5, y: 25.73), controlPoint2: CGPoint(x: 12.89, y: 26.41))
            bezierPath.addCurve(to: CGPoint(x: 9.43, y: 25.73), controlPoint1: CGPoint(x: 11.31, y: 26.65), controlPoint2: CGPoint(x: 10.37, y: 26.2))
            bezierPath.addCurve(to: CGPoint(x: 9.33, y: 25.49), controlPoint1: CGPoint(x: 9.37, y: 25.71), controlPoint2: CGPoint(x: 9.32, y: 25.57))
            bezierPath.addCurve(to: CGPoint(x: 9.77, y: 22.95), controlPoint1: CGPoint(x: 9.47, y: 24.64), controlPoint2: CGPoint(x: 9.61, y: 23.79))
            bezierPath.addCurve(to: CGPoint(x: 9.44, y: 21.78), controlPoint1: CGPoint(x: 9.85, y: 22.5), controlPoint2: CGPoint(x: 9.74, y: 22.13))
            bezierPath.addCurve(to: CGPoint(x: 8.47, y: 20.57), controlPoint1: CGPoint(x: 9.1, y: 21.4), controlPoint2: CGPoint(x: 8.78, y: 20.99))
            bezierPath.addCurve(to: CGPoint(x: 7.51, y: 20), controlPoint1: CGPoint(x: 8.23, y: 20.24), controlPoint2: CGPoint(x: 7.93, y: 20.02))
            bezierPath.addCurve(to: CGPoint(x: 4.64, y: 19.84), controlPoint1: CGPoint(x: 6.56, y: 19.95), controlPoint2: CGPoint(x: 5.62, y: 19.9))
            bezierPath.addCurve(to: CGPoint(x: 4.11, y: 17.54), controlPoint1: CGPoint(x: 4.46, y: 19.07), controlPoint2: CGPoint(x: 4.28, y: 18.31))
            bezierPath.addCurve(to: CGPoint(x: 3.98, y: 16.64), controlPoint1: CGPoint(x: 4.05, y: 17.24), controlPoint2: CGPoint(x: 3.88, y: 16.87))
            bezierPath.addCurve(to: CGPoint(x: 4.74, y: 16.17), controlPoint1: CGPoint(x: 4.07, y: 16.41), controlPoint2: CGPoint(x: 4.47, y: 16.32))
            bezierPath.addCurve(to: CGPoint(x: 6.34, y: 15.29), controlPoint1: CGPoint(x: 5.27, y: 15.87), controlPoint2: CGPoint(x: 5.8, y: 15.57))
            bezierPath.addCurve(to: CGPoint(x: 7.03, y: 14.34), controlPoint1: CGPoint(x: 6.73, y: 15.08), controlPoint2: CGPoint(x: 6.95, y: 14.78))
            bezierPath.addCurve(to: CGPoint(x: 7.39, y: 12.8), controlPoint1: CGPoint(x: 7.12, y: 13.82), controlPoint2: CGPoint(x: 7.25, y: 13.31))
            bezierPath.addCurve(to: CGPoint(x: 7.2, y: 11.64), controlPoint1: CGPoint(x: 7.51, y: 12.38), controlPoint2: CGPoint(x: 7.46, y: 12))
            bezierPath.addCurve(to: CGPoint(x: 5.56, y: 9.35), controlPoint1: CGPoint(x: 6.65, y: 10.89), controlPoint2: CGPoint(x: 6.12, y: 10.13))
            bezierPath.addCurve(to: CGPoint(x: 7.23, y: 7.26), controlPoint1: CGPoint(x: 6.12, y: 8.66), controlPoint2: CGPoint(x: 6.67, y: 7.96))
            bezierPath.addCurve(to: CGPoint(x: 8.21, y: 7.01), controlPoint1: CGPoint(x: 7.63, y: 6.76), controlPoint2: CGPoint(x: 7.63, y: 6.76))
            bezierPath.addCurve(to: CGPoint(x: 10.19, y: 7.84), controlPoint1: CGPoint(x: 8.87, y: 7.29), controlPoint2: CGPoint(x: 9.53, y: 7.56))
            bezierPath.addCurve(to: CGPoint(x: 11.42, y: 7.76), controlPoint1: CGPoint(x: 10.61, y: 8.02), controlPoint2: CGPoint(x: 11.01, y: 7.99))
            bezierPath.addCurve(to: CGPoint(x: 12.78, y: 7.11), controlPoint1: CGPoint(x: 11.86, y: 7.52), controlPoint2: CGPoint(x: 12.32, y: 7.3))
            bezierPath.addCurve(to: CGPoint(x: 13.63, y: 6.17), controlPoint1: CGPoint(x: 13.23, y: 6.93), controlPoint2: CGPoint(x: 13.51, y: 6.63))
            bezierPath.addCurve(to: CGPoint(x: 14.27, y: 3.89), controlPoint1: CGPoint(x: 13.84, y: 5.41), controlPoint2: CGPoint(x: 14.07, y: 4.65))
            bezierPath.addCurve(to: CGPoint(x: 14.62, y: 3.63), controlPoint1: CGPoint(x: 14.33, y: 3.69), controlPoint2: CGPoint(x: 14.41, y: 3.62))
            bezierPath.addCurve(to: CGPoint(x: 17.4, y: 3.63), controlPoint1: CGPoint(x: 15.54, y: 3.64), controlPoint2: CGPoint(x: 16.47, y: 3.64))
            bezierPath.addCurve(to: CGPoint(x: 17.72, y: 3.87), controlPoint1: CGPoint(x: 17.59, y: 3.62), controlPoint2: CGPoint(x: 17.67, y: 3.67))
            bezierPath.addCurve(to: CGPoint(x: 18.39, y: 6.23), controlPoint1: CGPoint(x: 17.94, y: 4.66), controlPoint2: CGPoint(x: 18.18, y: 5.45))
            bezierPath.addCurve(to: CGPoint(x: 19.17, y: 7.09), controlPoint1: CGPoint(x: 18.51, y: 6.65), controlPoint2: CGPoint(x: 18.77, y: 6.92))
            bezierPath.addCurve(to: CGPoint(x: 20.64, y: 7.8), controlPoint1: CGPoint(x: 19.67, y: 7.3), controlPoint2: CGPoint(x: 20.16, y: 7.54))
            bezierPath.addCurve(to: CGPoint(x: 21.76, y: 7.86), controlPoint1: CGPoint(x: 21.01, y: 7.99), controlPoint2: CGPoint(x: 21.38, y: 8.02))
            bezierPath.addCurve(to: CGPoint(x: 24.15, y: 6.87), controlPoint1: CGPoint(x: 22.56, y: 7.53), controlPoint2: CGPoint(x: 23.35, y: 7.19))
            bezierPath.addCurve(to: CGPoint(x: 24.47, y: 6.91), controlPoint1: CGPoint(x: 24.24, y: 6.83), controlPoint2: CGPoint(x: 24.42, y: 6.84))
            bezierPath.addCurve(to: CGPoint(x: 26.43, y: 9.35), controlPoint1: CGPoint(x: 25.13, y: 7.71), controlPoint2: CGPoint(x: 25.77, y: 8.53))
            bezierPath.addCurve(to: CGPoint(x: 24.83, y: 11.6), controlPoint1: CGPoint(x: 25.89, y: 10.11), controlPoint2: CGPoint(x: 25.37, y: 10.86))
            bezierPath.addCurve(to: CGPoint(x: 24.63, y: 12.85), controlPoint1: CGPoint(x: 24.54, y: 11.99), controlPoint2: CGPoint(x: 24.48, y: 12.38))
            bezierPath.addCurve(to: CGPoint(x: 24.96, y: 14.32), controlPoint1: CGPoint(x: 24.77, y: 13.33), controlPoint2: CGPoint(x: 24.88, y: 13.82))
            bezierPath.addCurve(to: CGPoint(x: 25.64, y: 15.28), controlPoint1: CGPoint(x: 25.03, y: 14.76), controlPoint2: CGPoint(x: 25.25, y: 15.07))
            bezierPath.addCurve(to: CGPoint(x: 27.83, y: 16.47), controlPoint1: CGPoint(x: 26.37, y: 15.68), controlPoint2: CGPoint(x: 27.1, y: 16.08))
            bezierPath.addCurve(to: CGPoint(x: 28.03, y: 16.91), controlPoint1: CGPoint(x: 28.02, y: 16.57), controlPoint2: CGPoint(x: 28.09, y: 16.67))
            bezierPath.addLine(to: CGPoint(x: 28.03, y: 16.91))
            bezierPath.close()
            bezierPath.miterLimit = 4;
            
            strokeColor.setStroke()
            bezierPath.lineWidth = 1
            bezierPath.stroke()
            
            //// Bezier 2 Drawing
            let bezier2Path = UIBezierPath()
            bezier2Path.move(to: CGPoint(x: 29.89, y: 14.97))
            bezier2Path.addCurve(to: CGPoint(x: 27.42, y: 13.62), controlPoint1: CGPoint(x: 29.07, y: 14.51), controlPoint2: CGPoint(x: 28.24, y: 14.07))
            bezier2Path.addCurve(to: CGPoint(x: 27.13, y: 12.36), controlPoint1: CGPoint(x: 27.07, y: 13.42), controlPoint2: CGPoint(x: 26.9, y: 12.68))
            bezier2Path.addCurve(to: CGPoint(x: 28.76, y: 10.06), controlPoint1: CGPoint(x: 27.68, y: 11.59), controlPoint2: CGPoint(x: 28.23, y: 10.84))
            bezier2Path.addCurve(to: CGPoint(x: 29.11, y: 9.31), controlPoint1: CGPoint(x: 28.91, y: 9.85), controlPoint2: CGPoint(x: 28.98, y: 9.58))
            bezier2Path.addCurve(to: CGPoint(x: 28.77, y: 8.58), controlPoint1: CGPoint(x: 28.99, y: 9.04), controlPoint2: CGPoint(x: 28.92, y: 8.78))
            bezier2Path.addCurve(to: CGPoint(x: 25.66, y: 4.68), controlPoint1: CGPoint(x: 27.74, y: 7.27), controlPoint2: CGPoint(x: 26.7, y: 5.97))
            bezier2Path.addCurve(to: CGPoint(x: 24.22, y: 4.32), controlPoint1: CGPoint(x: 25.27, y: 4.19), controlPoint2: CGPoint(x: 24.79, y: 4.09))
            bezier2Path.addCurve(to: CGPoint(x: 22.01, y: 5.25), controlPoint1: CGPoint(x: 23.48, y: 4.63), controlPoint2: CGPoint(x: 22.73, y: 4.91))
            bezier2Path.addCurve(to: CGPoint(x: 20.71, y: 5.21), controlPoint1: CGPoint(x: 21.55, y: 5.48), controlPoint2: CGPoint(x: 21.13, y: 5.54))
            bezier2Path.addCurve(to: CGPoint(x: 20.43, y: 4.88), controlPoint1: CGPoint(x: 20.59, y: 5.12), controlPoint2: CGPoint(x: 20.46, y: 5))
            bezier2Path.addCurve(to: CGPoint(x: 19.67, y: 2.27), controlPoint1: CGPoint(x: 20.16, y: 4.01), controlPoint2: CGPoint(x: 19.92, y: 3.14))
            bezier2Path.addCurve(to: CGPoint(x: 18.42, y: 1.31), controlPoint1: CGPoint(x: 19.48, y: 1.61), controlPoint2: CGPoint(x: 19.1, y: 1.31))
            bezier2Path.addCurve(to: CGPoint(x: 13.58, y: 1.31), controlPoint1: CGPoint(x: 16.81, y: 1.31), controlPoint2: CGPoint(x: 15.2, y: 1.31))
            bezier2Path.addCurve(to: CGPoint(x: 12.34, y: 2.24), controlPoint1: CGPoint(x: 12.91, y: 1.31), controlPoint2: CGPoint(x: 12.52, y: 1.6))
            bezier2Path.addCurve(to: CGPoint(x: 11.73, y: 4.43), controlPoint1: CGPoint(x: 12.13, y: 2.97), controlPoint2: CGPoint(x: 11.88, y: 3.69))
            bezier2Path.addCurve(to: CGPoint(x: 10.9, y: 5.41), controlPoint1: CGPoint(x: 11.62, y: 4.93), controlPoint2: CGPoint(x: 11.39, y: 5.25))
            bezier2Path.addCurve(to: CGPoint(x: 10.4, y: 5.42), controlPoint1: CGPoint(x: 10.72, y: 5.48), controlPoint2: CGPoint(x: 10.58, y: 5.5))
            bezier2Path.addCurve(to: CGPoint(x: 7.81, y: 4.34), controlPoint1: CGPoint(x: 9.54, y: 5.05), controlPoint2: CGPoint(x: 8.68, y: 4.69))
            bezier2Path.addCurve(to: CGPoint(x: 6.3, y: 4.72), controlPoint1: CGPoint(x: 7.19, y: 4.08), controlPoint2: CGPoint(x: 6.72, y: 4.19))
            bezier2Path.addCurve(to: CGPoint(x: 3.26, y: 8.52), controlPoint1: CGPoint(x: 5.28, y: 5.99), controlPoint2: CGPoint(x: 4.27, y: 7.25))
            bezier2Path.addCurve(to: CGPoint(x: 3.23, y: 10.06), controlPoint1: CGPoint(x: 2.86, y: 9.03), controlPoint2: CGPoint(x: 2.85, y: 9.53))
            bezier2Path.addCurve(to: CGPoint(x: 4.68, y: 12.09), controlPoint1: CGPoint(x: 3.71, y: 10.74), controlPoint2: CGPoint(x: 4.17, y: 11.43))
            bezier2Path.addCurve(to: CGPoint(x: 4.9, y: 13.15), controlPoint1: CGPoint(x: 4.95, y: 12.42), controlPoint2: CGPoint(x: 5.03, y: 12.73))
            bezier2Path.addCurve(to: CGPoint(x: 4.5, y: 13.65), controlPoint1: CGPoint(x: 4.83, y: 13.39), controlPoint2: CGPoint(x: 4.72, y: 13.54))
            bezier2Path.addCurve(to: CGPoint(x: 2.1, y: 14.98), controlPoint1: CGPoint(x: 3.7, y: 14.08), controlPoint2: CGPoint(x: 2.9, y: 14.53))
            bezier2Path.addCurve(to: CGPoint(x: 1.46, y: 16.29), controlPoint1: CGPoint(x: 1.56, y: 15.27), controlPoint2: CGPoint(x: 1.33, y: 15.7))
            bezier2Path.addCurve(to: CGPoint(x: 2.6, y: 21.27), controlPoint1: CGPoint(x: 1.83, y: 17.95), controlPoint2: CGPoint(x: 2.21, y: 19.61))
            bezier2Path.addCurve(to: CGPoint(x: 3.57, y: 22.1), controlPoint1: CGPoint(x: 2.71, y: 21.72), controlPoint2: CGPoint(x: 3.12, y: 22.07))
            bezier2Path.addCurve(to: CGPoint(x: 6.03, y: 22.22), controlPoint1: CGPoint(x: 4.39, y: 22.15), controlPoint2: CGPoint(x: 5.21, y: 22.22))
            bezier2Path.addCurve(to: CGPoint(x: 7.3, y: 22.87), controlPoint1: CGPoint(x: 6.59, y: 22.22), controlPoint2: CGPoint(x: 7.03, y: 22.35))
            bezier2Path.addCurve(to: CGPoint(x: 7.37, y: 23.18), controlPoint1: CGPoint(x: 7.35, y: 22.96), controlPoint2: CGPoint(x: 7.39, y: 23.09))
            bezier2Path.addCurve(to: CGPoint(x: 6.89, y: 26.01), controlPoint1: CGPoint(x: 7.22, y: 24.13), controlPoint2: CGPoint(x: 7.05, y: 25.07))
            bezier2Path.addCurve(to: CGPoint(x: 7.63, y: 27.44), controlPoint1: CGPoint(x: 6.77, y: 26.72), controlPoint2: CGPoint(x: 6.98, y: 27.13))
            bezier2Path.addCurve(to: CGPoint(x: 11.94, y: 29.52), controlPoint1: CGPoint(x: 9.06, y: 28.14), controlPoint2: CGPoint(x: 10.5, y: 28.83))
            bezier2Path.addCurve(to: CGPoint(x: 13.5, y: 29.21), controlPoint1: CGPoint(x: 12.57, y: 29.82), controlPoint2: CGPoint(x: 13.04, y: 29.73))
            bezier2Path.addCurve(to: CGPoint(x: 15.1, y: 27.38), controlPoint1: CGPoint(x: 14.04, y: 28.6), controlPoint2: CGPoint(x: 14.6, y: 28.01))
            bezier2Path.addCurve(to: CGPoint(x: 16.2, y: 26.92), controlPoint1: CGPoint(x: 15.4, y: 27.01), controlPoint2: CGPoint(x: 15.73, y: 26.81))
            bezier2Path.addCurve(to: CGPoint(x: 16.62, y: 27.11), controlPoint1: CGPoint(x: 16.35, y: 26.95), controlPoint2: CGPoint(x: 16.53, y: 27.01))
            bezier2Path.addCurve(to: CGPoint(x: 18.54, y: 29.26), controlPoint1: CGPoint(x: 17.27, y: 27.82), controlPoint2: CGPoint(x: 17.9, y: 28.54))
            bezier2Path.addCurve(to: CGPoint(x: 20, y: 29.55), controlPoint1: CGPoint(x: 18.95, y: 29.71), controlPoint2: CGPoint(x: 19.45, y: 29.81))
            bezier2Path.addCurve(to: CGPoint(x: 20.62, y: 29.25), controlPoint1: CGPoint(x: 20.21, y: 29.46), controlPoint2: CGPoint(x: 20.41, y: 29.35))
            bezier2Path.addCurve(to: CGPoint(x: 24.43, y: 27.41), controlPoint1: CGPoint(x: 21.89, y: 28.64), controlPoint2: CGPoint(x: 23.16, y: 28.03))
            bezier2Path.addCurve(to: CGPoint(x: 25.15, y: 26.2), controlPoint1: CGPoint(x: 24.95, y: 27.16), controlPoint2: CGPoint(x: 25.23, y: 26.7))
            bezier2Path.addCurve(to: CGPoint(x: 24.69, y: 23.56), controlPoint1: CGPoint(x: 25.01, y: 25.32), controlPoint2: CGPoint(x: 24.86, y: 24.43))
            bezier2Path.addCurve(to: CGPoint(x: 24.9, y: 22.59), controlPoint1: CGPoint(x: 24.61, y: 23.19), controlPoint2: CGPoint(x: 24.62, y: 22.89))
            bezier2Path.addCurve(to: CGPoint(x: 25.56, y: 22.25), controlPoint1: CGPoint(x: 25.1, y: 22.38), controlPoint2: CGPoint(x: 25.27, y: 22.26))
            bezier2Path.addCurve(to: CGPoint(x: 28.27, y: 22.1), controlPoint1: CGPoint(x: 26.46, y: 22.21), controlPoint2: CGPoint(x: 27.37, y: 22.15))
            bezier2Path.addCurve(to: CGPoint(x: 29.43, y: 21.18), controlPoint1: CGPoint(x: 28.89, y: 22.07), controlPoint2: CGPoint(x: 29.29, y: 21.78))
            bezier2Path.addCurve(to: CGPoint(x: 30.53, y: 16.35), controlPoint1: CGPoint(x: 29.8, y: 19.57), controlPoint2: CGPoint(x: 30.17, y: 17.96))
            bezier2Path.addCurve(to: CGPoint(x: 29.89, y: 14.97), controlPoint1: CGPoint(x: 30.67, y: 15.72), controlPoint2: CGPoint(x: 30.46, y: 15.29))
            bezier2Path.addLine(to: CGPoint(x: 29.89, y: 14.97))
            bezier2Path.close()
            bezier2Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier2Path.lineWidth = 1
            bezier2Path.stroke()
            
            //// Oval Drawing
            let ovalPath = UIBezierPath(ovalIn: CGRect(x: 13.05, y: 12.6, width: 5.9, height: 5.9))
            strokeColor.setStroke()
            ovalPath.lineWidth = 1
            ovalPath.stroke()
            
            
            //// Oval 2 Drawing
            let oval2Path = UIBezierPath(ovalIn: CGRect(x: 10.7, y: 10.35, width: 10.6, height: 10.5))
            strokeColor.setStroke()
            oval2Path.lineWidth = 1
            oval2Path.stroke()
        }
            
        else if(type == "About Us"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 13), false, 0)
            
            //// Color Declarations
            let strokeColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
            
            //// Page-1
            //// Stroke-1 Drawing
            let stroke1Path = UIBezierPath()
            stroke1Path.move(to: CGPoint(x: 19.52, y: 1.22))
            stroke1Path.addLine(to: CGPoint(x: 26.4, y: 11.21))
            stroke1Path.addLine(to: CGPoint(x: 26.44, y: 11.21))
            stroke1Path.addLine(to: CGPoint(x: 26.44, y: 1.22))
            stroke1Path.addLine(to: CGPoint(x: 27.56, y: 1.22))
            stroke1Path.addLine(to: CGPoint(x: 27.56, y: 13.03))
            stroke1Path.addLine(to: CGPoint(x: 26.3, y: 13.03))
            stroke1Path.addLine(to: CGPoint(x: 19.42, y: 3.04))
            stroke1Path.addLine(to: CGPoint(x: 19.39, y: 3.04))
            stroke1Path.addLine(to: CGPoint(x: 19.39, y: 13.03))
            stroke1Path.addLine(to: CGPoint(x: 18.27, y: 13.03))
            stroke1Path.addLine(to: CGPoint(x: 18.27, y: 1.22))
            stroke1Path.addLine(to: CGPoint(x: 19.52, y: 1.22))
            stroke1Path.close()
            stroke1Path.miterLimit = 4;
            
            stroke1Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke1Path.lineWidth = 0.5
            stroke1Path.stroke()
            
            
            //// Stroke-3 Drawing
            let stroke3Path = UIBezierPath()
            stroke3Path.move(to: CGPoint(x: 1.13, y: 12.8))
            stroke3Path.addCurve(to: CGPoint(x: 1.43, y: 11.28), controlPoint1: CGPoint(x: 1.14, y: 12.23), controlPoint2: CGPoint(x: 1.24, y: 11.72))
            stroke3Path.addCurve(to: CGPoint(x: 2.17, y: 10.09), controlPoint1: CGPoint(x: 1.61, y: 10.84), controlPoint2: CGPoint(x: 1.86, y: 10.44))
            stroke3Path.addCurve(to: CGPoint(x: 3.21, y: 9.12), controlPoint1: CGPoint(x: 2.48, y: 9.74), controlPoint2: CGPoint(x: 2.83, y: 9.41))
            stroke3Path.addCurve(to: CGPoint(x: 4.4, y: 8.28), controlPoint1: CGPoint(x: 3.6, y: 8.83), controlPoint2: CGPoint(x: 3.99, y: 8.55))
            stroke3Path.addCurve(to: CGPoint(x: 5.62, y: 7.45), controlPoint1: CGPoint(x: 4.81, y: 8.01), controlPoint2: CGPoint(x: 5.21, y: 7.73))
            stroke3Path.addCurve(to: CGPoint(x: 6.7, y: 6.55), controlPoint1: CGPoint(x: 6.02, y: 7.17), controlPoint2: CGPoint(x: 6.38, y: 6.87))
            stroke3Path.addCurve(to: CGPoint(x: 7.42, y: 5.57), controlPoint1: CGPoint(x: 7.02, y: 6.23), controlPoint2: CGPoint(x: 7.26, y: 5.9))
            stroke3Path.addCurve(to: CGPoint(x: 7.66, y: 4.37), controlPoint1: CGPoint(x: 7.58, y: 5.23), controlPoint2: CGPoint(x: 7.66, y: 4.83))
            stroke3Path.addCurve(to: CGPoint(x: 7.45, y: 3.37), controlPoint1: CGPoint(x: 7.66, y: 3.99), controlPoint2: CGPoint(x: 7.59, y: 3.66))
            stroke3Path.addCurve(to: CGPoint(x: 6.89, y: 2.62), controlPoint1: CGPoint(x: 7.32, y: 3.07), controlPoint2: CGPoint(x: 7.13, y: 2.83))
            stroke3Path.addCurve(to: CGPoint(x: 6.06, y: 2.16), controlPoint1: CGPoint(x: 6.65, y: 2.42), controlPoint2: CGPoint(x: 6.38, y: 2.26))
            stroke3Path.addCurve(to: CGPoint(x: 5.06, y: 2), controlPoint1: CGPoint(x: 5.75, y: 2.05), controlPoint2: CGPoint(x: 5.42, y: 2))
            stroke3Path.addCurve(to: CGPoint(x: 3.85, y: 2.27), controlPoint1: CGPoint(x: 4.59, y: 2), controlPoint2: CGPoint(x: 4.18, y: 2.09))
            stroke3Path.addCurve(to: CGPoint(x: 3.03, y: 2.98), controlPoint1: CGPoint(x: 3.51, y: 2.44), controlPoint2: CGPoint(x: 3.24, y: 2.68))
            stroke3Path.addCurve(to: CGPoint(x: 2.57, y: 4), controlPoint1: CGPoint(x: 2.82, y: 3.28), controlPoint2: CGPoint(x: 2.67, y: 3.62))
            stroke3Path.addCurve(to: CGPoint(x: 2.45, y: 5.23), controlPoint1: CGPoint(x: 2.48, y: 4.39), controlPoint2: CGPoint(x: 2.44, y: 4.8))
            stroke3Path.addLine(to: CGPoint(x: 1.41, y: 5.23))
            stroke3Path.addCurve(to: CGPoint(x: 1.62, y: 3.58), controlPoint1: CGPoint(x: 1.4, y: 4.63), controlPoint2: CGPoint(x: 1.47, y: 4.08))
            stroke3Path.addCurve(to: CGPoint(x: 2.3, y: 2.28), controlPoint1: CGPoint(x: 1.76, y: 3.08), controlPoint2: CGPoint(x: 1.99, y: 2.65))
            stroke3Path.addCurve(to: CGPoint(x: 3.47, y: 1.43), controlPoint1: CGPoint(x: 2.61, y: 1.92), controlPoint2: CGPoint(x: 3, y: 1.64))
            stroke3Path.addCurve(to: CGPoint(x: 5.11, y: 1.12), controlPoint1: CGPoint(x: 3.94, y: 1.23), controlPoint2: CGPoint(x: 4.48, y: 1.12))
            stroke3Path.addCurve(to: CGPoint(x: 6.53, y: 1.33), controlPoint1: CGPoint(x: 5.62, y: 1.12), controlPoint2: CGPoint(x: 6.09, y: 1.19))
            stroke3Path.addCurve(to: CGPoint(x: 7.67, y: 1.94), controlPoint1: CGPoint(x: 6.96, y: 1.47), controlPoint2: CGPoint(x: 7.34, y: 1.67))
            stroke3Path.addCurve(to: CGPoint(x: 8.43, y: 2.96), controlPoint1: CGPoint(x: 7.99, y: 2.21), controlPoint2: CGPoint(x: 8.25, y: 2.55))
            stroke3Path.addCurve(to: CGPoint(x: 8.7, y: 4.38), controlPoint1: CGPoint(x: 8.61, y: 3.37), controlPoint2: CGPoint(x: 8.7, y: 3.84))
            stroke3Path.addCurve(to: CGPoint(x: 8.46, y: 5.71), controlPoint1: CGPoint(x: 8.7, y: 4.87), controlPoint2: CGPoint(x: 8.62, y: 5.31))
            stroke3Path.addCurve(to: CGPoint(x: 7.82, y: 6.8), controlPoint1: CGPoint(x: 8.3, y: 6.1), controlPoint2: CGPoint(x: 8.09, y: 6.47))
            stroke3Path.addCurve(to: CGPoint(x: 6.89, y: 7.72), controlPoint1: CGPoint(x: 7.55, y: 7.13), controlPoint2: CGPoint(x: 7.24, y: 7.43))
            stroke3Path.addCurve(to: CGPoint(x: 5.79, y: 8.5), controlPoint1: CGPoint(x: 6.54, y: 8), controlPoint2: CGPoint(x: 6.18, y: 8.26))
            stroke3Path.addCurve(to: CGPoint(x: 4.82, y: 9.12), controlPoint1: CGPoint(x: 5.52, y: 8.69), controlPoint2: CGPoint(x: 5.19, y: 8.9))
            stroke3Path.addCurve(to: CGPoint(x: 3.73, y: 9.87), controlPoint1: CGPoint(x: 4.44, y: 9.35), controlPoint2: CGPoint(x: 4.08, y: 9.6))
            stroke3Path.addCurve(to: CGPoint(x: 2.81, y: 10.78), controlPoint1: CGPoint(x: 3.39, y: 10.15), controlPoint2: CGPoint(x: 3.08, y: 10.45))
            stroke3Path.addCurve(to: CGPoint(x: 2.32, y: 11.84), controlPoint1: CGPoint(x: 2.55, y: 11.1), controlPoint2: CGPoint(x: 2.38, y: 11.46))
            stroke3Path.addLine(to: CGPoint(x: 8.75, y: 11.84))
            stroke3Path.addLine(to: CGPoint(x: 8.75, y: 12.8))
            stroke3Path.addLine(to: CGPoint(x: 1.13, y: 12.8))
            stroke3Path.addLine(to: CGPoint(x: 1.13, y: 12.8))
            stroke3Path.close()
            stroke3Path.miterLimit = 4;
            
            stroke3Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke3Path.lineWidth = 0.5
            stroke3Path.stroke()
            
            
            //// Stroke-5 Drawing
            let stroke5Path = UIBezierPath()
            stroke5Path.move(to: CGPoint(x: 12.56, y: 3.38))
            stroke5Path.addCurve(to: CGPoint(x: 13.52, y: 3.11), controlPoint1: CGPoint(x: 12.93, y: 3.34), controlPoint2: CGPoint(x: 13.25, y: 3.25))
            stroke5Path.addCurve(to: CGPoint(x: 14.2, y: 2.46), controlPoint1: CGPoint(x: 13.79, y: 2.97), controlPoint2: CGPoint(x: 14.02, y: 2.75))
            stroke5Path.addCurve(to: CGPoint(x: 14.59, y: 1.22), controlPoint1: CGPoint(x: 14.38, y: 2.16), controlPoint2: CGPoint(x: 14.51, y: 1.75))
            stroke5Path.addLine(to: CGPoint(x: 15.43, y: 1.22))
            stroke5Path.addLine(to: CGPoint(x: 15.43, y: 12.8))
            stroke5Path.addLine(to: CGPoint(x: 14.39, y: 12.8))
            stroke5Path.addLine(to: CGPoint(x: 14.39, y: 4.2))
            stroke5Path.addLine(to: CGPoint(x: 11.33, y: 4.2))
            stroke5Path.addLine(to: CGPoint(x: 11.33, y: 3.46))
            stroke5Path.addCurve(to: CGPoint(x: 12.56, y: 3.38), controlPoint1: CGPoint(x: 11.78, y: 3.45), controlPoint2: CGPoint(x: 12.19, y: 3.42))
            stroke5Path.addLine(to: CGPoint(x: 12.56, y: 3.38))
            stroke5Path.close()
            stroke5Path.miterLimit = 4;
            
            stroke5Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke5Path.lineWidth = 0.5
            stroke5Path.stroke()
            
        }
        else if(type == "Sharing"){
            //// Color Declarations
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 30), false, 0)
            let strokeColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
            
            //// Page-1 Drawing
            let page1Path = UIBezierPath()
            page1Path.move(to: CGPoint(x: 22.25, y: 19.6))
            page1Path.addCurve(to: CGPoint(x: 24.59, y: 21.93), controlPoint1: CGPoint(x: 23.51, y: 19.6), controlPoint2: CGPoint(x: 24.59, y: 20.67))
            page1Path.addCurve(to: CGPoint(x: 22.22, y: 24.28), controlPoint1: CGPoint(x: 24.59, y: 23.21), controlPoint2: CGPoint(x: 23.5, y: 24.3))
            page1Path.addCurve(to: CGPoint(x: 19.9, y: 21.93), controlPoint1: CGPoint(x: 20.95, y: 24.27), controlPoint2: CGPoint(x: 19.89, y: 23.18))
            page1Path.addCurve(to: CGPoint(x: 22.25, y: 19.6), controlPoint1: CGPoint(x: 19.91, y: 20.67), controlPoint2: CGPoint(x: 20.99, y: 19.6))
            page1Path.addLine(to: CGPoint(x: 22.25, y: 19.6))
            page1Path.close()
            page1Path.move(to: CGPoint(x: 5.08, y: 15.69))
            page1Path.addCurve(to: CGPoint(x: 2.71, y: 13.38), controlPoint1: CGPoint(x: 3.82, y: 15.71), controlPoint2: CGPoint(x: 2.74, y: 14.65))
            page1Path.addCurve(to: CGPoint(x: 5.06, y: 11), controlPoint1: CGPoint(x: 2.69, y: 12.11), controlPoint2: CGPoint(x: 3.78, y: 11))
            page1Path.addCurve(to: CGPoint(x: 7.4, y: 13.34), controlPoint1: CGPoint(x: 6.32, y: 11.01), controlPoint2: CGPoint(x: 7.4, y: 12.08))
            page1Path.addCurve(to: CGPoint(x: 5.08, y: 15.69), controlPoint1: CGPoint(x: 7.41, y: 14.6), controlPoint2: CGPoint(x: 6.35, y: 15.67))
            page1Path.addLine(to: CGPoint(x: 5.08, y: 15.69))
            page1Path.close()
            page1Path.move(to: CGPoint(x: 22.27, y: 2.41))
            page1Path.addCurve(to: CGPoint(x: 24.59, y: 4.76), controlPoint1: CGPoint(x: 23.53, y: 2.43), controlPoint2: CGPoint(x: 24.6, y: 3.51))
            page1Path.addCurve(to: CGPoint(x: 22.25, y: 7.1), controlPoint1: CGPoint(x: 24.58, y: 6.03), controlPoint2: CGPoint(x: 23.51, y: 7.09))
            page1Path.addCurve(to: CGPoint(x: 19.9, y: 4.72), controlPoint1: CGPoint(x: 20.97, y: 7.1), controlPoint2: CGPoint(x: 19.88, y: 5.99))
            page1Path.addCurve(to: CGPoint(x: 22.27, y: 2.41), controlPoint1: CGPoint(x: 19.93, y: 3.45), controlPoint2: CGPoint(x: 21.01, y: 2.4))
            page1Path.addLine(to: CGPoint(x: 22.27, y: 2.41))
            page1Path.close()
            page1Path.move(to: CGPoint(x: 9.25, y: 11.93))
            page1Path.addCurve(to: CGPoint(x: 18.61, y: 7.25), controlPoint1: CGPoint(x: 12.38, y: 10.38), controlPoint2: CGPoint(x: 15.5, y: 8.82))
            page1Path.addCurve(to: CGPoint(x: 19.38, y: 7.39), controlPoint1: CGPoint(x: 18.95, y: 7.08), controlPoint2: CGPoint(x: 19.12, y: 7.12))
            page1Path.addCurve(to: CGPoint(x: 25.21, y: 7.27), controlPoint1: CGPoint(x: 21, y: 9.14), controlPoint2: CGPoint(x: 23.7, y: 9.11))
            page1Path.addCurve(to: CGPoint(x: 26.15, y: 5.44), controlPoint1: CGPoint(x: 25.64, y: 6.75), controlPoint2: CGPoint(x: 25.84, y: 6.05))
            page1Path.addLine(to: CGPoint(x: 26.15, y: 4.07))
            page1Path.addCurve(to: CGPoint(x: 24.96, y: 1.93), controlPoint1: CGPoint(x: 25.9, y: 3.28), controlPoint2: CGPoint(x: 25.58, y: 2.53))
            page1Path.addCurve(to: CGPoint(x: 22.93, y: 0.85), controlPoint1: CGPoint(x: 24.38, y: 1.37), controlPoint2: CGPoint(x: 23.67, y: 1.1))
            page1Path.addLine(to: CGPoint(x: 21.56, y: 0.85))
            page1Path.addCurve(to: CGPoint(x: 21.4, y: 0.94), controlPoint1: CGPoint(x: 21.51, y: 0.88), controlPoint2: CGPoint(x: 21.46, y: 0.92))
            page1Path.addCurve(to: CGPoint(x: 18.41, y: 4.05), controlPoint1: CGPoint(x: 19.76, y: 1.36), controlPoint2: CGPoint(x: 18.74, y: 2.4))
            page1Path.addCurve(to: CGPoint(x: 18.4, y: 5.58), controlPoint1: CGPoint(x: 18.32, y: 4.54), controlPoint2: CGPoint(x: 18.4, y: 5.07))
            page1Path.addCurve(to: CGPoint(x: 18.21, y: 5.69), controlPoint1: CGPoint(x: 18.32, y: 5.63), controlPoint2: CGPoint(x: 18.26, y: 5.67))
            page1Path.addCurve(to: CGPoint(x: 8.33, y: 10.64), controlPoint1: CGPoint(x: 14.91, y: 7.34), controlPoint2: CGPoint(x: 11.62, y: 8.98))
            page1Path.addCurve(to: CGPoint(x: 7.72, y: 10.49), controlPoint1: CGPoint(x: 8.04, y: 10.79), controlPoint2: CGPoint(x: 7.91, y: 10.67))
            page1Path.addCurve(to: CGPoint(x: 2.24, y: 10.63), controlPoint1: CGPoint(x: 6.16, y: 9.02), controlPoint2: CGPoint(x: 3.74, y: 9.1))
            page1Path.addCurve(to: CGPoint(x: 1.15, y: 12.66), controlPoint1: CGPoint(x: 1.68, y: 11.21), controlPoint2: CGPoint(x: 1.4, y: 11.93))
            page1Path.addLine(to: CGPoint(x: 1.15, y: 14.03))
            page1Path.addCurve(to: CGPoint(x: 1.25, y: 14.24), controlPoint1: CGPoint(x: 1.19, y: 14.1), controlPoint2: CGPoint(x: 1.23, y: 14.17))
            page1Path.addCurve(to: CGPoint(x: 7.78, y: 16.13), controlPoint1: CGPoint(x: 2.04, y: 17.24), controlPoint2: CGPoint(x: 5.51, y: 18.25))
            page1Path.addCurve(to: CGPoint(x: 8.42, y: 16.1), controlPoint1: CGPoint(x: 8.04, y: 15.89), controlPoint2: CGPoint(x: 8.2, y: 15.99))
            page1Path.addCurve(to: CGPoint(x: 18.03, y: 20.91), controlPoint1: CGPoint(x: 11.62, y: 17.71), controlPoint2: CGPoint(x: 14.83, y: 19.31))
            page1Path.addCurve(to: CGPoint(x: 18.39, y: 21.12), controlPoint1: CGPoint(x: 18.16, y: 20.98), controlPoint2: CGPoint(x: 18.28, y: 21.05))
            page1Path.addCurve(to: CGPoint(x: 19.84, y: 25), controlPoint1: CGPoint(x: 18.2, y: 22.82), controlPoint2: CGPoint(x: 18.65, y: 24.14))
            page1Path.addCurve(to: CGPoint(x: 21.56, y: 25.85), controlPoint1: CGPoint(x: 20.35, y: 25.37), controlPoint2: CGPoint(x: 20.98, y: 25.57))
            page1Path.addLine(to: CGPoint(x: 22.93, y: 25.85))
            page1Path.addCurve(to: CGPoint(x: 23.61, y: 25.61), controlPoint1: CGPoint(x: 23.16, y: 25.77), controlPoint2: CGPoint(x: 23.39, y: 25.7))
            page1Path.addCurve(to: CGPoint(x: 26.04, y: 22.93), controlPoint1: CGPoint(x: 24.85, y: 25.11), controlPoint2: CGPoint(x: 25.66, y: 24.22))
            page1Path.addCurve(to: CGPoint(x: 26.15, y: 22.62), controlPoint1: CGPoint(x: 26.07, y: 22.83), controlPoint2: CGPoint(x: 26.11, y: 22.73))
            page1Path.addLine(to: CGPoint(x: 26.15, y: 21.26))
            page1Path.addCurve(to: CGPoint(x: 26.09, y: 21.18), controlPoint1: CGPoint(x: 26.13, y: 21.23), controlPoint2: CGPoint(x: 26.1, y: 21.21))
            page1Path.addCurve(to: CGPoint(x: 19.23, y: 19.43), controlPoint1: CGPoint(x: 25.44, y: 17.97), controlPoint2: CGPoint(x: 21.38, y: 16.9))
            page1Path.addCurve(to: CGPoint(x: 18.75, y: 19.49), controlPoint1: CGPoint(x: 19.15, y: 19.52), controlPoint2: CGPoint(x: 18.87, y: 19.55))
            page1Path.addCurve(to: CGPoint(x: 9.12, y: 14.7), controlPoint1: CGPoint(x: 15.54, y: 17.9), controlPoint2: CGPoint(x: 12.33, y: 16.29))
            page1Path.addCurve(to: CGPoint(x: 8.87, y: 14.17), controlPoint1: CGPoint(x: 8.86, y: 14.57), controlPoint2: CGPoint(x: 8.84, y: 14.43))
            page1Path.addCurve(to: CGPoint(x: 8.88, y: 12.62), controlPoint1: CGPoint(x: 8.91, y: 13.66), controlPoint2: CGPoint(x: 8.96, y: 13.13))
            page1Path.addCurve(to: CGPoint(x: 9.25, y: 11.93), controlPoint1: CGPoint(x: 8.82, y: 12.24), controlPoint2: CGPoint(x: 8.92, y: 12.09))
            page1Path.addLine(to: CGPoint(x: 9.25, y: 11.93))
            page1Path.close()
            page1Path.miterLimit = 4;
            
            strokeColor.setStroke()
            page1Path.lineWidth = 0.5
            page1Path.stroke()
        }
        else if(type == "blackBackButton"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 90, height: 40), false, 0)
            let context = UIGraphicsGetCurrentContext()
            
            let fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
            
            //// Back-Chevron Drawing
            let backChevronPath = UIBezierPath()
            backChevronPath.move(to: CGPoint(x: 6, y: 21.5))
            backChevronPath.addLine(to: CGPoint(x: 16.5, y: 11))
            backChevronPath.addLine(to: CGPoint(x: 18.5, y: 13))
            backChevronPath.addLine(to: CGPoint(x: 10, y: 21))
            backChevronPath.addLine(to: CGPoint(x: 18.5, y: 30))
            backChevronPath.addLine(to: CGPoint(x: 16.5, y: 32))
            backChevronPath.addLine(to: CGPoint(x: 6, y: 21.5))
            backChevronPath.close()
            backChevronPath.miterLimit = 4;
            
            backChevronPath.usesEvenOddFillRule = true;
            
            fillColor.setFill()
            backChevronPath.fill()
            
            //// Text Drawing
            let textRect = CGRect(x: 13, y: 0, width: 60, height: 40)
            let textTextContent = NSString(string: NSLocalizedString("Back", comment: ""))
            let textStyle = NSMutableParagraphStyle()
            textStyle.alignment = .center
            
            let textFontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: UIFont.buttonFontSize), NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.paragraphStyle: textStyle]
            
            let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
            context!.saveGState()
            context!.clip(to: textRect)
            textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
            context!.restoreGState()
        }
            
            
        else if(type == "backButton"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 90, height: 40), false, 0)
            let context = UIGraphicsGetCurrentContext()
            
            let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
            
            //// Back-Chevron Drawing
            let backChevronPath = UIBezierPath()
            backChevronPath.move(to: CGPoint(x: 6, y: 21.5))
            backChevronPath.addLine(to: CGPoint(x: 16.5, y: 11))
            backChevronPath.addLine(to: CGPoint(x: 18.5, y: 13))
            backChevronPath.addLine(to: CGPoint(x: 10, y: 21))
            backChevronPath.addLine(to: CGPoint(x: 18.5, y: 30))
            backChevronPath.addLine(to: CGPoint(x: 16.5, y: 32))
            backChevronPath.addLine(to: CGPoint(x: 6, y: 21.5))
            backChevronPath.close()
            backChevronPath.miterLimit = 4;
            
            backChevronPath.usesEvenOddFillRule = true;
            
            fillColor.setFill()
            backChevronPath.fill()
            
            //// Text Drawing
            let textRect = CGRect(x: 13, y: 0, width: 60, height: 40)
            let textTextContent = NSString(string: NSLocalizedString("Back", comment: ""))
            let textStyle = NSMutableParagraphStyle()
            textStyle.alignment = .center
            
            let textFontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: UIFont.buttonFontSize), NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.paragraphStyle: textStyle]
            
            let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
            context!.saveGState()
            context!.clip(to: textRect)
            textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
            context!.restoreGState()
        }
        else if(type == "Add Vehicle"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 20, height: 20), false, 0)
            let fillColor = UIColor.white
            
            //// Rectangle-1 Drawing
            let rectangle1Path = UIBezierPath(rect: CGRect(x: 0, y: 9, width: 20, height: 3))
            fillColor.setFill()
            rectangle1Path.fill()
            
            //// Rectangle- 3 Drawing
            let rectangle3Path = UIBezierPath(rect: CGRect(x: 8.5, y: 0.5, width: 3, height: 20))
            fillColor.setFill()
            rectangle3Path.fill()
        }
        else if(type == "Driving Licence"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 27, height: 18), false, 0)
            let strokeColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
            
            //// Page-1
            //// Stroke-1 Drawing
            let stroke1Path = UIBezierPath()
            stroke1Path.move(to: CGPoint(x: 24.98, y: 15.64))
            stroke1Path.addCurve(to: CGPoint(x: 23.1, y: 17.62), controlPoint1: CGPoint(x: 24.98, y: 16.86), controlPoint2: CGPoint(x: 24.25, y: 17.62))
            stroke1Path.addCurve(to: CGPoint(x: 12.64, y: 17.62), controlPoint1: CGPoint(x: 19.61, y: 17.62), controlPoint2: CGPoint(x: 16.13, y: 17.62))
            stroke1Path.addCurve(to: CGPoint(x: 2.21, y: 17.62), controlPoint1: CGPoint(x: 9.16, y: 17.62), controlPoint2: CGPoint(x: 5.68, y: 17.62))
            stroke1Path.addCurve(to: CGPoint(x: 0.52, y: 16.57), controlPoint1: CGPoint(x: 1.44, y: 17.62), controlPoint2: CGPoint(x: 0.85, y: 17.31))
            stroke1Path.addCurve(to: CGPoint(x: 0.34, y: 15.67), controlPoint1: CGPoint(x: 0.4, y: 16.3), controlPoint2: CGPoint(x: 0.34, y: 15.97))
            stroke1Path.addCurve(to: CGPoint(x: 0.33, y: 2.31), controlPoint1: CGPoint(x: 0.33, y: 11.22), controlPoint2: CGPoint(x: 0.33, y: 6.76))
            stroke1Path.addCurve(to: CGPoint(x: 2.2, y: 0.35), controlPoint1: CGPoint(x: 0.33, y: 1.12), controlPoint2: CGPoint(x: 1.07, y: 0.35))
            stroke1Path.addCurve(to: CGPoint(x: 23.12, y: 0.35), controlPoint1: CGPoint(x: 9.17, y: 0.35), controlPoint2: CGPoint(x: 16.15, y: 0.35))
            stroke1Path.addCurve(to: CGPoint(x: 24.98, y: 2.31), controlPoint1: CGPoint(x: 24.25, y: 0.35), controlPoint2: CGPoint(x: 24.98, y: 1.12))
            stroke1Path.addCurve(to: CGPoint(x: 24.98, y: 15.64), controlPoint1: CGPoint(x: 24.99, y: 6.76), controlPoint2: CGPoint(x: 24.99, y: 11.2))
            stroke1Path.addLine(to: CGPoint(x: 24.98, y: 15.64))
            stroke1Path.close()
            stroke1Path.miterLimit = 4;
            
            stroke1Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke1Path.lineWidth = 0.5
            stroke1Path.stroke()
            
            
            //// Stroke-3 Drawing
            let stroke3Path = UIBezierPath()
            stroke3Path.move(to: CGPoint(x: 8.53, y: 8.97))
            stroke3Path.addCurve(to: CGPoint(x: 8.52, y: 8.78), controlPoint1: CGPoint(x: 8.53, y: 8.9), controlPoint2: CGPoint(x: 8.53, y: 8.84))
            stroke3Path.addCurve(to: CGPoint(x: 8.49, y: 8.64), controlPoint1: CGPoint(x: 8.52, y: 8.73), controlPoint2: CGPoint(x: 8.5, y: 8.68))
            stroke3Path.addCurve(to: CGPoint(x: 7.47, y: 7.61), controlPoint1: CGPoint(x: 8.34, y: 8.08), controlPoint2: CGPoint(x: 7.92, y: 7.83))
            stroke3Path.addCurve(to: CGPoint(x: 6.63, y: 7.18), controlPoint1: CGPoint(x: 7.19, y: 7.47), controlPoint2: CGPoint(x: 6.9, y: 7.34))
            stroke3Path.addCurve(to: CGPoint(x: 6.35, y: 6.11), controlPoint1: CGPoint(x: 6.36, y: 7.02), controlPoint2: CGPoint(x: 6.21, y: 6.39))
            stroke3Path.addCurve(to: CGPoint(x: 6.86, y: 5.12), controlPoint1: CGPoint(x: 6.51, y: 5.78), controlPoint2: CGPoint(x: 6.7, y: 5.46))
            stroke3Path.addCurve(to: CGPoint(x: 6.94, y: 4.67), controlPoint1: CGPoint(x: 6.92, y: 4.99), controlPoint2: CGPoint(x: 6.98, y: 4.79))
            stroke3Path.addCurve(to: CGPoint(x: 6.96, y: 4.04), controlPoint1: CGPoint(x: 6.86, y: 4.44), controlPoint2: CGPoint(x: 6.92, y: 4.25))
            stroke3Path.addCurve(to: CGPoint(x: 6.3, y: 2.59), controlPoint1: CGPoint(x: 7.07, y: 3.41), controlPoint2: CGPoint(x: 6.76, y: 2.74))
            stroke3Path.addCurve(to: CGPoint(x: 5.9, y: 2.27), controlPoint1: CGPoint(x: 6.12, y: 2.53), controlPoint2: CGPoint(x: 5.95, y: 2.5))
            stroke3Path.addCurve(to: CGPoint(x: 5.77, y: 2.19), controlPoint1: CGPoint(x: 5.89, y: 2.24), controlPoint2: CGPoint(x: 5.81, y: 2.19))
            stroke3Path.addCurve(to: CGPoint(x: 4.18, y: 4.24), controlPoint1: CGPoint(x: 4.58, y: 2.23), controlPoint2: CGPoint(x: 3.89, y: 3.15))
            stroke3Path.addCurve(to: CGPoint(x: 4.18, y: 4.55), controlPoint1: CGPoint(x: 4.21, y: 4.33), controlPoint2: CGPoint(x: 4.18, y: 4.44))
            stroke3Path.addCurve(to: CGPoint(x: 4.22, y: 5.07), controlPoint1: CGPoint(x: 4.19, y: 4.72), controlPoint2: CGPoint(x: 4.16, y: 4.91))
            stroke3Path.addCurve(to: CGPoint(x: 4.63, y: 5.93), controlPoint1: CGPoint(x: 4.33, y: 5.37), controlPoint2: CGPoint(x: 4.51, y: 5.64))
            stroke3Path.addCurve(to: CGPoint(x: 4.26, y: 7.33), controlPoint1: CGPoint(x: 4.93, y: 6.65), controlPoint2: CGPoint(x: 4.78, y: 7.08))
            stroke3Path.addCurve(to: CGPoint(x: 3.39, y: 7.79), controlPoint1: CGPoint(x: 3.97, y: 7.47), controlPoint2: CGPoint(x: 3.67, y: 7.61))
            stroke3Path.addCurve(to: CGPoint(x: 2.69, y: 8.97), controlPoint1: CGPoint(x: 2.97, y: 8.04), controlPoint2: CGPoint(x: 2.69, y: 8.41))
            stroke3Path.addLine(to: CGPoint(x: 8.53, y: 8.97))
            stroke3Path.addLine(to: CGPoint(x: 8.53, y: 8.97))
            stroke3Path.close()
            stroke3Path.miterLimit = 4;
            
            stroke3Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke3Path.lineWidth = 0.5
            stroke3Path.stroke()
            
            
            //// Stroke-5 Drawing
            let stroke5Path = UIBezierPath()
            stroke5Path.move(to: CGPoint(x: 18.19, y: 9.59))
            stroke5Path.addCurve(to: CGPoint(x: 14.46, y: 9.59), controlPoint1: CGPoint(x: 16.95, y: 9.59), controlPoint2: CGPoint(x: 15.7, y: 9.59))
            stroke5Path.addCurve(to: CGPoint(x: 13.78, y: 10.21), controlPoint1: CGPoint(x: 14.07, y: 9.6), controlPoint2: CGPoint(x: 13.8, y: 9.84))
            stroke5Path.addCurve(to: CGPoint(x: 14.52, y: 10.85), controlPoint1: CGPoint(x: 13.76, y: 10.58), controlPoint2: CGPoint(x: 14.06, y: 10.85))
            stroke5Path.addCurve(to: CGPoint(x: 21.91, y: 10.85), controlPoint1: CGPoint(x: 16.98, y: 10.85), controlPoint2: CGPoint(x: 19.45, y: 10.85))
            stroke5Path.addCurve(to: CGPoint(x: 22.24, y: 10.79), controlPoint1: CGPoint(x: 22.02, y: 10.85), controlPoint2: CGPoint(x: 22.14, y: 10.83))
            stroke5Path.addCurve(to: CGPoint(x: 22.64, y: 10.22), controlPoint1: CGPoint(x: 22.49, y: 10.69), controlPoint2: CGPoint(x: 22.64, y: 10.5))
            stroke5Path.addCurve(to: CGPoint(x: 22.24, y: 9.65), controlPoint1: CGPoint(x: 22.64, y: 9.94), controlPoint2: CGPoint(x: 22.49, y: 9.74))
            stroke5Path.addCurve(to: CGPoint(x: 21.85, y: 9.6), controlPoint1: CGPoint(x: 22.12, y: 9.61), controlPoint2: CGPoint(x: 21.98, y: 9.6))
            stroke5Path.addCurve(to: CGPoint(x: 18.19, y: 9.59), controlPoint1: CGPoint(x: 20.63, y: 9.59), controlPoint2: CGPoint(x: 19.41, y: 9.59))
            stroke5Path.addLine(to: CGPoint(x: 18.19, y: 9.59))
            stroke5Path.close()
            stroke5Path.miterLimit = 4;
            
            stroke5Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke5Path.lineWidth = 0.5
            stroke5Path.stroke()
            
            
            //// Stroke-7 Drawing
            let stroke7Path = UIBezierPath()
            stroke7Path.move(to: CGPoint(x: 18.18, y: 5.9))
            stroke7Path.addCurve(to: CGPoint(x: 21.85, y: 5.9), controlPoint1: CGPoint(x: 19.41, y: 5.9), controlPoint2: CGPoint(x: 20.63, y: 5.9))
            stroke7Path.addCurve(to: CGPoint(x: 22.27, y: 5.84), controlPoint1: CGPoint(x: 21.99, y: 5.9), controlPoint2: CGPoint(x: 22.14, y: 5.89))
            stroke7Path.addCurve(to: CGPoint(x: 22.63, y: 5.25), controlPoint1: CGPoint(x: 22.51, y: 5.73), controlPoint2: CGPoint(x: 22.65, y: 5.54))
            stroke7Path.addCurve(to: CGPoint(x: 22.25, y: 4.71), controlPoint1: CGPoint(x: 22.62, y: 4.98), controlPoint2: CGPoint(x: 22.48, y: 4.8))
            stroke7Path.addCurve(to: CGPoint(x: 21.85, y: 4.65), controlPoint1: CGPoint(x: 22.12, y: 4.66), controlPoint2: CGPoint(x: 21.99, y: 4.65))
            stroke7Path.addCurve(to: CGPoint(x: 19.11, y: 4.65), controlPoint1: CGPoint(x: 20.94, y: 4.65), controlPoint2: CGPoint(x: 20.02, y: 4.65))
            stroke7Path.addCurve(to: CGPoint(x: 14.5, y: 4.65), controlPoint1: CGPoint(x: 17.57, y: 4.65), controlPoint2: CGPoint(x: 16.03, y: 4.65))
            stroke7Path.addCurve(to: CGPoint(x: 13.8, y: 5.14), controlPoint1: CGPoint(x: 14.12, y: 4.65), controlPoint2: CGPoint(x: 13.87, y: 4.83))
            stroke7Path.addCurve(to: CGPoint(x: 14.49, y: 5.9), controlPoint1: CGPoint(x: 13.71, y: 5.57), controlPoint2: CGPoint(x: 14, y: 5.9))
            stroke7Path.addCurve(to: CGPoint(x: 18.18, y: 5.9), controlPoint1: CGPoint(x: 15.72, y: 5.91), controlPoint2: CGPoint(x: 16.95, y: 5.9))
            stroke7Path.addLine(to: CGPoint(x: 18.18, y: 5.9))
            stroke7Path.close()
            stroke7Path.miterLimit = 4;
            
            stroke7Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke7Path.lineWidth = 0.5
            stroke7Path.stroke()
            
            
            //// Stroke-9 Drawing
            let stroke9Path = UIBezierPath()
            stroke9Path.move(to: CGPoint(x: 17.32, y: 8.37))
            stroke9Path.addCurve(to: CGPoint(x: 20.1, y: 8.37), controlPoint1: CGPoint(x: 18.25, y: 8.37), controlPoint2: CGPoint(x: 19.17, y: 8.38))
            stroke9Path.addCurve(to: CGPoint(x: 20.49, y: 8.31), controlPoint1: CGPoint(x: 20.23, y: 8.37), controlPoint2: CGPoint(x: 20.37, y: 8.36))
            stroke9Path.addCurve(to: CGPoint(x: 20.88, y: 7.74), controlPoint1: CGPoint(x: 20.74, y: 8.22), controlPoint2: CGPoint(x: 20.88, y: 8.01))
            stroke9Path.addCurve(to: CGPoint(x: 20.48, y: 7.18), controlPoint1: CGPoint(x: 20.87, y: 7.47), controlPoint2: CGPoint(x: 20.73, y: 7.26))
            stroke9Path.addCurve(to: CGPoint(x: 20.08, y: 7.12), controlPoint1: CGPoint(x: 20.35, y: 7.14), controlPoint2: CGPoint(x: 20.22, y: 7.12))
            stroke9Path.addCurve(to: CGPoint(x: 17.68, y: 7.12), controlPoint1: CGPoint(x: 19.28, y: 7.12), controlPoint2: CGPoint(x: 18.48, y: 7.12))
            stroke9Path.addCurve(to: CGPoint(x: 14.47, y: 7.12), controlPoint1: CGPoint(x: 16.61, y: 7.12), controlPoint2: CGPoint(x: 15.54, y: 7.12))
            stroke9Path.addCurve(to: CGPoint(x: 13.81, y: 7.58), controlPoint1: CGPoint(x: 14.14, y: 7.12), controlPoint2: CGPoint(x: 13.88, y: 7.3))
            stroke9Path.addCurve(to: CGPoint(x: 14.46, y: 8.37), controlPoint1: CGPoint(x: 13.69, y: 8), controlPoint2: CGPoint(x: 13.98, y: 8.37))
            stroke9Path.addCurve(to: CGPoint(x: 17.32, y: 8.37), controlPoint1: CGPoint(x: 15.41, y: 8.38), controlPoint2: CGPoint(x: 16.37, y: 8.37))
            stroke9Path.addLine(to: CGPoint(x: 17.32, y: 8.37))
            stroke9Path.close()
            stroke9Path.miterLimit = 4;
            
            stroke9Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke9Path.lineWidth = 0.5
            stroke9Path.stroke()
            
            //// Stroke-13 Drawing
            let stroke13Path = UIBezierPath()
            stroke13Path.move(to: CGPoint(x: 11.49, y: 8.37))
            stroke13Path.addCurve(to: CGPoint(x: 10.89, y: 8.97), controlPoint1: CGPoint(x: 11.18, y: 8.37), controlPoint2: CGPoint(x: 10.9, y: 8.64))
            stroke13Path.addCurve(to: CGPoint(x: 11.46, y: 9.59), controlPoint1: CGPoint(x: 10.88, y: 9.29), controlPoint2: CGPoint(x: 11.15, y: 9.58))
            stroke13Path.addCurve(to: CGPoint(x: 12.07, y: 8.99), controlPoint1: CGPoint(x: 11.79, y: 9.6), controlPoint2: CGPoint(x: 12.07, y: 9.33))
            stroke13Path.addCurve(to: CGPoint(x: 11.49, y: 8.37), controlPoint1: CGPoint(x: 12.07, y: 8.66), controlPoint2: CGPoint(x: 11.81, y: 8.38))
            stroke13Path.addLine(to: CGPoint(x: 11.49, y: 8.37))
            stroke13Path.close()
            stroke13Path.miterLimit = 4;
            
            stroke13Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke13Path.lineWidth = 0.5
            stroke13Path.stroke()
            
            
            //// Stroke-15 Drawing
            let stroke15Path = UIBezierPath()
            stroke15Path.move(to: CGPoint(x: 12.07, y: 7.13))
            stroke15Path.addCurve(to: CGPoint(x: 11.48, y: 6.51), controlPoint1: CGPoint(x: 12.07, y: 6.8), controlPoint2: CGPoint(x: 11.79, y: 6.51))
            stroke15Path.addCurve(to: CGPoint(x: 10.89, y: 7.12), controlPoint1: CGPoint(x: 11.18, y: 6.51), controlPoint2: CGPoint(x: 10.9, y: 6.8))
            stroke15Path.addCurve(to: CGPoint(x: 11.49, y: 7.75), controlPoint1: CGPoint(x: 10.89, y: 7.45), controlPoint2: CGPoint(x: 11.18, y: 7.76))
            stroke15Path.addCurve(to: CGPoint(x: 12.07, y: 7.13), controlPoint1: CGPoint(x: 11.8, y: 7.74), controlPoint2: CGPoint(x: 12.08, y: 7.45))
            stroke15Path.addLine(to: CGPoint(x: 12.07, y: 7.13))
            stroke15Path.close()
            stroke15Path.miterLimit = 4;
            
            stroke15Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke15Path.lineWidth = 0.5
            stroke15Path.stroke()
            
            
            //// Stroke-17 Drawing
            let stroke17Path = UIBezierPath()
            stroke17Path.move(to: CGPoint(x: 11.46, y: 4.04))
            stroke17Path.addCurve(to: CGPoint(x: 12.07, y: 3.45), controlPoint1: CGPoint(x: 11.78, y: 4.05), controlPoint2: CGPoint(x: 12.05, y: 3.78))
            stroke17Path.addCurve(to: CGPoint(x: 11.49, y: 2.81), controlPoint1: CGPoint(x: 12.09, y: 3.12), controlPoint2: CGPoint(x: 11.81, y: 2.81))
            stroke17Path.addCurve(to: CGPoint(x: 10.89, y: 3.41), controlPoint1: CGPoint(x: 11.18, y: 2.81), controlPoint2: CGPoint(x: 10.9, y: 3.08))
            stroke17Path.addCurve(to: CGPoint(x: 11.46, y: 4.04), controlPoint1: CGPoint(x: 10.88, y: 3.73), controlPoint2: CGPoint(x: 11.15, y: 4.03))
            stroke17Path.addLine(to: CGPoint(x: 11.46, y: 4.04))
            stroke17Path.close()
            stroke17Path.miterLimit = 4;
            
            stroke17Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke17Path.lineWidth = 0.5
            stroke17Path.stroke()
            
            
            //// Stroke-19 Drawing
            let stroke19Path = UIBezierPath()
            stroke19Path.move(to: CGPoint(x: 12.07, y: 10.85))
            stroke19Path.addCurve(to: CGPoint(x: 11.5, y: 10.22), controlPoint1: CGPoint(x: 12.08, y: 10.53), controlPoint2: CGPoint(x: 11.81, y: 10.23))
            stroke19Path.addCurve(to: CGPoint(x: 10.89, y: 10.84), controlPoint1: CGPoint(x: 11.19, y: 10.21), controlPoint2: CGPoint(x: 10.89, y: 10.51))
            stroke19Path.addCurve(to: CGPoint(x: 11.48, y: 11.45), controlPoint1: CGPoint(x: 10.89, y: 11.16), controlPoint2: CGPoint(x: 11.17, y: 11.45))
            stroke19Path.addCurve(to: CGPoint(x: 12.07, y: 10.85), controlPoint1: CGPoint(x: 11.79, y: 11.46), controlPoint2: CGPoint(x: 12.06, y: 11.18))
            stroke19Path.addLine(to: CGPoint(x: 12.07, y: 10.85))
            stroke19Path.close()
            stroke19Path.miterLimit = 4;
            
            stroke19Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke19Path.lineWidth = 0.5
            stroke19Path.stroke()
            
            
            //// Stroke-21 Drawing
            let stroke21Path = UIBezierPath()
            stroke21Path.move(to: CGPoint(x: 11.48, y: 13.93))
            stroke21Path.addCurve(to: CGPoint(x: 10.89, y: 14.54), controlPoint1: CGPoint(x: 11.17, y: 13.93), controlPoint2: CGPoint(x: 10.9, y: 14.21))
            stroke21Path.addCurve(to: CGPoint(x: 11.47, y: 15.16), controlPoint1: CGPoint(x: 10.89, y: 14.86), controlPoint2: CGPoint(x: 11.16, y: 15.15))
            stroke21Path.addCurve(to: CGPoint(x: 12.07, y: 14.54), controlPoint1: CGPoint(x: 11.79, y: 15.16), controlPoint2: CGPoint(x: 12.08, y: 14.87))
            stroke21Path.addCurve(to: CGPoint(x: 11.48, y: 13.93), controlPoint1: CGPoint(x: 12.07, y: 14.21), controlPoint2: CGPoint(x: 11.8, y: 13.93))
            stroke21Path.addLine(to: CGPoint(x: 11.48, y: 13.93))
            stroke21Path.close()
            stroke21Path.miterLimit = 4;
            
            stroke21Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke21Path.lineWidth = 0.5
            stroke21Path.stroke()
            
            //// Stroke-23 Drawing
            let stroke23Path = UIBezierPath()
            stroke23Path.move(to: CGPoint(x: 11.48, y: 5.9))
            stroke23Path.addCurve(to: CGPoint(x: 12.07, y: 5.29), controlPoint1: CGPoint(x: 11.78, y: 5.9), controlPoint2: CGPoint(x: 12.07, y: 5.6))
            stroke23Path.addCurve(to: CGPoint(x: 11.5, y: 4.66), controlPoint1: CGPoint(x: 12.08, y: 4.97), controlPoint2: CGPoint(x: 11.8, y: 4.67))
            stroke23Path.addCurve(to: CGPoint(x: 10.89, y: 5.28), controlPoint1: CGPoint(x: 11.19, y: 4.64), controlPoint2: CGPoint(x: 10.89, y: 4.96))
            stroke23Path.addCurve(to: CGPoint(x: 11.48, y: 5.9), controlPoint1: CGPoint(x: 10.9, y: 5.6), controlPoint2: CGPoint(x: 11.18, y: 5.9))
            stroke23Path.addLine(to: CGPoint(x: 11.48, y: 5.9))
            stroke23Path.close()
            stroke23Path.miterLimit = 4;
            
            stroke23Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke23Path.lineWidth = 0.5
            stroke23Path.stroke()
            
            
            //// Stroke-25 Drawing
            let stroke25Path = UIBezierPath()
            stroke25Path.move(to: CGPoint(x: 11.48, y: 13.31))
            stroke25Path.addCurve(to: CGPoint(x: 12.07, y: 12.7), controlPoint1: CGPoint(x: 11.78, y: 13.32), controlPoint2: CGPoint(x: 12.07, y: 13.02))
            stroke25Path.addCurve(to: CGPoint(x: 11.5, y: 12.07), controlPoint1: CGPoint(x: 12.08, y: 12.38), controlPoint2: CGPoint(x: 11.8, y: 12.08))
            stroke25Path.addCurve(to: CGPoint(x: 10.89, y: 12.7), controlPoint1: CGPoint(x: 11.19, y: 12.06), controlPoint2: CGPoint(x: 10.89, y: 12.37))
            stroke25Path.addCurve(to: CGPoint(x: 11.48, y: 13.31), controlPoint1: CGPoint(x: 10.9, y: 13.01), controlPoint2: CGPoint(x: 11.18, y: 13.31))
            stroke25Path.addLine(to: CGPoint(x: 11.48, y: 13.31))
            stroke25Path.close()
            stroke25Path.miterLimit = 4;
            
            stroke25Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke25Path.lineWidth = 0.5
            stroke25Path.stroke()
            
            
            //// Stroke-29 Drawing
            let stroke29Path = UIBezierPath()
            stroke29Path.move(to: CGPoint(x: 11.49, y: 17.01))
            stroke29Path.addCurve(to: CGPoint(x: 12.07, y: 16.4), controlPoint1: CGPoint(x: 11.8, y: 17.01), controlPoint2: CGPoint(x: 12.07, y: 16.72))
            stroke29Path.addCurve(to: CGPoint(x: 11.49, y: 15.78), controlPoint1: CGPoint(x: 12.07, y: 16.07), controlPoint2: CGPoint(x: 11.8, y: 15.79))
            stroke29Path.addCurve(to: CGPoint(x: 10.89, y: 16.41), controlPoint1: CGPoint(x: 11.17, y: 15.78), controlPoint2: CGPoint(x: 10.88, y: 16.08))
            stroke29Path.addCurve(to: CGPoint(x: 11.49, y: 17.01), controlPoint1: CGPoint(x: 10.9, y: 16.74), controlPoint2: CGPoint(x: 11.17, y: 17.01))
            stroke29Path.addLine(to: CGPoint(x: 11.49, y: 17.01))
            stroke29Path.close()
            stroke29Path.miterLimit = 4;
            
            stroke29Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke29Path.lineWidth = 0.5
            stroke29Path.stroke()
            
            
            //// Stroke-39 Drawing
            let stroke39Path = UIBezierPath()
            stroke39Path.move(to: CGPoint(x: 17.33, y: 12.07))
            stroke39Path.addCurve(to: CGPoint(x: 20.19, y: 12.07), controlPoint1: CGPoint(x: 18.28, y: 12.07), controlPoint2: CGPoint(x: 19.24, y: 12.06))
            stroke39Path.addCurve(to: CGPoint(x: 20.85, y: 12.88), controlPoint1: CGPoint(x: 20.68, y: 12.07), controlPoint2: CGPoint(x: 20.98, y: 12.45))
            stroke39Path.addCurve(to: CGPoint(x: 20.17, y: 13.32), controlPoint1: CGPoint(x: 20.76, y: 13.15), controlPoint2: CGPoint(x: 20.52, y: 13.32))
            stroke39Path.addCurve(to: CGPoint(x: 18.1, y: 13.32), controlPoint1: CGPoint(x: 19.48, y: 13.32), controlPoint2: CGPoint(x: 18.79, y: 13.32))
            stroke39Path.addLine(to: CGPoint(x: 14.7, y: 13.32))
            stroke39Path.addCurve(to: CGPoint(x: 14.47, y: 13.32), controlPoint1: CGPoint(x: 14.62, y: 13.32), controlPoint2: CGPoint(x: 14.54, y: 13.32))
            stroke39Path.addCurve(to: CGPoint(x: 13.78, y: 12.71), controlPoint1: CGPoint(x: 14.07, y: 13.3), controlPoint2: CGPoint(x: 13.78, y: 13.05))
            stroke39Path.addCurve(to: CGPoint(x: 14.49, y: 12.07), controlPoint1: CGPoint(x: 13.78, y: 12.32), controlPoint2: CGPoint(x: 14.06, y: 12.07))
            stroke39Path.addCurve(to: CGPoint(x: 17.33, y: 12.07), controlPoint1: CGPoint(x: 15.44, y: 12.06), controlPoint2: CGPoint(x: 16.38, y: 12.07))
            stroke39Path.addLine(to: CGPoint(x: 17.33, y: 12.07))
            stroke39Path.close()
            stroke39Path.miterLimit = 4;
            
            stroke39Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke39Path.lineWidth = 0.5
            stroke39Path.stroke()
            
            
            //// Stroke-55 Drawing
            let stroke55Path = UIBezierPath()
            stroke55Path.move(to: CGPoint(x: 11.47, y: 2.18))
            stroke55Path.addCurve(to: CGPoint(x: 10.89, y: 1.57), controlPoint1: CGPoint(x: 11.16, y: 2.18), controlPoint2: CGPoint(x: 10.89, y: 1.89))
            stroke55Path.addCurve(to: CGPoint(x: 11.5, y: 0.96), controlPoint1: CGPoint(x: 10.89, y: 1.23), controlPoint2: CGPoint(x: 11.18, y: 0.95))
            stroke55Path.addCurve(to: CGPoint(x: 12.07, y: 1.59), controlPoint1: CGPoint(x: 11.82, y: 0.97), controlPoint2: CGPoint(x: 12.08, y: 1.27))
            stroke55Path.addCurve(to: CGPoint(x: 11.47, y: 2.18), controlPoint1: CGPoint(x: 12.06, y: 1.91), controlPoint2: CGPoint(x: 11.79, y: 2.19))
            stroke55Path.addLine(to: CGPoint(x: 11.47, y: 2.18))
            stroke55Path.close()
            stroke55Path.miterLimit = 4;
            
            stroke55Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke55Path.lineWidth = 0.5
            stroke55Path.stroke()
            
            //// Stroke-59 Drawing
            let stroke59Path = UIBezierPath()
            stroke59Path.move(to: CGPoint(x: 8.39, y: 16.08))
            stroke59Path.addLine(to: CGPoint(x: 7.51, y: 16.08))
            stroke59Path.addCurve(to: CGPoint(x: 7.39, y: 15.83), controlPoint1: CGPoint(x: 7.4, y: 16.04), controlPoint2: CGPoint(x: 7.38, y: 15.94))
            stroke59Path.addCurve(to: CGPoint(x: 3.83, y: 15.83), controlPoint1: CGPoint(x: 7.05, y: 15.75), controlPoint2: CGPoint(x: 4.19, y: 15.75))
            stroke59Path.addCurve(to: CGPoint(x: 3.71, y: 16.08), controlPoint1: CGPoint(x: 3.84, y: 15.94), controlPoint2: CGPoint(x: 3.81, y: 16.03))
            stroke59Path.addLine(to: CGPoint(x: 2.82, y: 16.08))
            stroke59Path.addCurve(to: CGPoint(x: 2.7, y: 15.86), controlPoint1: CGPoint(x: 2.73, y: 16.04), controlPoint2: CGPoint(x: 2.69, y: 15.97))
            stroke59Path.addCurve(to: CGPoint(x: 2.66, y: 14.94), controlPoint1: CGPoint(x: 2.71, y: 15.55), controlPoint2: CGPoint(x: 2.68, y: 15.24))
            stroke59Path.addCurve(to: CGPoint(x: 2.64, y: 14.69), controlPoint1: CGPoint(x: 2.65, y: 14.85), controlPoint2: CGPoint(x: 2.64, y: 14.77))
            stroke59Path.addLine(to: CGPoint(x: 2.64, y: 14.18))
            stroke59Path.addCurve(to: CGPoint(x: 2.65, y: 14.12), controlPoint1: CGPoint(x: 2.64, y: 14.16), controlPoint2: CGPoint(x: 2.65, y: 14.14))
            stroke59Path.addCurve(to: CGPoint(x: 2.95, y: 13.41), controlPoint1: CGPoint(x: 2.68, y: 13.85), controlPoint2: CGPoint(x: 2.73, y: 13.59))
            stroke59Path.addCurve(to: CGPoint(x: 2.88, y: 13.38), controlPoint1: CGPoint(x: 2.92, y: 13.4), controlPoint2: CGPoint(x: 2.9, y: 13.39))
            stroke59Path.addCurve(to: CGPoint(x: 2.69, y: 13.23), controlPoint1: CGPoint(x: 2.82, y: 13.33), controlPoint2: CGPoint(x: 2.75, y: 13.29))
            stroke59Path.addCurve(to: CGPoint(x: 2.74, y: 12.98), controlPoint1: CGPoint(x: 2.61, y: 13.14), controlPoint2: CGPoint(x: 2.63, y: 13.04))
            stroke59Path.addCurve(to: CGPoint(x: 2.82, y: 12.95), controlPoint1: CGPoint(x: 2.77, y: 12.97), controlPoint2: CGPoint(x: 2.79, y: 12.95))
            stroke59Path.addCurve(to: CGPoint(x: 3.25, y: 12.89), controlPoint1: CGPoint(x: 2.96, y: 12.92), controlPoint2: CGPoint(x: 3.11, y: 12.9))
            stroke59Path.addCurve(to: CGPoint(x: 3.3, y: 12.92), controlPoint1: CGPoint(x: 3.26, y: 12.88), controlPoint2: CGPoint(x: 3.29, y: 12.9))
            stroke59Path.addCurve(to: CGPoint(x: 3.4, y: 13.05), controlPoint1: CGPoint(x: 3.33, y: 12.96), controlPoint2: CGPoint(x: 3.36, y: 13))
            stroke59Path.addCurve(to: CGPoint(x: 3.43, y: 12.96), controlPoint1: CGPoint(x: 3.41, y: 13.01), controlPoint2: CGPoint(x: 3.42, y: 12.98))
            stroke59Path.addCurve(to: CGPoint(x: 3.79, y: 12.19), controlPoint1: CGPoint(x: 3.53, y: 12.69), controlPoint2: CGPoint(x: 3.64, y: 12.44))
            stroke59Path.addCurve(to: CGPoint(x: 4.15, y: 11.93), controlPoint1: CGPoint(x: 3.87, y: 12.05), controlPoint2: CGPoint(x: 3.99, y: 11.95))
            stroke59Path.addCurve(to: CGPoint(x: 4.97, y: 11.81), controlPoint1: CGPoint(x: 4.42, y: 11.88), controlPoint2: CGPoint(x: 4.7, y: 11.84))
            stroke59Path.addCurve(to: CGPoint(x: 5.24, y: 11.78), controlPoint1: CGPoint(x: 5.06, y: 11.79), controlPoint2: CGPoint(x: 5.15, y: 11.79))
            stroke59Path.addLine(to: CGPoint(x: 5.98, y: 11.78))
            stroke59Path.addCurve(to: CGPoint(x: 6.03, y: 11.79), controlPoint1: CGPoint(x: 6, y: 11.78), controlPoint2: CGPoint(x: 6.01, y: 11.79))
            stroke59Path.addCurve(to: CGPoint(x: 6.97, y: 11.9), controlPoint1: CGPoint(x: 6.35, y: 11.83), controlPoint2: CGPoint(x: 6.66, y: 11.87))
            stroke59Path.addCurve(to: CGPoint(x: 7.46, y: 12.25), controlPoint1: CGPoint(x: 7.19, y: 11.93), controlPoint2: CGPoint(x: 7.36, y: 12.04))
            stroke59Path.addCurve(to: CGPoint(x: 7.59, y: 12.49), controlPoint1: CGPoint(x: 7.5, y: 12.33), controlPoint2: CGPoint(x: 7.55, y: 12.4))
            stroke59Path.addCurve(to: CGPoint(x: 7.83, y: 13.04), controlPoint1: CGPoint(x: 7.67, y: 12.67), controlPoint2: CGPoint(x: 7.75, y: 12.85))
            stroke59Path.addCurve(to: CGPoint(x: 7.92, y: 12.92), controlPoint1: CGPoint(x: 7.86, y: 13), controlPoint2: CGPoint(x: 7.88, y: 12.95))
            stroke59Path.addCurve(to: CGPoint(x: 7.97, y: 12.89), controlPoint1: CGPoint(x: 7.93, y: 12.9), controlPoint2: CGPoint(x: 7.95, y: 12.88))
            stroke59Path.addCurve(to: CGPoint(x: 8.41, y: 12.95), controlPoint1: CGPoint(x: 8.11, y: 12.91), controlPoint2: CGPoint(x: 8.26, y: 12.92))
            stroke59Path.addCurve(to: CGPoint(x: 8.57, y: 13.1), controlPoint1: CGPoint(x: 8.48, y: 12.97), controlPoint2: CGPoint(x: 8.56, y: 13))
            stroke59Path.addCurve(to: CGPoint(x: 8.46, y: 13.3), controlPoint1: CGPoint(x: 8.58, y: 13.19), controlPoint2: CGPoint(x: 8.52, y: 13.25))
            stroke59Path.addCurve(to: CGPoint(x: 8.34, y: 13.38), controlPoint1: CGPoint(x: 8.42, y: 13.33), controlPoint2: CGPoint(x: 8.38, y: 13.35))
            stroke59Path.addCurve(to: CGPoint(x: 8.26, y: 13.41), controlPoint1: CGPoint(x: 8.32, y: 13.39), controlPoint2: CGPoint(x: 8.29, y: 13.4))
            stroke59Path.addCurve(to: CGPoint(x: 8.54, y: 13.91), controlPoint1: CGPoint(x: 8.43, y: 13.54), controlPoint2: CGPoint(x: 8.5, y: 13.72))
            stroke59Path.addCurve(to: CGPoint(x: 8.58, y: 14.18), controlPoint1: CGPoint(x: 8.56, y: 14), controlPoint2: CGPoint(x: 8.57, y: 14.09))
            stroke59Path.addLine(to: CGPoint(x: 8.58, y: 14.68))
            stroke59Path.addCurve(to: CGPoint(x: 8.56, y: 14.87), controlPoint1: CGPoint(x: 8.58, y: 14.74), controlPoint2: CGPoint(x: 8.57, y: 14.81))
            stroke59Path.addCurve(to: CGPoint(x: 8.52, y: 15.86), controlPoint1: CGPoint(x: 8.54, y: 15.2), controlPoint2: CGPoint(x: 8.51, y: 15.53))
            stroke59Path.addCurve(to: CGPoint(x: 8.39, y: 16.08), controlPoint1: CGPoint(x: 8.53, y: 15.97), controlPoint2: CGPoint(x: 8.49, y: 16.04))
            stroke59Path.addLine(to: CGPoint(x: 8.39, y: 16.08))
            stroke59Path.close()
            stroke59Path.miterLimit = 4;
            
            stroke59Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke59Path.lineWidth = 0.5
            stroke59Path.stroke()
            
            
            //// Stroke-61 Drawing
            let stroke61Path = UIBezierPath()
            stroke61Path.move(to: CGPoint(x: 7.53, y: 13.1))
            stroke61Path.addCurve(to: CGPoint(x: 7.15, y: 12.32), controlPoint1: CGPoint(x: 7.42, y: 12.83), controlPoint2: CGPoint(x: 7.31, y: 12.56))
            stroke61Path.addCurve(to: CGPoint(x: 7, y: 12.22), controlPoint1: CGPoint(x: 7.12, y: 12.27), controlPoint2: CGPoint(x: 7.05, y: 12.24))
            stroke61Path.addCurve(to: CGPoint(x: 5.7, y: 12.09), controlPoint1: CGPoint(x: 6.57, y: 12.14), controlPoint2: CGPoint(x: 6.14, y: 12.09))
            stroke61Path.addCurve(to: CGPoint(x: 4.25, y: 12.22), controlPoint1: CGPoint(x: 5.21, y: 12.08), controlPoint2: CGPoint(x: 4.73, y: 12.12))
            stroke61Path.addCurve(to: CGPoint(x: 4.02, y: 12.38), controlPoint1: CGPoint(x: 4.15, y: 12.24), controlPoint2: CGPoint(x: 4.07, y: 12.28))
            stroke61Path.addCurve(to: CGPoint(x: 3.71, y: 13.06), controlPoint1: CGPoint(x: 3.92, y: 12.61), controlPoint2: CGPoint(x: 3.81, y: 12.83))
            stroke61Path.addCurve(to: CGPoint(x: 3.7, y: 13.1), controlPoint1: CGPoint(x: 3.7, y: 13.07), controlPoint2: CGPoint(x: 3.7, y: 13.09))
            stroke61Path.addCurve(to: CGPoint(x: 7.53, y: 13.1), controlPoint1: CGPoint(x: 4.97, y: 13.02), controlPoint2: CGPoint(x: 6.25, y: 13.02))
            stroke61Path.addLine(to: CGPoint(x: 7.53, y: 13.1))
            stroke61Path.close()
            stroke61Path.miterLimit = 4;
            
            stroke61Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke61Path.lineWidth = 0.5
            stroke61Path.stroke()
            
            
            //// Stroke-63 Drawing
            let stroke63Path = UIBezierPath()
            stroke63Path.move(to: CGPoint(x: 3.7, y: 14.63))
            stroke63Path.addCurve(to: CGPoint(x: 3.91, y: 14.63), controlPoint1: CGPoint(x: 3.77, y: 14.63), controlPoint2: CGPoint(x: 3.84, y: 14.63))
            stroke63Path.addCurve(to: CGPoint(x: 4.02, y: 14.52), controlPoint1: CGPoint(x: 3.98, y: 14.62), controlPoint2: CGPoint(x: 4.02, y: 14.58))
            stroke63Path.addCurve(to: CGPoint(x: 3.8, y: 14.25), controlPoint1: CGPoint(x: 4.01, y: 14.4), controlPoint2: CGPoint(x: 3.91, y: 14.27))
            stroke63Path.addCurve(to: CGPoint(x: 3.17, y: 14.16), controlPoint1: CGPoint(x: 3.59, y: 14.22), controlPoint2: CGPoint(x: 3.38, y: 14.19))
            stroke63Path.addCurve(to: CGPoint(x: 3.06, y: 14.32), controlPoint1: CGPoint(x: 3.08, y: 14.15), controlPoint2: CGPoint(x: 3.03, y: 14.22))
            stroke63Path.addCurve(to: CGPoint(x: 3.12, y: 14.47), controlPoint1: CGPoint(x: 3.08, y: 14.37), controlPoint2: CGPoint(x: 3.1, y: 14.42))
            stroke63Path.addCurve(to: CGPoint(x: 3.35, y: 14.63), controlPoint1: CGPoint(x: 3.17, y: 14.58), controlPoint2: CGPoint(x: 3.24, y: 14.63))
            stroke63Path.addLine(to: CGPoint(x: 3.62, y: 14.63))
            stroke63Path.addLine(to: CGPoint(x: 3.7, y: 14.63))
            stroke63Path.close()
            stroke63Path.miterLimit = 4;
            
            stroke63Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke63Path.lineWidth = 0.5
            stroke63Path.stroke()
            
            //// Stroke-65 Drawing
            let stroke65Path = UIBezierPath()
            stroke65Path.move(to: CGPoint(x: 7.6, y: 14.63))
            stroke65Path.addLine(to: CGPoint(x: 7.76, y: 14.63))
            stroke65Path.addCurve(to: CGPoint(x: 8.14, y: 14.35), controlPoint1: CGPoint(x: 8.02, y: 14.63), controlPoint2: CGPoint(x: 8.05, y: 14.61))
            stroke65Path.addCurve(to: CGPoint(x: 8.15, y: 14.32), controlPoint1: CGPoint(x: 8.15, y: 14.34), controlPoint2: CGPoint(x: 8.15, y: 14.33))
            stroke65Path.addCurve(to: CGPoint(x: 8.04, y: 14.16), controlPoint1: CGPoint(x: 8.19, y: 14.21), controlPoint2: CGPoint(x: 8.14, y: 14.15))
            stroke65Path.addCurve(to: CGPoint(x: 7.46, y: 14.24), controlPoint1: CGPoint(x: 7.84, y: 14.19), controlPoint2: CGPoint(x: 7.65, y: 14.22))
            stroke65Path.addCurve(to: CGPoint(x: 7.22, y: 14.46), controlPoint1: CGPoint(x: 7.33, y: 14.26), controlPoint2: CGPoint(x: 7.26, y: 14.34))
            stroke65Path.addCurve(to: CGPoint(x: 7.33, y: 14.63), controlPoint1: CGPoint(x: 7.18, y: 14.57), controlPoint2: CGPoint(x: 7.22, y: 14.63))
            stroke65Path.addLine(to: CGPoint(x: 7.6, y: 14.63))
            stroke65Path.addLine(to: CGPoint(x: 7.6, y: 14.63))
            stroke65Path.close()
            stroke65Path.miterLimit = 4;
            
            stroke65Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke65Path.lineWidth = 0.5
            stroke65Path.stroke()
            
            
            //// Stroke-67 Drawing
            let stroke67Path = UIBezierPath()
            stroke67Path.move(to: CGPoint(x: 3.72, y: 14.9))
            stroke67Path.addLine(to: CGPoint(x: 3.72, y: 14.9))
            stroke67Path.addCurve(to: CGPoint(x: 3.38, y: 14.9), controlPoint1: CGPoint(x: 3.6, y: 14.9), controlPoint2: CGPoint(x: 3.49, y: 14.9))
            stroke67Path.addCurve(to: CGPoint(x: 3.3, y: 14.98), controlPoint1: CGPoint(x: 3.33, y: 14.9), controlPoint2: CGPoint(x: 3.3, y: 14.93))
            stroke67Path.addCurve(to: CGPoint(x: 3.38, y: 15.06), controlPoint1: CGPoint(x: 3.3, y: 15.03), controlPoint2: CGPoint(x: 3.34, y: 15.06))
            stroke67Path.addCurve(to: CGPoint(x: 4.05, y: 15.05), controlPoint1: CGPoint(x: 3.61, y: 15.06), controlPoint2: CGPoint(x: 3.83, y: 15.06))
            stroke67Path.addCurve(to: CGPoint(x: 4.11, y: 15.03), controlPoint1: CGPoint(x: 4.07, y: 15.05), controlPoint2: CGPoint(x: 4.1, y: 15.05))
            stroke67Path.addCurve(to: CGPoint(x: 4.13, y: 14.95), controlPoint1: CGPoint(x: 4.13, y: 15.01), controlPoint2: CGPoint(x: 4.14, y: 14.97))
            stroke67Path.addCurve(to: CGPoint(x: 4.05, y: 14.9), controlPoint1: CGPoint(x: 4.11, y: 14.93), controlPoint2: CGPoint(x: 4.08, y: 14.9))
            stroke67Path.addCurve(to: CGPoint(x: 3.72, y: 14.9), controlPoint1: CGPoint(x: 3.94, y: 14.9), controlPoint2: CGPoint(x: 3.83, y: 14.9))
            stroke67Path.addLine(to: CGPoint(x: 3.72, y: 14.9))
            stroke67Path.close()
            stroke67Path.miterLimit = 4;
            
            stroke67Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke67Path.lineWidth = 0.5
            stroke67Path.stroke()
            
            
            //// Stroke-69 Drawing
            let stroke69Path = UIBezierPath()
            stroke69Path.move(to: CGPoint(x: 7.5, y: 15.06))
            stroke69Path.addLine(to: CGPoint(x: 7.5, y: 15.06))
            stroke69Path.addCurve(to: CGPoint(x: 7.83, y: 15.06), controlPoint1: CGPoint(x: 7.61, y: 15.06), controlPoint2: CGPoint(x: 7.72, y: 15.06))
            stroke69Path.addCurve(to: CGPoint(x: 7.92, y: 14.98), controlPoint1: CGPoint(x: 7.88, y: 15.06), controlPoint2: CGPoint(x: 7.92, y: 15.02))
            stroke69Path.addCurve(to: CGPoint(x: 7.83, y: 14.9), controlPoint1: CGPoint(x: 7.92, y: 14.94), controlPoint2: CGPoint(x: 7.88, y: 14.9))
            stroke69Path.addCurve(to: CGPoint(x: 7.17, y: 14.9), controlPoint1: CGPoint(x: 7.61, y: 14.9), controlPoint2: CGPoint(x: 7.39, y: 14.9))
            stroke69Path.addCurve(to: CGPoint(x: 7.08, y: 14.98), controlPoint1: CGPoint(x: 7.11, y: 14.9), controlPoint2: CGPoint(x: 7.08, y: 14.93))
            stroke69Path.addCurve(to: CGPoint(x: 7.18, y: 15.06), controlPoint1: CGPoint(x: 7.08, y: 15.03), controlPoint2: CGPoint(x: 7.12, y: 15.06))
            stroke69Path.addLine(to: CGPoint(x: 7.5, y: 15.06))
            stroke69Path.addLine(to: CGPoint(x: 7.5, y: 15.06))
            stroke69Path.close()
            stroke69Path.miterLimit = 4;
            
            stroke69Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke69Path.lineWidth = 0.5
            stroke69Path.stroke()
        }
        else if(type == "Settings"){
            let strokeColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
            
            //// Bezier Drawing
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 28.03, y: 16.91))
            bezierPath.addCurve(to: CGPoint(x: 27.36, y: 19.84), controlPoint1: CGPoint(x: 27.79, y: 17.87), controlPoint2: CGPoint(x: 27.59, y: 18.83))
            bezierPath.addCurve(to: CGPoint(x: 25.3, y: 19.96), controlPoint1: CGPoint(x: 26.68, y: 19.88), controlPoint2: CGPoint(x: 25.98, y: 19.92))
            bezierPath.addCurve(to: CGPoint(x: 25.07, y: 19.96), controlPoint1: CGPoint(x: 25.22, y: 19.96), controlPoint2: CGPoint(x: 25.15, y: 19.97))
            bezierPath.addCurve(to: CGPoint(x: 23.31, y: 20.87), controlPoint1: CGPoint(x: 24.31, y: 19.92), controlPoint2: CGPoint(x: 23.71, y: 20.16))
            bezierPath.addCurve(to: CGPoint(x: 22.55, y: 21.79), controlPoint1: CGPoint(x: 23.12, y: 21.21), controlPoint2: CGPoint(x: 22.82, y: 21.5))
            bezierPath.addCurve(to: CGPoint(x: 22.23, y: 22.93), controlPoint1: CGPoint(x: 22.25, y: 22.12), controlPoint2: CGPoint(x: 22.15, y: 22.49))
            bezierPath.addCurve(to: CGPoint(x: 22.66, y: 25.48), controlPoint1: CGPoint(x: 22.39, y: 23.78), controlPoint2: CGPoint(x: 22.53, y: 24.62))
            bezierPath.addCurve(to: CGPoint(x: 22.55, y: 25.74), controlPoint1: CGPoint(x: 22.68, y: 25.56), controlPoint2: CGPoint(x: 22.62, y: 25.71))
            bezierPath.addCurve(to: CGPoint(x: 19.73, y: 27.11), controlPoint1: CGPoint(x: 21.62, y: 26.2), controlPoint2: CGPoint(x: 20.69, y: 26.65))
            bezierPath.addCurve(to: CGPoint(x: 17.93, y: 25.07), controlPoint1: CGPoint(x: 19.12, y: 26.43), controlPoint2: CGPoint(x: 18.51, y: 25.76))
            bezierPath.addCurve(to: CGPoint(x: 16.73, y: 24.57), controlPoint1: CGPoint(x: 17.6, y: 24.7), controlPoint2: CGPoint(x: 17.23, y: 24.54))
            bezierPath.addCurve(to: CGPoint(x: 15.22, y: 24.57), controlPoint1: CGPoint(x: 16.23, y: 24.6), controlPoint2: CGPoint(x: 15.72, y: 24.6))
            bezierPath.addCurve(to: CGPoint(x: 14.11, y: 25.04), controlPoint1: CGPoint(x: 14.75, y: 24.54), controlPoint2: CGPoint(x: 14.4, y: 24.7))
            bezierPath.addCurve(to: CGPoint(x: 12.27, y: 27.11), controlPoint1: CGPoint(x: 13.5, y: 25.73), controlPoint2: CGPoint(x: 12.89, y: 26.41))
            bezierPath.addCurve(to: CGPoint(x: 9.43, y: 25.73), controlPoint1: CGPoint(x: 11.31, y: 26.65), controlPoint2: CGPoint(x: 10.37, y: 26.2))
            bezierPath.addCurve(to: CGPoint(x: 9.33, y: 25.49), controlPoint1: CGPoint(x: 9.37, y: 25.71), controlPoint2: CGPoint(x: 9.32, y: 25.57))
            bezierPath.addCurve(to: CGPoint(x: 9.77, y: 22.95), controlPoint1: CGPoint(x: 9.47, y: 24.64), controlPoint2: CGPoint(x: 9.61, y: 23.79))
            bezierPath.addCurve(to: CGPoint(x: 9.44, y: 21.78), controlPoint1: CGPoint(x: 9.85, y: 22.5), controlPoint2: CGPoint(x: 9.74, y: 22.13))
            bezierPath.addCurve(to: CGPoint(x: 8.47, y: 20.57), controlPoint1: CGPoint(x: 9.1, y: 21.4), controlPoint2: CGPoint(x: 8.78, y: 20.99))
            bezierPath.addCurve(to: CGPoint(x: 7.51, y: 20), controlPoint1: CGPoint(x: 8.23, y: 20.24), controlPoint2: CGPoint(x: 7.93, y: 20.02))
            bezierPath.addCurve(to: CGPoint(x: 4.64, y: 19.84), controlPoint1: CGPoint(x: 6.56, y: 19.95), controlPoint2: CGPoint(x: 5.62, y: 19.9))
            bezierPath.addCurve(to: CGPoint(x: 4.11, y: 17.54), controlPoint1: CGPoint(x: 4.46, y: 19.07), controlPoint2: CGPoint(x: 4.28, y: 18.31))
            bezierPath.addCurve(to: CGPoint(x: 3.98, y: 16.64), controlPoint1: CGPoint(x: 4.05, y: 17.24), controlPoint2: CGPoint(x: 3.88, y: 16.87))
            bezierPath.addCurve(to: CGPoint(x: 4.74, y: 16.17), controlPoint1: CGPoint(x: 4.07, y: 16.41), controlPoint2: CGPoint(x: 4.47, y: 16.32))
            bezierPath.addCurve(to: CGPoint(x: 6.34, y: 15.29), controlPoint1: CGPoint(x: 5.27, y: 15.87), controlPoint2: CGPoint(x: 5.8, y: 15.57))
            bezierPath.addCurve(to: CGPoint(x: 7.03, y: 14.34), controlPoint1: CGPoint(x: 6.73, y: 15.08), controlPoint2: CGPoint(x: 6.95, y: 14.78))
            bezierPath.addCurve(to: CGPoint(x: 7.39, y: 12.8), controlPoint1: CGPoint(x: 7.12, y: 13.82), controlPoint2: CGPoint(x: 7.25, y: 13.31))
            bezierPath.addCurve(to: CGPoint(x: 7.2, y: 11.64), controlPoint1: CGPoint(x: 7.51, y: 12.38), controlPoint2: CGPoint(x: 7.46, y: 12))
            bezierPath.addCurve(to: CGPoint(x: 5.56, y: 9.35), controlPoint1: CGPoint(x: 6.65, y: 10.89), controlPoint2: CGPoint(x: 6.12, y: 10.13))
            bezierPath.addCurve(to: CGPoint(x: 7.23, y: 7.26), controlPoint1: CGPoint(x: 6.12, y: 8.66), controlPoint2: CGPoint(x: 6.67, y: 7.96))
            bezierPath.addCurve(to: CGPoint(x: 8.21, y: 7.01), controlPoint1: CGPoint(x: 7.63, y: 6.76), controlPoint2: CGPoint(x: 7.63, y: 6.76))
            bezierPath.addCurve(to: CGPoint(x: 10.19, y: 7.84), controlPoint1: CGPoint(x: 8.87, y: 7.29), controlPoint2: CGPoint(x: 9.53, y: 7.56))
            bezierPath.addCurve(to: CGPoint(x: 11.42, y: 7.76), controlPoint1: CGPoint(x: 10.61, y: 8.02), controlPoint2: CGPoint(x: 11.01, y: 7.99))
            bezierPath.addCurve(to: CGPoint(x: 12.78, y: 7.11), controlPoint1: CGPoint(x: 11.86, y: 7.52), controlPoint2: CGPoint(x: 12.32, y: 7.3))
            bezierPath.addCurve(to: CGPoint(x: 13.63, y: 6.17), controlPoint1: CGPoint(x: 13.23, y: 6.93), controlPoint2: CGPoint(x: 13.51, y: 6.63))
            bezierPath.addCurve(to: CGPoint(x: 14.27, y: 3.89), controlPoint1: CGPoint(x: 13.84, y: 5.41), controlPoint2: CGPoint(x: 14.07, y: 4.65))
            bezierPath.addCurve(to: CGPoint(x: 14.62, y: 3.63), controlPoint1: CGPoint(x: 14.33, y: 3.69), controlPoint2: CGPoint(x: 14.41, y: 3.62))
            bezierPath.addCurve(to: CGPoint(x: 17.4, y: 3.63), controlPoint1: CGPoint(x: 15.54, y: 3.64), controlPoint2: CGPoint(x: 16.47, y: 3.64))
            bezierPath.addCurve(to: CGPoint(x: 17.72, y: 3.87), controlPoint1: CGPoint(x: 17.59, y: 3.62), controlPoint2: CGPoint(x: 17.67, y: 3.67))
            bezierPath.addCurve(to: CGPoint(x: 18.39, y: 6.23), controlPoint1: CGPoint(x: 17.94, y: 4.66), controlPoint2: CGPoint(x: 18.18, y: 5.45))
            bezierPath.addCurve(to: CGPoint(x: 19.17, y: 7.09), controlPoint1: CGPoint(x: 18.51, y: 6.65), controlPoint2: CGPoint(x: 18.77, y: 6.92))
            bezierPath.addCurve(to: CGPoint(x: 20.64, y: 7.8), controlPoint1: CGPoint(x: 19.67, y: 7.3), controlPoint2: CGPoint(x: 20.16, y: 7.54))
            bezierPath.addCurve(to: CGPoint(x: 21.76, y: 7.86), controlPoint1: CGPoint(x: 21.01, y: 7.99), controlPoint2: CGPoint(x: 21.38, y: 8.02))
            bezierPath.addCurve(to: CGPoint(x: 24.15, y: 6.87), controlPoint1: CGPoint(x: 22.56, y: 7.53), controlPoint2: CGPoint(x: 23.35, y: 7.19))
            bezierPath.addCurve(to: CGPoint(x: 24.47, y: 6.91), controlPoint1: CGPoint(x: 24.24, y: 6.83), controlPoint2: CGPoint(x: 24.42, y: 6.84))
            bezierPath.addCurve(to: CGPoint(x: 26.43, y: 9.35), controlPoint1: CGPoint(x: 25.13, y: 7.71), controlPoint2: CGPoint(x: 25.77, y: 8.53))
            bezierPath.addCurve(to: CGPoint(x: 24.83, y: 11.6), controlPoint1: CGPoint(x: 25.89, y: 10.11), controlPoint2: CGPoint(x: 25.37, y: 10.86))
            bezierPath.addCurve(to: CGPoint(x: 24.63, y: 12.85), controlPoint1: CGPoint(x: 24.54, y: 11.99), controlPoint2: CGPoint(x: 24.48, y: 12.38))
            bezierPath.addCurve(to: CGPoint(x: 24.96, y: 14.32), controlPoint1: CGPoint(x: 24.77, y: 13.33), controlPoint2: CGPoint(x: 24.88, y: 13.82))
            bezierPath.addCurve(to: CGPoint(x: 25.64, y: 15.28), controlPoint1: CGPoint(x: 25.03, y: 14.76), controlPoint2: CGPoint(x: 25.25, y: 15.07))
            bezierPath.addCurve(to: CGPoint(x: 27.83, y: 16.47), controlPoint1: CGPoint(x: 26.37, y: 15.68), controlPoint2: CGPoint(x: 27.1, y: 16.08))
            bezierPath.addCurve(to: CGPoint(x: 28.03, y: 16.91), controlPoint1: CGPoint(x: 28.02, y: 16.57), controlPoint2: CGPoint(x: 28.09, y: 16.67))
            bezierPath.addLine(to: CGPoint(x: 28.03, y: 16.91))
            bezierPath.close()
            bezierPath.miterLimit = 4;
            
            strokeColor.setStroke()
            bezierPath.lineWidth = 1
            bezierPath.stroke()
            
            //// Bezier 2 Drawing
            let bezier2Path = UIBezierPath()
            bezier2Path.move(to: CGPoint(x: 29.89, y: 14.97))
            bezier2Path.addCurve(to: CGPoint(x: 27.42, y: 13.62), controlPoint1: CGPoint(x: 29.07, y: 14.51), controlPoint2: CGPoint(x: 28.24, y: 14.07))
            bezier2Path.addCurve(to: CGPoint(x: 27.13, y: 12.36), controlPoint1: CGPoint(x: 27.07, y: 13.42), controlPoint2: CGPoint(x: 26.9, y: 12.68))
            bezier2Path.addCurve(to: CGPoint(x: 28.76, y: 10.06), controlPoint1: CGPoint(x: 27.68, y: 11.59), controlPoint2: CGPoint(x: 28.23, y: 10.84))
            bezier2Path.addCurve(to: CGPoint(x: 29.11, y: 9.31), controlPoint1: CGPoint(x: 28.91, y: 9.85), controlPoint2: CGPoint(x: 28.98, y: 9.58))
            bezier2Path.addCurve(to: CGPoint(x: 28.77, y: 8.58), controlPoint1: CGPoint(x: 28.99, y: 9.04), controlPoint2: CGPoint(x: 28.92, y: 8.78))
            bezier2Path.addCurve(to: CGPoint(x: 25.66, y: 4.68), controlPoint1: CGPoint(x: 27.74, y: 7.27), controlPoint2: CGPoint(x: 26.7, y: 5.97))
            bezier2Path.addCurve(to: CGPoint(x: 24.22, y: 4.32), controlPoint1: CGPoint(x: 25.27, y: 4.19), controlPoint2: CGPoint(x: 24.79, y: 4.09))
            bezier2Path.addCurve(to: CGPoint(x: 22.01, y: 5.25), controlPoint1: CGPoint(x: 23.48, y: 4.63), controlPoint2: CGPoint(x: 22.73, y: 4.91))
            bezier2Path.addCurve(to: CGPoint(x: 20.71, y: 5.21), controlPoint1: CGPoint(x: 21.55, y: 5.48), controlPoint2: CGPoint(x: 21.13, y: 5.54))
            bezier2Path.addCurve(to: CGPoint(x: 20.43, y: 4.88), controlPoint1: CGPoint(x: 20.59, y: 5.12), controlPoint2: CGPoint(x: 20.46, y: 5))
            bezier2Path.addCurve(to: CGPoint(x: 19.67, y: 2.27), controlPoint1: CGPoint(x: 20.16, y: 4.01), controlPoint2: CGPoint(x: 19.92, y: 3.14))
            bezier2Path.addCurve(to: CGPoint(x: 18.42, y: 1.31), controlPoint1: CGPoint(x: 19.48, y: 1.61), controlPoint2: CGPoint(x: 19.1, y: 1.31))
            bezier2Path.addCurve(to: CGPoint(x: 13.58, y: 1.31), controlPoint1: CGPoint(x: 16.81, y: 1.31), controlPoint2: CGPoint(x: 15.2, y: 1.31))
            bezier2Path.addCurve(to: CGPoint(x: 12.34, y: 2.24), controlPoint1: CGPoint(x: 12.91, y: 1.31), controlPoint2: CGPoint(x: 12.52, y: 1.6))
            bezier2Path.addCurve(to: CGPoint(x: 11.73, y: 4.43), controlPoint1: CGPoint(x: 12.13, y: 2.97), controlPoint2: CGPoint(x: 11.88, y: 3.69))
            bezier2Path.addCurve(to: CGPoint(x: 10.9, y: 5.41), controlPoint1: CGPoint(x: 11.62, y: 4.93), controlPoint2: CGPoint(x: 11.39, y: 5.25))
            bezier2Path.addCurve(to: CGPoint(x: 10.4, y: 5.42), controlPoint1: CGPoint(x: 10.72, y: 5.48), controlPoint2: CGPoint(x: 10.58, y: 5.5))
            bezier2Path.addCurve(to: CGPoint(x: 7.81, y: 4.34), controlPoint1: CGPoint(x: 9.54, y: 5.05), controlPoint2: CGPoint(x: 8.68, y: 4.69))
            bezier2Path.addCurve(to: CGPoint(x: 6.3, y: 4.72), controlPoint1: CGPoint(x: 7.19, y: 4.08), controlPoint2: CGPoint(x: 6.72, y: 4.19))
            bezier2Path.addCurve(to: CGPoint(x: 3.26, y: 8.52), controlPoint1: CGPoint(x: 5.28, y: 5.99), controlPoint2: CGPoint(x: 4.27, y: 7.25))
            bezier2Path.addCurve(to: CGPoint(x: 3.23, y: 10.06), controlPoint1: CGPoint(x: 2.86, y: 9.03), controlPoint2: CGPoint(x: 2.85, y: 9.53))
            bezier2Path.addCurve(to: CGPoint(x: 4.68, y: 12.09), controlPoint1: CGPoint(x: 3.71, y: 10.74), controlPoint2: CGPoint(x: 4.17, y: 11.43))
            bezier2Path.addCurve(to: CGPoint(x: 4.9, y: 13.15), controlPoint1: CGPoint(x: 4.95, y: 12.42), controlPoint2: CGPoint(x: 5.03, y: 12.73))
            bezier2Path.addCurve(to: CGPoint(x: 4.5, y: 13.65), controlPoint1: CGPoint(x: 4.83, y: 13.39), controlPoint2: CGPoint(x: 4.72, y: 13.54))
            bezier2Path.addCurve(to: CGPoint(x: 2.1, y: 14.98), controlPoint1: CGPoint(x: 3.7, y: 14.08), controlPoint2: CGPoint(x: 2.9, y: 14.53))
            bezier2Path.addCurve(to: CGPoint(x: 1.46, y: 16.29), controlPoint1: CGPoint(x: 1.56, y: 15.27), controlPoint2: CGPoint(x: 1.33, y: 15.7))
            bezier2Path.addCurve(to: CGPoint(x: 2.6, y: 21.27), controlPoint1: CGPoint(x: 1.83, y: 17.95), controlPoint2: CGPoint(x: 2.21, y: 19.61))
            bezier2Path.addCurve(to: CGPoint(x: 3.57, y: 22.1), controlPoint1: CGPoint(x: 2.71, y: 21.72), controlPoint2: CGPoint(x: 3.12, y: 22.07))
            bezier2Path.addCurve(to: CGPoint(x: 6.03, y: 22.22), controlPoint1: CGPoint(x: 4.39, y: 22.15), controlPoint2: CGPoint(x: 5.21, y: 22.22))
            bezier2Path.addCurve(to: CGPoint(x: 7.3, y: 22.87), controlPoint1: CGPoint(x: 6.59, y: 22.22), controlPoint2: CGPoint(x: 7.03, y: 22.35))
            bezier2Path.addCurve(to: CGPoint(x: 7.37, y: 23.18), controlPoint1: CGPoint(x: 7.35, y: 22.96), controlPoint2: CGPoint(x: 7.39, y: 23.09))
            bezier2Path.addCurve(to: CGPoint(x: 6.89, y: 26.01), controlPoint1: CGPoint(x: 7.22, y: 24.13), controlPoint2: CGPoint(x: 7.05, y: 25.07))
            bezier2Path.addCurve(to: CGPoint(x: 7.63, y: 27.44), controlPoint1: CGPoint(x: 6.77, y: 26.72), controlPoint2: CGPoint(x: 6.98, y: 27.13))
            bezier2Path.addCurve(to: CGPoint(x: 11.94, y: 29.52), controlPoint1: CGPoint(x: 9.06, y: 28.14), controlPoint2: CGPoint(x: 10.5, y: 28.83))
            bezier2Path.addCurve(to: CGPoint(x: 13.5, y: 29.21), controlPoint1: CGPoint(x: 12.57, y: 29.82), controlPoint2: CGPoint(x: 13.04, y: 29.73))
            bezier2Path.addCurve(to: CGPoint(x: 15.1, y: 27.38), controlPoint1: CGPoint(x: 14.04, y: 28.6), controlPoint2: CGPoint(x: 14.6, y: 28.01))
            bezier2Path.addCurve(to: CGPoint(x: 16.2, y: 26.92), controlPoint1: CGPoint(x: 15.4, y: 27.01), controlPoint2: CGPoint(x: 15.73, y: 26.81))
            bezier2Path.addCurve(to: CGPoint(x: 16.62, y: 27.11), controlPoint1: CGPoint(x: 16.35, y: 26.95), controlPoint2: CGPoint(x: 16.53, y: 27.01))
            bezier2Path.addCurve(to: CGPoint(x: 18.54, y: 29.26), controlPoint1: CGPoint(x: 17.27, y: 27.82), controlPoint2: CGPoint(x: 17.9, y: 28.54))
            bezier2Path.addCurve(to: CGPoint(x: 20, y: 29.55), controlPoint1: CGPoint(x: 18.95, y: 29.71), controlPoint2: CGPoint(x: 19.45, y: 29.81))
            bezier2Path.addCurve(to: CGPoint(x: 20.62, y: 29.25), controlPoint1: CGPoint(x: 20.21, y: 29.46), controlPoint2: CGPoint(x: 20.41, y: 29.35))
            bezier2Path.addCurve(to: CGPoint(x: 24.43, y: 27.41), controlPoint1: CGPoint(x: 21.89, y: 28.64), controlPoint2: CGPoint(x: 23.16, y: 28.03))
            bezier2Path.addCurve(to: CGPoint(x: 25.15, y: 26.2), controlPoint1: CGPoint(x: 24.95, y: 27.16), controlPoint2: CGPoint(x: 25.23, y: 26.7))
            bezier2Path.addCurve(to: CGPoint(x: 24.69, y: 23.56), controlPoint1: CGPoint(x: 25.01, y: 25.32), controlPoint2: CGPoint(x: 24.86, y: 24.43))
            bezier2Path.addCurve(to: CGPoint(x: 24.9, y: 22.59), controlPoint1: CGPoint(x: 24.61, y: 23.19), controlPoint2: CGPoint(x: 24.62, y: 22.89))
            bezier2Path.addCurve(to: CGPoint(x: 25.56, y: 22.25), controlPoint1: CGPoint(x: 25.1, y: 22.38), controlPoint2: CGPoint(x: 25.27, y: 22.26))
            bezier2Path.addCurve(to: CGPoint(x: 28.27, y: 22.1), controlPoint1: CGPoint(x: 26.46, y: 22.21), controlPoint2: CGPoint(x: 27.37, y: 22.15))
            bezier2Path.addCurve(to: CGPoint(x: 29.43, y: 21.18), controlPoint1: CGPoint(x: 28.89, y: 22.07), controlPoint2: CGPoint(x: 29.29, y: 21.78))
            bezier2Path.addCurve(to: CGPoint(x: 30.53, y: 16.35), controlPoint1: CGPoint(x: 29.8, y: 19.57), controlPoint2: CGPoint(x: 30.17, y: 17.96))
            bezier2Path.addCurve(to: CGPoint(x: 29.89, y: 14.97), controlPoint1: CGPoint(x: 30.67, y: 15.72), controlPoint2: CGPoint(x: 30.46, y: 15.29))
            bezier2Path.addLine(to: CGPoint(x: 29.89, y: 14.97))
            bezier2Path.close()
            bezier2Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier2Path.lineWidth = 1
            bezier2Path.stroke()
            
            //// Oval Drawing
            let ovalPath = UIBezierPath(ovalIn: CGRect(x: 13.05, y: 12.6, width: 5.9, height: 5.9))
            strokeColor.setStroke()
            ovalPath.lineWidth = 1
            ovalPath.stroke()
            
            
            //// Oval 2 Drawing
            let oval2Path = UIBezierPath(ovalIn: CGRect(x: 10.7, y: 10.35, width: 10.6, height: 10.5))
            strokeColor.setStroke()
            oval2Path.lineWidth = 1
            oval2Path.stroke()
        }
        else if(type == "Help"){
            
            //// PaintCode Trial Version
            //// www.paintcodeapp.com
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 25, height: 25), false, 0)
            //// Color Declarations
            let strokeColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
            let strokeColor2 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
            
            //// Page-1
            //// Fill-3 Drawing
            let fill3Path = UIBezierPath()
            fill3Path.move(to: CGPoint(x: 21.93, y: 8.51))
            fill3Path.addLine(to: CGPoint(x: 18.62, y: 9.52))
            fill3Path.addCurve(to: CGPoint(x: 17.21, y: 7.48), controlPoint1: CGPoint(x: 18.28, y: 8.77), controlPoint2: CGPoint(x: 17.81, y: 8.09))
            fill3Path.addCurve(to: CGPoint(x: 15.17, y: 6.07), controlPoint1: CGPoint(x: 16.61, y: 6.88), controlPoint2: CGPoint(x: 15.92, y: 6.41))
            fill3Path.addLine(to: CGPoint(x: 16.18, y: 2.77))
            fill3Path.addCurve(to: CGPoint(x: 19.64, y: 5.05), controlPoint1: CGPoint(x: 17.46, y: 3.28), controlPoint2: CGPoint(x: 18.63, y: 4.05))
            fill3Path.addCurve(to: CGPoint(x: 21.93, y: 8.51), controlPoint1: CGPoint(x: 20.64, y: 6.06), controlPoint2: CGPoint(x: 21.41, y: 7.23))
            fill3Path.close()
            fill3Path.miterLimit = 4;
            
            fill3Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            fill3Path.lineWidth = 0.5
            fill3Path.stroke()
            
            
            //// Stroke-7 Drawing
            let stroke7Path = UIBezierPath(ovalIn: CGRect(x: 7.2, y: 7.2, width: 10.3, height: 10.3))
            strokeColor.setStroke()
            stroke7Path.lineWidth = 0.5
            stroke7Path.stroke()
            
            
            //// Fill-9 Drawing
            let fill9Path = UIBezierPath()
            fill9Path.move(to: CGPoint(x: 8.51, y: 2.77))
            fill9Path.addLine(to: CGPoint(x: 9.53, y: 6.08))
            fill9Path.addCurve(to: CGPoint(x: 7.48, y: 7.49), controlPoint1: CGPoint(x: 8.77, y: 6.42), controlPoint2: CGPoint(x: 8.09, y: 6.89))
            fill9Path.addCurve(to: CGPoint(x: 6.07, y: 9.53), controlPoint1: CGPoint(x: 6.88, y: 8.09), controlPoint2: CGPoint(x: 6.41, y: 8.78))
            fill9Path.addLine(to: CGPoint(x: 2.77, y: 8.52))
            fill9Path.addCurve(to: CGPoint(x: 5.06, y: 5.06), controlPoint1: CGPoint(x: 3.28, y: 7.23), controlPoint2: CGPoint(x: 4.06, y: 6.06))
            fill9Path.addCurve(to: CGPoint(x: 8.51, y: 2.77), controlPoint1: CGPoint(x: 6.06, y: 4.05), controlPoint2: CGPoint(x: 7.23, y: 3.28))
            fill9Path.close()
            fill9Path.miterLimit = 4;
            
            fill9Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            fill9Path.lineWidth = 0.5
            fill9Path.stroke()
            
            
            //// Fill-13 Drawing
            let fill13Path = UIBezierPath()
            fill13Path.move(to: CGPoint(x: 2.77, y: 16.19))
            fill13Path.addLine(to: CGPoint(x: 6.08, y: 15.17))
            fill13Path.addCurve(to: CGPoint(x: 7.49, y: 17.22), controlPoint1: CGPoint(x: 6.42, y: 15.93), controlPoint2: CGPoint(x: 6.89, y: 16.61))
            fill13Path.addCurve(to: CGPoint(x: 9.53, y: 18.63), controlPoint1: CGPoint(x: 8.09, y: 17.82), controlPoint2: CGPoint(x: 8.78, y: 18.29))
            fill13Path.addLine(to: CGPoint(x: 8.52, y: 21.93))
            fill13Path.addCurve(to: CGPoint(x: 5.06, y: 19.65), controlPoint1: CGPoint(x: 7.24, y: 21.42), controlPoint2: CGPoint(x: 6.07, y: 20.65))
            fill13Path.addCurve(to: CGPoint(x: 2.77, y: 16.19), controlPoint1: CGPoint(x: 4.06, y: 18.64), controlPoint2: CGPoint(x: 3.29, y: 17.47))
            fill13Path.close()
            fill13Path.miterLimit = 4;
            
            fill13Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            fill13Path.lineWidth = 0.5
            fill13Path.stroke()
            
            
            //// Fill-17 Drawing
            let fill17Path = UIBezierPath()
            fill17Path.move(to: CGPoint(x: 16.19, y: 21.93))
            fill17Path.addLine(to: CGPoint(x: 15.17, y: 18.62))
            fill17Path.addCurve(to: CGPoint(x: 17.22, y: 17.21), controlPoint1: CGPoint(x: 15.93, y: 18.28), controlPoint2: CGPoint(x: 16.61, y: 17.81))
            fill17Path.addCurve(to: CGPoint(x: 18.63, y: 15.17), controlPoint1: CGPoint(x: 17.82, y: 16.61), controlPoint2: CGPoint(x: 18.29, y: 15.92))
            fill17Path.addLine(to: CGPoint(x: 21.93, y: 16.18))
            fill17Path.addCurve(to: CGPoint(x: 19.64, y: 19.64), controlPoint1: CGPoint(x: 21.42, y: 17.47), controlPoint2: CGPoint(x: 20.64, y: 18.64))
            fill17Path.addCurve(to: CGPoint(x: 16.19, y: 21.93), controlPoint1: CGPoint(x: 18.64, y: 20.65), controlPoint2: CGPoint(x: 17.47, y: 21.42))
            fill17Path.close()
            fill17Path.miterLimit = 4;
            
            fill17Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            fill17Path.lineWidth = 0.5
            fill17Path.stroke()
            
            //// Stroke-1 Drawing
            let stroke1Path = UIBezierPath(ovalIn: CGRect(x: 0.3, y: 0.3, width: 24.1, height: 24.1))
            strokeColor.setStroke()
            stroke1Path.lineWidth = 0.5
            stroke1Path.stroke()
        }
        else if(type == "Partner"){
            
            //// PaintCode Trial Version
            //// www.paintcodeapp.com
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 25, height: 17), false, 0)
            //// Color Declarations
            let strokeColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
            
            //// Page-1
            //// Stroke-1 Drawing
            let stroke1Path = UIBezierPath()
            stroke1Path.move(to: CGPoint(x: 13.48, y: 1.62))
            stroke1Path.addCurve(to: CGPoint(x: 12.05, y: 1.42), controlPoint1: CGPoint(x: 12.99, y: 1.47), controlPoint2: CGPoint(x: 12.52, y: 1.42))
            stroke1Path.addCurve(to: CGPoint(x: 8.98, y: 1.88), controlPoint1: CGPoint(x: 11, y: 1.4), controlPoint2: CGPoint(x: 9.98, y: 1.59))
            stroke1Path.addCurve(to: CGPoint(x: 7.91, y: 2.22), controlPoint1: CGPoint(x: 8.62, y: 1.98), controlPoint2: CGPoint(x: 8.27, y: 2.13))
            stroke1Path.addCurve(to: CGPoint(x: 6.34, y: 2.31), controlPoint1: CGPoint(x: 7.4, y: 2.34), controlPoint2: CGPoint(x: 6.87, y: 2.37))
            stroke1Path.addCurve(to: CGPoint(x: 4.97, y: 1.69), controlPoint1: CGPoint(x: 5.83, y: 2.25), controlPoint2: CGPoint(x: 5.35, y: 2.08))
            stroke1Path.addCurve(to: CGPoint(x: 4.62, y: 1.42), controlPoint1: CGPoint(x: 4.87, y: 1.59), controlPoint2: CGPoint(x: 4.75, y: 1.5))
            stroke1Path.addCurve(to: CGPoint(x: 3.78, y: 1.61), controlPoint1: CGPoint(x: 4.31, y: 1.25), controlPoint2: CGPoint(x: 4, y: 1.32))
            stroke1Path.addCurve(to: CGPoint(x: 3.58, y: 1.98), controlPoint1: CGPoint(x: 3.7, y: 1.72), controlPoint2: CGPoint(x: 3.63, y: 1.85))
            stroke1Path.addCurve(to: CGPoint(x: 1.67, y: 6.52), controlPoint1: CGPoint(x: 2.94, y: 3.49), controlPoint2: CGPoint(x: 2.31, y: 5))
            stroke1Path.addCurve(to: CGPoint(x: 1.19, y: 7.67), controlPoint1: CGPoint(x: 1.51, y: 6.9), controlPoint2: CGPoint(x: 1.35, y: 7.28))
            stroke1Path.addCurve(to: CGPoint(x: 4, y: 10), controlPoint1: CGPoint(x: 2.31, y: 8.2), controlPoint2: CGPoint(x: 3.2, y: 9.01))
            stroke1Path.addCurve(to: CGPoint(x: 4.11, y: 9.86), controlPoint1: CGPoint(x: 4.04, y: 9.94), controlPoint2: CGPoint(x: 4.07, y: 9.89))
            stroke1Path.addCurve(to: CGPoint(x: 5.58, y: 8.35), controlPoint1: CGPoint(x: 4.6, y: 9.35), controlPoint2: CGPoint(x: 5.08, y: 8.84))
            stroke1Path.addCurve(to: CGPoint(x: 7.13, y: 8.01), controlPoint1: CGPoint(x: 6.03, y: 7.92), controlPoint2: CGPoint(x: 6.56, y: 7.8))
            stroke1Path.addCurve(to: CGPoint(x: 8.13, y: 9.3), controlPoint1: CGPoint(x: 7.71, y: 8.23), controlPoint2: CGPoint(x: 8.04, y: 8.67))
            stroke1Path.addCurve(to: CGPoint(x: 8.15, y: 9.6), controlPoint1: CGPoint(x: 8.14, y: 9.4), controlPoint2: CGPoint(x: 8.14, y: 9.49))
            stroke1Path.addCurve(to: CGPoint(x: 9.58, y: 9.77), controlPoint1: CGPoint(x: 8.66, y: 9.42), controlPoint2: CGPoint(x: 9.14, y: 9.46))
            stroke1Path.addCurve(to: CGPoint(x: 10.24, y: 11.07), controlPoint1: CGPoint(x: 10.01, y: 10.08), controlPoint2: CGPoint(x: 10.22, y: 10.52))
            stroke1Path.addCurve(to: CGPoint(x: 11.75, y: 11.17), controlPoint1: CGPoint(x: 10.77, y: 10.83), controlPoint2: CGPoint(x: 11.28, y: 10.85))
            stroke1Path.addCurve(to: CGPoint(x: 12.45, y: 12.54), controlPoint1: CGPoint(x: 12.22, y: 11.48), controlPoint2: CGPoint(x: 12.44, y: 11.95))
            stroke1Path.addCurve(to: CGPoint(x: 12.61, y: 12.48), controlPoint1: CGPoint(x: 12.51, y: 12.51), controlPoint2: CGPoint(x: 12.56, y: 12.5))
            stroke1Path.addCurve(to: CGPoint(x: 13.38, y: 12.45), controlPoint1: CGPoint(x: 12.87, y: 12.4), controlPoint2: CGPoint(x: 13.13, y: 12.38))
            stroke1Path.addCurve(to: CGPoint(x: 14.51, y: 13.54), controlPoint1: CGPoint(x: 13.96, y: 12.59), controlPoint2: CGPoint(x: 14.35, y: 12.96))
            stroke1Path.addCurve(to: CGPoint(x: 14.13, y: 15.07), controlPoint1: CGPoint(x: 14.68, y: 14.12), controlPoint2: CGPoint(x: 14.54, y: 14.64))
            stroke1Path.addCurve(to: CGPoint(x: 12.7, y: 16.55), controlPoint1: CGPoint(x: 13.65, y: 15.57), controlPoint2: CGPoint(x: 13.17, y: 16.06))
            stroke1Path.addCurve(to: CGPoint(x: 12.58, y: 16.68), controlPoint1: CGPoint(x: 12.66, y: 16.58), controlPoint2: CGPoint(x: 12.63, y: 16.62))
            stroke1Path.addCurve(to: CGPoint(x: 13.99, y: 16.8), controlPoint1: CGPoint(x: 13.04, y: 16.94), controlPoint2: CGPoint(x: 13.51, y: 17.02))
            stroke1Path.addCurve(to: CGPoint(x: 14.61, y: 15.53), controlPoint1: CGPoint(x: 14.51, y: 16.55), controlPoint2: CGPoint(x: 14.68, y: 16.11))
            stroke1Path.addCurve(to: CGPoint(x: 14.69, y: 15.57), controlPoint1: CGPoint(x: 14.64, y: 15.55), controlPoint2: CGPoint(x: 14.67, y: 15.56))
            stroke1Path.addCurve(to: CGPoint(x: 15.64, y: 15.75), controlPoint1: CGPoint(x: 14.99, y: 15.72), controlPoint2: CGPoint(x: 15.31, y: 15.78))
            stroke1Path.addCurve(to: CGPoint(x: 16.71, y: 14.7), controlPoint1: CGPoint(x: 16.22, y: 15.7), controlPoint2: CGPoint(x: 16.66, y: 15.28))
            stroke1Path.addCurve(to: CGPoint(x: 16.69, y: 14.16), controlPoint1: CGPoint(x: 16.73, y: 14.52), controlPoint2: CGPoint(x: 16.7, y: 14.34))
            stroke1Path.addCurve(to: CGPoint(x: 16.8, y: 14.21), controlPoint1: CGPoint(x: 16.72, y: 14.17), controlPoint2: CGPoint(x: 16.76, y: 14.19))
            stroke1Path.addCurve(to: CGPoint(x: 17.97, y: 14.4), controlPoint1: CGPoint(x: 17.17, y: 14.4), controlPoint2: CGPoint(x: 17.56, y: 14.47))
            stroke1Path.addCurve(to: CGPoint(x: 19.06, y: 13.09), controlPoint1: CGPoint(x: 18.63, y: 14.29), controlPoint2: CGPoint(x: 19.06, y: 13.77))
            stroke1Path.addLine(to: CGPoint(x: 19.06, y: 12.87))
            stroke1Path.addCurve(to: CGPoint(x: 20.04, y: 12.98), controlPoint1: CGPoint(x: 19.39, y: 12.99), controlPoint2: CGPoint(x: 19.71, y: 13.04))
            stroke1Path.addCurve(to: CGPoint(x: 21.19, y: 11.55), controlPoint1: CGPoint(x: 20.74, y: 12.86), controlPoint2: CGPoint(x: 21.17, y: 12.32))
            stroke1Path.addCurve(to: CGPoint(x: 20.62, y: 9.94), controlPoint1: CGPoint(x: 21.2, y: 10.94), controlPoint2: CGPoint(x: 21, y: 10.41))
            stroke1Path.addCurve(to: CGPoint(x: 15.73, y: 5.46), controlPoint1: CGPoint(x: 19.21, y: 8.19), controlPoint2: CGPoint(x: 17.59, y: 6.69))
            stroke1Path.addCurve(to: CGPoint(x: 15.52, y: 5.47), controlPoint1: CGPoint(x: 15.65, y: 5.4), controlPoint2: CGPoint(x: 15.6, y: 5.41))
            stroke1Path.addCurve(to: CGPoint(x: 13.05, y: 7.4), controlPoint1: CGPoint(x: 14.7, y: 6.12), controlPoint2: CGPoint(x: 13.88, y: 6.76))
            stroke1Path.addCurve(to: CGPoint(x: 12.38, y: 7.85), controlPoint1: CGPoint(x: 12.84, y: 7.57), controlPoint2: CGPoint(x: 12.62, y: 7.74))
            stroke1Path.addCurve(to: CGPoint(x: 11.15, y: 7.91), controlPoint1: CGPoint(x: 11.99, y: 8.03), controlPoint2: CGPoint(x: 11.56, y: 7.99))
            stroke1Path.addCurve(to: CGPoint(x: 9.92, y: 7.34), controlPoint1: CGPoint(x: 10.7, y: 7.82), controlPoint2: CGPoint(x: 10.26, y: 7.67))
            stroke1Path.addCurve(to: CGPoint(x: 9.65, y: 5.32), controlPoint1: CGPoint(x: 9.29, y: 6.75), controlPoint2: CGPoint(x: 9.18, y: 5.98))
            stroke1Path.addCurve(to: CGPoint(x: 10.38, y: 4.56), controlPoint1: CGPoint(x: 9.85, y: 5.04), controlPoint2: CGPoint(x: 10.12, y: 4.8))
            stroke1Path.addCurve(to: CGPoint(x: 13.33, y: 1.82), controlPoint1: CGPoint(x: 11.36, y: 3.64), controlPoint2: CGPoint(x: 12.34, y: 2.73))
            stroke1Path.addCurve(to: CGPoint(x: 13.48, y: 1.62), controlPoint1: CGPoint(x: 13.38, y: 1.77), controlPoint2: CGPoint(x: 13.42, y: 1.7))
            stroke1Path.addLine(to: CGPoint(x: 13.48, y: 1.62))
            stroke1Path.close()
            stroke1Path.miterLimit = 4;
            
            stroke1Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke1Path.lineWidth = 0.5
            stroke1Path.stroke()
            
            //// Stroke-3 Drawing
            let stroke3Path = UIBezierPath()
            stroke3Path.move(to: CGPoint(x: 15.58, y: 4.71))
            stroke3Path.addCurve(to: CGPoint(x: 15.61, y: 4.72), controlPoint1: CGPoint(x: 15.58, y: 4.71), controlPoint2: CGPoint(x: 15.6, y: 4.71))
            stroke3Path.addCurve(to: CGPoint(x: 21.52, y: 10.21), controlPoint1: CGPoint(x: 17.91, y: 6.17), controlPoint2: CGPoint(x: 19.87, y: 8.01))
            stroke3Path.addCurve(to: CGPoint(x: 21.78, y: 10.5), controlPoint1: CGPoint(x: 21.6, y: 10.32), controlPoint2: CGPoint(x: 21.68, y: 10.42))
            stroke3Path.addCurve(to: CGPoint(x: 22.37, y: 10.45), controlPoint1: CGPoint(x: 21.99, y: 10.67), controlPoint2: CGPoint(x: 22.19, y: 10.64))
            stroke3Path.addCurve(to: CGPoint(x: 22.66, y: 10.12), controlPoint1: CGPoint(x: 22.47, y: 10.34), controlPoint2: CGPoint(x: 22.56, y: 10.22))
            stroke3Path.addCurve(to: CGPoint(x: 25.42, y: 7.85), controlPoint1: CGPoint(x: 23.51, y: 9.28), controlPoint2: CGPoint(x: 24.46, y: 8.56))
            stroke3Path.addCurve(to: CGPoint(x: 25.54, y: 7), controlPoint1: CGPoint(x: 25.71, y: 7.64), controlPoint2: CGPoint(x: 25.76, y: 7.3))
            stroke3Path.addCurve(to: CGPoint(x: 25.2, y: 6.47), controlPoint1: CGPoint(x: 25.41, y: 6.83), controlPoint2: CGPoint(x: 25.29, y: 6.66))
            stroke3Path.addCurve(to: CGPoint(x: 24.05, y: 3.98), controlPoint1: CGPoint(x: 24.81, y: 5.64), controlPoint2: CGPoint(x: 24.41, y: 4.82))
            stroke3Path.addCurve(to: CGPoint(x: 23.1, y: 1.63), controlPoint1: CGPoint(x: 23.71, y: 3.2), controlPoint2: CGPoint(x: 23.42, y: 2.41))
            stroke3Path.addCurve(to: CGPoint(x: 22.96, y: 1.44), controlPoint1: CGPoint(x: 23.08, y: 1.55), controlPoint2: CGPoint(x: 23.02, y: 1.48))
            stroke3Path.addCurve(to: CGPoint(x: 22.19, y: 1.56), controlPoint1: CGPoint(x: 22.74, y: 1.28), controlPoint2: CGPoint(x: 22.42, y: 1.33))
            stroke3Path.addCurve(to: CGPoint(x: 21.89, y: 1.84), controlPoint1: CGPoint(x: 22.1, y: 1.66), controlPoint2: CGPoint(x: 22, y: 1.77))
            stroke3Path.addCurve(to: CGPoint(x: 20.05, y: 2.36), controlPoint1: CGPoint(x: 21.33, y: 2.2), controlPoint2: CGPoint(x: 20.7, y: 2.34))
            stroke3Path.addCurve(to: CGPoint(x: 18, y: 2), controlPoint1: CGPoint(x: 19.35, y: 2.38), controlPoint2: CGPoint(x: 18.66, y: 2.23))
            stroke3Path.addCurve(to: CGPoint(x: 15.97, y: 1.28), controlPoint1: CGPoint(x: 17.32, y: 1.77), controlPoint2: CGPoint(x: 16.65, y: 1.51))
            stroke3Path.addCurve(to: CGPoint(x: 15.2, y: 1.15), controlPoint1: CGPoint(x: 15.72, y: 1.2), controlPoint2: CGPoint(x: 15.45, y: 1.14))
            stroke3Path.addCurve(to: CGPoint(x: 13.9, y: 1.96), controlPoint1: CGPoint(x: 14.62, y: 1.16), controlPoint2: CGPoint(x: 14.22, y: 1.5))
            stroke3Path.addCurve(to: CGPoint(x: 13.75, y: 2.17), controlPoint1: CGPoint(x: 13.85, y: 2.04), controlPoint2: CGPoint(x: 13.81, y: 2.12))
            stroke3Path.addCurve(to: CGPoint(x: 12.55, y: 3.3), controlPoint1: CGPoint(x: 13.35, y: 2.55), controlPoint2: CGPoint(x: 12.95, y: 2.93))
            stroke3Path.addCurve(to: CGPoint(x: 10.37, y: 5.3), controlPoint1: CGPoint(x: 11.82, y: 3.97), controlPoint2: CGPoint(x: 11.09, y: 4.63))
            stroke3Path.addCurve(to: CGPoint(x: 9.92, y: 6.06), controlPoint1: CGPoint(x: 10.15, y: 5.51), controlPoint2: CGPoint(x: 9.96, y: 5.74))
            stroke3Path.addCurve(to: CGPoint(x: 10.52, y: 7.11), controlPoint1: CGPoint(x: 9.87, y: 6.45), controlPoint2: CGPoint(x: 10.12, y: 6.89))
            stroke3Path.addCurve(to: CGPoint(x: 11.63, y: 7.4), controlPoint1: CGPoint(x: 10.87, y: 7.3), controlPoint2: CGPoint(x: 11.24, y: 7.39))
            stroke3Path.addCurve(to: CGPoint(x: 12.44, y: 7.19), controlPoint1: CGPoint(x: 11.92, y: 7.41), controlPoint2: CGPoint(x: 12.19, y: 7.38))
            stroke3Path.addCurve(to: CGPoint(x: 15.31, y: 4.94), controlPoint1: CGPoint(x: 13.39, y: 6.43), controlPoint2: CGPoint(x: 14.35, y: 5.69))
            stroke3Path.addCurve(to: CGPoint(x: 15.58, y: 4.71), controlPoint1: CGPoint(x: 15.4, y: 4.87), controlPoint2: CGPoint(x: 15.48, y: 4.79))
            stroke3Path.addLine(to: CGPoint(x: 15.58, y: 4.71))
            stroke3Path.close()
            stroke3Path.miterLimit = 4;
            
            stroke3Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke3Path.lineWidth = 0.5
            stroke3Path.stroke()
            
            
            //// Stroke-5 Drawing
            let stroke5Path = UIBezierPath()
            stroke5Path.move(to: CGPoint(x: 3.81, y: 11.36))
            stroke5Path.addCurve(to: CGPoint(x: 4.4, y: 12.3), controlPoint1: CGPoint(x: 3.81, y: 11.79), controlPoint2: CGPoint(x: 4.03, y: 12.13))
            stroke5Path.addCurve(to: CGPoint(x: 5.46, y: 12.08), controlPoint1: CGPoint(x: 4.76, y: 12.45), controlPoint2: CGPoint(x: 5.18, y: 12.37))
            stroke5Path.addCurve(to: CGPoint(x: 7.28, y: 10.2), controlPoint1: CGPoint(x: 6.07, y: 11.45), controlPoint2: CGPoint(x: 6.68, y: 10.83))
            stroke5Path.addCurve(to: CGPoint(x: 7.32, y: 8.78), controlPoint1: CGPoint(x: 7.68, y: 9.79), controlPoint2: CGPoint(x: 7.7, y: 9.18))
            stroke5Path.addCurve(to: CGPoint(x: 5.93, y: 8.78), controlPoint1: CGPoint(x: 6.94, y: 8.38), controlPoint2: CGPoint(x: 6.33, y: 8.37))
            stroke5Path.addCurve(to: CGPoint(x: 4.1, y: 10.66), controlPoint1: CGPoint(x: 5.31, y: 9.4), controlPoint2: CGPoint(x: 4.71, y: 10.03))
            stroke5Path.addCurve(to: CGPoint(x: 3.81, y: 11.36), controlPoint1: CGPoint(x: 3.91, y: 10.85), controlPoint2: CGPoint(x: 3.81, y: 11.09))
            stroke5Path.addLine(to: CGPoint(x: 3.81, y: 11.36))
            stroke5Path.close()
            stroke5Path.miterLimit = 4;
            
            stroke5Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke5Path.lineWidth = 0.5
            stroke5Path.stroke()
            
            
            //// Stroke-7 Drawing
            let stroke7Path = UIBezierPath()
            stroke7Path.move(to: CGPoint(x: 8.8, y: 10.06))
            stroke7Path.addCurve(to: CGPoint(x: 8.01, y: 10.37), controlPoint1: CGPoint(x: 8.44, y: 10.06), controlPoint2: CGPoint(x: 8.2, y: 10.16))
            stroke7Path.addCurve(to: CGPoint(x: 6.21, y: 12.21), controlPoint1: CGPoint(x: 7.41, y: 10.98), controlPoint2: CGPoint(x: 6.81, y: 11.6))
            stroke7Path.addCurve(to: CGPoint(x: 6.1, y: 12.34), controlPoint1: CGPoint(x: 6.17, y: 12.25), controlPoint2: CGPoint(x: 6.13, y: 12.3))
            stroke7Path.addCurve(to: CGPoint(x: 6.22, y: 13.69), controlPoint1: CGPoint(x: 5.79, y: 12.75), controlPoint2: CGPoint(x: 5.84, y: 13.35))
            stroke7Path.addCurve(to: CGPoint(x: 7.54, y: 13.66), controlPoint1: CGPoint(x: 6.6, y: 14.04), controlPoint2: CGPoint(x: 7.18, y: 14.03))
            stroke7Path.addCurve(to: CGPoint(x: 9.41, y: 11.74), controlPoint1: CGPoint(x: 8.17, y: 13.03), controlPoint2: CGPoint(x: 8.79, y: 12.38))
            stroke7Path.addCurve(to: CGPoint(x: 9.61, y: 10.67), controlPoint1: CGPoint(x: 9.69, y: 11.46), controlPoint2: CGPoint(x: 9.77, y: 11.02))
            stroke7Path.addCurve(to: CGPoint(x: 8.8, y: 10.06), controlPoint1: CGPoint(x: 9.44, y: 10.27), controlPoint2: CGPoint(x: 9.14, y: 10.07))
            stroke7Path.addLine(to: CGPoint(x: 8.8, y: 10.06))
            stroke7Path.close()
            stroke7Path.miterLimit = 4;
            
            stroke7Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke7Path.lineWidth = 0.5
            stroke7Path.stroke()
            
            
            //// Stroke-9 Drawing
            let stroke9Path = UIBezierPath()
            stroke9Path.move(to: CGPoint(x: 11.15, y: 16.86))
            stroke9Path.addCurve(to: CGPoint(x: 11.91, y: 16.56), controlPoint1: CGPoint(x: 11.48, y: 16.86), controlPoint2: CGPoint(x: 11.71, y: 16.76))
            stroke9Path.addCurve(to: CGPoint(x: 13.72, y: 14.7), controlPoint1: CGPoint(x: 12.51, y: 15.94), controlPoint2: CGPoint(x: 13.12, y: 15.32))
            stroke9Path.addCurve(to: CGPoint(x: 13.76, y: 13.28), controlPoint1: CGPoint(x: 14.12, y: 14.29), controlPoint2: CGPoint(x: 14.13, y: 13.67))
            stroke9Path.addCurve(to: CGPoint(x: 12.37, y: 13.27), controlPoint1: CGPoint(x: 13.38, y: 12.88), controlPoint2: CGPoint(x: 12.78, y: 12.87))
            stroke9Path.addCurve(to: CGPoint(x: 11.98, y: 13.67), controlPoint1: CGPoint(x: 12.24, y: 13.4), controlPoint2: CGPoint(x: 12.11, y: 13.53))
            stroke9Path.addCurve(to: CGPoint(x: 10.54, y: 15.15), controlPoint1: CGPoint(x: 11.5, y: 14.16), controlPoint2: CGPoint(x: 11.02, y: 14.66))
            stroke9Path.addCurve(to: CGPoint(x: 10.32, y: 16.26), controlPoint1: CGPoint(x: 10.24, y: 15.46), controlPoint2: CGPoint(x: 10.16, y: 15.89))
            stroke9Path.addCurve(to: CGPoint(x: 11.15, y: 16.86), controlPoint1: CGPoint(x: 10.49, y: 16.65), controlPoint2: CGPoint(x: 10.79, y: 16.85))
            stroke9Path.addLine(to: CGPoint(x: 11.15, y: 16.86))
            stroke9Path.close()
            stroke9Path.miterLimit = 4;
            
            stroke9Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke9Path.lineWidth = 0.5
            stroke9Path.stroke()
            
            
            //// Stroke-11 Drawing
            let stroke11Path = UIBezierPath()
            stroke11Path.move(to: CGPoint(x: 8.11, y: 14.37))
            stroke11Path.addCurve(to: CGPoint(x: 8.7, y: 15.29), controlPoint1: CGPoint(x: 8.11, y: 14.78), controlPoint2: CGPoint(x: 8.34, y: 15.14))
            stroke11Path.addCurve(to: CGPoint(x: 9.76, y: 15.07), controlPoint1: CGPoint(x: 9.1, y: 15.44), controlPoint2: CGPoint(x: 9.46, y: 15.38))
            stroke11Path.addCurve(to: CGPoint(x: 11.61, y: 13.18), controlPoint1: CGPoint(x: 10.38, y: 14.45), controlPoint2: CGPoint(x: 10.99, y: 13.81))
            stroke11Path.addCurve(to: CGPoint(x: 11.61, y: 11.77), controlPoint1: CGPoint(x: 11.99, y: 12.78), controlPoint2: CGPoint(x: 11.99, y: 12.16))
            stroke11Path.addCurve(to: CGPoint(x: 10.25, y: 11.75), controlPoint1: CGPoint(x: 11.25, y: 11.38), controlPoint2: CGPoint(x: 10.64, y: 11.37))
            stroke11Path.addCurve(to: CGPoint(x: 8.38, y: 13.67), controlPoint1: CGPoint(x: 9.62, y: 12.38), controlPoint2: CGPoint(x: 9, y: 13.03))
            stroke11Path.addCurve(to: CGPoint(x: 8.11, y: 14.37), controlPoint1: CGPoint(x: 8.2, y: 13.86), controlPoint2: CGPoint(x: 8.11, y: 14.1))
            stroke11Path.addLine(to: CGPoint(x: 8.11, y: 14.37))
            stroke11Path.close()
            stroke11Path.miterLimit = 4;
            
            stroke11Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke11Path.lineWidth = 0.5
            stroke11Path.stroke()
        }
        
        if(type == "edit"){
            //// Group-3
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 0.5, y: 24.5))
            shapePath.addCurve(to: CGPoint(x: 10.1, y: 22.9), controlPoint1: CGPoint(x: 0.5, y: 24.5), controlPoint2: CGPoint(x: 8.5, y: 24.5))
            shapePath.addCurve(to: CGPoint(x: 11.7, y: 18.2), controlPoint1: CGPoint(x: 11.6, y: 21.4), controlPoint2: CGPoint(x: 11.7, y: 18.2))
            shapePath.addLine(to: CGPoint(x: 6.9, y: 18.2))
            shapePath.addLine(to: CGPoint(x: 0.5, y: 24.5))
            shapePath.addLine(to: CGPoint(x: 0.5, y: 24.5))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            fillColor.setStroke()
            shapePath.stroke()
            
            
            //// Shape_1_ Drawing
            let shape_1_Path = UIBezierPath()
            shape_1_Path.move(to: CGPoint(x: 8.8, y: 16.6))
            shape_1_Path.addLine(to: CGPoint(x: 13.7, y: 16.6))
            shape_1_Path.addLine(to: CGPoint(x: 13.7, y: 19.7))
            shape_1_Path.addLine(to: CGPoint(x: 26.5, y: 7.1))
            shape_1_Path.addLine(to: CGPoint(x: 26.5, y: -0.5))
            shape_1_Path.addLine(to: CGPoint(x: 8.8, y: 16.6))
            shape_1_Path.close()
            shape_1_Path.miterLimit = 4;
            
            fillColor.setStroke()
            shape_1_Path.stroke()
        }
            
        else if(type == "estimate"){
            let strokeColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
            
            //// Group-3
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 8.14, y: 2.25))
            shapePath.addCurve(to: CGPoint(x: 9.12, y: 1), controlPoint1: CGPoint(x: 8.7, y: 2.25), controlPoint2: CGPoint(x: 9.12, y: 1.7))
            shapePath.addLine(to: CGPoint(x: 25.02, y: 1))
            shapePath.addCurve(to: CGPoint(x: 26, y: 2.25), controlPoint1: CGPoint(x: 25.02, y: 1.7), controlPoint2: CGPoint(x: 25.45, y: 2.25))
            shapePath.addLine(to: CGPoint(x: 26, y: 3.32))
            shapePath.addCurve(to: CGPoint(x: 25.02, y: 4.57), controlPoint1: CGPoint(x: 25.45, y: 3.32), controlPoint2: CGPoint(x: 25.02, y: 3.87))
            shapePath.addLine(to: CGPoint(x: 9.12, y: 4.57))
            shapePath.addCurve(to: CGPoint(x: 8.14, y: 3.32), controlPoint1: CGPoint(x: 9.12, y: 3.87), controlPoint2: CGPoint(x: 8.7, y: 3.32))
            shapePath.addLine(to: CGPoint(x: 8.14, y: 2.25))
            shapePath.addLine(to: CGPoint(x: 8.14, y: 2.25))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            shapePath.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
            
            
            //// Shape 2 Drawing
            let shape2Path = UIBezierPath()
            shape2Path.move(to: CGPoint(x: 1, y: 2.25))
            shape2Path.addCurve(to: CGPoint(x: 1.18, y: 1), controlPoint1: CGPoint(x: 1.11, y: 2.25), controlPoint2: CGPoint(x: 1.18, y: 1.7))
            shape2Path.addLine(to: CGPoint(x: 4.39, y: 1))
            shape2Path.addCurve(to: CGPoint(x: 4.57, y: 2.25), controlPoint1: CGPoint(x: 4.39, y: 1.7), controlPoint2: CGPoint(x: 4.46, y: 2.25))
            shape2Path.addLine(to: CGPoint(x: 4.57, y: 3.32))
            shape2Path.addCurve(to: CGPoint(x: 4.39, y: 4.57), controlPoint1: CGPoint(x: 4.46, y: 3.32), controlPoint2: CGPoint(x: 4.39, y: 3.87))
            shape2Path.addLine(to: CGPoint(x: 1.18, y: 4.57))
            shape2Path.addCurve(to: CGPoint(x: 1, y: 3.32), controlPoint1: CGPoint(x: 1.18, y: 3.87), controlPoint2: CGPoint(x: 1.11, y: 3.32))
            shape2Path.addLine(to: CGPoint(x: 1, y: 2.25))
            shape2Path.addLine(to: CGPoint(x: 1, y: 2.25))
            shape2Path.close()
            shape2Path.miterLimit = 4;
            
            shape2Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shape2Path.lineWidth = 1
            shape2Path.stroke()
            
            
            //// Shape 3 Drawing
            let shape3Path = UIBezierPath()
            shape3Path.move(to: CGPoint(x: 9.12, y: 8.14))
            shape3Path.addLine(to: CGPoint(x: 25.02, y: 8.14))
            shape3Path.addCurve(to: CGPoint(x: 26, y: 9.39), controlPoint1: CGPoint(x: 25.02, y: 8.84), controlPoint2: CGPoint(x: 25.45, y: 9.39))
            shape3Path.addLine(to: CGPoint(x: 26, y: 10.46))
            shape3Path.addCurve(to: CGPoint(x: 25.02, y: 11.71), controlPoint1: CGPoint(x: 25.45, y: 10.46), controlPoint2: CGPoint(x: 25.02, y: 11.02))
            shape3Path.addLine(to: CGPoint(x: 9.12, y: 11.71))
            shape3Path.addCurve(to: CGPoint(x: 8.14, y: 10.46), controlPoint1: CGPoint(x: 9.12, y: 11.02), controlPoint2: CGPoint(x: 8.7, y: 10.46))
            shape3Path.addLine(to: CGPoint(x: 8.14, y: 9.39))
            shape3Path.addCurve(to: CGPoint(x: 9.12, y: 8.14), controlPoint1: CGPoint(x: 8.7, y: 9.39), controlPoint2: CGPoint(x: 9.12, y: 8.84))
            shape3Path.close()
            shape3Path.miterLimit = 4;
            
            shape3Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shape3Path.lineWidth = 1
            shape3Path.stroke()
            
            
            //// Shape 4 Drawing
            let shape4Path = UIBezierPath()
            shape4Path.move(to: CGPoint(x: 1, y: 9.39))
            shape4Path.addCurve(to: CGPoint(x: 1.18, y: 8.14), controlPoint1: CGPoint(x: 1.11, y: 9.39), controlPoint2: CGPoint(x: 1.18, y: 8.84))
            shape4Path.addLine(to: CGPoint(x: 4.39, y: 8.14))
            shape4Path.addCurve(to: CGPoint(x: 4.57, y: 9.39), controlPoint1: CGPoint(x: 4.39, y: 8.84), controlPoint2: CGPoint(x: 4.46, y: 9.39))
            shape4Path.addLine(to: CGPoint(x: 4.57, y: 10.46))
            shape4Path.addCurve(to: CGPoint(x: 4.39, y: 11.71), controlPoint1: CGPoint(x: 4.46, y: 10.46), controlPoint2: CGPoint(x: 4.39, y: 11.02))
            shape4Path.addLine(to: CGPoint(x: 1.18, y: 11.71))
            shape4Path.addCurve(to: CGPoint(x: 1, y: 10.46), controlPoint1: CGPoint(x: 1.18, y: 11.02), controlPoint2: CGPoint(x: 1.11, y: 10.46))
            shape4Path.addLine(to: CGPoint(x: 1, y: 9.39))
            shape4Path.addLine(to: CGPoint(x: 1, y: 9.39))
            shape4Path.close()
            shape4Path.miterLimit = 4;
            
            shape4Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shape4Path.lineWidth = 1
            shape4Path.stroke()
            
            //// Shape 5 Drawing
            let shape5Path = UIBezierPath()
            shape5Path.move(to: CGPoint(x: 9.12, y: 15.29))
            shape5Path.addLine(to: CGPoint(x: 25.02, y: 15.29))
            shape5Path.addCurve(to: CGPoint(x: 26, y: 16.54), controlPoint1: CGPoint(x: 25.02, y: 15.98), controlPoint2: CGPoint(x: 25.45, y: 16.54))
            shape5Path.addLine(to: CGPoint(x: 26, y: 17.61))
            shape5Path.addCurve(to: CGPoint(x: 25.02, y: 18.86), controlPoint1: CGPoint(x: 25.45, y: 17.61), controlPoint2: CGPoint(x: 25.02, y: 18.16))
            shape5Path.addLine(to: CGPoint(x: 9.12, y: 18.86))
            shape5Path.addCurve(to: CGPoint(x: 8.14, y: 17.61), controlPoint1: CGPoint(x: 9.12, y: 18.16), controlPoint2: CGPoint(x: 8.7, y: 17.61))
            shape5Path.addLine(to: CGPoint(x: 8.14, y: 16.54))
            shape5Path.addCurve(to: CGPoint(x: 9.12, y: 15.29), controlPoint1: CGPoint(x: 8.7, y: 16.54), controlPoint2: CGPoint(x: 9.12, y: 15.98))
            shape5Path.close()
            shape5Path.miterLimit = 4;
            
            shape5Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shape5Path.lineWidth = 1
            shape5Path.stroke()
            
            
            //// Shape 6 Drawing
            let shape6Path = UIBezierPath()
            shape6Path.move(to: CGPoint(x: 1, y: 16.54))
            shape6Path.addCurve(to: CGPoint(x: 1.18, y: 15.29), controlPoint1: CGPoint(x: 1.11, y: 16.54), controlPoint2: CGPoint(x: 1.18, y: 15.98))
            shape6Path.addLine(to: CGPoint(x: 4.39, y: 15.29))
            shape6Path.addCurve(to: CGPoint(x: 4.57, y: 16.54), controlPoint1: CGPoint(x: 4.39, y: 15.98), controlPoint2: CGPoint(x: 4.46, y: 16.54))
            shape6Path.addLine(to: CGPoint(x: 4.57, y: 17.61))
            shape6Path.addCurve(to: CGPoint(x: 4.39, y: 18.86), controlPoint1: CGPoint(x: 4.46, y: 17.61), controlPoint2: CGPoint(x: 4.39, y: 18.16))
            shape6Path.addLine(to: CGPoint(x: 1.18, y: 18.86))
            shape6Path.addCurve(to: CGPoint(x: 1, y: 17.61), controlPoint1: CGPoint(x: 1.18, y: 18.16), controlPoint2: CGPoint(x: 1.11, y: 17.61))
            shape6Path.addLine(to: CGPoint(x: 1, y: 16.54))
            shape6Path.addLine(to: CGPoint(x: 1, y: 16.54))
            shape6Path.close()
            shape6Path.miterLimit = 4;
            
            shape6Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shape6Path.lineWidth = 1
            shape6Path.stroke()
            
            
        }
            
        else if(type == "chat"){
            let strokeColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
            
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 7.72, y: 20.97))
            shapePath.addCurve(to: CGPoint(x: 7.67, y: 21.4), controlPoint1: CGPoint(x: 7.68, y: 21.12), controlPoint2: CGPoint(x: 7.67, y: 21.25))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 25))
            shapePath.addCurve(to: CGPoint(x: 9.38, y: 25.43), controlPoint1: CGPoint(x: 7.67, y: 26.2), controlPoint2: CGPoint(x: 8.52, y: 26.29))
            shapePath.addLine(to: CGPoint(x: 14.33, y: 21.14))
            shapePath.addLine(to: CGPoint(x: 17.37, y: 21.14))
            shapePath.addCurve(to: CGPoint(x: 27.67, y: 10.93), controlPoint1: CGPoint(x: 23.05, y: 21.14), controlPoint2: CGPoint(x: 27.67, y: 16.57))
            shapePath.addCurve(to: CGPoint(x: 17.37, y: 1), controlPoint1: CGPoint(x: 27.67, y: 5.3), controlPoint2: CGPoint(x: 23.05, y: 1))
            shapePath.addLine(to: CGPoint(x: 11.3, y: 1))
            shapePath.addCurve(to: CGPoint(x: 1, y: 11.2), controlPoint1: CGPoint(x: 5.62, y: 1), controlPoint2: CGPoint(x: 1, y: 5.56))
            shapePath.addCurve(to: CGPoint(x: 7.72, y: 20.97), controlPoint1: CGPoint(x: 1, y: 15.8), controlPoint2: CGPoint(x: 3.48, y: 19.71))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 7.67, y: 7.71))
            shapePath.addLine(to: CGPoint(x: 21, y: 7.71))
            shapePath.addLine(to: CGPoint(x: 21, y: 9.39))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 9.39))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 7.71))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 7.71))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 7.67, y: 11.07))
            shapePath.addLine(to: CGPoint(x: 21, y: 11.07))
            shapePath.addLine(to: CGPoint(x: 21, y: 12.75))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 12.75))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 11.07))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 11.07))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 16, y: 14.42))
            shapePath.addLine(to: CGPoint(x: 16, y: 16.1))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 16.1))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 14.42))
            shapePath.addLine(to: CGPoint(x: 16, y: 14.42))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            strokeColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
            
        }
        else if(type == "call"){
            let strokeColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
            
            //// Group-3
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 17.32, y: 12.57))
            shapePath.addLine(to: CGPoint(x: 17.39, y: 12.5))
            shapePath.addCurve(to: CGPoint(x: 16.57, y: 11.81), controlPoint1: CGPoint(x: 17.09, y: 12.29), controlPoint2: CGPoint(x: 16.82, y: 12.06))
            shapePath.addLine(to: CGPoint(x: 17.32, y: 12.57))
            shapePath.addLine(to: CGPoint(x: 17.32, y: 12.57))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 20.95, y: 13.3))
            shapePath.addCurve(to: CGPoint(x: 17.5, y: 17.09), controlPoint1: CGPoint(x: 21.09, y: 14.01), controlPoint2: CGPoint(x: 19.51, y: 15.1))
            shapePath.addCurve(to: CGPoint(x: 13.34, y: 20.41), controlPoint1: CGPoint(x: 15.08, y: 19.51), controlPoint2: CGPoint(x: 14.4, y: 20.25))
            shapePath.addCurve(to: CGPoint(x: 12.5, y: 17.39), controlPoint1: CGPoint(x: 13.37, y: 19.33), controlPoint2: CGPoint(x: 13.07, y: 18.3))
            shapePath.addCurve(to: CGPoint(x: 11.81, y: 16.57), controlPoint1: CGPoint(x: 12.29, y: 17.09), controlPoint2: CGPoint(x: 12.06, y: 16.82))
            shapePath.addLine(to: CGPoint(x: 9.53, y: 14.28))
            shapePath.addCurve(to: CGPoint(x: 6.42, y: 14.33), controlPoint1: CGPoint(x: 8.68, y: 13.44), controlPoint2: CGPoint(x: 7.29, y: 13.46))
            shapePath.addLine(to: CGPoint(x: 4.04, y: 16.7))
            shapePath.addLine(to: CGPoint(x: 1.67, y: 19.08))
            shapePath.addCurve(to: CGPoint(x: 1.62, y: 22.19), controlPoint1: CGPoint(x: 0.8, y: 19.95), controlPoint2: CGPoint(x: 0.77, y: 21.34))
            shapePath.addLine(to: CGPoint(x: 3.91, y: 24.47))
            shapePath.addCurve(to: CGPoint(x: 4.73, y: 25.16), controlPoint1: CGPoint(x: 4.16, y: 24.72), controlPoint2: CGPoint(x: 4.43, y: 24.95))
            shapePath.addCurve(to: CGPoint(x: 10.35, y: 25.3), controlPoint1: CGPoint(x: 6.4, y: 26.23), controlPoint2: CGPoint(x: 8.59, y: 26.28))
            shapePath.addCurve(to: CGPoint(x: 20.02, y: 19.01), controlPoint1: CGPoint(x: 12.36, y: 24.91), controlPoint2: CGPoint(x: 15.56, y: 23.47))
            shapePath.addCurve(to: CGPoint(x: 25.73, y: 9.32), controlPoint1: CGPoint(x: 25, y: 14.03), controlPoint2: CGPoint(x: 25.87, y: 10.96))
            shapePath.addCurve(to: CGPoint(x: 25.16, y: 4.73), controlPoint1: CGPoint(x: 26.23, y: 7.79), controlPoint2: CGPoint(x: 26.03, y: 6.1))
            shapePath.addCurve(to: CGPoint(x: 24.47, y: 3.91), controlPoint1: CGPoint(x: 24.95, y: 4.43), controlPoint2: CGPoint(x: 24.72, y: 4.16))
            shapePath.addLine(to: CGPoint(x: 22.19, y: 1.62))
            shapePath.addCurve(to: CGPoint(x: 19.08, y: 1.67), controlPoint1: CGPoint(x: 21.34, y: 0.77), controlPoint2: CGPoint(x: 19.95, y: 0.8))
            shapePath.addLine(to: CGPoint(x: 16.7, y: 4.04))
            shapePath.addLine(to: CGPoint(x: 14.33, y: 6.42))
            shapePath.addCurve(to: CGPoint(x: 14.28, y: 9.53), controlPoint1: CGPoint(x: 13.46, y: 7.29), controlPoint2: CGPoint(x: 13.44, y: 8.68))
            shapePath.addLine(to: CGPoint(x: 16.57, y: 11.81))
            shapePath.addCurve(to: CGPoint(x: 17.39, y: 12.5), controlPoint1: CGPoint(x: 16.82, y: 12.06), controlPoint2: CGPoint(x: 17.09, y: 12.29))
            shapePath.addCurve(to: CGPoint(x: 20.95, y: 13.3), controlPoint1: CGPoint(x: 18.46, y: 13.18), controlPoint2: CGPoint(x: 19.72, y: 13.46))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 25.16, y: 4.73))
            shapePath.addLine(to: CGPoint(x: 25.23, y: 4.66))
            shapePath.addLine(to: CGPoint(x: 24.47, y: 3.91))
            shapePath.addCurve(to: CGPoint(x: 25.16, y: 4.73), controlPoint1: CGPoint(x: 24.72, y: 4.16), controlPoint2: CGPoint(x: 24.95, y: 4.43))
            shapePath.addLine(to: CGPoint(x: 25.16, y: 4.73))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 4.66, y: 25.23))
            shapePath.addLine(to: CGPoint(x: 4.73, y: 25.16))
            shapePath.addCurve(to: CGPoint(x: 3.91, y: 24.47), controlPoint1: CGPoint(x: 4.43, y: 24.95), controlPoint2: CGPoint(x: 4.16, y: 24.72))
            shapePath.addLine(to: CGPoint(x: 4.66, y: 25.23))
            shapePath.addLine(to: CGPoint(x: 4.66, y: 25.23))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 12.5, y: 17.39))
            shapePath.addLine(to: CGPoint(x: 12.57, y: 17.32))
            shapePath.addLine(to: CGPoint(x: 11.81, y: 16.57))
            shapePath.addCurve(to: CGPoint(x: 12.5, y: 17.39), controlPoint1: CGPoint(x: 12.06, y: 16.82), controlPoint2: CGPoint(x: 12.29, y: 17.09))
            shapePath.addLine(to: CGPoint(x: 12.5, y: 17.39))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            shapePath.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
            
            
        }
        else if(type == "invoice"){
            let strokeColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
            
            //// Group-4
            //// Shape Drawing
            let shapePath = UIBezierPath(ovalIn: CGRect(x: 1, y: 1, width: 25, height: 25))
            strokeColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
            
            
            //// Shape 2 Drawing
            let shape2Path = UIBezierPath()
            shape2Path.move(to: CGPoint(x: 11.75, y: 13))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 19))
            shape2Path.addLine(to: CGPoint(x: 9.75, y: 19))
            shape2Path.addLine(to: CGPoint(x: 9.75, y: 21))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 21))
            shape2Path.addLine(to: CGPoint(x: 15.75, y: 21))
            shape2Path.addLine(to: CGPoint(x: 17.75, y: 21))
            shape2Path.addLine(to: CGPoint(x: 17.75, y: 19))
            shape2Path.addLine(to: CGPoint(x: 15.75, y: 19))
            shape2Path.addLine(to: CGPoint(x: 15.75, y: 13))
            shape2Path.addLine(to: CGPoint(x: 15.75, y: 11))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 11))
            shape2Path.addLine(to: CGPoint(x: 9.75, y: 11))
            shape2Path.addLine(to: CGPoint(x: 9.75, y: 13))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 13))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 13))
            shape2Path.close()
            shape2Path.move(to: CGPoint(x: 11.75, y: 5))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 9))
            shape2Path.addLine(to: CGPoint(x: 15.75, y: 9))
            shape2Path.addLine(to: CGPoint(x: 15.75, y: 5))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 5))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 5))
            shape2Path.close()
            shape2Path.miterLimit = 4;
            
            shape2Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shape2Path.lineWidth = 1
            shape2Path.stroke()
        }
            
        else if(type == "car"){
            let strokeColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
            
            //// Bezier Drawing
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 25.36, y: 16.29))
            bezierPath.addLine(to: CGPoint(x: 25.36, y: 16.29))
            bezierPath.addCurve(to: CGPoint(x: 26.99, y: 16.29), controlPoint1: CGPoint(x: 25.9, y: 16.29), controlPoint2: CGPoint(x: 26.45, y: 16.3))
            bezierPath.addCurve(to: CGPoint(x: 27.43, y: 15.94), controlPoint1: CGPoint(x: 27.25, y: 16.29), controlPoint2: CGPoint(x: 27.42, y: 16.14))
            bezierPath.addCurve(to: CGPoint(x: 27, y: 15.57), controlPoint1: CGPoint(x: 27.43, y: 15.73), controlPoint2: CGPoint(x: 27.27, y: 15.57))
            bezierPath.addCurve(to: CGPoint(x: 23.74, y: 15.57), controlPoint1: CGPoint(x: 25.92, y: 15.57), controlPoint2: CGPoint(x: 24.83, y: 15.57))
            bezierPath.addCurve(to: CGPoint(x: 23.3, y: 15.94), controlPoint1: CGPoint(x: 23.45, y: 15.57), controlPoint2: CGPoint(x: 23.29, y: 15.71))
            bezierPath.addCurve(to: CGPoint(x: 23.75, y: 16.29), controlPoint1: CGPoint(x: 23.3, y: 16.17), controlPoint2: CGPoint(x: 23.46, y: 16.29))
            bezierPath.addCurve(to: CGPoint(x: 25.36, y: 16.29), controlPoint1: CGPoint(x: 24.29, y: 16.3), controlPoint2: CGPoint(x: 24.82, y: 16.29))
            bezierPath.addLine(to: CGPoint(x: 25.36, y: 16.29))
            bezierPath.close()
            bezierPath.miterLimit = 4;
            
            strokeColor.setStroke()
            bezierPath.lineWidth = 1
            bezierPath.stroke()
            
            
            //// Bezier 2 Drawing
            let bezier2Path = UIBezierPath()
            bezier2Path.move(to: CGPoint(x: 6.63, y: 15.57))
            bezier2Path.addLine(to: CGPoint(x: 6.63, y: 15.57))
            bezier2Path.addCurve(to: CGPoint(x: 4.97, y: 15.57), controlPoint1: CGPoint(x: 6.08, y: 15.57), controlPoint2: CGPoint(x: 5.52, y: 15.57))
            bezier2Path.addCurve(to: CGPoint(x: 4.58, y: 15.94), controlPoint1: CGPoint(x: 4.73, y: 15.58), controlPoint2: CGPoint(x: 4.57, y: 15.7))
            bezier2Path.addCurve(to: CGPoint(x: 4.98, y: 16.3), controlPoint1: CGPoint(x: 4.59, y: 16.18), controlPoint2: CGPoint(x: 4.74, y: 16.3))
            bezier2Path.addCurve(to: CGPoint(x: 8.29, y: 16.29), controlPoint1: CGPoint(x: 6.08, y: 16.29), controlPoint2: CGPoint(x: 7.19, y: 16.3))
            bezier2Path.addCurve(to: CGPoint(x: 8.59, y: 16.18), controlPoint1: CGPoint(x: 8.39, y: 16.29), controlPoint2: CGPoint(x: 8.54, y: 16.25))
            bezier2Path.addCurve(to: CGPoint(x: 8.67, y: 15.82), controlPoint1: CGPoint(x: 8.66, y: 16.08), controlPoint2: CGPoint(x: 8.72, y: 15.9))
            bezier2Path.addCurve(to: CGPoint(x: 8.3, y: 15.58), controlPoint1: CGPoint(x: 8.6, y: 15.71), controlPoint2: CGPoint(x: 8.43, y: 15.59))
            bezier2Path.addCurve(to: CGPoint(x: 6.63, y: 15.57), controlPoint1: CGPoint(x: 7.74, y: 15.55), controlPoint2: CGPoint(x: 7.19, y: 15.57))
            bezier2Path.addLine(to: CGPoint(x: 6.63, y: 15.57))
            bezier2Path.close()
            bezier2Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier2Path.lineWidth = 1
            bezier2Path.stroke()
            
            
            //// Bezier 3 Drawing
            let bezier3Path = UIBezierPath()
            bezier3Path.move(to: CGPoint(x: 25.85, y: 14.28))
            bezier3Path.addLine(to: CGPoint(x: 26.63, y: 14.28))
            bezier3Path.addCurve(to: CGPoint(x: 28.55, y: 12.97), controlPoint1: CGPoint(x: 27.93, y: 14.28), controlPoint2: CGPoint(x: 28.07, y: 14.17))
            bezier3Path.addCurve(to: CGPoint(x: 28.6, y: 12.83), controlPoint1: CGPoint(x: 28.57, y: 12.92), controlPoint2: CGPoint(x: 28.59, y: 12.88))
            bezier3Path.addCurve(to: CGPoint(x: 28.01, y: 12.1), controlPoint1: CGPoint(x: 28.76, y: 12.33), controlPoint2: CGPoint(x: 28.53, y: 12.03))
            bezier3Path.addCurve(to: CGPoint(x: 25.17, y: 12.47), controlPoint1: CGPoint(x: 27.06, y: 12.21), controlPoint2: CGPoint(x: 26.12, y: 12.35))
            bezier3Path.addCurve(to: CGPoint(x: 23.95, y: 13.49), controlPoint1: CGPoint(x: 24.53, y: 12.54), controlPoint2: CGPoint(x: 24.16, y: 12.91))
            bezier3Path.addCurve(to: CGPoint(x: 24.5, y: 14.27), controlPoint1: CGPoint(x: 23.78, y: 13.99), controlPoint2: CGPoint(x: 23.97, y: 14.27))
            bezier3Path.addCurve(to: CGPoint(x: 25.85, y: 14.28), controlPoint1: CGPoint(x: 24.95, y: 14.28), controlPoint2: CGPoint(x: 25.41, y: 14.28))
            bezier3Path.addLine(to: CGPoint(x: 25.85, y: 14.28))
            bezier3Path.close()
            bezier3Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier3Path.lineWidth = 1
            bezier3Path.stroke()
            
            
            //// Bezier 4 Drawing
            let bezier4Path = UIBezierPath()
            bezier4Path.move(to: CGPoint(x: 6.16, y: 14.28))
            bezier4Path.addCurve(to: CGPoint(x: 6.53, y: 14.28), controlPoint1: CGPoint(x: 6.28, y: 14.28), controlPoint2: CGPoint(x: 6.41, y: 14.28))
            bezier4Path.addCurve(to: CGPoint(x: 7.59, y: 14.27), controlPoint1: CGPoint(x: 6.88, y: 14.28), controlPoint2: CGPoint(x: 7.24, y: 14.29))
            bezier4Path.addCurve(to: CGPoint(x: 8.11, y: 13.79), controlPoint1: CGPoint(x: 7.93, y: 14.26), controlPoint2: CGPoint(x: 8.13, y: 14.07))
            bezier4Path.addCurve(to: CGPoint(x: 7.04, y: 12.51), controlPoint1: CGPoint(x: 8.09, y: 13.22), controlPoint2: CGPoint(x: 7.6, y: 12.59))
            bezier4Path.addCurve(to: CGPoint(x: 3.95, y: 12.1), controlPoint1: CGPoint(x: 6.02, y: 12.35), controlPoint2: CGPoint(x: 4.98, y: 12.22))
            bezier4Path.addCurve(to: CGPoint(x: 3.39, y: 12.82), controlPoint1: CGPoint(x: 3.46, y: 12.04), controlPoint2: CGPoint(x: 3.24, y: 12.34))
            bezier4Path.addCurve(to: CGPoint(x: 3.69, y: 13.53), controlPoint1: CGPoint(x: 3.47, y: 13.06), controlPoint2: CGPoint(x: 3.58, y: 13.3))
            bezier4Path.addCurve(to: CGPoint(x: 4.84, y: 14.28), controlPoint1: CGPoint(x: 3.9, y: 14.04), controlPoint2: CGPoint(x: 4.3, y: 14.27))
            bezier4Path.addCurve(to: CGPoint(x: 6.16, y: 14.28), controlPoint1: CGPoint(x: 5.28, y: 14.28), controlPoint2: CGPoint(x: 5.72, y: 14.28))
            bezier4Path.addLine(to: CGPoint(x: 6.16, y: 14.28))
            bezier4Path.close()
            bezier4Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier4Path.lineWidth = 1
            bezier4Path.stroke()
            
            //// Bezier 5 Drawing
            let bezier5Path = UIBezierPath()
            bezier5Path.move(to: CGPoint(x: 25.49, y: 7.1))
            bezier5Path.addCurve(to: CGPoint(x: 23.63, y: 3.4), controlPoint1: CGPoint(x: 24.99, y: 5.8), controlPoint2: CGPoint(x: 24.43, y: 4.53))
            bezier5Path.addCurve(to: CGPoint(x: 22.89, y: 2.97), controlPoint1: CGPoint(x: 23.48, y: 3.18), controlPoint2: CGPoint(x: 23.16, y: 3.02))
            bezier5Path.addCurve(to: CGPoint(x: 16.45, y: 2.32), controlPoint1: CGPoint(x: 20.76, y: 2.56), controlPoint2: CGPoint(x: 18.61, y: 2.34))
            bezier5Path.addCurve(to: CGPoint(x: 9.28, y: 2.92), controlPoint1: CGPoint(x: 14.04, y: 2.3), controlPoint2: CGPoint(x: 11.65, y: 2.49))
            bezier5Path.addCurve(to: CGPoint(x: 8.15, y: 3.7), controlPoint1: CGPoint(x: 8.77, y: 3.02), controlPoint2: CGPoint(x: 8.38, y: 3.24))
            bezier5Path.addCurve(to: CGPoint(x: 6.59, y: 6.89), controlPoint1: CGPoint(x: 7.63, y: 4.76), controlPoint2: CGPoint(x: 7.11, y: 5.82))
            bezier5Path.addCurve(to: CGPoint(x: 6.53, y: 7.09), controlPoint1: CGPoint(x: 6.55, y: 6.96), controlPoint2: CGPoint(x: 6.55, y: 7.04))
            bezier5Path.addCurve(to: CGPoint(x: 25.49, y: 7.1), controlPoint1: CGPoint(x: 12.85, y: 6.69), controlPoint2: CGPoint(x: 19.15, y: 6.69))
            bezier5Path.addLine(to: CGPoint(x: 25.49, y: 7.1))
            bezier5Path.close()
            bezier5Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier5Path.lineWidth = 1
            bezier5Path.stroke()
            
            //// Bezier 6 Drawing
            let bezier6Path = UIBezierPath()
            bezier6Path.move(to: CGPoint(x: 29.79, y: 21.12))
            bezier6Path.addLine(to: CGPoint(x: 25.42, y: 21.12))
            bezier6Path.addCurve(to: CGPoint(x: 24.8, y: 19.95), controlPoint1: CGPoint(x: 24.88, y: 20.91), controlPoint2: CGPoint(x: 24.75, y: 20.47))
            bezier6Path.addCurve(to: CGPoint(x: 7.2, y: 19.94), controlPoint1: CGPoint(x: 23.12, y: 19.55), controlPoint2: CGPoint(x: 8.95, y: 19.55))
            bezier6Path.addCurve(to: CGPoint(x: 6.58, y: 21.12), controlPoint1: CGPoint(x: 7.25, y: 20.47), controlPoint2: CGPoint(x: 7.11, y: 20.9))
            bezier6Path.addLine(to: CGPoint(x: 2.21, y: 21.12))
            bezier6Path.addCurve(to: CGPoint(x: 1.58, y: 20.08), controlPoint1: CGPoint(x: 1.74, y: 20.93), controlPoint2: CGPoint(x: 1.56, y: 20.58))
            bezier6Path.addCurve(to: CGPoint(x: 1.4, y: 15.73), controlPoint1: CGPoint(x: 1.64, y: 18.63), controlPoint2: CGPoint(x: 1.51, y: 17.18))
            bezier6Path.addCurve(to: CGPoint(x: 1.29, y: 14.57), controlPoint1: CGPoint(x: 1.36, y: 15.34), controlPoint2: CGPoint(x: 1.32, y: 14.96))
            bezier6Path.addLine(to: CGPoint(x: 1.29, y: 12.15))
            bezier6Path.addCurve(to: CGPoint(x: 1.35, y: 11.88), controlPoint1: CGPoint(x: 1.31, y: 12.06), controlPoint2: CGPoint(x: 1.34, y: 11.97))
            bezier6Path.addCurve(to: CGPoint(x: 2.84, y: 8.55), controlPoint1: CGPoint(x: 1.48, y: 10.61), controlPoint2: CGPoint(x: 1.74, y: 9.4))
            bezier6Path.addCurve(to: CGPoint(x: 2.48, y: 8.39), controlPoint1: CGPoint(x: 2.71, y: 8.49), controlPoint2: CGPoint(x: 2.59, y: 8.45))
            bezier6Path.addCurve(to: CGPoint(x: 1.57, y: 7.72), controlPoint1: CGPoint(x: 2.17, y: 8.17), controlPoint2: CGPoint(x: 1.82, y: 7.99))
            bezier6Path.addCurve(to: CGPoint(x: 1.79, y: 6.55), controlPoint1: CGPoint(x: 1.16, y: 7.29), controlPoint2: CGPoint(x: 1.27, y: 6.83))
            bezier6Path.addCurve(to: CGPoint(x: 2.21, y: 6.37), controlPoint1: CGPoint(x: 1.92, y: 6.48), controlPoint2: CGPoint(x: 2.07, y: 6.4))
            bezier6Path.addCurve(to: CGPoint(x: 4.31, y: 6.08), controlPoint1: CGPoint(x: 2.91, y: 6.26), controlPoint2: CGPoint(x: 3.61, y: 6.16))
            bezier6Path.addCurve(to: CGPoint(x: 4.58, y: 6.23), controlPoint1: CGPoint(x: 4.39, y: 6.07), controlPoint2: CGPoint(x: 4.51, y: 6.16))
            bezier6Path.addCurve(to: CGPoint(x: 5.05, y: 6.83), controlPoint1: CGPoint(x: 4.74, y: 6.41), controlPoint2: CGPoint(x: 4.88, y: 6.61))
            bezier6Path.addCurve(to: CGPoint(x: 5.2, y: 6.43), controlPoint1: CGPoint(x: 5.11, y: 6.66), controlPoint2: CGPoint(x: 5.16, y: 6.55))
            bezier6Path.addCurve(to: CGPoint(x: 6.99, y: 2.81), controlPoint1: CGPoint(x: 5.7, y: 5.17), controlPoint2: CGPoint(x: 6.27, y: 3.96))
            bezier6Path.addCurve(to: CGPoint(x: 8.76, y: 1.55), controlPoint1: CGPoint(x: 7.41, y: 2.14), controlPoint2: CGPoint(x: 7.98, y: 1.67))
            bezier6Path.addCurve(to: CGPoint(x: 12.85, y: 1), controlPoint1: CGPoint(x: 10.12, y: 1.34), controlPoint2: CGPoint(x: 11.49, y: 1.17))
            bezier6Path.addCurve(to: CGPoint(x: 14.16, y: 0.88), controlPoint1: CGPoint(x: 13.29, y: 0.94), controlPoint2: CGPoint(x: 13.72, y: 0.92))
            bezier6Path.addLine(to: CGPoint(x: 17.84, y: 0.88))
            bezier6Path.addCurve(to: CGPoint(x: 18.09, y: 0.93), controlPoint1: CGPoint(x: 17.92, y: 0.89), controlPoint2: CGPoint(x: 18.01, y: 0.92))
            bezier6Path.addCurve(to: CGPoint(x: 22.76, y: 1.46), controlPoint1: CGPoint(x: 19.65, y: 1.1), controlPoint2: CGPoint(x: 21.2, y: 1.29))
            bezier6Path.addCurve(to: CGPoint(x: 25.17, y: 3.07), controlPoint1: CGPoint(x: 23.85, y: 1.57), controlPoint2: CGPoint(x: 24.66, y: 2.09))
            bezier6Path.addCurve(to: CGPoint(x: 25.79, y: 4.2), controlPoint1: CGPoint(x: 25.37, y: 3.45), controlPoint2: CGPoint(x: 25.61, y: 3.81))
            bezier6Path.addCurve(to: CGPoint(x: 26.98, y: 6.79), controlPoint1: CGPoint(x: 26.2, y: 5.05), controlPoint2: CGPoint(x: 26.58, y: 5.91))
            bezier6Path.addCurve(to: CGPoint(x: 27.43, y: 6.22), controlPoint1: CGPoint(x: 27.12, y: 6.6), controlPoint2: CGPoint(x: 27.27, y: 6.4))
            bezier6Path.addCurve(to: CGPoint(x: 27.68, y: 6.08), controlPoint1: CGPoint(x: 27.49, y: 6.15), controlPoint2: CGPoint(x: 27.6, y: 6.07))
            bezier6Path.addCurve(to: CGPoint(x: 29.85, y: 6.4), controlPoint1: CGPoint(x: 28.4, y: 6.17), controlPoint2: CGPoint(x: 29.13, y: 6.26))
            bezier6Path.addCurve(to: CGPoint(x: 30.66, y: 7.07), controlPoint1: CGPoint(x: 30.21, y: 6.47), controlPoint2: CGPoint(x: 30.59, y: 6.63))
            bezier6Path.addCurve(to: CGPoint(x: 30.11, y: 8.04), controlPoint1: CGPoint(x: 30.73, y: 7.52), controlPoint2: CGPoint(x: 30.42, y: 7.8))
            bezier6Path.addCurve(to: CGPoint(x: 29.52, y: 8.39), controlPoint1: CGPoint(x: 29.93, y: 8.18), controlPoint2: CGPoint(x: 29.72, y: 8.28))
            bezier6Path.addCurve(to: CGPoint(x: 29.15, y: 8.55), controlPoint1: CGPoint(x: 29.41, y: 8.45), controlPoint2: CGPoint(x: 29.29, y: 8.49))
            bezier6Path.addCurve(to: CGPoint(x: 30.52, y: 10.91), controlPoint1: CGPoint(x: 29.97, y: 9.14), controlPoint2: CGPoint(x: 30.32, y: 9.99))
            bezier6Path.addCurve(to: CGPoint(x: 30.71, y: 12.15), controlPoint1: CGPoint(x: 30.6, y: 11.32), controlPoint2: CGPoint(x: 30.65, y: 11.74))
            bezier6Path.addLine(to: CGPoint(x: 30.71, y: 14.51))
            bezier6Path.addCurve(to: CGPoint(x: 30.63, y: 15.44), controlPoint1: CGPoint(x: 30.69, y: 14.82), controlPoint2: CGPoint(x: 30.66, y: 15.13))
            bezier6Path.addCurve(to: CGPoint(x: 30.42, y: 20.08), controlPoint1: CGPoint(x: 30.5, y: 16.99), controlPoint2: CGPoint(x: 30.36, y: 18.53))
            bezier6Path.addCurve(to: CGPoint(x: 29.79, y: 21.12), controlPoint1: CGPoint(x: 30.44, y: 20.58), controlPoint2: CGPoint(x: 30.26, y: 20.93))
            bezier6Path.addLine(to: CGPoint(x: 29.79, y: 21.12))
            bezier6Path.close()
            bezier6Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier6Path.lineWidth = 1
            bezier6Path.stroke()
        }
            
        else if(type == "addComp"){
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 9.75, y: 13.97))
            shapePath.addLine(to: CGPoint(x: 3.15, y: 20.93))
            shapePath.addCurve(to: CGPoint(x: 3.06, y: 23.67), controlPoint1: CGPoint(x: 2.41, y: 21.71), controlPoint2: CGPoint(x: 2.36, y: 22.93))
            shapePath.addLine(to: CGPoint(x: 4.56, y: 25.26))
            shapePath.addCurve(to: CGPoint(x: 7.15, y: 25.16), controlPoint1: CGPoint(x: 5.26, y: 25.98), controlPoint2: CGPoint(x: 6.41, y: 25.93))
            shapePath.addLine(to: CGPoint(x: 13.77, y: 18.19))
            shapePath.addCurve(to: CGPoint(x: 13.86, y: 15.44), controlPoint1: CGPoint(x: 14.51, y: 17.4), controlPoint2: CGPoint(x: 14.54, y: 16.18))
            shapePath.addLine(to: CGPoint(x: 13.77, y: 15.36))
            shapePath.addLine(to: CGPoint(x: 20.56, y: 8.2))
            shapePath.addLine(to: CGPoint(x: 21.58, y: 8.53))
            shapePath.addLine(to: CGPoint(x: 24.48, y: 4.06))
            shapePath.addLine(to: CGPoint(x: 23.15, y: 2.65))
            shapePath.addLine(to: CGPoint(x: 18.91, y: 5.71))
            shapePath.addLine(to: CGPoint(x: 19.22, y: 6.8))
            shapePath.addLine(to: CGPoint(x: 12.43, y: 13.95))
            shapePath.addLine(to: CGPoint(x: 12.36, y: 13.87))
            shapePath.addCurve(to: CGPoint(x: 9.75, y: 13.97), controlPoint1: CGPoint(x: 11.66, y: 13.14), controlPoint2: CGPoint(x: 10.49, y: 13.18))
            shapePath.addLine(to: CGPoint(x: 9.75, y: 13.97))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            shapePath.usesEvenOddFillRule = true;
            
            fillColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
            
            
            //// Shape 2 Drawing
            let shape2Path = UIBezierPath()
            shape2Path.move(to: CGPoint(x: 13.49, y: 10.9))
            shape2Path.addLine(to: CGPoint(x: 14.15, y: 10.19))
            shape2Path.addLine(to: CGPoint(x: 13.85, y: 9.87))
            shape2Path.addCurve(to: CGPoint(x: 12.22, y: 3.23), controlPoint1: CGPoint(x: 14.42, y: 7.61), controlPoint2: CGPoint(x: 13.88, y: 5.09))
            shape2Path.addCurve(to: CGPoint(x: 4.69, y: 1.6), controlPoint1: CGPoint(x: 10.19, y: 1), controlPoint2: CGPoint(x: 7.15, y: 0.42))
            shape2Path.addLine(to: CGPoint(x: 8.41, y: 5.58))
            shape2Path.addCurve(to: CGPoint(x: 8.42, y: 7.23), controlPoint1: CGPoint(x: 8.83, y: 6.05), controlPoint2: CGPoint(x: 8.84, y: 6.78))
            shape2Path.addLine(to: CGPoint(x: 6.9, y: 8.82))
            shape2Path.addCurve(to: CGPoint(x: 5.36, y: 8.81), controlPoint1: CGPoint(x: 6.49, y: 9.27), controlPoint2: CGPoint(x: 5.78, y: 9.26))
            shape2Path.addLine(to: CGPoint(x: 1.56, y: 4.89))
            shape2Path.addCurve(to: CGPoint(x: 3.12, y: 12.83), controlPoint1: CGPoint(x: 0.45, y: 7.5), controlPoint2: CGPoint(x: 1, y: 10.7))
            shape2Path.addCurve(to: CGPoint(x: 6.76, y: 14.71), controlPoint1: CGPoint(x: 4.17, y: 13.88), controlPoint2: CGPoint(x: 5.44, y: 14.51))
            shape2Path.addLine(to: CGPoint(x: 10.67, y: 10.6))
            shape2Path.addCurve(to: CGPoint(x: 13.21, y: 10.6), controlPoint1: CGPoint(x: 11.37, y: 11.33), controlPoint2: CGPoint(x: 12.5, y: 11.33))
            shape2Path.addLine(to: CGPoint(x: 13.49, y: 10.9))
            shape2Path.addLine(to: CGPoint(x: 13.49, y: 10.9))
            shape2Path.close()
            shape2Path.move(to: CGPoint(x: 15.5, y: 20.8))
            shape2Path.addLine(to: CGPoint(x: 19.69, y: 25.12))
            shape2Path.addCurve(to: CGPoint(x: 22.91, y: 25.02), controlPoint1: CGPoint(x: 20.57, y: 26.02), controlPoint2: CGPoint(x: 22.01, y: 25.97))
            shape2Path.addLine(to: CGPoint(x: 23.77, y: 24.11))
            shape2Path.addCurve(to: CGPoint(x: 23.88, y: 20.7), controlPoint1: CGPoint(x: 24.68, y: 23.15), controlPoint2: CGPoint(x: 24.73, y: 21.64))
            shape2Path.addLine(to: CGPoint(x: 18.25, y: 14.62))
            shape2Path.addLine(to: CGPoint(x: 17.63, y: 15.27))
            shape2Path.addLine(to: CGPoint(x: 17.93, y: 15.57))
            shape2Path.addCurve(to: CGPoint(x: 17.93, y: 18.25), controlPoint1: CGPoint(x: 17.23, y: 16.3), controlPoint2: CGPoint(x: 17.23, y: 17.51))
            shape2Path.addLine(to: CGPoint(x: 15.5, y: 20.8))
            shape2Path.addLine(to: CGPoint(x: 15.5, y: 20.8))
            shape2Path.close()
            shape2Path.miterLimit = 4;
            
            shape2Path.usesEvenOddFillRule = true;
            
            fillColor.setStroke()
            shape2Path.lineWidth = 1
            shape2Path.stroke()
        }
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imgbgc!
    }
    
    func drawShapes(_ view1: UIView, type:String)->UIImageView{
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 40, height: 30), false, 0)
        //let contextfirst = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let fillColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
        if(type == "edit"){
            //// Group-3
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 0.5, y: 24.5))
            shapePath.addCurve(to: CGPoint(x: 10.1, y: 22.9), controlPoint1: CGPoint(x: 0.5, y: 24.5), controlPoint2: CGPoint(x: 8.5, y: 24.5))
            shapePath.addCurve(to: CGPoint(x: 11.7, y: 18.2), controlPoint1: CGPoint(x: 11.6, y: 21.4), controlPoint2: CGPoint(x: 11.7, y: 18.2))
            shapePath.addLine(to: CGPoint(x: 6.9, y: 18.2))
            shapePath.addLine(to: CGPoint(x: 0.5, y: 24.5))
            shapePath.addLine(to: CGPoint(x: 0.5, y: 24.5))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            fillColor.setStroke()
            shapePath.stroke()
            
            
            //// Shape_1_ Drawing
            let shape_1_Path = UIBezierPath()
            shape_1_Path.move(to: CGPoint(x: 8.8, y: 16.6))
            shape_1_Path.addLine(to: CGPoint(x: 13.7, y: 16.6))
            shape_1_Path.addLine(to: CGPoint(x: 13.7, y: 19.7))
            shape_1_Path.addLine(to: CGPoint(x: 26.5, y: 7.1))
            shape_1_Path.addLine(to: CGPoint(x: 26.5, y: -0.5))
            shape_1_Path.addLine(to: CGPoint(x: 8.8, y: 16.6))
            shape_1_Path.close()
            shape_1_Path.miterLimit = 4;
            
            fillColor.setStroke()
            shape_1_Path.stroke()
        }
        else if(type == "calendar"){
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 9.84, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 1))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 1))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 2.79))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 6.3, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 6.3, y: 1))
            shapePath.addLine(to: CGPoint(x: 4.53, y: 1))
            shapePath.addLine(to: CGPoint(x: 4.53, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 4.53, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 6.3, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 6.3, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 6.3, y: 2.79))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 20.44, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 20.44, y: 1))
            shapePath.addLine(to: CGPoint(x: 18.67, y: 1))
            shapePath.addLine(to: CGPoint(x: 18.67, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 18.67, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 20.44, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 20.44, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 20.44, y: 2.79))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 16.9, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 1))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 1))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 2.79))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 13.37, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 1))
            shapePath.addLine(to: CGPoint(x: 11.6, y: 1))
            shapePath.addLine(to: CGPoint(x: 11.6, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 11.6, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 2.79))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 8.07, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 13.5))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 13.5))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 20.64))
            shapePath.addLine(to: CGPoint(x: 11.6, y: 20.64))
            shapePath.addLine(to: CGPoint(x: 11.6, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 11.71))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 13.37, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 13.5))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 13.5))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 20.64))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 20.64))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 11.71))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 11.71))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 1, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 1, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 1, y: 8.14))
            shapePath.addLine(to: CGPoint(x: 1, y: 24.21))
            shapePath.addLine(to: CGPoint(x: 2.77, y: 26))
            shapePath.addLine(to: CGPoint(x: 22.21, y: 26))
            shapePath.addLine(to: CGPoint(x: 23.97, y: 24.21))
            shapePath.addLine(to: CGPoint(x: 23.97, y: 8.14))
            shapePath.addLine(to: CGPoint(x: 23.97, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 23.97, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 22.21, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 22.21, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 22.21, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 20.44, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 18.67, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 16.9, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 15.14, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 13.37, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 11.6, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 9.84, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 8.07, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 6.3, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 4.53, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 2.77, y: 6.36))
            shapePath.addLine(to: CGPoint(x: 2.77, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 2.77, y: 2.79))
            shapePath.addLine(to: CGPoint(x: 1, y: 4.57))
            shapePath.addLine(to: CGPoint(x: 1, y: 4.57))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 2.77, y: 8.14))
            shapePath.addLine(to: CGPoint(x: 4.53, y: 8.14))
            shapePath.addLine(to: CGPoint(x: 6.3, y: 8.14))
            shapePath.addLine(to: CGPoint(x: 22.21, y: 8.14))
            shapePath.addLine(to: CGPoint(x: 22.21, y: 24.21))
            shapePath.addLine(to: CGPoint(x: 2.77, y: 24.21))
            shapePath.addLine(to: CGPoint(x: 2.77, y: 8.14))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            fillColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
        }
        else if(type == "addComp"){
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 9.75, y: 13.97))
            shapePath.addLine(to: CGPoint(x: 3.15, y: 20.93))
            shapePath.addCurve(to: CGPoint(x: 3.06, y: 23.67), controlPoint1: CGPoint(x: 2.41, y: 21.71), controlPoint2: CGPoint(x: 2.36, y: 22.93))
            shapePath.addLine(to: CGPoint(x: 4.56, y: 25.26))
            shapePath.addCurve(to: CGPoint(x: 7.15, y: 25.16), controlPoint1: CGPoint(x: 5.26, y: 25.98), controlPoint2: CGPoint(x: 6.41, y: 25.93))
            shapePath.addLine(to: CGPoint(x: 13.77, y: 18.19))
            shapePath.addCurve(to: CGPoint(x: 13.86, y: 15.44), controlPoint1: CGPoint(x: 14.51, y: 17.4), controlPoint2: CGPoint(x: 14.54, y: 16.18))
            shapePath.addLine(to: CGPoint(x: 13.77, y: 15.36))
            shapePath.addLine(to: CGPoint(x: 20.56, y: 8.2))
            shapePath.addLine(to: CGPoint(x: 21.58, y: 8.53))
            shapePath.addLine(to: CGPoint(x: 24.48, y: 4.06))
            shapePath.addLine(to: CGPoint(x: 23.15, y: 2.65))
            shapePath.addLine(to: CGPoint(x: 18.91, y: 5.71))
            shapePath.addLine(to: CGPoint(x: 19.22, y: 6.8))
            shapePath.addLine(to: CGPoint(x: 12.43, y: 13.95))
            shapePath.addLine(to: CGPoint(x: 12.36, y: 13.87))
            shapePath.addCurve(to: CGPoint(x: 9.75, y: 13.97), controlPoint1: CGPoint(x: 11.66, y: 13.14), controlPoint2: CGPoint(x: 10.49, y: 13.18))
            shapePath.addLine(to: CGPoint(x: 9.75, y: 13.97))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            shapePath.usesEvenOddFillRule = true;
            
            fillColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
            
            
            //// Shape 2 Drawing
            let shape2Path = UIBezierPath()
            shape2Path.move(to: CGPoint(x: 13.49, y: 10.9))
            shape2Path.addLine(to: CGPoint(x: 14.15, y: 10.19))
            shape2Path.addLine(to: CGPoint(x: 13.85, y: 9.87))
            shape2Path.addCurve(to: CGPoint(x: 12.22, y: 3.23), controlPoint1: CGPoint(x: 14.42, y: 7.61), controlPoint2: CGPoint(x: 13.88, y: 5.09))
            shape2Path.addCurve(to: CGPoint(x: 4.69, y: 1.6), controlPoint1: CGPoint(x: 10.19, y: 1), controlPoint2: CGPoint(x: 7.15, y: 0.42))
            shape2Path.addLine(to: CGPoint(x: 8.41, y: 5.58))
            shape2Path.addCurve(to: CGPoint(x: 8.42, y: 7.23), controlPoint1: CGPoint(x: 8.83, y: 6.05), controlPoint2: CGPoint(x: 8.84, y: 6.78))
            shape2Path.addLine(to: CGPoint(x: 6.9, y: 8.82))
            shape2Path.addCurve(to: CGPoint(x: 5.36, y: 8.81), controlPoint1: CGPoint(x: 6.49, y: 9.27), controlPoint2: CGPoint(x: 5.78, y: 9.26))
            shape2Path.addLine(to: CGPoint(x: 1.56, y: 4.89))
            shape2Path.addCurve(to: CGPoint(x: 3.12, y: 12.83), controlPoint1: CGPoint(x: 0.45, y: 7.5), controlPoint2: CGPoint(x: 1, y: 10.7))
            shape2Path.addCurve(to: CGPoint(x: 6.76, y: 14.71), controlPoint1: CGPoint(x: 4.17, y: 13.88), controlPoint2: CGPoint(x: 5.44, y: 14.51))
            shape2Path.addLine(to: CGPoint(x: 10.67, y: 10.6))
            shape2Path.addCurve(to: CGPoint(x: 13.21, y: 10.6), controlPoint1: CGPoint(x: 11.37, y: 11.33), controlPoint2: CGPoint(x: 12.5, y: 11.33))
            shape2Path.addLine(to: CGPoint(x: 13.49, y: 10.9))
            shape2Path.addLine(to: CGPoint(x: 13.49, y: 10.9))
            shape2Path.close()
            shape2Path.move(to: CGPoint(x: 15.5, y: 20.8))
            shape2Path.addLine(to: CGPoint(x: 19.69, y: 25.12))
            shape2Path.addCurve(to: CGPoint(x: 22.91, y: 25.02), controlPoint1: CGPoint(x: 20.57, y: 26.02), controlPoint2: CGPoint(x: 22.01, y: 25.97))
            shape2Path.addLine(to: CGPoint(x: 23.77, y: 24.11))
            shape2Path.addCurve(to: CGPoint(x: 23.88, y: 20.7), controlPoint1: CGPoint(x: 24.68, y: 23.15), controlPoint2: CGPoint(x: 24.73, y: 21.64))
            shape2Path.addLine(to: CGPoint(x: 18.25, y: 14.62))
            shape2Path.addLine(to: CGPoint(x: 17.63, y: 15.27))
            shape2Path.addLine(to: CGPoint(x: 17.93, y: 15.57))
            shape2Path.addCurve(to: CGPoint(x: 17.93, y: 18.25), controlPoint1: CGPoint(x: 17.23, y: 16.3), controlPoint2: CGPoint(x: 17.23, y: 17.51))
            shape2Path.addLine(to: CGPoint(x: 15.5, y: 20.8))
            shape2Path.addLine(to: CGPoint(x: 15.5, y: 20.8))
            shape2Path.close()
            shape2Path.miterLimit = 4;
            
            shape2Path.usesEvenOddFillRule = true;
            
            fillColor.setStroke()
            shape2Path.lineWidth = 1
            shape2Path.stroke()
        }
        else if(type == "car"){
            let strokeColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
            
            //// Bezier Drawing
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 25.36, y: 16.29))
            bezierPath.addLine(to: CGPoint(x: 25.36, y: 16.29))
            bezierPath.addCurve(to: CGPoint(x: 26.99, y: 16.29), controlPoint1: CGPoint(x: 25.9, y: 16.29), controlPoint2: CGPoint(x: 26.45, y: 16.3))
            bezierPath.addCurve(to: CGPoint(x: 27.43, y: 15.94), controlPoint1: CGPoint(x: 27.25, y: 16.29), controlPoint2: CGPoint(x: 27.42, y: 16.14))
            bezierPath.addCurve(to: CGPoint(x: 27, y: 15.57), controlPoint1: CGPoint(x: 27.43, y: 15.73), controlPoint2: CGPoint(x: 27.27, y: 15.57))
            bezierPath.addCurve(to: CGPoint(x: 23.74, y: 15.57), controlPoint1: CGPoint(x: 25.92, y: 15.57), controlPoint2: CGPoint(x: 24.83, y: 15.57))
            bezierPath.addCurve(to: CGPoint(x: 23.3, y: 15.94), controlPoint1: CGPoint(x: 23.45, y: 15.57), controlPoint2: CGPoint(x: 23.29, y: 15.71))
            bezierPath.addCurve(to: CGPoint(x: 23.75, y: 16.29), controlPoint1: CGPoint(x: 23.3, y: 16.17), controlPoint2: CGPoint(x: 23.46, y: 16.29))
            bezierPath.addCurve(to: CGPoint(x: 25.36, y: 16.29), controlPoint1: CGPoint(x: 24.29, y: 16.3), controlPoint2: CGPoint(x: 24.82, y: 16.29))
            bezierPath.addLine(to: CGPoint(x: 25.36, y: 16.29))
            bezierPath.close()
            bezierPath.miterLimit = 4;
            
            strokeColor.setStroke()
            bezierPath.lineWidth = 1
            bezierPath.stroke()
            
            
            //// Bezier 2 Drawing
            let bezier2Path = UIBezierPath()
            bezier2Path.move(to: CGPoint(x: 6.63, y: 15.57))
            bezier2Path.addLine(to: CGPoint(x: 6.63, y: 15.57))
            bezier2Path.addCurve(to: CGPoint(x: 4.97, y: 15.57), controlPoint1: CGPoint(x: 6.08, y: 15.57), controlPoint2: CGPoint(x: 5.52, y: 15.57))
            bezier2Path.addCurve(to: CGPoint(x: 4.58, y: 15.94), controlPoint1: CGPoint(x: 4.73, y: 15.58), controlPoint2: CGPoint(x: 4.57, y: 15.7))
            bezier2Path.addCurve(to: CGPoint(x: 4.98, y: 16.3), controlPoint1: CGPoint(x: 4.59, y: 16.18), controlPoint2: CGPoint(x: 4.74, y: 16.3))
            bezier2Path.addCurve(to: CGPoint(x: 8.29, y: 16.29), controlPoint1: CGPoint(x: 6.08, y: 16.29), controlPoint2: CGPoint(x: 7.19, y: 16.3))
            bezier2Path.addCurve(to: CGPoint(x: 8.59, y: 16.18), controlPoint1: CGPoint(x: 8.39, y: 16.29), controlPoint2: CGPoint(x: 8.54, y: 16.25))
            bezier2Path.addCurve(to: CGPoint(x: 8.67, y: 15.82), controlPoint1: CGPoint(x: 8.66, y: 16.08), controlPoint2: CGPoint(x: 8.72, y: 15.9))
            bezier2Path.addCurve(to: CGPoint(x: 8.3, y: 15.58), controlPoint1: CGPoint(x: 8.6, y: 15.71), controlPoint2: CGPoint(x: 8.43, y: 15.59))
            bezier2Path.addCurve(to: CGPoint(x: 6.63, y: 15.57), controlPoint1: CGPoint(x: 7.74, y: 15.55), controlPoint2: CGPoint(x: 7.19, y: 15.57))
            bezier2Path.addLine(to: CGPoint(x: 6.63, y: 15.57))
            bezier2Path.close()
            bezier2Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier2Path.lineWidth = 1
            bezier2Path.stroke()
            
            
            //// Bezier 3 Drawing
            let bezier3Path = UIBezierPath()
            bezier3Path.move(to: CGPoint(x: 25.85, y: 14.28))
            bezier3Path.addLine(to: CGPoint(x: 26.63, y: 14.28))
            bezier3Path.addCurve(to: CGPoint(x: 28.55, y: 12.97), controlPoint1: CGPoint(x: 27.93, y: 14.28), controlPoint2: CGPoint(x: 28.07, y: 14.17))
            bezier3Path.addCurve(to: CGPoint(x: 28.6, y: 12.83), controlPoint1: CGPoint(x: 28.57, y: 12.92), controlPoint2: CGPoint(x: 28.59, y: 12.88))
            bezier3Path.addCurve(to: CGPoint(x: 28.01, y: 12.1), controlPoint1: CGPoint(x: 28.76, y: 12.33), controlPoint2: CGPoint(x: 28.53, y: 12.03))
            bezier3Path.addCurve(to: CGPoint(x: 25.17, y: 12.47), controlPoint1: CGPoint(x: 27.06, y: 12.21), controlPoint2: CGPoint(x: 26.12, y: 12.35))
            bezier3Path.addCurve(to: CGPoint(x: 23.95, y: 13.49), controlPoint1: CGPoint(x: 24.53, y: 12.54), controlPoint2: CGPoint(x: 24.16, y: 12.91))
            bezier3Path.addCurve(to: CGPoint(x: 24.5, y: 14.27), controlPoint1: CGPoint(x: 23.78, y: 13.99), controlPoint2: CGPoint(x: 23.97, y: 14.27))
            bezier3Path.addCurve(to: CGPoint(x: 25.85, y: 14.28), controlPoint1: CGPoint(x: 24.95, y: 14.28), controlPoint2: CGPoint(x: 25.41, y: 14.28))
            bezier3Path.addLine(to: CGPoint(x: 25.85, y: 14.28))
            bezier3Path.close()
            bezier3Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier3Path.lineWidth = 1
            bezier3Path.stroke()
            
            
            //// Bezier 4 Drawing
            let bezier4Path = UIBezierPath()
            bezier4Path.move(to: CGPoint(x: 6.16, y: 14.28))
            bezier4Path.addCurve(to: CGPoint(x: 6.53, y: 14.28), controlPoint1: CGPoint(x: 6.28, y: 14.28), controlPoint2: CGPoint(x: 6.41, y: 14.28))
            bezier4Path.addCurve(to: CGPoint(x: 7.59, y: 14.27), controlPoint1: CGPoint(x: 6.88, y: 14.28), controlPoint2: CGPoint(x: 7.24, y: 14.29))
            bezier4Path.addCurve(to: CGPoint(x: 8.11, y: 13.79), controlPoint1: CGPoint(x: 7.93, y: 14.26), controlPoint2: CGPoint(x: 8.13, y: 14.07))
            bezier4Path.addCurve(to: CGPoint(x: 7.04, y: 12.51), controlPoint1: CGPoint(x: 8.09, y: 13.22), controlPoint2: CGPoint(x: 7.6, y: 12.59))
            bezier4Path.addCurve(to: CGPoint(x: 3.95, y: 12.1), controlPoint1: CGPoint(x: 6.02, y: 12.35), controlPoint2: CGPoint(x: 4.98, y: 12.22))
            bezier4Path.addCurve(to: CGPoint(x: 3.39, y: 12.82), controlPoint1: CGPoint(x: 3.46, y: 12.04), controlPoint2: CGPoint(x: 3.24, y: 12.34))
            bezier4Path.addCurve(to: CGPoint(x: 3.69, y: 13.53), controlPoint1: CGPoint(x: 3.47, y: 13.06), controlPoint2: CGPoint(x: 3.58, y: 13.3))
            bezier4Path.addCurve(to: CGPoint(x: 4.84, y: 14.28), controlPoint1: CGPoint(x: 3.9, y: 14.04), controlPoint2: CGPoint(x: 4.3, y: 14.27))
            bezier4Path.addCurve(to: CGPoint(x: 6.16, y: 14.28), controlPoint1: CGPoint(x: 5.28, y: 14.28), controlPoint2: CGPoint(x: 5.72, y: 14.28))
            bezier4Path.addLine(to: CGPoint(x: 6.16, y: 14.28))
            bezier4Path.close()
            bezier4Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier4Path.lineWidth = 1
            bezier4Path.stroke()
            
            //// Bezier 5 Drawing
            let bezier5Path = UIBezierPath()
            bezier5Path.move(to: CGPoint(x: 25.49, y: 7.1))
            bezier5Path.addCurve(to: CGPoint(x: 23.63, y: 3.4), controlPoint1: CGPoint(x: 24.99, y: 5.8), controlPoint2: CGPoint(x: 24.43, y: 4.53))
            bezier5Path.addCurve(to: CGPoint(x: 22.89, y: 2.97), controlPoint1: CGPoint(x: 23.48, y: 3.18), controlPoint2: CGPoint(x: 23.16, y: 3.02))
            bezier5Path.addCurve(to: CGPoint(x: 16.45, y: 2.32), controlPoint1: CGPoint(x: 20.76, y: 2.56), controlPoint2: CGPoint(x: 18.61, y: 2.34))
            bezier5Path.addCurve(to: CGPoint(x: 9.28, y: 2.92), controlPoint1: CGPoint(x: 14.04, y: 2.3), controlPoint2: CGPoint(x: 11.65, y: 2.49))
            bezier5Path.addCurve(to: CGPoint(x: 8.15, y: 3.7), controlPoint1: CGPoint(x: 8.77, y: 3.02), controlPoint2: CGPoint(x: 8.38, y: 3.24))
            bezier5Path.addCurve(to: CGPoint(x: 6.59, y: 6.89), controlPoint1: CGPoint(x: 7.63, y: 4.76), controlPoint2: CGPoint(x: 7.11, y: 5.82))
            bezier5Path.addCurve(to: CGPoint(x: 6.53, y: 7.09), controlPoint1: CGPoint(x: 6.55, y: 6.96), controlPoint2: CGPoint(x: 6.55, y: 7.04))
            bezier5Path.addCurve(to: CGPoint(x: 25.49, y: 7.1), controlPoint1: CGPoint(x: 12.85, y: 6.69), controlPoint2: CGPoint(x: 19.15, y: 6.69))
            bezier5Path.addLine(to: CGPoint(x: 25.49, y: 7.1))
            bezier5Path.close()
            bezier5Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier5Path.lineWidth = 1
            bezier5Path.stroke()
            
            //// Bezier 6 Drawing
            let bezier6Path = UIBezierPath()
            bezier6Path.move(to: CGPoint(x: 29.79, y: 21.12))
            bezier6Path.addLine(to: CGPoint(x: 25.42, y: 21.12))
            bezier6Path.addCurve(to: CGPoint(x: 24.8, y: 19.95), controlPoint1: CGPoint(x: 24.88, y: 20.91), controlPoint2: CGPoint(x: 24.75, y: 20.47))
            bezier6Path.addCurve(to: CGPoint(x: 7.2, y: 19.94), controlPoint1: CGPoint(x: 23.12, y: 19.55), controlPoint2: CGPoint(x: 8.95, y: 19.55))
            bezier6Path.addCurve(to: CGPoint(x: 6.58, y: 21.12), controlPoint1: CGPoint(x: 7.25, y: 20.47), controlPoint2: CGPoint(x: 7.11, y: 20.9))
            bezier6Path.addLine(to: CGPoint(x: 2.21, y: 21.12))
            bezier6Path.addCurve(to: CGPoint(x: 1.58, y: 20.08), controlPoint1: CGPoint(x: 1.74, y: 20.93), controlPoint2: CGPoint(x: 1.56, y: 20.58))
            bezier6Path.addCurve(to: CGPoint(x: 1.4, y: 15.73), controlPoint1: CGPoint(x: 1.64, y: 18.63), controlPoint2: CGPoint(x: 1.51, y: 17.18))
            bezier6Path.addCurve(to: CGPoint(x: 1.29, y: 14.57), controlPoint1: CGPoint(x: 1.36, y: 15.34), controlPoint2: CGPoint(x: 1.32, y: 14.96))
            bezier6Path.addLine(to: CGPoint(x: 1.29, y: 12.15))
            bezier6Path.addCurve(to: CGPoint(x: 1.35, y: 11.88), controlPoint1: CGPoint(x: 1.31, y: 12.06), controlPoint2: CGPoint(x: 1.34, y: 11.97))
            bezier6Path.addCurve(to: CGPoint(x: 2.84, y: 8.55), controlPoint1: CGPoint(x: 1.48, y: 10.61), controlPoint2: CGPoint(x: 1.74, y: 9.4))
            bezier6Path.addCurve(to: CGPoint(x: 2.48, y: 8.39), controlPoint1: CGPoint(x: 2.71, y: 8.49), controlPoint2: CGPoint(x: 2.59, y: 8.45))
            bezier6Path.addCurve(to: CGPoint(x: 1.57, y: 7.72), controlPoint1: CGPoint(x: 2.17, y: 8.17), controlPoint2: CGPoint(x: 1.82, y: 7.99))
            bezier6Path.addCurve(to: CGPoint(x: 1.79, y: 6.55), controlPoint1: CGPoint(x: 1.16, y: 7.29), controlPoint2: CGPoint(x: 1.27, y: 6.83))
            bezier6Path.addCurve(to: CGPoint(x: 2.21, y: 6.37), controlPoint1: CGPoint(x: 1.92, y: 6.48), controlPoint2: CGPoint(x: 2.07, y: 6.4))
            bezier6Path.addCurve(to: CGPoint(x: 4.31, y: 6.08), controlPoint1: CGPoint(x: 2.91, y: 6.26), controlPoint2: CGPoint(x: 3.61, y: 6.16))
            bezier6Path.addCurve(to: CGPoint(x: 4.58, y: 6.23), controlPoint1: CGPoint(x: 4.39, y: 6.07), controlPoint2: CGPoint(x: 4.51, y: 6.16))
            bezier6Path.addCurve(to: CGPoint(x: 5.05, y: 6.83), controlPoint1: CGPoint(x: 4.74, y: 6.41), controlPoint2: CGPoint(x: 4.88, y: 6.61))
            bezier6Path.addCurve(to: CGPoint(x: 5.2, y: 6.43), controlPoint1: CGPoint(x: 5.11, y: 6.66), controlPoint2: CGPoint(x: 5.16, y: 6.55))
            bezier6Path.addCurve(to: CGPoint(x: 6.99, y: 2.81), controlPoint1: CGPoint(x: 5.7, y: 5.17), controlPoint2: CGPoint(x: 6.27, y: 3.96))
            bezier6Path.addCurve(to: CGPoint(x: 8.76, y: 1.55), controlPoint1: CGPoint(x: 7.41, y: 2.14), controlPoint2: CGPoint(x: 7.98, y: 1.67))
            bezier6Path.addCurve(to: CGPoint(x: 12.85, y: 1), controlPoint1: CGPoint(x: 10.12, y: 1.34), controlPoint2: CGPoint(x: 11.49, y: 1.17))
            bezier6Path.addCurve(to: CGPoint(x: 14.16, y: 0.88), controlPoint1: CGPoint(x: 13.29, y: 0.94), controlPoint2: CGPoint(x: 13.72, y: 0.92))
            bezier6Path.addLine(to: CGPoint(x: 17.84, y: 0.88))
            bezier6Path.addCurve(to: CGPoint(x: 18.09, y: 0.93), controlPoint1: CGPoint(x: 17.92, y: 0.89), controlPoint2: CGPoint(x: 18.01, y: 0.92))
            bezier6Path.addCurve(to: CGPoint(x: 22.76, y: 1.46), controlPoint1: CGPoint(x: 19.65, y: 1.1), controlPoint2: CGPoint(x: 21.2, y: 1.29))
            bezier6Path.addCurve(to: CGPoint(x: 25.17, y: 3.07), controlPoint1: CGPoint(x: 23.85, y: 1.57), controlPoint2: CGPoint(x: 24.66, y: 2.09))
            bezier6Path.addCurve(to: CGPoint(x: 25.79, y: 4.2), controlPoint1: CGPoint(x: 25.37, y: 3.45), controlPoint2: CGPoint(x: 25.61, y: 3.81))
            bezier6Path.addCurve(to: CGPoint(x: 26.98, y: 6.79), controlPoint1: CGPoint(x: 26.2, y: 5.05), controlPoint2: CGPoint(x: 26.58, y: 5.91))
            bezier6Path.addCurve(to: CGPoint(x: 27.43, y: 6.22), controlPoint1: CGPoint(x: 27.12, y: 6.6), controlPoint2: CGPoint(x: 27.27, y: 6.4))
            bezier6Path.addCurve(to: CGPoint(x: 27.68, y: 6.08), controlPoint1: CGPoint(x: 27.49, y: 6.15), controlPoint2: CGPoint(x: 27.6, y: 6.07))
            bezier6Path.addCurve(to: CGPoint(x: 29.85, y: 6.4), controlPoint1: CGPoint(x: 28.4, y: 6.17), controlPoint2: CGPoint(x: 29.13, y: 6.26))
            bezier6Path.addCurve(to: CGPoint(x: 30.66, y: 7.07), controlPoint1: CGPoint(x: 30.21, y: 6.47), controlPoint2: CGPoint(x: 30.59, y: 6.63))
            bezier6Path.addCurve(to: CGPoint(x: 30.11, y: 8.04), controlPoint1: CGPoint(x: 30.73, y: 7.52), controlPoint2: CGPoint(x: 30.42, y: 7.8))
            bezier6Path.addCurve(to: CGPoint(x: 29.52, y: 8.39), controlPoint1: CGPoint(x: 29.93, y: 8.18), controlPoint2: CGPoint(x: 29.72, y: 8.28))
            bezier6Path.addCurve(to: CGPoint(x: 29.15, y: 8.55), controlPoint1: CGPoint(x: 29.41, y: 8.45), controlPoint2: CGPoint(x: 29.29, y: 8.49))
            bezier6Path.addCurve(to: CGPoint(x: 30.52, y: 10.91), controlPoint1: CGPoint(x: 29.97, y: 9.14), controlPoint2: CGPoint(x: 30.32, y: 9.99))
            bezier6Path.addCurve(to: CGPoint(x: 30.71, y: 12.15), controlPoint1: CGPoint(x: 30.6, y: 11.32), controlPoint2: CGPoint(x: 30.65, y: 11.74))
            bezier6Path.addLine(to: CGPoint(x: 30.71, y: 14.51))
            bezier6Path.addCurve(to: CGPoint(x: 30.63, y: 15.44), controlPoint1: CGPoint(x: 30.69, y: 14.82), controlPoint2: CGPoint(x: 30.66, y: 15.13))
            bezier6Path.addCurve(to: CGPoint(x: 30.42, y: 20.08), controlPoint1: CGPoint(x: 30.5, y: 16.99), controlPoint2: CGPoint(x: 30.36, y: 18.53))
            bezier6Path.addCurve(to: CGPoint(x: 29.79, y: 21.12), controlPoint1: CGPoint(x: 30.44, y: 20.58), controlPoint2: CGPoint(x: 30.26, y: 20.93))
            bezier6Path.addLine(to: CGPoint(x: 29.79, y: 21.12))
            bezier6Path.close()
            bezier6Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier6Path.lineWidth = 1
            bezier6Path.stroke()
        }
        else if(type == "locationIcon"){
            let page1Path = UIBezierPath()
            page1Path.move(to: CGPoint(x: 8.88, y: 13.9))
            page1Path.addCurve(to: CGPoint(x: 3.88, y: 8.65), controlPoint1: CGPoint(x: 6.27, y: 13.9), controlPoint2: CGPoint(x: 3.88, y: 11.19))
            page1Path.addCurve(to: CGPoint(x: 8.91, y: 3.86), controlPoint1: CGPoint(x: 3.88, y: 6.1), controlPoint2: CGPoint(x: 6.29, y: 3.86))
            page1Path.addCurve(to: CGPoint(x: 13.92, y: 8.66), controlPoint1: CGPoint(x: 11.53, y: 3.86), controlPoint2: CGPoint(x: 13.92, y: 6.13))
            page1Path.addCurve(to: CGPoint(x: 8.88, y: 13.9), controlPoint1: CGPoint(x: 13.92, y: 11.21), controlPoint2: CGPoint(x: 11.52, y: 13.9))
            page1Path.addLine(to: CGPoint(x: 8.88, y: 13.9))
            page1Path.close()
            page1Path.move(to: CGPoint(x: 1, y: 8.46))
            page1Path.addCurve(to: CGPoint(x: 8.91, y: 24), controlPoint1: CGPoint(x: 1, y: 12.61), controlPoint2: CGPoint(x: 8.91, y: 24))
            page1Path.addCurve(to: CGPoint(x: 16.83, y: 8.46), controlPoint1: CGPoint(x: 8.91, y: 24), controlPoint2: CGPoint(x: 16.83, y: 12.61))
            page1Path.addCurve(to: CGPoint(x: 8.91, y: 0.98), controlPoint1: CGPoint(x: 16.83, y: 4.33), controlPoint2: CGPoint(x: 13.29, y: 0.98))
            page1Path.addCurve(to: CGPoint(x: 1, y: 8.46), controlPoint1: CGPoint(x: 4.54, y: 0.98), controlPoint2: CGPoint(x: 1, y: 4.33))
            page1Path.close()
            page1Path.miterLimit = 4;
            
            fillColor.setStroke()
            page1Path.lineWidth = 1
            page1Path.stroke()
            
        }
        else if(type == "ambCall"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 34, height: 34), false, 0)
            let strokeColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
            
            //// Group-3
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 21.89, y: 15.81))
            shapePath.addLine(to: CGPoint(x: 21.98, y: 15.72))
            shapePath.addCurve(to: CGPoint(x: 20.92, y: 14.84), controlPoint1: CGPoint(x: 21.6, y: 15.45), controlPoint2: CGPoint(x: 21.25, y: 15.16))
            shapePath.addLine(to: CGPoint(x: 21.89, y: 15.81))
            shapePath.addLine(to: CGPoint(x: 21.89, y: 15.81))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 26.54, y: 16.74))
            shapePath.addCurve(to: CGPoint(x: 22.12, y: 21.6), controlPoint1: CGPoint(x: 26.72, y: 17.65), controlPoint2: CGPoint(x: 24.7, y: 19.05))
            shapePath.addCurve(to: CGPoint(x: 16.8, y: 25.84), controlPoint1: CGPoint(x: 19.02, y: 24.7), controlPoint2: CGPoint(x: 18.15, y: 25.63))
            shapePath.addCurve(to: CGPoint(x: 15.72, y: 21.98), controlPoint1: CGPoint(x: 16.83, y: 24.46), controlPoint2: CGPoint(x: 16.45, y: 23.15))
            shapePath.addCurve(to: CGPoint(x: 14.84, y: 20.92), controlPoint1: CGPoint(x: 15.45, y: 21.6), controlPoint2: CGPoint(x: 15.16, y: 21.25))
            shapePath.addLine(to: CGPoint(x: 11.92, y: 18))
            shapePath.addCurve(to: CGPoint(x: 7.94, y: 18.06), controlPoint1: CGPoint(x: 10.83, y: 16.92), controlPoint2: CGPoint(x: 9.05, y: 16.95))
            shapePath.addLine(to: CGPoint(x: 4.89, y: 21.1))
            shapePath.addLine(to: CGPoint(x: 1.85, y: 24.14))
            shapePath.addCurve(to: CGPoint(x: 1.79, y: 28.12), controlPoint1: CGPoint(x: 0.74, y: 25.25), controlPoint2: CGPoint(x: 0.71, y: 27.04))
            shapePath.addLine(to: CGPoint(x: 4.72, y: 31.05))
            shapePath.addCurve(to: CGPoint(x: 5.77, y: 31.92), controlPoint1: CGPoint(x: 5.04, y: 31.37), controlPoint2: CGPoint(x: 5.39, y: 31.66))
            shapePath.addCurve(to: CGPoint(x: 12.97, y: 32.1), controlPoint1: CGPoint(x: 7.91, y: 33.3), controlPoint2: CGPoint(x: 10.72, y: 33.36))
            shapePath.addCurve(to: CGPoint(x: 25.34, y: 24.05), controlPoint1: CGPoint(x: 15.54, y: 31.6), controlPoint2: CGPoint(x: 19.64, y: 29.76))
            shapePath.addCurve(to: CGPoint(x: 32.65, y: 11.65), controlPoint1: CGPoint(x: 31.72, y: 17.68), controlPoint2: CGPoint(x: 32.83, y: 13.75))
            shapePath.addCurve(to: CGPoint(x: 31.92, y: 5.77), controlPoint1: CGPoint(x: 33.3, y: 9.69), controlPoint2: CGPoint(x: 33.04, y: 7.53))
            shapePath.addCurve(to: CGPoint(x: 31.05, y: 4.72), controlPoint1: CGPoint(x: 31.66, y: 5.39), controlPoint2: CGPoint(x: 31.37, y: 5.04))
            shapePath.addLine(to: CGPoint(x: 28.12, y: 1.79))
            shapePath.addCurve(to: CGPoint(x: 24.14, y: 1.85), controlPoint1: CGPoint(x: 27.04, y: 0.71), controlPoint2: CGPoint(x: 25.25, y: 0.74))
            shapePath.addLine(to: CGPoint(x: 21.1, y: 4.89))
            shapePath.addLine(to: CGPoint(x: 18.06, y: 7.94))
            shapePath.addCurve(to: CGPoint(x: 18, y: 11.92), controlPoint1: CGPoint(x: 16.95, y: 9.05), controlPoint2: CGPoint(x: 16.92, y: 10.83))
            shapePath.addLine(to: CGPoint(x: 20.92, y: 14.84))
            shapePath.addCurve(to: CGPoint(x: 21.98, y: 15.72), controlPoint1: CGPoint(x: 21.25, y: 15.16), controlPoint2: CGPoint(x: 21.6, y: 15.45))
            shapePath.addCurve(to: CGPoint(x: 26.54, y: 16.74), controlPoint1: CGPoint(x: 23.35, y: 16.6), controlPoint2: CGPoint(x: 24.96, y: 16.95))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 31.92, y: 5.77))
            shapePath.addLine(to: CGPoint(x: 32.01, y: 5.68))
            shapePath.addLine(to: CGPoint(x: 31.05, y: 4.72))
            shapePath.addCurve(to: CGPoint(x: 31.92, y: 5.77), controlPoint1: CGPoint(x: 31.37, y: 5.04), controlPoint2: CGPoint(x: 31.66, y: 5.39))
            shapePath.addLine(to: CGPoint(x: 31.92, y: 5.77))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 5.68, y: 32.01))
            shapePath.addLine(to: CGPoint(x: 5.77, y: 31.92))
            shapePath.addCurve(to: CGPoint(x: 4.72, y: 31.05), controlPoint1: CGPoint(x: 5.39, y: 31.66), controlPoint2: CGPoint(x: 5.04, y: 31.37))
            shapePath.addLine(to: CGPoint(x: 5.68, y: 32.01))
            shapePath.addLine(to: CGPoint(x: 5.68, y: 32.01))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 15.72, y: 21.98))
            shapePath.addLine(to: CGPoint(x: 15.81, y: 21.89))
            shapePath.addLine(to: CGPoint(x: 14.84, y: 20.92))
            shapePath.addCurve(to: CGPoint(x: 15.72, y: 21.98), controlPoint1: CGPoint(x: 15.16, y: 21.25), controlPoint2: CGPoint(x: 15.45, y: 21.6))
            shapePath.addLine(to: CGPoint(x: 15.72, y: 21.98))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            shapePath.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
        }
        else if(type == "ambLocation"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 31, height: 42), false, 0)
            let strokeColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
            
            //// Group 2
            //// Page-1 Drawing
            let page1Path = UIBezierPath()
            page1Path.move(to: CGPoint(x: 15.88, y: 23.75))
            page1Path.addCurve(to: CGPoint(x: 7.07, y: 14.5), controlPoint1: CGPoint(x: 11.27, y: 23.75), controlPoint2: CGPoint(x: 7.07, y: 18.98))
            page1Path.addCurve(to: CGPoint(x: 15.93, y: 6.07), controlPoint1: CGPoint(x: 7.07, y: 10.01), controlPoint2: CGPoint(x: 11.32, y: 6.07))
            page1Path.addCurve(to: CGPoint(x: 24.75, y: 14.52), controlPoint1: CGPoint(x: 20.54, y: 6.07), controlPoint2: CGPoint(x: 24.75, y: 10.07))
            page1Path.addCurve(to: CGPoint(x: 15.88, y: 23.75), controlPoint1: CGPoint(x: 24.75, y: 19.01), controlPoint2: CGPoint(x: 20.52, y: 23.75))
            page1Path.addLine(to: CGPoint(x: 15.88, y: 23.75))
            page1Path.close()
            page1Path.move(to: CGPoint(x: 2, y: 14.17))
            page1Path.addCurve(to: CGPoint(x: 15.93, y: 41.53), controlPoint1: CGPoint(x: 2, y: 21.47), controlPoint2: CGPoint(x: 15.93, y: 41.53))
            page1Path.addCurve(to: CGPoint(x: 29.86, y: 14.17), controlPoint1: CGPoint(x: 15.93, y: 41.53), controlPoint2: CGPoint(x: 29.86, y: 21.47))
            page1Path.addCurve(to: CGPoint(x: 15.93, y: 1), controlPoint1: CGPoint(x: 29.86, y: 6.9), controlPoint2: CGPoint(x: 23.63, y: 1))
            page1Path.addCurve(to: CGPoint(x: 2, y: 14.17), controlPoint1: CGPoint(x: 8.23, y: 1), controlPoint2: CGPoint(x: 2, y: 6.9))
            page1Path.close()
            page1Path.miterLimit = 4;
            
            page1Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            page1Path.lineWidth = 1
            page1Path.stroke()
        }
        else if(type == "checkMark"){
            let fillColor = UIColor(red: 0.925, green: 0.315, blue: 0.104, alpha: 1.000)
            
            //// Check Drawing
            let checkPath = UIBezierPath()
            checkPath.move(to: CGPoint(x: 1.5, y: 5))
            checkPath.addLine(to: CGPoint(x: 0, y: 6.5))
            checkPath.addLine(to: CGPoint(x: 4, y: 10.5))
            checkPath.addLine(to: CGPoint(x: 13, y: 2))
            checkPath.addLine(to: CGPoint(x: 11.5, y: 0.5))
            checkPath.addLine(to: CGPoint(x: 4, y: 7.5))
            checkPath.addLine(to: CGPoint(x: 1.5, y: 5))
            checkPath.close()
            checkPath.miterLimit = 4;
            
            checkPath.usesEvenOddFillRule = true;
            
            fillColor.setFill()
            checkPath.fill()
            
            
        }
        else if(type == "menu"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 50, height: 30), false, 0)
            var fillColor = UIColor()
            if(DataCreator.sharedInstance.homePageCheck == 0){
                fillColor = UIColor(red: 74/225, green: 74/225, blue: 74/225, alpha: 1)
            }
            else{
                fillColor = UIColor.white
            }
            
            let rectangle1Path = UIBezierPath(rect: CGRect(x: 15, y: 10, width: 20, height: 2))
            fillColor.setFill()
            rectangle1Path.fill()
            
            let rectangle2Path = UIBezierPath(rect: CGRect(x: 15, y: 15, width: 20, height: 2))
            fillColor.setFill()
            rectangle2Path.fill()
            
            let rectangle3Path = UIBezierPath(rect: CGRect(x:15, y: 20, width: 20, height: 2))
            fillColor.setFill()
            rectangle3Path.fill()
            
        }
        else if(type == "21"){
            //// Color Declarations
            
        }
        else if(type == "cross"){
            let context = UIGraphicsGetCurrentContext()
            
            //// Color Declarations
            let fillColor = UIColor(red: 0.100, green: 0.099, blue: 0.144, alpha: 1.000)
            
            //// Group 2
            //// Rectangle-1 Drawing
            context?.saveGState()
            context?.translateBy(x: 12.5, y: 12)
            context?.rotate(by: 45 * CGFloat(Double.pi) / 180)
            
            let rectangle1Path = UIBezierPath(rect: CGRect(x: -7.5, y: -1, width: 15, height: 2))
            fillColor.setFill()
            rectangle1Path.fill()
            
            context?.restoreGState()
            
            
            //// Rectangle- 3 Drawing
            context?.saveGState()
            context?.translateBy(x: 12.5, y: 12)
            context?.rotate(by: 45 * CGFloat(Double.pi) / 180)
            
            let rectangle3Path = UIBezierPath(rect: CGRect(x: -1, y: -7.5, width: 2, height: 15))
            fillColor.setFill()
            rectangle3Path.fill()
            
            context?.restoreGState()
        }
        else if(type == "plus"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 40, height: 40), false, 0)
            var fillColor = UIColor()
            if(DataCreator.sharedInstance.homePageCheck == 0){
                fillColor = UIColor(red: 74/225, green: 74/225, blue: 74/225, alpha: 1)
            }
            else{
                fillColor = UIColor.white
            }
            
            //// Rectangle-1 Drawing
            let rectangle1Path = UIBezierPath(rect: CGRect(x: 10, y: 19, width: 20, height: 3))
            fillColor.setFill()
            rectangle1Path.fill()
            
            //// Rectangle- 3 Drawing
            let rectangle3Path = UIBezierPath(rect: CGRect(x: 18.5, y: 10.5, width: 3, height: 20))
            fillColor.setFill()
            rectangle3Path.fill()
        }
        else if(type == "blackPlus"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 40, height: 40), false, 0)
            var fillColor = UIColor()
            
            fillColor = UIColor(red: 0.100, green: 0.099, blue: 0.144, alpha: 1.000)
            
            
            //// Rectangle-1 Drawing
            let rectangle1Path = UIBezierPath(rect: CGRect(x: 10, y: 19, width: 20, height: 3))
            fillColor.setFill()
            rectangle1Path.fill()
            
            //// Rectangle- 3 Drawing
            let rectangle3Path = UIBezierPath(rect: CGRect(x: 18.5, y: 10.5, width: 3, height: 20))
            fillColor.setFill()
            rectangle3Path.fill()
        }
        else if(type == "plus1"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 20, height: 20), false, 0)
            let fillColor = UIColor.black
            
            //// Rectangle-1 Drawing
            let rectangle1Path = UIBezierPath(rect: CGRect(x: 0, y: 9, width: 20, height: 3))
            fillColor.setFill()
            rectangle1Path.fill()
            
            //// Rectangle- 3 Drawing
            let rectangle3Path = UIBezierPath(rect: CGRect(x: 8.5, y: 0.5, width: 3, height: 20))
            fillColor.setFill()
            rectangle3Path.fill()
            
            
        }
        else if(type == "plus2"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 20, height: 20), false, 0)
            let fillColor = UIColor.white
            
            //// Rectangle-1 Drawing
            let rectangle1Path = UIBezierPath(rect: CGRect(x: 0, y: 9, width: 20, height: 3))
            fillColor.setFill()
            rectangle1Path.fill()
            
            //// Rectangle- 3 Drawing
            let rectangle3Path = UIBezierPath(rect: CGRect(x: 8.5, y: 0.5, width: 3, height: 20))
            fillColor.setFill()
            rectangle3Path.fill()
            
            
        }
        else if(type == "mapBack"){
            let style = Style()
            let fillColor = style.systemFontColor//UIColor(red: 151, green: 151, blue: 151, alpha: 1.000)
            
            //// Back-Chevron Drawing
            let backChevronPath = UIBezierPath()
            backChevronPath.move(to: CGPoint(x: 0, y: 10.5))
            backChevronPath.addLine(to: CGPoint(x: 10.5, y: 0))
            backChevronPath.addLine(to: CGPoint(x: 12.5, y: 2))
            backChevronPath.addLine(to: CGPoint(x: 4, y: 10.5))
            backChevronPath.addLine(to: CGPoint(x: 12.5, y: 19))
            backChevronPath.addLine(to: CGPoint(x: 10.5, y: 21))
            backChevronPath.addLine(to: CGPoint(x: 0, y: 10.5))
            backChevronPath.close()
            backChevronPath.miterLimit = 4;
            
            backChevronPath.usesEvenOddFillRule = true;
            
            fillColor.setFill()
            backChevronPath.fill()
        }
        else if(type == "chatBack"){
            let fillColor = UIColor.black//UIColor(red: 151, green: 151, blue: 151, alpha: 1.000)
            
            //// Back-Chevron Drawing
            let backChevronPath = UIBezierPath()
            backChevronPath.move(to: CGPoint(x: 0, y: 10.5))
            backChevronPath.addLine(to: CGPoint(x: 10.5, y: 0))
            backChevronPath.addLine(to: CGPoint(x: 12.5, y: 2))
            backChevronPath.addLine(to: CGPoint(x: 4, y: 10.5))
            backChevronPath.addLine(to: CGPoint(x: 12.5, y: 19))
            backChevronPath.addLine(to: CGPoint(x: 10.5, y: 21))
            backChevronPath.addLine(to: CGPoint(x: 0, y: 10.5))
            backChevronPath.close()
            backChevronPath.miterLimit = 4;
            
            backChevronPath.usesEvenOddFillRule = true;
            
            fillColor.setFill()
            backChevronPath.fill()
        }
        else if(type == "backButton"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 90, height: 40), false, 0)
            let context = UIGraphicsGetCurrentContext()
            
            let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
            
            //// Back-Chevron Drawing
            let backChevronPath = UIBezierPath()
            backChevronPath.move(to: CGPoint(x: 6, y: 21.5))
            backChevronPath.addLine(to: CGPoint(x: 16.5, y: 11))
            backChevronPath.addLine(to: CGPoint(x: 18.5, y: 13))
            backChevronPath.addLine(to: CGPoint(x: 10, y: 21))
            backChevronPath.addLine(to: CGPoint(x: 18.5, y: 30))
            backChevronPath.addLine(to: CGPoint(x: 16.5, y: 32))
            backChevronPath.addLine(to: CGPoint(x: 6, y: 21.5))
            backChevronPath.close()
            backChevronPath.miterLimit = 4;
            
            backChevronPath.usesEvenOddFillRule = true;
            
            fillColor.setFill()
            backChevronPath.fill()
            
            //// Text Drawing
            let textRect = CGRect(x: 13, y: 0, width: 60, height: 40)
            let textTextContent = NSString(string: NSLocalizedString("Back", comment: ""))
            let textStyle = NSMutableParagraphStyle()
            textStyle.alignment = .center
            
            let textFontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: UIFont.buttonFontSize), NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.paragraphStyle: textStyle]
            
            let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
            context!.saveGState()
            context!.clip(to: textRect)
            textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
            context!.restoreGState()
        }
        else if(type == "nextButton"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 90, height: 40), false, 0)
            let context = UIGraphicsGetCurrentContext()
            
            //// Text Drawing
            let textRect = CGRect(x: 13, y: 0, width: 90, height: 40)
            let textTextContent = NSString(string: NSLocalizedString("Next", comment: ""))
            let textStyle = NSMutableParagraphStyle()
            textStyle.alignment = .center
            
            let textFontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: UIFont.buttonFontSize), NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.paragraphStyle: textStyle]
            
            let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
            context!.saveGState()
            context!.clip(to: textRect)
            textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
            context!.restoreGState()
        }
        else if(type == "backButtonMap"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 90, height: 40), false, 0)
            let context = UIGraphicsGetCurrentContext()
            
            let fillColor = UIColor.black//(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
            
            //// Back-Chevron Drawing
            let backChevronPath = UIBezierPath()
            backChevronPath.move(to: CGPoint(x: 6, y: 21.5))
            backChevronPath.addLine(to: CGPoint(x: 16.5, y: 11))
            backChevronPath.addLine(to: CGPoint(x: 18.5, y: 13))
            backChevronPath.addLine(to: CGPoint(x: 10, y: 21))
            backChevronPath.addLine(to: CGPoint(x: 18.5, y: 30))
            backChevronPath.addLine(to: CGPoint(x: 16.5, y: 32))
            backChevronPath.addLine(to: CGPoint(x: 6, y: 21.5))
            backChevronPath.close()
            backChevronPath.miterLimit = 4;
            
            backChevronPath.usesEvenOddFillRule = true;
            
            fillColor.setFill()
            backChevronPath.fill()
            
            //// Text Drawing
            let textRect = CGRect(x: 13, y: 0, width: 60, height: 40)
            let textTextContent = NSString(string: "Back")
            let textStyle = NSMutableParagraphStyle()
            textStyle.alignment = .center
            
            let textFontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: UIFont.buttonFontSize), NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.paragraphStyle: textStyle]
            
            let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
            context!.saveGState()
            context!.clip(to: textRect)
            textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
            context!.restoreGState()
        }
        else if(type == "back"){
            let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
            
            //// Back-Chevron Drawing
            let backChevronPath = UIBezierPath()
            backChevronPath.move(to: CGPoint(x: 0, y: 10.5))
            backChevronPath.addLine(to: CGPoint(x: 10.5, y: 0))
            backChevronPath.addLine(to: CGPoint(x: 12.5, y: 2))
            backChevronPath.addLine(to: CGPoint(x: 4, y: 10.5))
            backChevronPath.addLine(to: CGPoint(x: 12.5, y: 19))
            backChevronPath.addLine(to: CGPoint(x: 10.5, y: 21))
            backChevronPath.addLine(to: CGPoint(x: 0, y: 10.5))
            backChevronPath.close()
            backChevronPath.miterLimit = 4;
            
            backChevronPath.usesEvenOddFillRule = true;
            
            fillColor.setFill()
            backChevronPath.fill()
            
            
        }
        else if(type == "chat"){
            let strokeColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
            
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 7.72, y: 20.97))
            shapePath.addCurve(to: CGPoint(x: 7.67, y: 21.4), controlPoint1: CGPoint(x: 7.68, y: 21.12), controlPoint2: CGPoint(x: 7.67, y: 21.25))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 25))
            shapePath.addCurve(to: CGPoint(x: 9.38, y: 25.43), controlPoint1: CGPoint(x: 7.67, y: 26.2), controlPoint2: CGPoint(x: 8.52, y: 26.29))
            shapePath.addLine(to: CGPoint(x: 14.33, y: 21.14))
            shapePath.addLine(to: CGPoint(x: 17.37, y: 21.14))
            shapePath.addCurve(to: CGPoint(x: 27.67, y: 10.93), controlPoint1: CGPoint(x: 23.05, y: 21.14), controlPoint2: CGPoint(x: 27.67, y: 16.57))
            shapePath.addCurve(to: CGPoint(x: 17.37, y: 1), controlPoint1: CGPoint(x: 27.67, y: 5.3), controlPoint2: CGPoint(x: 23.05, y: 1))
            shapePath.addLine(to: CGPoint(x: 11.3, y: 1))
            shapePath.addCurve(to: CGPoint(x: 1, y: 11.2), controlPoint1: CGPoint(x: 5.62, y: 1), controlPoint2: CGPoint(x: 1, y: 5.56))
            shapePath.addCurve(to: CGPoint(x: 7.72, y: 20.97), controlPoint1: CGPoint(x: 1, y: 15.8), controlPoint2: CGPoint(x: 3.48, y: 19.71))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 7.67, y: 7.71))
            shapePath.addLine(to: CGPoint(x: 21, y: 7.71))
            shapePath.addLine(to: CGPoint(x: 21, y: 9.39))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 9.39))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 7.71))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 7.71))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 7.67, y: 11.07))
            shapePath.addLine(to: CGPoint(x: 21, y: 11.07))
            shapePath.addLine(to: CGPoint(x: 21, y: 12.75))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 12.75))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 11.07))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 11.07))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 16, y: 14.42))
            shapePath.addLine(to: CGPoint(x: 16, y: 16.1))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 16.1))
            shapePath.addLine(to: CGPoint(x: 7.67, y: 14.42))
            shapePath.addLine(to: CGPoint(x: 16, y: 14.42))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            strokeColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
            
        }
        else if(type == "call"){
            let strokeColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
            
            //// Group-3
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 17.32, y: 12.57))
            shapePath.addLine(to: CGPoint(x: 17.39, y: 12.5))
            shapePath.addCurve(to: CGPoint(x: 16.57, y: 11.81), controlPoint1: CGPoint(x: 17.09, y: 12.29), controlPoint2: CGPoint(x: 16.82, y: 12.06))
            shapePath.addLine(to: CGPoint(x: 17.32, y: 12.57))
            shapePath.addLine(to: CGPoint(x: 17.32, y: 12.57))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 20.95, y: 13.3))
            shapePath.addCurve(to: CGPoint(x: 17.5, y: 17.09), controlPoint1: CGPoint(x: 21.09, y: 14.01), controlPoint2: CGPoint(x: 19.51, y: 15.1))
            shapePath.addCurve(to: CGPoint(x: 13.34, y: 20.41), controlPoint1: CGPoint(x: 15.08, y: 19.51), controlPoint2: CGPoint(x: 14.4, y: 20.25))
            shapePath.addCurve(to: CGPoint(x: 12.5, y: 17.39), controlPoint1: CGPoint(x: 13.37, y: 19.33), controlPoint2: CGPoint(x: 13.07, y: 18.3))
            shapePath.addCurve(to: CGPoint(x: 11.81, y: 16.57), controlPoint1: CGPoint(x: 12.29, y: 17.09), controlPoint2: CGPoint(x: 12.06, y: 16.82))
            shapePath.addLine(to: CGPoint(x: 9.53, y: 14.28))
            shapePath.addCurve(to: CGPoint(x: 6.42, y: 14.33), controlPoint1: CGPoint(x: 8.68, y: 13.44), controlPoint2: CGPoint(x: 7.29, y: 13.46))
            shapePath.addLine(to: CGPoint(x: 4.04, y: 16.7))
            shapePath.addLine(to: CGPoint(x: 1.67, y: 19.08))
            shapePath.addCurve(to: CGPoint(x: 1.62, y: 22.19), controlPoint1: CGPoint(x: 0.8, y: 19.95), controlPoint2: CGPoint(x: 0.77, y: 21.34))
            shapePath.addLine(to: CGPoint(x: 3.91, y: 24.47))
            shapePath.addCurve(to: CGPoint(x: 4.73, y: 25.16), controlPoint1: CGPoint(x: 4.16, y: 24.72), controlPoint2: CGPoint(x: 4.43, y: 24.95))
            shapePath.addCurve(to: CGPoint(x: 10.35, y: 25.3), controlPoint1: CGPoint(x: 6.4, y: 26.23), controlPoint2: CGPoint(x: 8.59, y: 26.28))
            shapePath.addCurve(to: CGPoint(x: 20.02, y: 19.01), controlPoint1: CGPoint(x: 12.36, y: 24.91), controlPoint2: CGPoint(x: 15.56, y: 23.47))
            shapePath.addCurve(to: CGPoint(x: 25.73, y: 9.32), controlPoint1: CGPoint(x: 25, y: 14.03), controlPoint2: CGPoint(x: 25.87, y: 10.96))
            shapePath.addCurve(to: CGPoint(x: 25.16, y: 4.73), controlPoint1: CGPoint(x: 26.23, y: 7.79), controlPoint2: CGPoint(x: 26.03, y: 6.1))
            shapePath.addCurve(to: CGPoint(x: 24.47, y: 3.91), controlPoint1: CGPoint(x: 24.95, y: 4.43), controlPoint2: CGPoint(x: 24.72, y: 4.16))
            shapePath.addLine(to: CGPoint(x: 22.19, y: 1.62))
            shapePath.addCurve(to: CGPoint(x: 19.08, y: 1.67), controlPoint1: CGPoint(x: 21.34, y: 0.77), controlPoint2: CGPoint(x: 19.95, y: 0.8))
            shapePath.addLine(to: CGPoint(x: 16.7, y: 4.04))
            shapePath.addLine(to: CGPoint(x: 14.33, y: 6.42))
            shapePath.addCurve(to: CGPoint(x: 14.28, y: 9.53), controlPoint1: CGPoint(x: 13.46, y: 7.29), controlPoint2: CGPoint(x: 13.44, y: 8.68))
            shapePath.addLine(to: CGPoint(x: 16.57, y: 11.81))
            shapePath.addCurve(to: CGPoint(x: 17.39, y: 12.5), controlPoint1: CGPoint(x: 16.82, y: 12.06), controlPoint2: CGPoint(x: 17.09, y: 12.29))
            shapePath.addCurve(to: CGPoint(x: 20.95, y: 13.3), controlPoint1: CGPoint(x: 18.46, y: 13.18), controlPoint2: CGPoint(x: 19.72, y: 13.46))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 25.16, y: 4.73))
            shapePath.addLine(to: CGPoint(x: 25.23, y: 4.66))
            shapePath.addLine(to: CGPoint(x: 24.47, y: 3.91))
            shapePath.addCurve(to: CGPoint(x: 25.16, y: 4.73), controlPoint1: CGPoint(x: 24.72, y: 4.16), controlPoint2: CGPoint(x: 24.95, y: 4.43))
            shapePath.addLine(to: CGPoint(x: 25.16, y: 4.73))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 4.66, y: 25.23))
            shapePath.addLine(to: CGPoint(x: 4.73, y: 25.16))
            shapePath.addCurve(to: CGPoint(x: 3.91, y: 24.47), controlPoint1: CGPoint(x: 4.43, y: 24.95), controlPoint2: CGPoint(x: 4.16, y: 24.72))
            shapePath.addLine(to: CGPoint(x: 4.66, y: 25.23))
            shapePath.addLine(to: CGPoint(x: 4.66, y: 25.23))
            shapePath.close()
            shapePath.move(to: CGPoint(x: 12.5, y: 17.39))
            shapePath.addLine(to: CGPoint(x: 12.57, y: 17.32))
            shapePath.addLine(to: CGPoint(x: 11.81, y: 16.57))
            shapePath.addCurve(to: CGPoint(x: 12.5, y: 17.39), controlPoint1: CGPoint(x: 12.06, y: 16.82), controlPoint2: CGPoint(x: 12.29, y: 17.09))
            shapePath.addLine(to: CGPoint(x: 12.5, y: 17.39))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            shapePath.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
            
            
        }
        else if(type == "invoice"){
            let strokeColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
            
            //// Group-4
            //// Shape Drawing
            let shapePath = UIBezierPath(ovalIn: CGRect(x: 1, y: 1, width: 25, height: 25))
            strokeColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
            
            
            //// Shape 2 Drawing
            let shape2Path = UIBezierPath()
            shape2Path.move(to: CGPoint(x: 11.75, y: 13))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 19))
            shape2Path.addLine(to: CGPoint(x: 9.75, y: 19))
            shape2Path.addLine(to: CGPoint(x: 9.75, y: 21))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 21))
            shape2Path.addLine(to: CGPoint(x: 15.75, y: 21))
            shape2Path.addLine(to: CGPoint(x: 17.75, y: 21))
            shape2Path.addLine(to: CGPoint(x: 17.75, y: 19))
            shape2Path.addLine(to: CGPoint(x: 15.75, y: 19))
            shape2Path.addLine(to: CGPoint(x: 15.75, y: 13))
            shape2Path.addLine(to: CGPoint(x: 15.75, y: 11))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 11))
            shape2Path.addLine(to: CGPoint(x: 9.75, y: 11))
            shape2Path.addLine(to: CGPoint(x: 9.75, y: 13))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 13))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 13))
            shape2Path.close()
            shape2Path.move(to: CGPoint(x: 11.75, y: 5))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 9))
            shape2Path.addLine(to: CGPoint(x: 15.75, y: 9))
            shape2Path.addLine(to: CGPoint(x: 15.75, y: 5))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 5))
            shape2Path.addLine(to: CGPoint(x: 11.75, y: 5))
            shape2Path.close()
            shape2Path.miterLimit = 4;
            
            shape2Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shape2Path.lineWidth = 1
            shape2Path.stroke()
        }
        else if(type == "Driving Licence"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 27, height: 18), false, 0)
            let strokeColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
            
            //// Page-1
            //// Stroke-1 Drawing
            let stroke1Path = UIBezierPath()
            stroke1Path.move(to: CGPoint(x: 24.98, y: 15.64))
            stroke1Path.addCurve(to: CGPoint(x: 23.1, y: 17.62), controlPoint1: CGPoint(x: 24.98, y: 16.86), controlPoint2: CGPoint(x: 24.25, y: 17.62))
            stroke1Path.addCurve(to: CGPoint(x: 12.64, y: 17.62), controlPoint1: CGPoint(x: 19.61, y: 17.62), controlPoint2: CGPoint(x: 16.13, y: 17.62))
            stroke1Path.addCurve(to: CGPoint(x: 2.21, y: 17.62), controlPoint1: CGPoint(x: 9.16, y: 17.62), controlPoint2: CGPoint(x: 5.68, y: 17.62))
            stroke1Path.addCurve(to: CGPoint(x: 0.52, y: 16.57), controlPoint1: CGPoint(x: 1.44, y: 17.62), controlPoint2: CGPoint(x: 0.85, y: 17.31))
            stroke1Path.addCurve(to: CGPoint(x: 0.34, y: 15.67), controlPoint1: CGPoint(x: 0.4, y: 16.3), controlPoint2: CGPoint(x: 0.34, y: 15.97))
            stroke1Path.addCurve(to: CGPoint(x: 0.33, y: 2.31), controlPoint1: CGPoint(x: 0.33, y: 11.22), controlPoint2: CGPoint(x: 0.33, y: 6.76))
            stroke1Path.addCurve(to: CGPoint(x: 2.2, y: 0.35), controlPoint1: CGPoint(x: 0.33, y: 1.12), controlPoint2: CGPoint(x: 1.07, y: 0.35))
            stroke1Path.addCurve(to: CGPoint(x: 23.12, y: 0.35), controlPoint1: CGPoint(x: 9.17, y: 0.35), controlPoint2: CGPoint(x: 16.15, y: 0.35))
            stroke1Path.addCurve(to: CGPoint(x: 24.98, y: 2.31), controlPoint1: CGPoint(x: 24.25, y: 0.35), controlPoint2: CGPoint(x: 24.98, y: 1.12))
            stroke1Path.addCurve(to: CGPoint(x: 24.98, y: 15.64), controlPoint1: CGPoint(x: 24.99, y: 6.76), controlPoint2: CGPoint(x: 24.99, y: 11.2))
            stroke1Path.addLine(to: CGPoint(x: 24.98, y: 15.64))
            stroke1Path.close()
            stroke1Path.miterLimit = 4;
            
            stroke1Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke1Path.lineWidth = 0.5
            stroke1Path.stroke()
            
            
            //// Stroke-3 Drawing
            let stroke3Path = UIBezierPath()
            stroke3Path.move(to: CGPoint(x: 8.53, y: 8.97))
            stroke3Path.addCurve(to: CGPoint(x: 8.52, y: 8.78), controlPoint1: CGPoint(x: 8.53, y: 8.9), controlPoint2: CGPoint(x: 8.53, y: 8.84))
            stroke3Path.addCurve(to: CGPoint(x: 8.49, y: 8.64), controlPoint1: CGPoint(x: 8.52, y: 8.73), controlPoint2: CGPoint(x: 8.5, y: 8.68))
            stroke3Path.addCurve(to: CGPoint(x: 7.47, y: 7.61), controlPoint1: CGPoint(x: 8.34, y: 8.08), controlPoint2: CGPoint(x: 7.92, y: 7.83))
            stroke3Path.addCurve(to: CGPoint(x: 6.63, y: 7.18), controlPoint1: CGPoint(x: 7.19, y: 7.47), controlPoint2: CGPoint(x: 6.9, y: 7.34))
            stroke3Path.addCurve(to: CGPoint(x: 6.35, y: 6.11), controlPoint1: CGPoint(x: 6.36, y: 7.02), controlPoint2: CGPoint(x: 6.21, y: 6.39))
            stroke3Path.addCurve(to: CGPoint(x: 6.86, y: 5.12), controlPoint1: CGPoint(x: 6.51, y: 5.78), controlPoint2: CGPoint(x: 6.7, y: 5.46))
            stroke3Path.addCurve(to: CGPoint(x: 6.94, y: 4.67), controlPoint1: CGPoint(x: 6.92, y: 4.99), controlPoint2: CGPoint(x: 6.98, y: 4.79))
            stroke3Path.addCurve(to: CGPoint(x: 6.96, y: 4.04), controlPoint1: CGPoint(x: 6.86, y: 4.44), controlPoint2: CGPoint(x: 6.92, y: 4.25))
            stroke3Path.addCurve(to: CGPoint(x: 6.3, y: 2.59), controlPoint1: CGPoint(x: 7.07, y: 3.41), controlPoint2: CGPoint(x: 6.76, y: 2.74))
            stroke3Path.addCurve(to: CGPoint(x: 5.9, y: 2.27), controlPoint1: CGPoint(x: 6.12, y: 2.53), controlPoint2: CGPoint(x: 5.95, y: 2.5))
            stroke3Path.addCurve(to: CGPoint(x: 5.77, y: 2.19), controlPoint1: CGPoint(x: 5.89, y: 2.24), controlPoint2: CGPoint(x: 5.81, y: 2.19))
            stroke3Path.addCurve(to: CGPoint(x: 4.18, y: 4.24), controlPoint1: CGPoint(x: 4.58, y: 2.23), controlPoint2: CGPoint(x: 3.89, y: 3.15))
            stroke3Path.addCurve(to: CGPoint(x: 4.18, y: 4.55), controlPoint1: CGPoint(x: 4.21, y: 4.33), controlPoint2: CGPoint(x: 4.18, y: 4.44))
            stroke3Path.addCurve(to: CGPoint(x: 4.22, y: 5.07), controlPoint1: CGPoint(x: 4.19, y: 4.72), controlPoint2: CGPoint(x: 4.16, y: 4.91))
            stroke3Path.addCurve(to: CGPoint(x: 4.63, y: 5.93), controlPoint1: CGPoint(x: 4.33, y: 5.37), controlPoint2: CGPoint(x: 4.51, y: 5.64))
            stroke3Path.addCurve(to: CGPoint(x: 4.26, y: 7.33), controlPoint1: CGPoint(x: 4.93, y: 6.65), controlPoint2: CGPoint(x: 4.78, y: 7.08))
            stroke3Path.addCurve(to: CGPoint(x: 3.39, y: 7.79), controlPoint1: CGPoint(x: 3.97, y: 7.47), controlPoint2: CGPoint(x: 3.67, y: 7.61))
            stroke3Path.addCurve(to: CGPoint(x: 2.69, y: 8.97), controlPoint1: CGPoint(x: 2.97, y: 8.04), controlPoint2: CGPoint(x: 2.69, y: 8.41))
            stroke3Path.addLine(to: CGPoint(x: 8.53, y: 8.97))
            stroke3Path.addLine(to: CGPoint(x: 8.53, y: 8.97))
            stroke3Path.close()
            stroke3Path.miterLimit = 4;
            
            stroke3Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke3Path.lineWidth = 0.5
            stroke3Path.stroke()
            
            
            //// Stroke-5 Drawing
            let stroke5Path = UIBezierPath()
            stroke5Path.move(to: CGPoint(x: 18.19, y: 9.59))
            stroke5Path.addCurve(to: CGPoint(x: 14.46, y: 9.59), controlPoint1: CGPoint(x: 16.95, y: 9.59), controlPoint2: CGPoint(x: 15.7, y: 9.59))
            stroke5Path.addCurve(to: CGPoint(x: 13.78, y: 10.21), controlPoint1: CGPoint(x: 14.07, y: 9.6), controlPoint2: CGPoint(x: 13.8, y: 9.84))
            stroke5Path.addCurve(to: CGPoint(x: 14.52, y: 10.85), controlPoint1: CGPoint(x: 13.76, y: 10.58), controlPoint2: CGPoint(x: 14.06, y: 10.85))
            stroke5Path.addCurve(to: CGPoint(x: 21.91, y: 10.85), controlPoint1: CGPoint(x: 16.98, y: 10.85), controlPoint2: CGPoint(x: 19.45, y: 10.85))
            stroke5Path.addCurve(to: CGPoint(x: 22.24, y: 10.79), controlPoint1: CGPoint(x: 22.02, y: 10.85), controlPoint2: CGPoint(x: 22.14, y: 10.83))
            stroke5Path.addCurve(to: CGPoint(x: 22.64, y: 10.22), controlPoint1: CGPoint(x: 22.49, y: 10.69), controlPoint2: CGPoint(x: 22.64, y: 10.5))
            stroke5Path.addCurve(to: CGPoint(x: 22.24, y: 9.65), controlPoint1: CGPoint(x: 22.64, y: 9.94), controlPoint2: CGPoint(x: 22.49, y: 9.74))
            stroke5Path.addCurve(to: CGPoint(x: 21.85, y: 9.6), controlPoint1: CGPoint(x: 22.12, y: 9.61), controlPoint2: CGPoint(x: 21.98, y: 9.6))
            stroke5Path.addCurve(to: CGPoint(x: 18.19, y: 9.59), controlPoint1: CGPoint(x: 20.63, y: 9.59), controlPoint2: CGPoint(x: 19.41, y: 9.59))
            stroke5Path.addLine(to: CGPoint(x: 18.19, y: 9.59))
            stroke5Path.close()
            stroke5Path.miterLimit = 4;
            
            stroke5Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke5Path.lineWidth = 0.5
            stroke5Path.stroke()
            
            
            //// Stroke-7 Drawing
            let stroke7Path = UIBezierPath()
            stroke7Path.move(to: CGPoint(x: 18.18, y: 5.9))
            stroke7Path.addCurve(to: CGPoint(x: 21.85, y: 5.9), controlPoint1: CGPoint(x: 19.41, y: 5.9), controlPoint2: CGPoint(x: 20.63, y: 5.9))
            stroke7Path.addCurve(to: CGPoint(x: 22.27, y: 5.84), controlPoint1: CGPoint(x: 21.99, y: 5.9), controlPoint2: CGPoint(x: 22.14, y: 5.89))
            stroke7Path.addCurve(to: CGPoint(x: 22.63, y: 5.25), controlPoint1: CGPoint(x: 22.51, y: 5.73), controlPoint2: CGPoint(x: 22.65, y: 5.54))
            stroke7Path.addCurve(to: CGPoint(x: 22.25, y: 4.71), controlPoint1: CGPoint(x: 22.62, y: 4.98), controlPoint2: CGPoint(x: 22.48, y: 4.8))
            stroke7Path.addCurve(to: CGPoint(x: 21.85, y: 4.65), controlPoint1: CGPoint(x: 22.12, y: 4.66), controlPoint2: CGPoint(x: 21.99, y: 4.65))
            stroke7Path.addCurve(to: CGPoint(x: 19.11, y: 4.65), controlPoint1: CGPoint(x: 20.94, y: 4.65), controlPoint2: CGPoint(x: 20.02, y: 4.65))
            stroke7Path.addCurve(to: CGPoint(x: 14.5, y: 4.65), controlPoint1: CGPoint(x: 17.57, y: 4.65), controlPoint2: CGPoint(x: 16.03, y: 4.65))
            stroke7Path.addCurve(to: CGPoint(x: 13.8, y: 5.14), controlPoint1: CGPoint(x: 14.12, y: 4.65), controlPoint2: CGPoint(x: 13.87, y: 4.83))
            stroke7Path.addCurve(to: CGPoint(x: 14.49, y: 5.9), controlPoint1: CGPoint(x: 13.71, y: 5.57), controlPoint2: CGPoint(x: 14, y: 5.9))
            stroke7Path.addCurve(to: CGPoint(x: 18.18, y: 5.9), controlPoint1: CGPoint(x: 15.72, y: 5.91), controlPoint2: CGPoint(x: 16.95, y: 5.9))
            stroke7Path.addLine(to: CGPoint(x: 18.18, y: 5.9))
            stroke7Path.close()
            stroke7Path.miterLimit = 4;
            
            stroke7Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke7Path.lineWidth = 0.5
            stroke7Path.stroke()
            
            
            //// Stroke-9 Drawing
            let stroke9Path = UIBezierPath()
            stroke9Path.move(to: CGPoint(x: 17.32, y: 8.37))
            stroke9Path.addCurve(to: CGPoint(x: 20.1, y: 8.37), controlPoint1: CGPoint(x: 18.25, y: 8.37), controlPoint2: CGPoint(x: 19.17, y: 8.38))
            stroke9Path.addCurve(to: CGPoint(x: 20.49, y: 8.31), controlPoint1: CGPoint(x: 20.23, y: 8.37), controlPoint2: CGPoint(x: 20.37, y: 8.36))
            stroke9Path.addCurve(to: CGPoint(x: 20.88, y: 7.74), controlPoint1: CGPoint(x: 20.74, y: 8.22), controlPoint2: CGPoint(x: 20.88, y: 8.01))
            stroke9Path.addCurve(to: CGPoint(x: 20.48, y: 7.18), controlPoint1: CGPoint(x: 20.87, y: 7.47), controlPoint2: CGPoint(x: 20.73, y: 7.26))
            stroke9Path.addCurve(to: CGPoint(x: 20.08, y: 7.12), controlPoint1: CGPoint(x: 20.35, y: 7.14), controlPoint2: CGPoint(x: 20.22, y: 7.12))
            stroke9Path.addCurve(to: CGPoint(x: 17.68, y: 7.12), controlPoint1: CGPoint(x: 19.28, y: 7.12), controlPoint2: CGPoint(x: 18.48, y: 7.12))
            stroke9Path.addCurve(to: CGPoint(x: 14.47, y: 7.12), controlPoint1: CGPoint(x: 16.61, y: 7.12), controlPoint2: CGPoint(x: 15.54, y: 7.12))
            stroke9Path.addCurve(to: CGPoint(x: 13.81, y: 7.58), controlPoint1: CGPoint(x: 14.14, y: 7.12), controlPoint2: CGPoint(x: 13.88, y: 7.3))
            stroke9Path.addCurve(to: CGPoint(x: 14.46, y: 8.37), controlPoint1: CGPoint(x: 13.69, y: 8), controlPoint2: CGPoint(x: 13.98, y: 8.37))
            stroke9Path.addCurve(to: CGPoint(x: 17.32, y: 8.37), controlPoint1: CGPoint(x: 15.41, y: 8.38), controlPoint2: CGPoint(x: 16.37, y: 8.37))
            stroke9Path.addLine(to: CGPoint(x: 17.32, y: 8.37))
            stroke9Path.close()
            stroke9Path.miterLimit = 4;
            
            stroke9Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke9Path.lineWidth = 0.5
            stroke9Path.stroke()
            
            //// Stroke-13 Drawing
            let stroke13Path = UIBezierPath()
            stroke13Path.move(to: CGPoint(x: 11.49, y: 8.37))
            stroke13Path.addCurve(to: CGPoint(x: 10.89, y: 8.97), controlPoint1: CGPoint(x: 11.18, y: 8.37), controlPoint2: CGPoint(x: 10.9, y: 8.64))
            stroke13Path.addCurve(to: CGPoint(x: 11.46, y: 9.59), controlPoint1: CGPoint(x: 10.88, y: 9.29), controlPoint2: CGPoint(x: 11.15, y: 9.58))
            stroke13Path.addCurve(to: CGPoint(x: 12.07, y: 8.99), controlPoint1: CGPoint(x: 11.79, y: 9.6), controlPoint2: CGPoint(x: 12.07, y: 9.33))
            stroke13Path.addCurve(to: CGPoint(x: 11.49, y: 8.37), controlPoint1: CGPoint(x: 12.07, y: 8.66), controlPoint2: CGPoint(x: 11.81, y: 8.38))
            stroke13Path.addLine(to: CGPoint(x: 11.49, y: 8.37))
            stroke13Path.close()
            stroke13Path.miterLimit = 4;
            
            stroke13Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke13Path.lineWidth = 0.5
            stroke13Path.stroke()
            
            
            //// Stroke-15 Drawing
            let stroke15Path = UIBezierPath()
            stroke15Path.move(to: CGPoint(x: 12.07, y: 7.13))
            stroke15Path.addCurve(to: CGPoint(x: 11.48, y: 6.51), controlPoint1: CGPoint(x: 12.07, y: 6.8), controlPoint2: CGPoint(x: 11.79, y: 6.51))
            stroke15Path.addCurve(to: CGPoint(x: 10.89, y: 7.12), controlPoint1: CGPoint(x: 11.18, y: 6.51), controlPoint2: CGPoint(x: 10.9, y: 6.8))
            stroke15Path.addCurve(to: CGPoint(x: 11.49, y: 7.75), controlPoint1: CGPoint(x: 10.89, y: 7.45), controlPoint2: CGPoint(x: 11.18, y: 7.76))
            stroke15Path.addCurve(to: CGPoint(x: 12.07, y: 7.13), controlPoint1: CGPoint(x: 11.8, y: 7.74), controlPoint2: CGPoint(x: 12.08, y: 7.45))
            stroke15Path.addLine(to: CGPoint(x: 12.07, y: 7.13))
            stroke15Path.close()
            stroke15Path.miterLimit = 4;
            
            stroke15Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke15Path.lineWidth = 0.5
            stroke15Path.stroke()
            
            
            //// Stroke-17 Drawing
            let stroke17Path = UIBezierPath()
            stroke17Path.move(to: CGPoint(x: 11.46, y: 4.04))
            stroke17Path.addCurve(to: CGPoint(x: 12.07, y: 3.45), controlPoint1: CGPoint(x: 11.78, y: 4.05), controlPoint2: CGPoint(x: 12.05, y: 3.78))
            stroke17Path.addCurve(to: CGPoint(x: 11.49, y: 2.81), controlPoint1: CGPoint(x: 12.09, y: 3.12), controlPoint2: CGPoint(x: 11.81, y: 2.81))
            stroke17Path.addCurve(to: CGPoint(x: 10.89, y: 3.41), controlPoint1: CGPoint(x: 11.18, y: 2.81), controlPoint2: CGPoint(x: 10.9, y: 3.08))
            stroke17Path.addCurve(to: CGPoint(x: 11.46, y: 4.04), controlPoint1: CGPoint(x: 10.88, y: 3.73), controlPoint2: CGPoint(x: 11.15, y: 4.03))
            stroke17Path.addLine(to: CGPoint(x: 11.46, y: 4.04))
            stroke17Path.close()
            stroke17Path.miterLimit = 4;
            
            stroke17Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke17Path.lineWidth = 0.5
            stroke17Path.stroke()
            
            
            //// Stroke-19 Drawing
            let stroke19Path = UIBezierPath()
            stroke19Path.move(to: CGPoint(x: 12.07, y: 10.85))
            stroke19Path.addCurve(to: CGPoint(x: 11.5, y: 10.22), controlPoint1: CGPoint(x: 12.08, y: 10.53), controlPoint2: CGPoint(x: 11.81, y: 10.23))
            stroke19Path.addCurve(to: CGPoint(x: 10.89, y: 10.84), controlPoint1: CGPoint(x: 11.19, y: 10.21), controlPoint2: CGPoint(x: 10.89, y: 10.51))
            stroke19Path.addCurve(to: CGPoint(x: 11.48, y: 11.45), controlPoint1: CGPoint(x: 10.89, y: 11.16), controlPoint2: CGPoint(x: 11.17, y: 11.45))
            stroke19Path.addCurve(to: CGPoint(x: 12.07, y: 10.85), controlPoint1: CGPoint(x: 11.79, y: 11.46), controlPoint2: CGPoint(x: 12.06, y: 11.18))
            stroke19Path.addLine(to: CGPoint(x: 12.07, y: 10.85))
            stroke19Path.close()
            stroke19Path.miterLimit = 4;
            
            stroke19Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke19Path.lineWidth = 0.5
            stroke19Path.stroke()
            
            
            //// Stroke-21 Drawing
            let stroke21Path = UIBezierPath()
            stroke21Path.move(to: CGPoint(x: 11.48, y: 13.93))
            stroke21Path.addCurve(to: CGPoint(x: 10.89, y: 14.54), controlPoint1: CGPoint(x: 11.17, y: 13.93), controlPoint2: CGPoint(x: 10.9, y: 14.21))
            stroke21Path.addCurve(to: CGPoint(x: 11.47, y: 15.16), controlPoint1: CGPoint(x: 10.89, y: 14.86), controlPoint2: CGPoint(x: 11.16, y: 15.15))
            stroke21Path.addCurve(to: CGPoint(x: 12.07, y: 14.54), controlPoint1: CGPoint(x: 11.79, y: 15.16), controlPoint2: CGPoint(x: 12.08, y: 14.87))
            stroke21Path.addCurve(to: CGPoint(x: 11.48, y: 13.93), controlPoint1: CGPoint(x: 12.07, y: 14.21), controlPoint2: CGPoint(x: 11.8, y: 13.93))
            stroke21Path.addLine(to: CGPoint(x: 11.48, y: 13.93))
            stroke21Path.close()
            stroke21Path.miterLimit = 4;
            
            stroke21Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke21Path.lineWidth = 0.5
            stroke21Path.stroke()
            
            //// Stroke-23 Drawing
            let stroke23Path = UIBezierPath()
            stroke23Path.move(to: CGPoint(x: 11.48, y: 5.9))
            stroke23Path.addCurve(to: CGPoint(x: 12.07, y: 5.29), controlPoint1: CGPoint(x: 11.78, y: 5.9), controlPoint2: CGPoint(x: 12.07, y: 5.6))
            stroke23Path.addCurve(to: CGPoint(x: 11.5, y: 4.66), controlPoint1: CGPoint(x: 12.08, y: 4.97), controlPoint2: CGPoint(x: 11.8, y: 4.67))
            stroke23Path.addCurve(to: CGPoint(x: 10.89, y: 5.28), controlPoint1: CGPoint(x: 11.19, y: 4.64), controlPoint2: CGPoint(x: 10.89, y: 4.96))
            stroke23Path.addCurve(to: CGPoint(x: 11.48, y: 5.9), controlPoint1: CGPoint(x: 10.9, y: 5.6), controlPoint2: CGPoint(x: 11.18, y: 5.9))
            stroke23Path.addLine(to: CGPoint(x: 11.48, y: 5.9))
            stroke23Path.close()
            stroke23Path.miterLimit = 4;
            
            stroke23Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke23Path.lineWidth = 0.5
            stroke23Path.stroke()
            
            
            //// Stroke-25 Drawing
            let stroke25Path = UIBezierPath()
            stroke25Path.move(to: CGPoint(x: 11.48, y: 13.31))
            stroke25Path.addCurve(to: CGPoint(x: 12.07, y: 12.7), controlPoint1: CGPoint(x: 11.78, y: 13.32), controlPoint2: CGPoint(x: 12.07, y: 13.02))
            stroke25Path.addCurve(to: CGPoint(x: 11.5, y: 12.07), controlPoint1: CGPoint(x: 12.08, y: 12.38), controlPoint2: CGPoint(x: 11.8, y: 12.08))
            stroke25Path.addCurve(to: CGPoint(x: 10.89, y: 12.7), controlPoint1: CGPoint(x: 11.19, y: 12.06), controlPoint2: CGPoint(x: 10.89, y: 12.37))
            stroke25Path.addCurve(to: CGPoint(x: 11.48, y: 13.31), controlPoint1: CGPoint(x: 10.9, y: 13.01), controlPoint2: CGPoint(x: 11.18, y: 13.31))
            stroke25Path.addLine(to: CGPoint(x: 11.48, y: 13.31))
            stroke25Path.close()
            stroke25Path.miterLimit = 4;
            
            stroke25Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke25Path.lineWidth = 0.5
            stroke25Path.stroke()
            
            
            //// Stroke-29 Drawing
            let stroke29Path = UIBezierPath()
            stroke29Path.move(to: CGPoint(x: 11.49, y: 17.01))
            stroke29Path.addCurve(to: CGPoint(x: 12.07, y: 16.4), controlPoint1: CGPoint(x: 11.8, y: 17.01), controlPoint2: CGPoint(x: 12.07, y: 16.72))
            stroke29Path.addCurve(to: CGPoint(x: 11.49, y: 15.78), controlPoint1: CGPoint(x: 12.07, y: 16.07), controlPoint2: CGPoint(x: 11.8, y: 15.79))
            stroke29Path.addCurve(to: CGPoint(x: 10.89, y: 16.41), controlPoint1: CGPoint(x: 11.17, y: 15.78), controlPoint2: CGPoint(x: 10.88, y: 16.08))
            stroke29Path.addCurve(to: CGPoint(x: 11.49, y: 17.01), controlPoint1: CGPoint(x: 10.9, y: 16.74), controlPoint2: CGPoint(x: 11.17, y: 17.01))
            stroke29Path.addLine(to: CGPoint(x: 11.49, y: 17.01))
            stroke29Path.close()
            stroke29Path.miterLimit = 4;
            
            stroke29Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke29Path.lineWidth = 0.5
            stroke29Path.stroke()
            
            
            //// Stroke-39 Drawing
            let stroke39Path = UIBezierPath()
            stroke39Path.move(to: CGPoint(x: 17.33, y: 12.07))
            stroke39Path.addCurve(to: CGPoint(x: 20.19, y: 12.07), controlPoint1: CGPoint(x: 18.28, y: 12.07), controlPoint2: CGPoint(x: 19.24, y: 12.06))
            stroke39Path.addCurve(to: CGPoint(x: 20.85, y: 12.88), controlPoint1: CGPoint(x: 20.68, y: 12.07), controlPoint2: CGPoint(x: 20.98, y: 12.45))
            stroke39Path.addCurve(to: CGPoint(x: 20.17, y: 13.32), controlPoint1: CGPoint(x: 20.76, y: 13.15), controlPoint2: CGPoint(x: 20.52, y: 13.32))
            stroke39Path.addCurve(to: CGPoint(x: 18.1, y: 13.32), controlPoint1: CGPoint(x: 19.48, y: 13.32), controlPoint2: CGPoint(x: 18.79, y: 13.32))
            stroke39Path.addLine(to: CGPoint(x: 14.7, y: 13.32))
            stroke39Path.addCurve(to: CGPoint(x: 14.47, y: 13.32), controlPoint1: CGPoint(x: 14.62, y: 13.32), controlPoint2: CGPoint(x: 14.54, y: 13.32))
            stroke39Path.addCurve(to: CGPoint(x: 13.78, y: 12.71), controlPoint1: CGPoint(x: 14.07, y: 13.3), controlPoint2: CGPoint(x: 13.78, y: 13.05))
            stroke39Path.addCurve(to: CGPoint(x: 14.49, y: 12.07), controlPoint1: CGPoint(x: 13.78, y: 12.32), controlPoint2: CGPoint(x: 14.06, y: 12.07))
            stroke39Path.addCurve(to: CGPoint(x: 17.33, y: 12.07), controlPoint1: CGPoint(x: 15.44, y: 12.06), controlPoint2: CGPoint(x: 16.38, y: 12.07))
            stroke39Path.addLine(to: CGPoint(x: 17.33, y: 12.07))
            stroke39Path.close()
            stroke39Path.miterLimit = 4;
            
            stroke39Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke39Path.lineWidth = 0.5
            stroke39Path.stroke()
            
            
            //// Stroke-55 Drawing
            let stroke55Path = UIBezierPath()
            stroke55Path.move(to: CGPoint(x: 11.47, y: 2.18))
            stroke55Path.addCurve(to: CGPoint(x: 10.89, y: 1.57), controlPoint1: CGPoint(x: 11.16, y: 2.18), controlPoint2: CGPoint(x: 10.89, y: 1.89))
            stroke55Path.addCurve(to: CGPoint(x: 11.5, y: 0.96), controlPoint1: CGPoint(x: 10.89, y: 1.23), controlPoint2: CGPoint(x: 11.18, y: 0.95))
            stroke55Path.addCurve(to: CGPoint(x: 12.07, y: 1.59), controlPoint1: CGPoint(x: 11.82, y: 0.97), controlPoint2: CGPoint(x: 12.08, y: 1.27))
            stroke55Path.addCurve(to: CGPoint(x: 11.47, y: 2.18), controlPoint1: CGPoint(x: 12.06, y: 1.91), controlPoint2: CGPoint(x: 11.79, y: 2.19))
            stroke55Path.addLine(to: CGPoint(x: 11.47, y: 2.18))
            stroke55Path.close()
            stroke55Path.miterLimit = 4;
            
            stroke55Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke55Path.lineWidth = 0.5
            stroke55Path.stroke()
            
            //// Stroke-59 Drawing
            let stroke59Path = UIBezierPath()
            stroke59Path.move(to: CGPoint(x: 8.39, y: 16.08))
            stroke59Path.addLine(to: CGPoint(x: 7.51, y: 16.08))
            stroke59Path.addCurve(to: CGPoint(x: 7.39, y: 15.83), controlPoint1: CGPoint(x: 7.4, y: 16.04), controlPoint2: CGPoint(x: 7.38, y: 15.94))
            stroke59Path.addCurve(to: CGPoint(x: 3.83, y: 15.83), controlPoint1: CGPoint(x: 7.05, y: 15.75), controlPoint2: CGPoint(x: 4.19, y: 15.75))
            stroke59Path.addCurve(to: CGPoint(x: 3.71, y: 16.08), controlPoint1: CGPoint(x: 3.84, y: 15.94), controlPoint2: CGPoint(x: 3.81, y: 16.03))
            stroke59Path.addLine(to: CGPoint(x: 2.82, y: 16.08))
            stroke59Path.addCurve(to: CGPoint(x: 2.7, y: 15.86), controlPoint1: CGPoint(x: 2.73, y: 16.04), controlPoint2: CGPoint(x: 2.69, y: 15.97))
            stroke59Path.addCurve(to: CGPoint(x: 2.66, y: 14.94), controlPoint1: CGPoint(x: 2.71, y: 15.55), controlPoint2: CGPoint(x: 2.68, y: 15.24))
            stroke59Path.addCurve(to: CGPoint(x: 2.64, y: 14.69), controlPoint1: CGPoint(x: 2.65, y: 14.85), controlPoint2: CGPoint(x: 2.64, y: 14.77))
            stroke59Path.addLine(to: CGPoint(x: 2.64, y: 14.18))
            stroke59Path.addCurve(to: CGPoint(x: 2.65, y: 14.12), controlPoint1: CGPoint(x: 2.64, y: 14.16), controlPoint2: CGPoint(x: 2.65, y: 14.14))
            stroke59Path.addCurve(to: CGPoint(x: 2.95, y: 13.41), controlPoint1: CGPoint(x: 2.68, y: 13.85), controlPoint2: CGPoint(x: 2.73, y: 13.59))
            stroke59Path.addCurve(to: CGPoint(x: 2.88, y: 13.38), controlPoint1: CGPoint(x: 2.92, y: 13.4), controlPoint2: CGPoint(x: 2.9, y: 13.39))
            stroke59Path.addCurve(to: CGPoint(x: 2.69, y: 13.23), controlPoint1: CGPoint(x: 2.82, y: 13.33), controlPoint2: CGPoint(x: 2.75, y: 13.29))
            stroke59Path.addCurve(to: CGPoint(x: 2.74, y: 12.98), controlPoint1: CGPoint(x: 2.61, y: 13.14), controlPoint2: CGPoint(x: 2.63, y: 13.04))
            stroke59Path.addCurve(to: CGPoint(x: 2.82, y: 12.95), controlPoint1: CGPoint(x: 2.77, y: 12.97), controlPoint2: CGPoint(x: 2.79, y: 12.95))
            stroke59Path.addCurve(to: CGPoint(x: 3.25, y: 12.89), controlPoint1: CGPoint(x: 2.96, y: 12.92), controlPoint2: CGPoint(x: 3.11, y: 12.9))
            stroke59Path.addCurve(to: CGPoint(x: 3.3, y: 12.92), controlPoint1: CGPoint(x: 3.26, y: 12.88), controlPoint2: CGPoint(x: 3.29, y: 12.9))
            stroke59Path.addCurve(to: CGPoint(x: 3.4, y: 13.05), controlPoint1: CGPoint(x: 3.33, y: 12.96), controlPoint2: CGPoint(x: 3.36, y: 13))
            stroke59Path.addCurve(to: CGPoint(x: 3.43, y: 12.96), controlPoint1: CGPoint(x: 3.41, y: 13.01), controlPoint2: CGPoint(x: 3.42, y: 12.98))
            stroke59Path.addCurve(to: CGPoint(x: 3.79, y: 12.19), controlPoint1: CGPoint(x: 3.53, y: 12.69), controlPoint2: CGPoint(x: 3.64, y: 12.44))
            stroke59Path.addCurve(to: CGPoint(x: 4.15, y: 11.93), controlPoint1: CGPoint(x: 3.87, y: 12.05), controlPoint2: CGPoint(x: 3.99, y: 11.95))
            stroke59Path.addCurve(to: CGPoint(x: 4.97, y: 11.81), controlPoint1: CGPoint(x: 4.42, y: 11.88), controlPoint2: CGPoint(x: 4.7, y: 11.84))
            stroke59Path.addCurve(to: CGPoint(x: 5.24, y: 11.78), controlPoint1: CGPoint(x: 5.06, y: 11.79), controlPoint2: CGPoint(x: 5.15, y: 11.79))
            stroke59Path.addLine(to: CGPoint(x: 5.98, y: 11.78))
            stroke59Path.addCurve(to: CGPoint(x: 6.03, y: 11.79), controlPoint1: CGPoint(x: 6, y: 11.78), controlPoint2: CGPoint(x: 6.01, y: 11.79))
            stroke59Path.addCurve(to: CGPoint(x: 6.97, y: 11.9), controlPoint1: CGPoint(x: 6.35, y: 11.83), controlPoint2: CGPoint(x: 6.66, y: 11.87))
            stroke59Path.addCurve(to: CGPoint(x: 7.46, y: 12.25), controlPoint1: CGPoint(x: 7.19, y: 11.93), controlPoint2: CGPoint(x: 7.36, y: 12.04))
            stroke59Path.addCurve(to: CGPoint(x: 7.59, y: 12.49), controlPoint1: CGPoint(x: 7.5, y: 12.33), controlPoint2: CGPoint(x: 7.55, y: 12.4))
            stroke59Path.addCurve(to: CGPoint(x: 7.83, y: 13.04), controlPoint1: CGPoint(x: 7.67, y: 12.67), controlPoint2: CGPoint(x: 7.75, y: 12.85))
            stroke59Path.addCurve(to: CGPoint(x: 7.92, y: 12.92), controlPoint1: CGPoint(x: 7.86, y: 13), controlPoint2: CGPoint(x: 7.88, y: 12.95))
            stroke59Path.addCurve(to: CGPoint(x: 7.97, y: 12.89), controlPoint1: CGPoint(x: 7.93, y: 12.9), controlPoint2: CGPoint(x: 7.95, y: 12.88))
            stroke59Path.addCurve(to: CGPoint(x: 8.41, y: 12.95), controlPoint1: CGPoint(x: 8.11, y: 12.91), controlPoint2: CGPoint(x: 8.26, y: 12.92))
            stroke59Path.addCurve(to: CGPoint(x: 8.57, y: 13.1), controlPoint1: CGPoint(x: 8.48, y: 12.97), controlPoint2: CGPoint(x: 8.56, y: 13))
            stroke59Path.addCurve(to: CGPoint(x: 8.46, y: 13.3), controlPoint1: CGPoint(x: 8.58, y: 13.19), controlPoint2: CGPoint(x: 8.52, y: 13.25))
            stroke59Path.addCurve(to: CGPoint(x: 8.34, y: 13.38), controlPoint1: CGPoint(x: 8.42, y: 13.33), controlPoint2: CGPoint(x: 8.38, y: 13.35))
            stroke59Path.addCurve(to: CGPoint(x: 8.26, y: 13.41), controlPoint1: CGPoint(x: 8.32, y: 13.39), controlPoint2: CGPoint(x: 8.29, y: 13.4))
            stroke59Path.addCurve(to: CGPoint(x: 8.54, y: 13.91), controlPoint1: CGPoint(x: 8.43, y: 13.54), controlPoint2: CGPoint(x: 8.5, y: 13.72))
            stroke59Path.addCurve(to: CGPoint(x: 8.58, y: 14.18), controlPoint1: CGPoint(x: 8.56, y: 14), controlPoint2: CGPoint(x: 8.57, y: 14.09))
            stroke59Path.addLine(to: CGPoint(x: 8.58, y: 14.68))
            stroke59Path.addCurve(to: CGPoint(x: 8.56, y: 14.87), controlPoint1: CGPoint(x: 8.58, y: 14.74), controlPoint2: CGPoint(x: 8.57, y: 14.81))
            stroke59Path.addCurve(to: CGPoint(x: 8.52, y: 15.86), controlPoint1: CGPoint(x: 8.54, y: 15.2), controlPoint2: CGPoint(x: 8.51, y: 15.53))
            stroke59Path.addCurve(to: CGPoint(x: 8.39, y: 16.08), controlPoint1: CGPoint(x: 8.53, y: 15.97), controlPoint2: CGPoint(x: 8.49, y: 16.04))
            stroke59Path.addLine(to: CGPoint(x: 8.39, y: 16.08))
            stroke59Path.close()
            stroke59Path.miterLimit = 4;
            
            stroke59Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke59Path.lineWidth = 0.5
            stroke59Path.stroke()
            
            
            //// Stroke-61 Drawing
            let stroke61Path = UIBezierPath()
            stroke61Path.move(to: CGPoint(x: 7.53, y: 13.1))
            stroke61Path.addCurve(to: CGPoint(x: 7.15, y: 12.32), controlPoint1: CGPoint(x: 7.42, y: 12.83), controlPoint2: CGPoint(x: 7.31, y: 12.56))
            stroke61Path.addCurve(to: CGPoint(x: 7, y: 12.22), controlPoint1: CGPoint(x: 7.12, y: 12.27), controlPoint2: CGPoint(x: 7.05, y: 12.24))
            stroke61Path.addCurve(to: CGPoint(x: 5.7, y: 12.09), controlPoint1: CGPoint(x: 6.57, y: 12.14), controlPoint2: CGPoint(x: 6.14, y: 12.09))
            stroke61Path.addCurve(to: CGPoint(x: 4.25, y: 12.22), controlPoint1: CGPoint(x: 5.21, y: 12.08), controlPoint2: CGPoint(x: 4.73, y: 12.12))
            stroke61Path.addCurve(to: CGPoint(x: 4.02, y: 12.38), controlPoint1: CGPoint(x: 4.15, y: 12.24), controlPoint2: CGPoint(x: 4.07, y: 12.28))
            stroke61Path.addCurve(to: CGPoint(x: 3.71, y: 13.06), controlPoint1: CGPoint(x: 3.92, y: 12.61), controlPoint2: CGPoint(x: 3.81, y: 12.83))
            stroke61Path.addCurve(to: CGPoint(x: 3.7, y: 13.1), controlPoint1: CGPoint(x: 3.7, y: 13.07), controlPoint2: CGPoint(x: 3.7, y: 13.09))
            stroke61Path.addCurve(to: CGPoint(x: 7.53, y: 13.1), controlPoint1: CGPoint(x: 4.97, y: 13.02), controlPoint2: CGPoint(x: 6.25, y: 13.02))
            stroke61Path.addLine(to: CGPoint(x: 7.53, y: 13.1))
            stroke61Path.close()
            stroke61Path.miterLimit = 4;
            
            stroke61Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke61Path.lineWidth = 0.5
            stroke61Path.stroke()
            
            
            //// Stroke-63 Drawing
            let stroke63Path = UIBezierPath()
            stroke63Path.move(to: CGPoint(x: 3.7, y: 14.63))
            stroke63Path.addCurve(to: CGPoint(x: 3.91, y: 14.63), controlPoint1: CGPoint(x: 3.77, y: 14.63), controlPoint2: CGPoint(x: 3.84, y: 14.63))
            stroke63Path.addCurve(to: CGPoint(x: 4.02, y: 14.52), controlPoint1: CGPoint(x: 3.98, y: 14.62), controlPoint2: CGPoint(x: 4.02, y: 14.58))
            stroke63Path.addCurve(to: CGPoint(x: 3.8, y: 14.25), controlPoint1: CGPoint(x: 4.01, y: 14.4), controlPoint2: CGPoint(x: 3.91, y: 14.27))
            stroke63Path.addCurve(to: CGPoint(x: 3.17, y: 14.16), controlPoint1: CGPoint(x: 3.59, y: 14.22), controlPoint2: CGPoint(x: 3.38, y: 14.19))
            stroke63Path.addCurve(to: CGPoint(x: 3.06, y: 14.32), controlPoint1: CGPoint(x: 3.08, y: 14.15), controlPoint2: CGPoint(x: 3.03, y: 14.22))
            stroke63Path.addCurve(to: CGPoint(x: 3.12, y: 14.47), controlPoint1: CGPoint(x: 3.08, y: 14.37), controlPoint2: CGPoint(x: 3.1, y: 14.42))
            stroke63Path.addCurve(to: CGPoint(x: 3.35, y: 14.63), controlPoint1: CGPoint(x: 3.17, y: 14.58), controlPoint2: CGPoint(x: 3.24, y: 14.63))
            stroke63Path.addLine(to: CGPoint(x: 3.62, y: 14.63))
            stroke63Path.addLine(to: CGPoint(x: 3.7, y: 14.63))
            stroke63Path.close()
            stroke63Path.miterLimit = 4;
            
            stroke63Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke63Path.lineWidth = 0.5
            stroke63Path.stroke()
            
            //// Stroke-65 Drawing
            let stroke65Path = UIBezierPath()
            stroke65Path.move(to: CGPoint(x: 7.6, y: 14.63))
            stroke65Path.addLine(to: CGPoint(x: 7.76, y: 14.63))
            stroke65Path.addCurve(to: CGPoint(x: 8.14, y: 14.35), controlPoint1: CGPoint(x: 8.02, y: 14.63), controlPoint2: CGPoint(x: 8.05, y: 14.61))
            stroke65Path.addCurve(to: CGPoint(x: 8.15, y: 14.32), controlPoint1: CGPoint(x: 8.15, y: 14.34), controlPoint2: CGPoint(x: 8.15, y: 14.33))
            stroke65Path.addCurve(to: CGPoint(x: 8.04, y: 14.16), controlPoint1: CGPoint(x: 8.19, y: 14.21), controlPoint2: CGPoint(x: 8.14, y: 14.15))
            stroke65Path.addCurve(to: CGPoint(x: 7.46, y: 14.24), controlPoint1: CGPoint(x: 7.84, y: 14.19), controlPoint2: CGPoint(x: 7.65, y: 14.22))
            stroke65Path.addCurve(to: CGPoint(x: 7.22, y: 14.46), controlPoint1: CGPoint(x: 7.33, y: 14.26), controlPoint2: CGPoint(x: 7.26, y: 14.34))
            stroke65Path.addCurve(to: CGPoint(x: 7.33, y: 14.63), controlPoint1: CGPoint(x: 7.18, y: 14.57), controlPoint2: CGPoint(x: 7.22, y: 14.63))
            stroke65Path.addLine(to: CGPoint(x: 7.6, y: 14.63))
            stroke65Path.addLine(to: CGPoint(x: 7.6, y: 14.63))
            stroke65Path.close()
            stroke65Path.miterLimit = 4;
            
            stroke65Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke65Path.lineWidth = 0.5
            stroke65Path.stroke()
            
            
            //// Stroke-67 Drawing
            let stroke67Path = UIBezierPath()
            stroke67Path.move(to: CGPoint(x: 3.72, y: 14.9))
            stroke67Path.addLine(to: CGPoint(x: 3.72, y: 14.9))
            stroke67Path.addCurve(to: CGPoint(x: 3.38, y: 14.9), controlPoint1: CGPoint(x: 3.6, y: 14.9), controlPoint2: CGPoint(x: 3.49, y: 14.9))
            stroke67Path.addCurve(to: CGPoint(x: 3.3, y: 14.98), controlPoint1: CGPoint(x: 3.33, y: 14.9), controlPoint2: CGPoint(x: 3.3, y: 14.93))
            stroke67Path.addCurve(to: CGPoint(x: 3.38, y: 15.06), controlPoint1: CGPoint(x: 3.3, y: 15.03), controlPoint2: CGPoint(x: 3.34, y: 15.06))
            stroke67Path.addCurve(to: CGPoint(x: 4.05, y: 15.05), controlPoint1: CGPoint(x: 3.61, y: 15.06), controlPoint2: CGPoint(x: 3.83, y: 15.06))
            stroke67Path.addCurve(to: CGPoint(x: 4.11, y: 15.03), controlPoint1: CGPoint(x: 4.07, y: 15.05), controlPoint2: CGPoint(x: 4.1, y: 15.05))
            stroke67Path.addCurve(to: CGPoint(x: 4.13, y: 14.95), controlPoint1: CGPoint(x: 4.13, y: 15.01), controlPoint2: CGPoint(x: 4.14, y: 14.97))
            stroke67Path.addCurve(to: CGPoint(x: 4.05, y: 14.9), controlPoint1: CGPoint(x: 4.11, y: 14.93), controlPoint2: CGPoint(x: 4.08, y: 14.9))
            stroke67Path.addCurve(to: CGPoint(x: 3.72, y: 14.9), controlPoint1: CGPoint(x: 3.94, y: 14.9), controlPoint2: CGPoint(x: 3.83, y: 14.9))
            stroke67Path.addLine(to: CGPoint(x: 3.72, y: 14.9))
            stroke67Path.close()
            stroke67Path.miterLimit = 4;
            
            stroke67Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke67Path.lineWidth = 0.5
            stroke67Path.stroke()
            
            
            //// Stroke-69 Drawing
            let stroke69Path = UIBezierPath()
            stroke69Path.move(to: CGPoint(x: 7.5, y: 15.06))
            stroke69Path.addLine(to: CGPoint(x: 7.5, y: 15.06))
            stroke69Path.addCurve(to: CGPoint(x: 7.83, y: 15.06), controlPoint1: CGPoint(x: 7.61, y: 15.06), controlPoint2: CGPoint(x: 7.72, y: 15.06))
            stroke69Path.addCurve(to: CGPoint(x: 7.92, y: 14.98), controlPoint1: CGPoint(x: 7.88, y: 15.06), controlPoint2: CGPoint(x: 7.92, y: 15.02))
            stroke69Path.addCurve(to: CGPoint(x: 7.83, y: 14.9), controlPoint1: CGPoint(x: 7.92, y: 14.94), controlPoint2: CGPoint(x: 7.88, y: 14.9))
            stroke69Path.addCurve(to: CGPoint(x: 7.17, y: 14.9), controlPoint1: CGPoint(x: 7.61, y: 14.9), controlPoint2: CGPoint(x: 7.39, y: 14.9))
            stroke69Path.addCurve(to: CGPoint(x: 7.08, y: 14.98), controlPoint1: CGPoint(x: 7.11, y: 14.9), controlPoint2: CGPoint(x: 7.08, y: 14.93))
            stroke69Path.addCurve(to: CGPoint(x: 7.18, y: 15.06), controlPoint1: CGPoint(x: 7.08, y: 15.03), controlPoint2: CGPoint(x: 7.12, y: 15.06))
            stroke69Path.addLine(to: CGPoint(x: 7.5, y: 15.06))
            stroke69Path.addLine(to: CGPoint(x: 7.5, y: 15.06))
            stroke69Path.close()
            stroke69Path.miterLimit = 4;
            
            stroke69Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke69Path.lineWidth = 0.5
            stroke69Path.stroke()
        }
        else if(type == "Settings"){
            let strokeColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
            
            //// Bezier Drawing
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 28.03, y: 16.91))
            bezierPath.addCurve(to: CGPoint(x: 27.36, y: 19.84), controlPoint1: CGPoint(x: 27.79, y: 17.87), controlPoint2: CGPoint(x: 27.59, y: 18.83))
            bezierPath.addCurve(to: CGPoint(x: 25.3, y: 19.96), controlPoint1: CGPoint(x: 26.68, y: 19.88), controlPoint2: CGPoint(x: 25.98, y: 19.92))
            bezierPath.addCurve(to: CGPoint(x: 25.07, y: 19.96), controlPoint1: CGPoint(x: 25.22, y: 19.96), controlPoint2: CGPoint(x: 25.15, y: 19.97))
            bezierPath.addCurve(to: CGPoint(x: 23.31, y: 20.87), controlPoint1: CGPoint(x: 24.31, y: 19.92), controlPoint2: CGPoint(x: 23.71, y: 20.16))
            bezierPath.addCurve(to: CGPoint(x: 22.55, y: 21.79), controlPoint1: CGPoint(x: 23.12, y: 21.21), controlPoint2: CGPoint(x: 22.82, y: 21.5))
            bezierPath.addCurve(to: CGPoint(x: 22.23, y: 22.93), controlPoint1: CGPoint(x: 22.25, y: 22.12), controlPoint2: CGPoint(x: 22.15, y: 22.49))
            bezierPath.addCurve(to: CGPoint(x: 22.66, y: 25.48), controlPoint1: CGPoint(x: 22.39, y: 23.78), controlPoint2: CGPoint(x: 22.53, y: 24.62))
            bezierPath.addCurve(to: CGPoint(x: 22.55, y: 25.74), controlPoint1: CGPoint(x: 22.68, y: 25.56), controlPoint2: CGPoint(x: 22.62, y: 25.71))
            bezierPath.addCurve(to: CGPoint(x: 19.73, y: 27.11), controlPoint1: CGPoint(x: 21.62, y: 26.2), controlPoint2: CGPoint(x: 20.69, y: 26.65))
            bezierPath.addCurve(to: CGPoint(x: 17.93, y: 25.07), controlPoint1: CGPoint(x: 19.12, y: 26.43), controlPoint2: CGPoint(x: 18.51, y: 25.76))
            bezierPath.addCurve(to: CGPoint(x: 16.73, y: 24.57), controlPoint1: CGPoint(x: 17.6, y: 24.7), controlPoint2: CGPoint(x: 17.23, y: 24.54))
            bezierPath.addCurve(to: CGPoint(x: 15.22, y: 24.57), controlPoint1: CGPoint(x: 16.23, y: 24.6), controlPoint2: CGPoint(x: 15.72, y: 24.6))
            bezierPath.addCurve(to: CGPoint(x: 14.11, y: 25.04), controlPoint1: CGPoint(x: 14.75, y: 24.54), controlPoint2: CGPoint(x: 14.4, y: 24.7))
            bezierPath.addCurve(to: CGPoint(x: 12.27, y: 27.11), controlPoint1: CGPoint(x: 13.5, y: 25.73), controlPoint2: CGPoint(x: 12.89, y: 26.41))
            bezierPath.addCurve(to: CGPoint(x: 9.43, y: 25.73), controlPoint1: CGPoint(x: 11.31, y: 26.65), controlPoint2: CGPoint(x: 10.37, y: 26.2))
            bezierPath.addCurve(to: CGPoint(x: 9.33, y: 25.49), controlPoint1: CGPoint(x: 9.37, y: 25.71), controlPoint2: CGPoint(x: 9.32, y: 25.57))
            bezierPath.addCurve(to: CGPoint(x: 9.77, y: 22.95), controlPoint1: CGPoint(x: 9.47, y: 24.64), controlPoint2: CGPoint(x: 9.61, y: 23.79))
            bezierPath.addCurve(to: CGPoint(x: 9.44, y: 21.78), controlPoint1: CGPoint(x: 9.85, y: 22.5), controlPoint2: CGPoint(x: 9.74, y: 22.13))
            bezierPath.addCurve(to: CGPoint(x: 8.47, y: 20.57), controlPoint1: CGPoint(x: 9.1, y: 21.4), controlPoint2: CGPoint(x: 8.78, y: 20.99))
            bezierPath.addCurve(to: CGPoint(x: 7.51, y: 20), controlPoint1: CGPoint(x: 8.23, y: 20.24), controlPoint2: CGPoint(x: 7.93, y: 20.02))
            bezierPath.addCurve(to: CGPoint(x: 4.64, y: 19.84), controlPoint1: CGPoint(x: 6.56, y: 19.95), controlPoint2: CGPoint(x: 5.62, y: 19.9))
            bezierPath.addCurve(to: CGPoint(x: 4.11, y: 17.54), controlPoint1: CGPoint(x: 4.46, y: 19.07), controlPoint2: CGPoint(x: 4.28, y: 18.31))
            bezierPath.addCurve(to: CGPoint(x: 3.98, y: 16.64), controlPoint1: CGPoint(x: 4.05, y: 17.24), controlPoint2: CGPoint(x: 3.88, y: 16.87))
            bezierPath.addCurve(to: CGPoint(x: 4.74, y: 16.17), controlPoint1: CGPoint(x: 4.07, y: 16.41), controlPoint2: CGPoint(x: 4.47, y: 16.32))
            bezierPath.addCurve(to: CGPoint(x: 6.34, y: 15.29), controlPoint1: CGPoint(x: 5.27, y: 15.87), controlPoint2: CGPoint(x: 5.8, y: 15.57))
            bezierPath.addCurve(to: CGPoint(x: 7.03, y: 14.34), controlPoint1: CGPoint(x: 6.73, y: 15.08), controlPoint2: CGPoint(x: 6.95, y: 14.78))
            bezierPath.addCurve(to: CGPoint(x: 7.39, y: 12.8), controlPoint1: CGPoint(x: 7.12, y: 13.82), controlPoint2: CGPoint(x: 7.25, y: 13.31))
            bezierPath.addCurve(to: CGPoint(x: 7.2, y: 11.64), controlPoint1: CGPoint(x: 7.51, y: 12.38), controlPoint2: CGPoint(x: 7.46, y: 12))
            bezierPath.addCurve(to: CGPoint(x: 5.56, y: 9.35), controlPoint1: CGPoint(x: 6.65, y: 10.89), controlPoint2: CGPoint(x: 6.12, y: 10.13))
            bezierPath.addCurve(to: CGPoint(x: 7.23, y: 7.26), controlPoint1: CGPoint(x: 6.12, y: 8.66), controlPoint2: CGPoint(x: 6.67, y: 7.96))
            bezierPath.addCurve(to: CGPoint(x: 8.21, y: 7.01), controlPoint1: CGPoint(x: 7.63, y: 6.76), controlPoint2: CGPoint(x: 7.63, y: 6.76))
            bezierPath.addCurve(to: CGPoint(x: 10.19, y: 7.84), controlPoint1: CGPoint(x: 8.87, y: 7.29), controlPoint2: CGPoint(x: 9.53, y: 7.56))
            bezierPath.addCurve(to: CGPoint(x: 11.42, y: 7.76), controlPoint1: CGPoint(x: 10.61, y: 8.02), controlPoint2: CGPoint(x: 11.01, y: 7.99))
            bezierPath.addCurve(to: CGPoint(x: 12.78, y: 7.11), controlPoint1: CGPoint(x: 11.86, y: 7.52), controlPoint2: CGPoint(x: 12.32, y: 7.3))
            bezierPath.addCurve(to: CGPoint(x: 13.63, y: 6.17), controlPoint1: CGPoint(x: 13.23, y: 6.93), controlPoint2: CGPoint(x: 13.51, y: 6.63))
            bezierPath.addCurve(to: CGPoint(x: 14.27, y: 3.89), controlPoint1: CGPoint(x: 13.84, y: 5.41), controlPoint2: CGPoint(x: 14.07, y: 4.65))
            bezierPath.addCurve(to: CGPoint(x: 14.62, y: 3.63), controlPoint1: CGPoint(x: 14.33, y: 3.69), controlPoint2: CGPoint(x: 14.41, y: 3.62))
            bezierPath.addCurve(to: CGPoint(x: 17.4, y: 3.63), controlPoint1: CGPoint(x: 15.54, y: 3.64), controlPoint2: CGPoint(x: 16.47, y: 3.64))
            bezierPath.addCurve(to: CGPoint(x: 17.72, y: 3.87), controlPoint1: CGPoint(x: 17.59, y: 3.62), controlPoint2: CGPoint(x: 17.67, y: 3.67))
            bezierPath.addCurve(to: CGPoint(x: 18.39, y: 6.23), controlPoint1: CGPoint(x: 17.94, y: 4.66), controlPoint2: CGPoint(x: 18.18, y: 5.45))
            bezierPath.addCurve(to: CGPoint(x: 19.17, y: 7.09), controlPoint1: CGPoint(x: 18.51, y: 6.65), controlPoint2: CGPoint(x: 18.77, y: 6.92))
            bezierPath.addCurve(to: CGPoint(x: 20.64, y: 7.8), controlPoint1: CGPoint(x: 19.67, y: 7.3), controlPoint2: CGPoint(x: 20.16, y: 7.54))
            bezierPath.addCurve(to: CGPoint(x: 21.76, y: 7.86), controlPoint1: CGPoint(x: 21.01, y: 7.99), controlPoint2: CGPoint(x: 21.38, y: 8.02))
            bezierPath.addCurve(to: CGPoint(x: 24.15, y: 6.87), controlPoint1: CGPoint(x: 22.56, y: 7.53), controlPoint2: CGPoint(x: 23.35, y: 7.19))
            bezierPath.addCurve(to: CGPoint(x: 24.47, y: 6.91), controlPoint1: CGPoint(x: 24.24, y: 6.83), controlPoint2: CGPoint(x: 24.42, y: 6.84))
            bezierPath.addCurve(to: CGPoint(x: 26.43, y: 9.35), controlPoint1: CGPoint(x: 25.13, y: 7.71), controlPoint2: CGPoint(x: 25.77, y: 8.53))
            bezierPath.addCurve(to: CGPoint(x: 24.83, y: 11.6), controlPoint1: CGPoint(x: 25.89, y: 10.11), controlPoint2: CGPoint(x: 25.37, y: 10.86))
            bezierPath.addCurve(to: CGPoint(x: 24.63, y: 12.85), controlPoint1: CGPoint(x: 24.54, y: 11.99), controlPoint2: CGPoint(x: 24.48, y: 12.38))
            bezierPath.addCurve(to: CGPoint(x: 24.96, y: 14.32), controlPoint1: CGPoint(x: 24.77, y: 13.33), controlPoint2: CGPoint(x: 24.88, y: 13.82))
            bezierPath.addCurve(to: CGPoint(x: 25.64, y: 15.28), controlPoint1: CGPoint(x: 25.03, y: 14.76), controlPoint2: CGPoint(x: 25.25, y: 15.07))
            bezierPath.addCurve(to: CGPoint(x: 27.83, y: 16.47), controlPoint1: CGPoint(x: 26.37, y: 15.68), controlPoint2: CGPoint(x: 27.1, y: 16.08))
            bezierPath.addCurve(to: CGPoint(x: 28.03, y: 16.91), controlPoint1: CGPoint(x: 28.02, y: 16.57), controlPoint2: CGPoint(x: 28.09, y: 16.67))
            bezierPath.addLine(to: CGPoint(x: 28.03, y: 16.91))
            bezierPath.close()
            bezierPath.miterLimit = 4;
            
            strokeColor.setStroke()
            bezierPath.lineWidth = 1
            bezierPath.stroke()
            
            //// Bezier 2 Drawing
            let bezier2Path = UIBezierPath()
            bezier2Path.move(to: CGPoint(x: 29.89, y: 14.97))
            bezier2Path.addCurve(to: CGPoint(x: 27.42, y: 13.62), controlPoint1: CGPoint(x: 29.07, y: 14.51), controlPoint2: CGPoint(x: 28.24, y: 14.07))
            bezier2Path.addCurve(to: CGPoint(x: 27.13, y: 12.36), controlPoint1: CGPoint(x: 27.07, y: 13.42), controlPoint2: CGPoint(x: 26.9, y: 12.68))
            bezier2Path.addCurve(to: CGPoint(x: 28.76, y: 10.06), controlPoint1: CGPoint(x: 27.68, y: 11.59), controlPoint2: CGPoint(x: 28.23, y: 10.84))
            bezier2Path.addCurve(to: CGPoint(x: 29.11, y: 9.31), controlPoint1: CGPoint(x: 28.91, y: 9.85), controlPoint2: CGPoint(x: 28.98, y: 9.58))
            bezier2Path.addCurve(to: CGPoint(x: 28.77, y: 8.58), controlPoint1: CGPoint(x: 28.99, y: 9.04), controlPoint2: CGPoint(x: 28.92, y: 8.78))
            bezier2Path.addCurve(to: CGPoint(x: 25.66, y: 4.68), controlPoint1: CGPoint(x: 27.74, y: 7.27), controlPoint2: CGPoint(x: 26.7, y: 5.97))
            bezier2Path.addCurve(to: CGPoint(x: 24.22, y: 4.32), controlPoint1: CGPoint(x: 25.27, y: 4.19), controlPoint2: CGPoint(x: 24.79, y: 4.09))
            bezier2Path.addCurve(to: CGPoint(x: 22.01, y: 5.25), controlPoint1: CGPoint(x: 23.48, y: 4.63), controlPoint2: CGPoint(x: 22.73, y: 4.91))
            bezier2Path.addCurve(to: CGPoint(x: 20.71, y: 5.21), controlPoint1: CGPoint(x: 21.55, y: 5.48), controlPoint2: CGPoint(x: 21.13, y: 5.54))
            bezier2Path.addCurve(to: CGPoint(x: 20.43, y: 4.88), controlPoint1: CGPoint(x: 20.59, y: 5.12), controlPoint2: CGPoint(x: 20.46, y: 5))
            bezier2Path.addCurve(to: CGPoint(x: 19.67, y: 2.27), controlPoint1: CGPoint(x: 20.16, y: 4.01), controlPoint2: CGPoint(x: 19.92, y: 3.14))
            bezier2Path.addCurve(to: CGPoint(x: 18.42, y: 1.31), controlPoint1: CGPoint(x: 19.48, y: 1.61), controlPoint2: CGPoint(x: 19.1, y: 1.31))
            bezier2Path.addCurve(to: CGPoint(x: 13.58, y: 1.31), controlPoint1: CGPoint(x: 16.81, y: 1.31), controlPoint2: CGPoint(x: 15.2, y: 1.31))
            bezier2Path.addCurve(to: CGPoint(x: 12.34, y: 2.24), controlPoint1: CGPoint(x: 12.91, y: 1.31), controlPoint2: CGPoint(x: 12.52, y: 1.6))
            bezier2Path.addCurve(to: CGPoint(x: 11.73, y: 4.43), controlPoint1: CGPoint(x: 12.13, y: 2.97), controlPoint2: CGPoint(x: 11.88, y: 3.69))
            bezier2Path.addCurve(to: CGPoint(x: 10.9, y: 5.41), controlPoint1: CGPoint(x: 11.62, y: 4.93), controlPoint2: CGPoint(x: 11.39, y: 5.25))
            bezier2Path.addCurve(to: CGPoint(x: 10.4, y: 5.42), controlPoint1: CGPoint(x: 10.72, y: 5.48), controlPoint2: CGPoint(x: 10.58, y: 5.5))
            bezier2Path.addCurve(to: CGPoint(x: 7.81, y: 4.34), controlPoint1: CGPoint(x: 9.54, y: 5.05), controlPoint2: CGPoint(x: 8.68, y: 4.69))
            bezier2Path.addCurve(to: CGPoint(x: 6.3, y: 4.72), controlPoint1: CGPoint(x: 7.19, y: 4.08), controlPoint2: CGPoint(x: 6.72, y: 4.19))
            bezier2Path.addCurve(to: CGPoint(x: 3.26, y: 8.52), controlPoint1: CGPoint(x: 5.28, y: 5.99), controlPoint2: CGPoint(x: 4.27, y: 7.25))
            bezier2Path.addCurve(to: CGPoint(x: 3.23, y: 10.06), controlPoint1: CGPoint(x: 2.86, y: 9.03), controlPoint2: CGPoint(x: 2.85, y: 9.53))
            bezier2Path.addCurve(to: CGPoint(x: 4.68, y: 12.09), controlPoint1: CGPoint(x: 3.71, y: 10.74), controlPoint2: CGPoint(x: 4.17, y: 11.43))
            bezier2Path.addCurve(to: CGPoint(x: 4.9, y: 13.15), controlPoint1: CGPoint(x: 4.95, y: 12.42), controlPoint2: CGPoint(x: 5.03, y: 12.73))
            bezier2Path.addCurve(to: CGPoint(x: 4.5, y: 13.65), controlPoint1: CGPoint(x: 4.83, y: 13.39), controlPoint2: CGPoint(x: 4.72, y: 13.54))
            bezier2Path.addCurve(to: CGPoint(x: 2.1, y: 14.98), controlPoint1: CGPoint(x: 3.7, y: 14.08), controlPoint2: CGPoint(x: 2.9, y: 14.53))
            bezier2Path.addCurve(to: CGPoint(x: 1.46, y: 16.29), controlPoint1: CGPoint(x: 1.56, y: 15.27), controlPoint2: CGPoint(x: 1.33, y: 15.7))
            bezier2Path.addCurve(to: CGPoint(x: 2.6, y: 21.27), controlPoint1: CGPoint(x: 1.83, y: 17.95), controlPoint2: CGPoint(x: 2.21, y: 19.61))
            bezier2Path.addCurve(to: CGPoint(x: 3.57, y: 22.1), controlPoint1: CGPoint(x: 2.71, y: 21.72), controlPoint2: CGPoint(x: 3.12, y: 22.07))
            bezier2Path.addCurve(to: CGPoint(x: 6.03, y: 22.22), controlPoint1: CGPoint(x: 4.39, y: 22.15), controlPoint2: CGPoint(x: 5.21, y: 22.22))
            bezier2Path.addCurve(to: CGPoint(x: 7.3, y: 22.87), controlPoint1: CGPoint(x: 6.59, y: 22.22), controlPoint2: CGPoint(x: 7.03, y: 22.35))
            bezier2Path.addCurve(to: CGPoint(x: 7.37, y: 23.18), controlPoint1: CGPoint(x: 7.35, y: 22.96), controlPoint2: CGPoint(x: 7.39, y: 23.09))
            bezier2Path.addCurve(to: CGPoint(x: 6.89, y: 26.01), controlPoint1: CGPoint(x: 7.22, y: 24.13), controlPoint2: CGPoint(x: 7.05, y: 25.07))
            bezier2Path.addCurve(to: CGPoint(x: 7.63, y: 27.44), controlPoint1: CGPoint(x: 6.77, y: 26.72), controlPoint2: CGPoint(x: 6.98, y: 27.13))
            bezier2Path.addCurve(to: CGPoint(x: 11.94, y: 29.52), controlPoint1: CGPoint(x: 9.06, y: 28.14), controlPoint2: CGPoint(x: 10.5, y: 28.83))
            bezier2Path.addCurve(to: CGPoint(x: 13.5, y: 29.21), controlPoint1: CGPoint(x: 12.57, y: 29.82), controlPoint2: CGPoint(x: 13.04, y: 29.73))
            bezier2Path.addCurve(to: CGPoint(x: 15.1, y: 27.38), controlPoint1: CGPoint(x: 14.04, y: 28.6), controlPoint2: CGPoint(x: 14.6, y: 28.01))
            bezier2Path.addCurve(to: CGPoint(x: 16.2, y: 26.92), controlPoint1: CGPoint(x: 15.4, y: 27.01), controlPoint2: CGPoint(x: 15.73, y: 26.81))
            bezier2Path.addCurve(to: CGPoint(x: 16.62, y: 27.11), controlPoint1: CGPoint(x: 16.35, y: 26.95), controlPoint2: CGPoint(x: 16.53, y: 27.01))
            bezier2Path.addCurve(to: CGPoint(x: 18.54, y: 29.26), controlPoint1: CGPoint(x: 17.27, y: 27.82), controlPoint2: CGPoint(x: 17.9, y: 28.54))
            bezier2Path.addCurve(to: CGPoint(x: 20, y: 29.55), controlPoint1: CGPoint(x: 18.95, y: 29.71), controlPoint2: CGPoint(x: 19.45, y: 29.81))
            bezier2Path.addCurve(to: CGPoint(x: 20.62, y: 29.25), controlPoint1: CGPoint(x: 20.21, y: 29.46), controlPoint2: CGPoint(x: 20.41, y: 29.35))
            bezier2Path.addCurve(to: CGPoint(x: 24.43, y: 27.41), controlPoint1: CGPoint(x: 21.89, y: 28.64), controlPoint2: CGPoint(x: 23.16, y: 28.03))
            bezier2Path.addCurve(to: CGPoint(x: 25.15, y: 26.2), controlPoint1: CGPoint(x: 24.95, y: 27.16), controlPoint2: CGPoint(x: 25.23, y: 26.7))
            bezier2Path.addCurve(to: CGPoint(x: 24.69, y: 23.56), controlPoint1: CGPoint(x: 25.01, y: 25.32), controlPoint2: CGPoint(x: 24.86, y: 24.43))
            bezier2Path.addCurve(to: CGPoint(x: 24.9, y: 22.59), controlPoint1: CGPoint(x: 24.61, y: 23.19), controlPoint2: CGPoint(x: 24.62, y: 22.89))
            bezier2Path.addCurve(to: CGPoint(x: 25.56, y: 22.25), controlPoint1: CGPoint(x: 25.1, y: 22.38), controlPoint2: CGPoint(x: 25.27, y: 22.26))
            bezier2Path.addCurve(to: CGPoint(x: 28.27, y: 22.1), controlPoint1: CGPoint(x: 26.46, y: 22.21), controlPoint2: CGPoint(x: 27.37, y: 22.15))
            bezier2Path.addCurve(to: CGPoint(x: 29.43, y: 21.18), controlPoint1: CGPoint(x: 28.89, y: 22.07), controlPoint2: CGPoint(x: 29.29, y: 21.78))
            bezier2Path.addCurve(to: CGPoint(x: 30.53, y: 16.35), controlPoint1: CGPoint(x: 29.8, y: 19.57), controlPoint2: CGPoint(x: 30.17, y: 17.96))
            bezier2Path.addCurve(to: CGPoint(x: 29.89, y: 14.97), controlPoint1: CGPoint(x: 30.67, y: 15.72), controlPoint2: CGPoint(x: 30.46, y: 15.29))
            bezier2Path.addLine(to: CGPoint(x: 29.89, y: 14.97))
            bezier2Path.close()
            bezier2Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier2Path.lineWidth = 1
            bezier2Path.stroke()
            
            //// Oval Drawing
            let ovalPath = UIBezierPath(ovalIn: CGRect(x: 13.05, y: 12.6, width: 5.9, height: 5.9))
            strokeColor.setStroke()
            ovalPath.lineWidth = 1
            ovalPath.stroke()
            
            
            //// Oval 2 Drawing
            let oval2Path = UIBezierPath(ovalIn: CGRect(x: 10.7, y: 10.35, width: 10.6, height: 10.5))
            strokeColor.setStroke()
            oval2Path.lineWidth = 1
            oval2Path.stroke()
        }
        else if(type == "Help"){
            
            //// PaintCode Trial Version
            //// www.paintcodeapp.com
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 25, height: 25), false, 0)
            //// Color Declarations
            let strokeColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
            let strokeColor2 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
            
            //// Page-1
            //// Fill-3 Drawing
            let fill3Path = UIBezierPath()
            fill3Path.move(to: CGPoint(x: 21.93, y: 8.51))
            fill3Path.addLine(to: CGPoint(x: 18.62, y: 9.52))
            fill3Path.addCurve(to: CGPoint(x: 17.21, y: 7.48), controlPoint1: CGPoint(x: 18.28, y: 8.77), controlPoint2: CGPoint(x: 17.81, y: 8.09))
            fill3Path.addCurve(to: CGPoint(x: 15.17, y: 6.07), controlPoint1: CGPoint(x: 16.61, y: 6.88), controlPoint2: CGPoint(x: 15.92, y: 6.41))
            fill3Path.addLine(to: CGPoint(x: 16.18, y: 2.77))
            fill3Path.addCurve(to: CGPoint(x: 19.64, y: 5.05), controlPoint1: CGPoint(x: 17.46, y: 3.28), controlPoint2: CGPoint(x: 18.63, y: 4.05))
            fill3Path.addCurve(to: CGPoint(x: 21.93, y: 8.51), controlPoint1: CGPoint(x: 20.64, y: 6.06), controlPoint2: CGPoint(x: 21.41, y: 7.23))
            fill3Path.close()
            fill3Path.miterLimit = 4;
            
            fill3Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            fill3Path.lineWidth = 0.5
            fill3Path.stroke()
            
            
            //// Stroke-7 Drawing
            let stroke7Path = UIBezierPath(ovalIn: CGRect(x: 7.2, y: 7.2, width: 10.3, height: 10.3))
            strokeColor.setStroke()
            stroke7Path.lineWidth = 0.5
            stroke7Path.stroke()
            
            
            //// Fill-9 Drawing
            let fill9Path = UIBezierPath()
            fill9Path.move(to: CGPoint(x: 8.51, y: 2.77))
            fill9Path.addLine(to: CGPoint(x: 9.53, y: 6.08))
            fill9Path.addCurve(to: CGPoint(x: 7.48, y: 7.49), controlPoint1: CGPoint(x: 8.77, y: 6.42), controlPoint2: CGPoint(x: 8.09, y: 6.89))
            fill9Path.addCurve(to: CGPoint(x: 6.07, y: 9.53), controlPoint1: CGPoint(x: 6.88, y: 8.09), controlPoint2: CGPoint(x: 6.41, y: 8.78))
            fill9Path.addLine(to: CGPoint(x: 2.77, y: 8.52))
            fill9Path.addCurve(to: CGPoint(x: 5.06, y: 5.06), controlPoint1: CGPoint(x: 3.28, y: 7.23), controlPoint2: CGPoint(x: 4.06, y: 6.06))
            fill9Path.addCurve(to: CGPoint(x: 8.51, y: 2.77), controlPoint1: CGPoint(x: 6.06, y: 4.05), controlPoint2: CGPoint(x: 7.23, y: 3.28))
            fill9Path.close()
            fill9Path.miterLimit = 4;
            
            fill9Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            fill9Path.lineWidth = 0.5
            fill9Path.stroke()
            
            
            //// Fill-13 Drawing
            let fill13Path = UIBezierPath()
            fill13Path.move(to: CGPoint(x: 2.77, y: 16.19))
            fill13Path.addLine(to: CGPoint(x: 6.08, y: 15.17))
            fill13Path.addCurve(to: CGPoint(x: 7.49, y: 17.22), controlPoint1: CGPoint(x: 6.42, y: 15.93), controlPoint2: CGPoint(x: 6.89, y: 16.61))
            fill13Path.addCurve(to: CGPoint(x: 9.53, y: 18.63), controlPoint1: CGPoint(x: 8.09, y: 17.82), controlPoint2: CGPoint(x: 8.78, y: 18.29))
            fill13Path.addLine(to: CGPoint(x: 8.52, y: 21.93))
            fill13Path.addCurve(to: CGPoint(x: 5.06, y: 19.65), controlPoint1: CGPoint(x: 7.24, y: 21.42), controlPoint2: CGPoint(x: 6.07, y: 20.65))
            fill13Path.addCurve(to: CGPoint(x: 2.77, y: 16.19), controlPoint1: CGPoint(x: 4.06, y: 18.64), controlPoint2: CGPoint(x: 3.29, y: 17.47))
            fill13Path.close()
            fill13Path.miterLimit = 4;
            
            fill13Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            fill13Path.lineWidth = 0.5
            fill13Path.stroke()
            
            
            //// Fill-17 Drawing
            let fill17Path = UIBezierPath()
            fill17Path.move(to: CGPoint(x: 16.19, y: 21.93))
            fill17Path.addLine(to: CGPoint(x: 15.17, y: 18.62))
            fill17Path.addCurve(to: CGPoint(x: 17.22, y: 17.21), controlPoint1: CGPoint(x: 15.93, y: 18.28), controlPoint2: CGPoint(x: 16.61, y: 17.81))
            fill17Path.addCurve(to: CGPoint(x: 18.63, y: 15.17), controlPoint1: CGPoint(x: 17.82, y: 16.61), controlPoint2: CGPoint(x: 18.29, y: 15.92))
            fill17Path.addLine(to: CGPoint(x: 21.93, y: 16.18))
            fill17Path.addCurve(to: CGPoint(x: 19.64, y: 19.64), controlPoint1: CGPoint(x: 21.42, y: 17.47), controlPoint2: CGPoint(x: 20.64, y: 18.64))
            fill17Path.addCurve(to: CGPoint(x: 16.19, y: 21.93), controlPoint1: CGPoint(x: 18.64, y: 20.65), controlPoint2: CGPoint(x: 17.47, y: 21.42))
            fill17Path.close()
            fill17Path.miterLimit = 4;
            
            fill17Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            fill17Path.lineWidth = 0.5
            fill17Path.stroke()
            
            //// Stroke-1 Drawing
            let stroke1Path = UIBezierPath(ovalIn: CGRect(x: 0.3, y: 0.3, width: 24.1, height: 24.1))
            strokeColor.setStroke()
            stroke1Path.lineWidth = 0.5
            stroke1Path.stroke()
        }
        else if(type == "Right"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 30), false, 0)
            let strokeColor = UIColor(red: 0.715, green: 0.723, blue: 0.733, alpha: 1.000)
            
            //// Page-1 Drawing
            let page1Path = UIBezierPath()
            page1Path.move(to: CGPoint(x: 8.42, y: 27.65))
            page1Path.addCurve(to: CGPoint(x: 6, y: 24.32), controlPoint1: CGPoint(x: 7.61, y: 26.54), controlPoint2: CGPoint(x: 6.8, y: 25.43))
            page1Path.addCurve(to: CGPoint(x: 2.74, y: 19.86), controlPoint1: CGPoint(x: 4.91, y: 22.84), controlPoint2: CGPoint(x: 3.83, y: 21.35))
            page1Path.addCurve(to: CGPoint(x: 1.06, y: 17.56), controlPoint1: CGPoint(x: 2.18, y: 19.1), controlPoint2: CGPoint(x: 1.62, y: 18.33))
            page1Path.addCurve(to: CGPoint(x: 1, y: 17.46), controlPoint1: CGPoint(x: 1.04, y: 17.53), controlPoint2: CGPoint(x: 1.02, y: 17.5))
            page1Path.addCurve(to: CGPoint(x: 1.02, y: 17.44), controlPoint1: CGPoint(x: 1.01, y: 17.46), controlPoint2: CGPoint(x: 1.01, y: 17.45))
            page1Path.addCurve(to: CGPoint(x: 7.32, y: 21.65), controlPoint1: CGPoint(x: 3.12, y: 18.84), controlPoint2: CGPoint(x: 5.21, y: 20.24))
            page1Path.addCurve(to: CGPoint(x: 7.63, y: 21.15), controlPoint1: CGPoint(x: 7.42, y: 21.48), controlPoint2: CGPoint(x: 7.52, y: 21.32))
            page1Path.addCurve(to: CGPoint(x: 12.19, y: 14.37), controlPoint1: CGPoint(x: 9.05, y: 18.82), controlPoint2: CGPoint(x: 10.55, y: 16.55))
            page1Path.addCurve(to: CGPoint(x: 14.61, y: 11.28), controlPoint1: CGPoint(x: 12.98, y: 13.33), controlPoint2: CGPoint(x: 13.78, y: 12.29))
            page1Path.addCurve(to: CGPoint(x: 19.07, y: 6.41), controlPoint1: CGPoint(x: 16, y: 9.57), controlPoint2: CGPoint(x: 17.49, y: 7.95))
            page1Path.addCurve(to: CGPoint(x: 21.78, y: 3.98), controlPoint1: CGPoint(x: 19.94, y: 5.57), controlPoint2: CGPoint(x: 20.84, y: 4.75))
            page1Path.addCurve(to: CGPoint(x: 24.18, y: 2.18), controlPoint1: CGPoint(x: 22.56, y: 3.34), controlPoint2: CGPoint(x: 23.35, y: 2.74))
            page1Path.addCurve(to: CGPoint(x: 24.27, y: 2.13), controlPoint1: CGPoint(x: 24.21, y: 2.16), controlPoint2: CGPoint(x: 24.24, y: 2.15))
            page1Path.addCurve(to: CGPoint(x: 24.29, y: 2.15), controlPoint1: CGPoint(x: 24.27, y: 2.14), controlPoint2: CGPoint(x: 24.28, y: 2.14))
            page1Path.addCurve(to: CGPoint(x: 24.2, y: 2.26), controlPoint1: CGPoint(x: 24.26, y: 2.19), controlPoint2: CGPoint(x: 24.23, y: 2.23))
            page1Path.addCurve(to: CGPoint(x: 22.98, y: 3.61), controlPoint1: CGPoint(x: 23.79, y: 2.71), controlPoint2: CGPoint(x: 23.38, y: 3.16))
            page1Path.addCurve(to: CGPoint(x: 21.36, y: 5.51), controlPoint1: CGPoint(x: 22.43, y: 4.24), controlPoint2: CGPoint(x: 21.88, y: 4.87))
            page1Path.addCurve(to: CGPoint(x: 19.24, y: 8.19), controlPoint1: CGPoint(x: 20.64, y: 6.39), controlPoint2: CGPoint(x: 19.93, y: 7.28))
            page1Path.addCurve(to: CGPoint(x: 14.31, y: 15.63), controlPoint1: CGPoint(x: 17.44, y: 10.57), controlPoint2: CGPoint(x: 15.81, y: 13.06))
            page1Path.addCurve(to: CGPoint(x: 10.29, y: 23.42), controlPoint1: CGPoint(x: 12.84, y: 18.16), controlPoint2: CGPoint(x: 11.5, y: 20.76))
            page1Path.addCurve(to: CGPoint(x: 8.45, y: 27.62), controlPoint1: CGPoint(x: 9.65, y: 24.81), controlPoint2: CGPoint(x: 9.06, y: 26.22))
            page1Path.addCurve(to: CGPoint(x: 8.44, y: 27.65), controlPoint1: CGPoint(x: 8.44, y: 27.63), controlPoint2: CGPoint(x: 8.44, y: 27.64))
            page1Path.addLine(to: CGPoint(x: 8.42, y: 27.65))
            page1Path.addLine(to: CGPoint(x: 8.42, y: 27.65))
            page1Path.close()
            page1Path.miterLimit = 4;
            
            strokeColor.setStroke()
            page1Path.lineWidth = 1
            page1Path.stroke()
        }
            
        else if(type == "About Us"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 13), false, 0)
            
            //// Color Declarations
            let strokeColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
            
            //// Page-1
            //// Stroke-1 Drawing
            let stroke1Path = UIBezierPath()
            stroke1Path.move(to: CGPoint(x: 19.52, y: 1.22))
            stroke1Path.addLine(to: CGPoint(x: 26.4, y: 11.21))
            stroke1Path.addLine(to: CGPoint(x: 26.44, y: 11.21))
            stroke1Path.addLine(to: CGPoint(x: 26.44, y: 1.22))
            stroke1Path.addLine(to: CGPoint(x: 27.56, y: 1.22))
            stroke1Path.addLine(to: CGPoint(x: 27.56, y: 13.03))
            stroke1Path.addLine(to: CGPoint(x: 26.3, y: 13.03))
            stroke1Path.addLine(to: CGPoint(x: 19.42, y: 3.04))
            stroke1Path.addLine(to: CGPoint(x: 19.39, y: 3.04))
            stroke1Path.addLine(to: CGPoint(x: 19.39, y: 13.03))
            stroke1Path.addLine(to: CGPoint(x: 18.27, y: 13.03))
            stroke1Path.addLine(to: CGPoint(x: 18.27, y: 1.22))
            stroke1Path.addLine(to: CGPoint(x: 19.52, y: 1.22))
            stroke1Path.close()
            stroke1Path.miterLimit = 4;
            
            stroke1Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke1Path.lineWidth = 0.5
            stroke1Path.stroke()
            
            
            //// Stroke-3 Drawing
            let stroke3Path = UIBezierPath()
            stroke3Path.move(to: CGPoint(x: 1.13, y: 12.8))
            stroke3Path.addCurve(to: CGPoint(x: 1.43, y: 11.28), controlPoint1: CGPoint(x: 1.14, y: 12.23), controlPoint2: CGPoint(x: 1.24, y: 11.72))
            stroke3Path.addCurve(to: CGPoint(x: 2.17, y: 10.09), controlPoint1: CGPoint(x: 1.61, y: 10.84), controlPoint2: CGPoint(x: 1.86, y: 10.44))
            stroke3Path.addCurve(to: CGPoint(x: 3.21, y: 9.12), controlPoint1: CGPoint(x: 2.48, y: 9.74), controlPoint2: CGPoint(x: 2.83, y: 9.41))
            stroke3Path.addCurve(to: CGPoint(x: 4.4, y: 8.28), controlPoint1: CGPoint(x: 3.6, y: 8.83), controlPoint2: CGPoint(x: 3.99, y: 8.55))
            stroke3Path.addCurve(to: CGPoint(x: 5.62, y: 7.45), controlPoint1: CGPoint(x: 4.81, y: 8.01), controlPoint2: CGPoint(x: 5.21, y: 7.73))
            stroke3Path.addCurve(to: CGPoint(x: 6.7, y: 6.55), controlPoint1: CGPoint(x: 6.02, y: 7.17), controlPoint2: CGPoint(x: 6.38, y: 6.87))
            stroke3Path.addCurve(to: CGPoint(x: 7.42, y: 5.57), controlPoint1: CGPoint(x: 7.02, y: 6.23), controlPoint2: CGPoint(x: 7.26, y: 5.9))
            stroke3Path.addCurve(to: CGPoint(x: 7.66, y: 4.37), controlPoint1: CGPoint(x: 7.58, y: 5.23), controlPoint2: CGPoint(x: 7.66, y: 4.83))
            stroke3Path.addCurve(to: CGPoint(x: 7.45, y: 3.37), controlPoint1: CGPoint(x: 7.66, y: 3.99), controlPoint2: CGPoint(x: 7.59, y: 3.66))
            stroke3Path.addCurve(to: CGPoint(x: 6.89, y: 2.62), controlPoint1: CGPoint(x: 7.32, y: 3.07), controlPoint2: CGPoint(x: 7.13, y: 2.83))
            stroke3Path.addCurve(to: CGPoint(x: 6.06, y: 2.16), controlPoint1: CGPoint(x: 6.65, y: 2.42), controlPoint2: CGPoint(x: 6.38, y: 2.26))
            stroke3Path.addCurve(to: CGPoint(x: 5.06, y: 2), controlPoint1: CGPoint(x: 5.75, y: 2.05), controlPoint2: CGPoint(x: 5.42, y: 2))
            stroke3Path.addCurve(to: CGPoint(x: 3.85, y: 2.27), controlPoint1: CGPoint(x: 4.59, y: 2), controlPoint2: CGPoint(x: 4.18, y: 2.09))
            stroke3Path.addCurve(to: CGPoint(x: 3.03, y: 2.98), controlPoint1: CGPoint(x: 3.51, y: 2.44), controlPoint2: CGPoint(x: 3.24, y: 2.68))
            stroke3Path.addCurve(to: CGPoint(x: 2.57, y: 4), controlPoint1: CGPoint(x: 2.82, y: 3.28), controlPoint2: CGPoint(x: 2.67, y: 3.62))
            stroke3Path.addCurve(to: CGPoint(x: 2.45, y: 5.23), controlPoint1: CGPoint(x: 2.48, y: 4.39), controlPoint2: CGPoint(x: 2.44, y: 4.8))
            stroke3Path.addLine(to: CGPoint(x: 1.41, y: 5.23))
            stroke3Path.addCurve(to: CGPoint(x: 1.62, y: 3.58), controlPoint1: CGPoint(x: 1.4, y: 4.63), controlPoint2: CGPoint(x: 1.47, y: 4.08))
            stroke3Path.addCurve(to: CGPoint(x: 2.3, y: 2.28), controlPoint1: CGPoint(x: 1.76, y: 3.08), controlPoint2: CGPoint(x: 1.99, y: 2.65))
            stroke3Path.addCurve(to: CGPoint(x: 3.47, y: 1.43), controlPoint1: CGPoint(x: 2.61, y: 1.92), controlPoint2: CGPoint(x: 3, y: 1.64))
            stroke3Path.addCurve(to: CGPoint(x: 5.11, y: 1.12), controlPoint1: CGPoint(x: 3.94, y: 1.23), controlPoint2: CGPoint(x: 4.48, y: 1.12))
            stroke3Path.addCurve(to: CGPoint(x: 6.53, y: 1.33), controlPoint1: CGPoint(x: 5.62, y: 1.12), controlPoint2: CGPoint(x: 6.09, y: 1.19))
            stroke3Path.addCurve(to: CGPoint(x: 7.67, y: 1.94), controlPoint1: CGPoint(x: 6.96, y: 1.47), controlPoint2: CGPoint(x: 7.34, y: 1.67))
            stroke3Path.addCurve(to: CGPoint(x: 8.43, y: 2.96), controlPoint1: CGPoint(x: 7.99, y: 2.21), controlPoint2: CGPoint(x: 8.25, y: 2.55))
            stroke3Path.addCurve(to: CGPoint(x: 8.7, y: 4.38), controlPoint1: CGPoint(x: 8.61, y: 3.37), controlPoint2: CGPoint(x: 8.7, y: 3.84))
            stroke3Path.addCurve(to: CGPoint(x: 8.46, y: 5.71), controlPoint1: CGPoint(x: 8.7, y: 4.87), controlPoint2: CGPoint(x: 8.62, y: 5.31))
            stroke3Path.addCurve(to: CGPoint(x: 7.82, y: 6.8), controlPoint1: CGPoint(x: 8.3, y: 6.1), controlPoint2: CGPoint(x: 8.09, y: 6.47))
            stroke3Path.addCurve(to: CGPoint(x: 6.89, y: 7.72), controlPoint1: CGPoint(x: 7.55, y: 7.13), controlPoint2: CGPoint(x: 7.24, y: 7.43))
            stroke3Path.addCurve(to: CGPoint(x: 5.79, y: 8.5), controlPoint1: CGPoint(x: 6.54, y: 8), controlPoint2: CGPoint(x: 6.18, y: 8.26))
            stroke3Path.addCurve(to: CGPoint(x: 4.82, y: 9.12), controlPoint1: CGPoint(x: 5.52, y: 8.69), controlPoint2: CGPoint(x: 5.19, y: 8.9))
            stroke3Path.addCurve(to: CGPoint(x: 3.73, y: 9.87), controlPoint1: CGPoint(x: 4.44, y: 9.35), controlPoint2: CGPoint(x: 4.08, y: 9.6))
            stroke3Path.addCurve(to: CGPoint(x: 2.81, y: 10.78), controlPoint1: CGPoint(x: 3.39, y: 10.15), controlPoint2: CGPoint(x: 3.08, y: 10.45))
            stroke3Path.addCurve(to: CGPoint(x: 2.32, y: 11.84), controlPoint1: CGPoint(x: 2.55, y: 11.1), controlPoint2: CGPoint(x: 2.38, y: 11.46))
            stroke3Path.addLine(to: CGPoint(x: 8.75, y: 11.84))
            stroke3Path.addLine(to: CGPoint(x: 8.75, y: 12.8))
            stroke3Path.addLine(to: CGPoint(x: 1.13, y: 12.8))
            stroke3Path.addLine(to: CGPoint(x: 1.13, y: 12.8))
            stroke3Path.close()
            stroke3Path.miterLimit = 4;
            
            stroke3Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke3Path.lineWidth = 0.5
            stroke3Path.stroke()
            
            
            //// Stroke-5 Drawing
            let stroke5Path = UIBezierPath()
            stroke5Path.move(to: CGPoint(x: 12.56, y: 3.38))
            stroke5Path.addCurve(to: CGPoint(x: 13.52, y: 3.11), controlPoint1: CGPoint(x: 12.93, y: 3.34), controlPoint2: CGPoint(x: 13.25, y: 3.25))
            stroke5Path.addCurve(to: CGPoint(x: 14.2, y: 2.46), controlPoint1: CGPoint(x: 13.79, y: 2.97), controlPoint2: CGPoint(x: 14.02, y: 2.75))
            stroke5Path.addCurve(to: CGPoint(x: 14.59, y: 1.22), controlPoint1: CGPoint(x: 14.38, y: 2.16), controlPoint2: CGPoint(x: 14.51, y: 1.75))
            stroke5Path.addLine(to: CGPoint(x: 15.43, y: 1.22))
            stroke5Path.addLine(to: CGPoint(x: 15.43, y: 12.8))
            stroke5Path.addLine(to: CGPoint(x: 14.39, y: 12.8))
            stroke5Path.addLine(to: CGPoint(x: 14.39, y: 4.2))
            stroke5Path.addLine(to: CGPoint(x: 11.33, y: 4.2))
            stroke5Path.addLine(to: CGPoint(x: 11.33, y: 3.46))
            stroke5Path.addCurve(to: CGPoint(x: 12.56, y: 3.38), controlPoint1: CGPoint(x: 11.78, y: 3.45), controlPoint2: CGPoint(x: 12.19, y: 3.42))
            stroke5Path.addLine(to: CGPoint(x: 12.56, y: 3.38))
            stroke5Path.close()
            stroke5Path.miterLimit = 4;
            
            stroke5Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke5Path.lineWidth = 0.5
            stroke5Path.stroke()
            
        }
        else if(type == "Sharing"){
            //// Color Declarations
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 30), false, 0)
            let strokeColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
            
            //// Page-1 Drawing
            let page1Path = UIBezierPath()
            page1Path.move(to: CGPoint(x: 22.25, y: 19.6))
            page1Path.addCurve(to: CGPoint(x: 24.59, y: 21.93), controlPoint1: CGPoint(x: 23.51, y: 19.6), controlPoint2: CGPoint(x: 24.59, y: 20.67))
            page1Path.addCurve(to: CGPoint(x: 22.22, y: 24.28), controlPoint1: CGPoint(x: 24.59, y: 23.21), controlPoint2: CGPoint(x: 23.5, y: 24.3))
            page1Path.addCurve(to: CGPoint(x: 19.9, y: 21.93), controlPoint1: CGPoint(x: 20.95, y: 24.27), controlPoint2: CGPoint(x: 19.89, y: 23.18))
            page1Path.addCurve(to: CGPoint(x: 22.25, y: 19.6), controlPoint1: CGPoint(x: 19.91, y: 20.67), controlPoint2: CGPoint(x: 20.99, y: 19.6))
            page1Path.addLine(to: CGPoint(x: 22.25, y: 19.6))
            page1Path.close()
            page1Path.move(to: CGPoint(x: 5.08, y: 15.69))
            page1Path.addCurve(to: CGPoint(x: 2.71, y: 13.38), controlPoint1: CGPoint(x: 3.82, y: 15.71), controlPoint2: CGPoint(x: 2.74, y: 14.65))
            page1Path.addCurve(to: CGPoint(x: 5.06, y: 11), controlPoint1: CGPoint(x: 2.69, y: 12.11), controlPoint2: CGPoint(x: 3.78, y: 11))
            page1Path.addCurve(to: CGPoint(x: 7.4, y: 13.34), controlPoint1: CGPoint(x: 6.32, y: 11.01), controlPoint2: CGPoint(x: 7.4, y: 12.08))
            page1Path.addCurve(to: CGPoint(x: 5.08, y: 15.69), controlPoint1: CGPoint(x: 7.41, y: 14.6), controlPoint2: CGPoint(x: 6.35, y: 15.67))
            page1Path.addLine(to: CGPoint(x: 5.08, y: 15.69))
            page1Path.close()
            page1Path.move(to: CGPoint(x: 22.27, y: 2.41))
            page1Path.addCurve(to: CGPoint(x: 24.59, y: 4.76), controlPoint1: CGPoint(x: 23.53, y: 2.43), controlPoint2: CGPoint(x: 24.6, y: 3.51))
            page1Path.addCurve(to: CGPoint(x: 22.25, y: 7.1), controlPoint1: CGPoint(x: 24.58, y: 6.03), controlPoint2: CGPoint(x: 23.51, y: 7.09))
            page1Path.addCurve(to: CGPoint(x: 19.9, y: 4.72), controlPoint1: CGPoint(x: 20.97, y: 7.1), controlPoint2: CGPoint(x: 19.88, y: 5.99))
            page1Path.addCurve(to: CGPoint(x: 22.27, y: 2.41), controlPoint1: CGPoint(x: 19.93, y: 3.45), controlPoint2: CGPoint(x: 21.01, y: 2.4))
            page1Path.addLine(to: CGPoint(x: 22.27, y: 2.41))
            page1Path.close()
            page1Path.move(to: CGPoint(x: 9.25, y: 11.93))
            page1Path.addCurve(to: CGPoint(x: 18.61, y: 7.25), controlPoint1: CGPoint(x: 12.38, y: 10.38), controlPoint2: CGPoint(x: 15.5, y: 8.82))
            page1Path.addCurve(to: CGPoint(x: 19.38, y: 7.39), controlPoint1: CGPoint(x: 18.95, y: 7.08), controlPoint2: CGPoint(x: 19.12, y: 7.12))
            page1Path.addCurve(to: CGPoint(x: 25.21, y: 7.27), controlPoint1: CGPoint(x: 21, y: 9.14), controlPoint2: CGPoint(x: 23.7, y: 9.11))
            page1Path.addCurve(to: CGPoint(x: 26.15, y: 5.44), controlPoint1: CGPoint(x: 25.64, y: 6.75), controlPoint2: CGPoint(x: 25.84, y: 6.05))
            page1Path.addLine(to: CGPoint(x: 26.15, y: 4.07))
            page1Path.addCurve(to: CGPoint(x: 24.96, y: 1.93), controlPoint1: CGPoint(x: 25.9, y: 3.28), controlPoint2: CGPoint(x: 25.58, y: 2.53))
            page1Path.addCurve(to: CGPoint(x: 22.93, y: 0.85), controlPoint1: CGPoint(x: 24.38, y: 1.37), controlPoint2: CGPoint(x: 23.67, y: 1.1))
            page1Path.addLine(to: CGPoint(x: 21.56, y: 0.85))
            page1Path.addCurve(to: CGPoint(x: 21.4, y: 0.94), controlPoint1: CGPoint(x: 21.51, y: 0.88), controlPoint2: CGPoint(x: 21.46, y: 0.92))
            page1Path.addCurve(to: CGPoint(x: 18.41, y: 4.05), controlPoint1: CGPoint(x: 19.76, y: 1.36), controlPoint2: CGPoint(x: 18.74, y: 2.4))
            page1Path.addCurve(to: CGPoint(x: 18.4, y: 5.58), controlPoint1: CGPoint(x: 18.32, y: 4.54), controlPoint2: CGPoint(x: 18.4, y: 5.07))
            page1Path.addCurve(to: CGPoint(x: 18.21, y: 5.69), controlPoint1: CGPoint(x: 18.32, y: 5.63), controlPoint2: CGPoint(x: 18.26, y: 5.67))
            page1Path.addCurve(to: CGPoint(x: 8.33, y: 10.64), controlPoint1: CGPoint(x: 14.91, y: 7.34), controlPoint2: CGPoint(x: 11.62, y: 8.98))
            page1Path.addCurve(to: CGPoint(x: 7.72, y: 10.49), controlPoint1: CGPoint(x: 8.04, y: 10.79), controlPoint2: CGPoint(x: 7.91, y: 10.67))
            page1Path.addCurve(to: CGPoint(x: 2.24, y: 10.63), controlPoint1: CGPoint(x: 6.16, y: 9.02), controlPoint2: CGPoint(x: 3.74, y: 9.1))
            page1Path.addCurve(to: CGPoint(x: 1.15, y: 12.66), controlPoint1: CGPoint(x: 1.68, y: 11.21), controlPoint2: CGPoint(x: 1.4, y: 11.93))
            page1Path.addLine(to: CGPoint(x: 1.15, y: 14.03))
            page1Path.addCurve(to: CGPoint(x: 1.25, y: 14.24), controlPoint1: CGPoint(x: 1.19, y: 14.1), controlPoint2: CGPoint(x: 1.23, y: 14.17))
            page1Path.addCurve(to: CGPoint(x: 7.78, y: 16.13), controlPoint1: CGPoint(x: 2.04, y: 17.24), controlPoint2: CGPoint(x: 5.51, y: 18.25))
            page1Path.addCurve(to: CGPoint(x: 8.42, y: 16.1), controlPoint1: CGPoint(x: 8.04, y: 15.89), controlPoint2: CGPoint(x: 8.2, y: 15.99))
            page1Path.addCurve(to: CGPoint(x: 18.03, y: 20.91), controlPoint1: CGPoint(x: 11.62, y: 17.71), controlPoint2: CGPoint(x: 14.83, y: 19.31))
            page1Path.addCurve(to: CGPoint(x: 18.39, y: 21.12), controlPoint1: CGPoint(x: 18.16, y: 20.98), controlPoint2: CGPoint(x: 18.28, y: 21.05))
            page1Path.addCurve(to: CGPoint(x: 19.84, y: 25), controlPoint1: CGPoint(x: 18.2, y: 22.82), controlPoint2: CGPoint(x: 18.65, y: 24.14))
            page1Path.addCurve(to: CGPoint(x: 21.56, y: 25.85), controlPoint1: CGPoint(x: 20.35, y: 25.37), controlPoint2: CGPoint(x: 20.98, y: 25.57))
            page1Path.addLine(to: CGPoint(x: 22.93, y: 25.85))
            page1Path.addCurve(to: CGPoint(x: 23.61, y: 25.61), controlPoint1: CGPoint(x: 23.16, y: 25.77), controlPoint2: CGPoint(x: 23.39, y: 25.7))
            page1Path.addCurve(to: CGPoint(x: 26.04, y: 22.93), controlPoint1: CGPoint(x: 24.85, y: 25.11), controlPoint2: CGPoint(x: 25.66, y: 24.22))
            page1Path.addCurve(to: CGPoint(x: 26.15, y: 22.62), controlPoint1: CGPoint(x: 26.07, y: 22.83), controlPoint2: CGPoint(x: 26.11, y: 22.73))
            page1Path.addLine(to: CGPoint(x: 26.15, y: 21.26))
            page1Path.addCurve(to: CGPoint(x: 26.09, y: 21.18), controlPoint1: CGPoint(x: 26.13, y: 21.23), controlPoint2: CGPoint(x: 26.1, y: 21.21))
            page1Path.addCurve(to: CGPoint(x: 19.23, y: 19.43), controlPoint1: CGPoint(x: 25.44, y: 17.97), controlPoint2: CGPoint(x: 21.38, y: 16.9))
            page1Path.addCurve(to: CGPoint(x: 18.75, y: 19.49), controlPoint1: CGPoint(x: 19.15, y: 19.52), controlPoint2: CGPoint(x: 18.87, y: 19.55))
            page1Path.addCurve(to: CGPoint(x: 9.12, y: 14.7), controlPoint1: CGPoint(x: 15.54, y: 17.9), controlPoint2: CGPoint(x: 12.33, y: 16.29))
            page1Path.addCurve(to: CGPoint(x: 8.87, y: 14.17), controlPoint1: CGPoint(x: 8.86, y: 14.57), controlPoint2: CGPoint(x: 8.84, y: 14.43))
            page1Path.addCurve(to: CGPoint(x: 8.88, y: 12.62), controlPoint1: CGPoint(x: 8.91, y: 13.66), controlPoint2: CGPoint(x: 8.96, y: 13.13))
            page1Path.addCurve(to: CGPoint(x: 9.25, y: 11.93), controlPoint1: CGPoint(x: 8.82, y: 12.24), controlPoint2: CGPoint(x: 8.92, y: 12.09))
            page1Path.addLine(to: CGPoint(x: 9.25, y: 11.93))
            page1Path.close()
            page1Path.miterLimit = 4;
            
            strokeColor.setStroke()
            page1Path.lineWidth = 0.5
            page1Path.stroke()
        }
        else if(type == "Partner"){
            
            //// PaintCode Trial Version
            //// www.paintcodeapp.com
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 25, height: 17), false, 0)
            //// Color Declarations
            let strokeColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
            
            //// Page-1
            //// Stroke-1 Drawing
            let stroke1Path = UIBezierPath()
            stroke1Path.move(to: CGPoint(x: 13.48, y: 1.62))
            stroke1Path.addCurve(to: CGPoint(x: 12.05, y: 1.42), controlPoint1: CGPoint(x: 12.99, y: 1.47), controlPoint2: CGPoint(x: 12.52, y: 1.42))
            stroke1Path.addCurve(to: CGPoint(x: 8.98, y: 1.88), controlPoint1: CGPoint(x: 11, y: 1.4), controlPoint2: CGPoint(x: 9.98, y: 1.59))
            stroke1Path.addCurve(to: CGPoint(x: 7.91, y: 2.22), controlPoint1: CGPoint(x: 8.62, y: 1.98), controlPoint2: CGPoint(x: 8.27, y: 2.13))
            stroke1Path.addCurve(to: CGPoint(x: 6.34, y: 2.31), controlPoint1: CGPoint(x: 7.4, y: 2.34), controlPoint2: CGPoint(x: 6.87, y: 2.37))
            stroke1Path.addCurve(to: CGPoint(x: 4.97, y: 1.69), controlPoint1: CGPoint(x: 5.83, y: 2.25), controlPoint2: CGPoint(x: 5.35, y: 2.08))
            stroke1Path.addCurve(to: CGPoint(x: 4.62, y: 1.42), controlPoint1: CGPoint(x: 4.87, y: 1.59), controlPoint2: CGPoint(x: 4.75, y: 1.5))
            stroke1Path.addCurve(to: CGPoint(x: 3.78, y: 1.61), controlPoint1: CGPoint(x: 4.31, y: 1.25), controlPoint2: CGPoint(x: 4, y: 1.32))
            stroke1Path.addCurve(to: CGPoint(x: 3.58, y: 1.98), controlPoint1: CGPoint(x: 3.7, y: 1.72), controlPoint2: CGPoint(x: 3.63, y: 1.85))
            stroke1Path.addCurve(to: CGPoint(x: 1.67, y: 6.52), controlPoint1: CGPoint(x: 2.94, y: 3.49), controlPoint2: CGPoint(x: 2.31, y: 5))
            stroke1Path.addCurve(to: CGPoint(x: 1.19, y: 7.67), controlPoint1: CGPoint(x: 1.51, y: 6.9), controlPoint2: CGPoint(x: 1.35, y: 7.28))
            stroke1Path.addCurve(to: CGPoint(x: 4, y: 10), controlPoint1: CGPoint(x: 2.31, y: 8.2), controlPoint2: CGPoint(x: 3.2, y: 9.01))
            stroke1Path.addCurve(to: CGPoint(x: 4.11, y: 9.86), controlPoint1: CGPoint(x: 4.04, y: 9.94), controlPoint2: CGPoint(x: 4.07, y: 9.89))
            stroke1Path.addCurve(to: CGPoint(x: 5.58, y: 8.35), controlPoint1: CGPoint(x: 4.6, y: 9.35), controlPoint2: CGPoint(x: 5.08, y: 8.84))
            stroke1Path.addCurve(to: CGPoint(x: 7.13, y: 8.01), controlPoint1: CGPoint(x: 6.03, y: 7.92), controlPoint2: CGPoint(x: 6.56, y: 7.8))
            stroke1Path.addCurve(to: CGPoint(x: 8.13, y: 9.3), controlPoint1: CGPoint(x: 7.71, y: 8.23), controlPoint2: CGPoint(x: 8.04, y: 8.67))
            stroke1Path.addCurve(to: CGPoint(x: 8.15, y: 9.6), controlPoint1: CGPoint(x: 8.14, y: 9.4), controlPoint2: CGPoint(x: 8.14, y: 9.49))
            stroke1Path.addCurve(to: CGPoint(x: 9.58, y: 9.77), controlPoint1: CGPoint(x: 8.66, y: 9.42), controlPoint2: CGPoint(x: 9.14, y: 9.46))
            stroke1Path.addCurve(to: CGPoint(x: 10.24, y: 11.07), controlPoint1: CGPoint(x: 10.01, y: 10.08), controlPoint2: CGPoint(x: 10.22, y: 10.52))
            stroke1Path.addCurve(to: CGPoint(x: 11.75, y: 11.17), controlPoint1: CGPoint(x: 10.77, y: 10.83), controlPoint2: CGPoint(x: 11.28, y: 10.85))
            stroke1Path.addCurve(to: CGPoint(x: 12.45, y: 12.54), controlPoint1: CGPoint(x: 12.22, y: 11.48), controlPoint2: CGPoint(x: 12.44, y: 11.95))
            stroke1Path.addCurve(to: CGPoint(x: 12.61, y: 12.48), controlPoint1: CGPoint(x: 12.51, y: 12.51), controlPoint2: CGPoint(x: 12.56, y: 12.5))
            stroke1Path.addCurve(to: CGPoint(x: 13.38, y: 12.45), controlPoint1: CGPoint(x: 12.87, y: 12.4), controlPoint2: CGPoint(x: 13.13, y: 12.38))
            stroke1Path.addCurve(to: CGPoint(x: 14.51, y: 13.54), controlPoint1: CGPoint(x: 13.96, y: 12.59), controlPoint2: CGPoint(x: 14.35, y: 12.96))
            stroke1Path.addCurve(to: CGPoint(x: 14.13, y: 15.07), controlPoint1: CGPoint(x: 14.68, y: 14.12), controlPoint2: CGPoint(x: 14.54, y: 14.64))
            stroke1Path.addCurve(to: CGPoint(x: 12.7, y: 16.55), controlPoint1: CGPoint(x: 13.65, y: 15.57), controlPoint2: CGPoint(x: 13.17, y: 16.06))
            stroke1Path.addCurve(to: CGPoint(x: 12.58, y: 16.68), controlPoint1: CGPoint(x: 12.66, y: 16.58), controlPoint2: CGPoint(x: 12.63, y: 16.62))
            stroke1Path.addCurve(to: CGPoint(x: 13.99, y: 16.8), controlPoint1: CGPoint(x: 13.04, y: 16.94), controlPoint2: CGPoint(x: 13.51, y: 17.02))
            stroke1Path.addCurve(to: CGPoint(x: 14.61, y: 15.53), controlPoint1: CGPoint(x: 14.51, y: 16.55), controlPoint2: CGPoint(x: 14.68, y: 16.11))
            stroke1Path.addCurve(to: CGPoint(x: 14.69, y: 15.57), controlPoint1: CGPoint(x: 14.64, y: 15.55), controlPoint2: CGPoint(x: 14.67, y: 15.56))
            stroke1Path.addCurve(to: CGPoint(x: 15.64, y: 15.75), controlPoint1: CGPoint(x: 14.99, y: 15.72), controlPoint2: CGPoint(x: 15.31, y: 15.78))
            stroke1Path.addCurve(to: CGPoint(x: 16.71, y: 14.7), controlPoint1: CGPoint(x: 16.22, y: 15.7), controlPoint2: CGPoint(x: 16.66, y: 15.28))
            stroke1Path.addCurve(to: CGPoint(x: 16.69, y: 14.16), controlPoint1: CGPoint(x: 16.73, y: 14.52), controlPoint2: CGPoint(x: 16.7, y: 14.34))
            stroke1Path.addCurve(to: CGPoint(x: 16.8, y: 14.21), controlPoint1: CGPoint(x: 16.72, y: 14.17), controlPoint2: CGPoint(x: 16.76, y: 14.19))
            stroke1Path.addCurve(to: CGPoint(x: 17.97, y: 14.4), controlPoint1: CGPoint(x: 17.17, y: 14.4), controlPoint2: CGPoint(x: 17.56, y: 14.47))
            stroke1Path.addCurve(to: CGPoint(x: 19.06, y: 13.09), controlPoint1: CGPoint(x: 18.63, y: 14.29), controlPoint2: CGPoint(x: 19.06, y: 13.77))
            stroke1Path.addLine(to: CGPoint(x: 19.06, y: 12.87))
            stroke1Path.addCurve(to: CGPoint(x: 20.04, y: 12.98), controlPoint1: CGPoint(x: 19.39, y: 12.99), controlPoint2: CGPoint(x: 19.71, y: 13.04))
            stroke1Path.addCurve(to: CGPoint(x: 21.19, y: 11.55), controlPoint1: CGPoint(x: 20.74, y: 12.86), controlPoint2: CGPoint(x: 21.17, y: 12.32))
            stroke1Path.addCurve(to: CGPoint(x: 20.62, y: 9.94), controlPoint1: CGPoint(x: 21.2, y: 10.94), controlPoint2: CGPoint(x: 21, y: 10.41))
            stroke1Path.addCurve(to: CGPoint(x: 15.73, y: 5.46), controlPoint1: CGPoint(x: 19.21, y: 8.19), controlPoint2: CGPoint(x: 17.59, y: 6.69))
            stroke1Path.addCurve(to: CGPoint(x: 15.52, y: 5.47), controlPoint1: CGPoint(x: 15.65, y: 5.4), controlPoint2: CGPoint(x: 15.6, y: 5.41))
            stroke1Path.addCurve(to: CGPoint(x: 13.05, y: 7.4), controlPoint1: CGPoint(x: 14.7, y: 6.12), controlPoint2: CGPoint(x: 13.88, y: 6.76))
            stroke1Path.addCurve(to: CGPoint(x: 12.38, y: 7.85), controlPoint1: CGPoint(x: 12.84, y: 7.57), controlPoint2: CGPoint(x: 12.62, y: 7.74))
            stroke1Path.addCurve(to: CGPoint(x: 11.15, y: 7.91), controlPoint1: CGPoint(x: 11.99, y: 8.03), controlPoint2: CGPoint(x: 11.56, y: 7.99))
            stroke1Path.addCurve(to: CGPoint(x: 9.92, y: 7.34), controlPoint1: CGPoint(x: 10.7, y: 7.82), controlPoint2: CGPoint(x: 10.26, y: 7.67))
            stroke1Path.addCurve(to: CGPoint(x: 9.65, y: 5.32), controlPoint1: CGPoint(x: 9.29, y: 6.75), controlPoint2: CGPoint(x: 9.18, y: 5.98))
            stroke1Path.addCurve(to: CGPoint(x: 10.38, y: 4.56), controlPoint1: CGPoint(x: 9.85, y: 5.04), controlPoint2: CGPoint(x: 10.12, y: 4.8))
            stroke1Path.addCurve(to: CGPoint(x: 13.33, y: 1.82), controlPoint1: CGPoint(x: 11.36, y: 3.64), controlPoint2: CGPoint(x: 12.34, y: 2.73))
            stroke1Path.addCurve(to: CGPoint(x: 13.48, y: 1.62), controlPoint1: CGPoint(x: 13.38, y: 1.77), controlPoint2: CGPoint(x: 13.42, y: 1.7))
            stroke1Path.addLine(to: CGPoint(x: 13.48, y: 1.62))
            stroke1Path.close()
            stroke1Path.miterLimit = 4;
            
            stroke1Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke1Path.lineWidth = 0.5
            stroke1Path.stroke()
            
            //// Stroke-3 Drawing
            let stroke3Path = UIBezierPath()
            stroke3Path.move(to: CGPoint(x: 15.58, y: 4.71))
            stroke3Path.addCurve(to: CGPoint(x: 15.61, y: 4.72), controlPoint1: CGPoint(x: 15.58, y: 4.71), controlPoint2: CGPoint(x: 15.6, y: 4.71))
            stroke3Path.addCurve(to: CGPoint(x: 21.52, y: 10.21), controlPoint1: CGPoint(x: 17.91, y: 6.17), controlPoint2: CGPoint(x: 19.87, y: 8.01))
            stroke3Path.addCurve(to: CGPoint(x: 21.78, y: 10.5), controlPoint1: CGPoint(x: 21.6, y: 10.32), controlPoint2: CGPoint(x: 21.68, y: 10.42))
            stroke3Path.addCurve(to: CGPoint(x: 22.37, y: 10.45), controlPoint1: CGPoint(x: 21.99, y: 10.67), controlPoint2: CGPoint(x: 22.19, y: 10.64))
            stroke3Path.addCurve(to: CGPoint(x: 22.66, y: 10.12), controlPoint1: CGPoint(x: 22.47, y: 10.34), controlPoint2: CGPoint(x: 22.56, y: 10.22))
            stroke3Path.addCurve(to: CGPoint(x: 25.42, y: 7.85), controlPoint1: CGPoint(x: 23.51, y: 9.28), controlPoint2: CGPoint(x: 24.46, y: 8.56))
            stroke3Path.addCurve(to: CGPoint(x: 25.54, y: 7), controlPoint1: CGPoint(x: 25.71, y: 7.64), controlPoint2: CGPoint(x: 25.76, y: 7.3))
            stroke3Path.addCurve(to: CGPoint(x: 25.2, y: 6.47), controlPoint1: CGPoint(x: 25.41, y: 6.83), controlPoint2: CGPoint(x: 25.29, y: 6.66))
            stroke3Path.addCurve(to: CGPoint(x: 24.05, y: 3.98), controlPoint1: CGPoint(x: 24.81, y: 5.64), controlPoint2: CGPoint(x: 24.41, y: 4.82))
            stroke3Path.addCurve(to: CGPoint(x: 23.1, y: 1.63), controlPoint1: CGPoint(x: 23.71, y: 3.2), controlPoint2: CGPoint(x: 23.42, y: 2.41))
            stroke3Path.addCurve(to: CGPoint(x: 22.96, y: 1.44), controlPoint1: CGPoint(x: 23.08, y: 1.55), controlPoint2: CGPoint(x: 23.02, y: 1.48))
            stroke3Path.addCurve(to: CGPoint(x: 22.19, y: 1.56), controlPoint1: CGPoint(x: 22.74, y: 1.28), controlPoint2: CGPoint(x: 22.42, y: 1.33))
            stroke3Path.addCurve(to: CGPoint(x: 21.89, y: 1.84), controlPoint1: CGPoint(x: 22.1, y: 1.66), controlPoint2: CGPoint(x: 22, y: 1.77))
            stroke3Path.addCurve(to: CGPoint(x: 20.05, y: 2.36), controlPoint1: CGPoint(x: 21.33, y: 2.2), controlPoint2: CGPoint(x: 20.7, y: 2.34))
            stroke3Path.addCurve(to: CGPoint(x: 18, y: 2), controlPoint1: CGPoint(x: 19.35, y: 2.38), controlPoint2: CGPoint(x: 18.66, y: 2.23))
            stroke3Path.addCurve(to: CGPoint(x: 15.97, y: 1.28), controlPoint1: CGPoint(x: 17.32, y: 1.77), controlPoint2: CGPoint(x: 16.65, y: 1.51))
            stroke3Path.addCurve(to: CGPoint(x: 15.2, y: 1.15), controlPoint1: CGPoint(x: 15.72, y: 1.2), controlPoint2: CGPoint(x: 15.45, y: 1.14))
            stroke3Path.addCurve(to: CGPoint(x: 13.9, y: 1.96), controlPoint1: CGPoint(x: 14.62, y: 1.16), controlPoint2: CGPoint(x: 14.22, y: 1.5))
            stroke3Path.addCurve(to: CGPoint(x: 13.75, y: 2.17), controlPoint1: CGPoint(x: 13.85, y: 2.04), controlPoint2: CGPoint(x: 13.81, y: 2.12))
            stroke3Path.addCurve(to: CGPoint(x: 12.55, y: 3.3), controlPoint1: CGPoint(x: 13.35, y: 2.55), controlPoint2: CGPoint(x: 12.95, y: 2.93))
            stroke3Path.addCurve(to: CGPoint(x: 10.37, y: 5.3), controlPoint1: CGPoint(x: 11.82, y: 3.97), controlPoint2: CGPoint(x: 11.09, y: 4.63))
            stroke3Path.addCurve(to: CGPoint(x: 9.92, y: 6.06), controlPoint1: CGPoint(x: 10.15, y: 5.51), controlPoint2: CGPoint(x: 9.96, y: 5.74))
            stroke3Path.addCurve(to: CGPoint(x: 10.52, y: 7.11), controlPoint1: CGPoint(x: 9.87, y: 6.45), controlPoint2: CGPoint(x: 10.12, y: 6.89))
            stroke3Path.addCurve(to: CGPoint(x: 11.63, y: 7.4), controlPoint1: CGPoint(x: 10.87, y: 7.3), controlPoint2: CGPoint(x: 11.24, y: 7.39))
            stroke3Path.addCurve(to: CGPoint(x: 12.44, y: 7.19), controlPoint1: CGPoint(x: 11.92, y: 7.41), controlPoint2: CGPoint(x: 12.19, y: 7.38))
            stroke3Path.addCurve(to: CGPoint(x: 15.31, y: 4.94), controlPoint1: CGPoint(x: 13.39, y: 6.43), controlPoint2: CGPoint(x: 14.35, y: 5.69))
            stroke3Path.addCurve(to: CGPoint(x: 15.58, y: 4.71), controlPoint1: CGPoint(x: 15.4, y: 4.87), controlPoint2: CGPoint(x: 15.48, y: 4.79))
            stroke3Path.addLine(to: CGPoint(x: 15.58, y: 4.71))
            stroke3Path.close()
            stroke3Path.miterLimit = 4;
            
            stroke3Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke3Path.lineWidth = 0.5
            stroke3Path.stroke()
            
            
            //// Stroke-5 Drawing
            let stroke5Path = UIBezierPath()
            stroke5Path.move(to: CGPoint(x: 3.81, y: 11.36))
            stroke5Path.addCurve(to: CGPoint(x: 4.4, y: 12.3), controlPoint1: CGPoint(x: 3.81, y: 11.79), controlPoint2: CGPoint(x: 4.03, y: 12.13))
            stroke5Path.addCurve(to: CGPoint(x: 5.46, y: 12.08), controlPoint1: CGPoint(x: 4.76, y: 12.45), controlPoint2: CGPoint(x: 5.18, y: 12.37))
            stroke5Path.addCurve(to: CGPoint(x: 7.28, y: 10.2), controlPoint1: CGPoint(x: 6.07, y: 11.45), controlPoint2: CGPoint(x: 6.68, y: 10.83))
            stroke5Path.addCurve(to: CGPoint(x: 7.32, y: 8.78), controlPoint1: CGPoint(x: 7.68, y: 9.79), controlPoint2: CGPoint(x: 7.7, y: 9.18))
            stroke5Path.addCurve(to: CGPoint(x: 5.93, y: 8.78), controlPoint1: CGPoint(x: 6.94, y: 8.38), controlPoint2: CGPoint(x: 6.33, y: 8.37))
            stroke5Path.addCurve(to: CGPoint(x: 4.1, y: 10.66), controlPoint1: CGPoint(x: 5.31, y: 9.4), controlPoint2: CGPoint(x: 4.71, y: 10.03))
            stroke5Path.addCurve(to: CGPoint(x: 3.81, y: 11.36), controlPoint1: CGPoint(x: 3.91, y: 10.85), controlPoint2: CGPoint(x: 3.81, y: 11.09))
            stroke5Path.addLine(to: CGPoint(x: 3.81, y: 11.36))
            stroke5Path.close()
            stroke5Path.miterLimit = 4;
            
            stroke5Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke5Path.lineWidth = 0.5
            stroke5Path.stroke()
            
            
            //// Stroke-7 Drawing
            let stroke7Path = UIBezierPath()
            stroke7Path.move(to: CGPoint(x: 8.8, y: 10.06))
            stroke7Path.addCurve(to: CGPoint(x: 8.01, y: 10.37), controlPoint1: CGPoint(x: 8.44, y: 10.06), controlPoint2: CGPoint(x: 8.2, y: 10.16))
            stroke7Path.addCurve(to: CGPoint(x: 6.21, y: 12.21), controlPoint1: CGPoint(x: 7.41, y: 10.98), controlPoint2: CGPoint(x: 6.81, y: 11.6))
            stroke7Path.addCurve(to: CGPoint(x: 6.1, y: 12.34), controlPoint1: CGPoint(x: 6.17, y: 12.25), controlPoint2: CGPoint(x: 6.13, y: 12.3))
            stroke7Path.addCurve(to: CGPoint(x: 6.22, y: 13.69), controlPoint1: CGPoint(x: 5.79, y: 12.75), controlPoint2: CGPoint(x: 5.84, y: 13.35))
            stroke7Path.addCurve(to: CGPoint(x: 7.54, y: 13.66), controlPoint1: CGPoint(x: 6.6, y: 14.04), controlPoint2: CGPoint(x: 7.18, y: 14.03))
            stroke7Path.addCurve(to: CGPoint(x: 9.41, y: 11.74), controlPoint1: CGPoint(x: 8.17, y: 13.03), controlPoint2: CGPoint(x: 8.79, y: 12.38))
            stroke7Path.addCurve(to: CGPoint(x: 9.61, y: 10.67), controlPoint1: CGPoint(x: 9.69, y: 11.46), controlPoint2: CGPoint(x: 9.77, y: 11.02))
            stroke7Path.addCurve(to: CGPoint(x: 8.8, y: 10.06), controlPoint1: CGPoint(x: 9.44, y: 10.27), controlPoint2: CGPoint(x: 9.14, y: 10.07))
            stroke7Path.addLine(to: CGPoint(x: 8.8, y: 10.06))
            stroke7Path.close()
            stroke7Path.miterLimit = 4;
            
            stroke7Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke7Path.lineWidth = 0.5
            stroke7Path.stroke()
            
            
            //// Stroke-9 Drawing
            let stroke9Path = UIBezierPath()
            stroke9Path.move(to: CGPoint(x: 11.15, y: 16.86))
            stroke9Path.addCurve(to: CGPoint(x: 11.91, y: 16.56), controlPoint1: CGPoint(x: 11.48, y: 16.86), controlPoint2: CGPoint(x: 11.71, y: 16.76))
            stroke9Path.addCurve(to: CGPoint(x: 13.72, y: 14.7), controlPoint1: CGPoint(x: 12.51, y: 15.94), controlPoint2: CGPoint(x: 13.12, y: 15.32))
            stroke9Path.addCurve(to: CGPoint(x: 13.76, y: 13.28), controlPoint1: CGPoint(x: 14.12, y: 14.29), controlPoint2: CGPoint(x: 14.13, y: 13.67))
            stroke9Path.addCurve(to: CGPoint(x: 12.37, y: 13.27), controlPoint1: CGPoint(x: 13.38, y: 12.88), controlPoint2: CGPoint(x: 12.78, y: 12.87))
            stroke9Path.addCurve(to: CGPoint(x: 11.98, y: 13.67), controlPoint1: CGPoint(x: 12.24, y: 13.4), controlPoint2: CGPoint(x: 12.11, y: 13.53))
            stroke9Path.addCurve(to: CGPoint(x: 10.54, y: 15.15), controlPoint1: CGPoint(x: 11.5, y: 14.16), controlPoint2: CGPoint(x: 11.02, y: 14.66))
            stroke9Path.addCurve(to: CGPoint(x: 10.32, y: 16.26), controlPoint1: CGPoint(x: 10.24, y: 15.46), controlPoint2: CGPoint(x: 10.16, y: 15.89))
            stroke9Path.addCurve(to: CGPoint(x: 11.15, y: 16.86), controlPoint1: CGPoint(x: 10.49, y: 16.65), controlPoint2: CGPoint(x: 10.79, y: 16.85))
            stroke9Path.addLine(to: CGPoint(x: 11.15, y: 16.86))
            stroke9Path.close()
            stroke9Path.miterLimit = 4;
            
            stroke9Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke9Path.lineWidth = 0.5
            stroke9Path.stroke()
            
            
            //// Stroke-11 Drawing
            let stroke11Path = UIBezierPath()
            stroke11Path.move(to: CGPoint(x: 8.11, y: 14.37))
            stroke11Path.addCurve(to: CGPoint(x: 8.7, y: 15.29), controlPoint1: CGPoint(x: 8.11, y: 14.78), controlPoint2: CGPoint(x: 8.34, y: 15.14))
            stroke11Path.addCurve(to: CGPoint(x: 9.76, y: 15.07), controlPoint1: CGPoint(x: 9.1, y: 15.44), controlPoint2: CGPoint(x: 9.46, y: 15.38))
            stroke11Path.addCurve(to: CGPoint(x: 11.61, y: 13.18), controlPoint1: CGPoint(x: 10.38, y: 14.45), controlPoint2: CGPoint(x: 10.99, y: 13.81))
            stroke11Path.addCurve(to: CGPoint(x: 11.61, y: 11.77), controlPoint1: CGPoint(x: 11.99, y: 12.78), controlPoint2: CGPoint(x: 11.99, y: 12.16))
            stroke11Path.addCurve(to: CGPoint(x: 10.25, y: 11.75), controlPoint1: CGPoint(x: 11.25, y: 11.38), controlPoint2: CGPoint(x: 10.64, y: 11.37))
            stroke11Path.addCurve(to: CGPoint(x: 8.38, y: 13.67), controlPoint1: CGPoint(x: 9.62, y: 12.38), controlPoint2: CGPoint(x: 9, y: 13.03))
            stroke11Path.addCurve(to: CGPoint(x: 8.11, y: 14.37), controlPoint1: CGPoint(x: 8.2, y: 13.86), controlPoint2: CGPoint(x: 8.11, y: 14.1))
            stroke11Path.addLine(to: CGPoint(x: 8.11, y: 14.37))
            stroke11Path.close()
            stroke11Path.miterLimit = 4;
            
            stroke11Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke11Path.lineWidth = 0.5
            stroke11Path.stroke()
        }
        else if(type == "estimate"){
            let strokeColor = UIColor(red: 0.407, green: 0.399, blue: 0.399, alpha: 1.000)
            
            //// Group-3
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.move(to: CGPoint(x: 8.14, y: 2.25))
            shapePath.addCurve(to: CGPoint(x: 9.12, y: 1), controlPoint1: CGPoint(x: 8.7, y: 2.25), controlPoint2: CGPoint(x: 9.12, y: 1.7))
            shapePath.addLine(to: CGPoint(x: 25.02, y: 1))
            shapePath.addCurve(to: CGPoint(x: 26, y: 2.25), controlPoint1: CGPoint(x: 25.02, y: 1.7), controlPoint2: CGPoint(x: 25.45, y: 2.25))
            shapePath.addLine(to: CGPoint(x: 26, y: 3.32))
            shapePath.addCurve(to: CGPoint(x: 25.02, y: 4.57), controlPoint1: CGPoint(x: 25.45, y: 3.32), controlPoint2: CGPoint(x: 25.02, y: 3.87))
            shapePath.addLine(to: CGPoint(x: 9.12, y: 4.57))
            shapePath.addCurve(to: CGPoint(x: 8.14, y: 3.32), controlPoint1: CGPoint(x: 9.12, y: 3.87), controlPoint2: CGPoint(x: 8.7, y: 3.32))
            shapePath.addLine(to: CGPoint(x: 8.14, y: 2.25))
            shapePath.addLine(to: CGPoint(x: 8.14, y: 2.25))
            shapePath.close()
            shapePath.miterLimit = 4;
            
            shapePath.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shapePath.lineWidth = 1
            shapePath.stroke()
            
            
            //// Shape 2 Drawing
            let shape2Path = UIBezierPath()
            shape2Path.move(to: CGPoint(x: 1, y: 2.25))
            shape2Path.addCurve(to: CGPoint(x: 1.18, y: 1), controlPoint1: CGPoint(x: 1.11, y: 2.25), controlPoint2: CGPoint(x: 1.18, y: 1.7))
            shape2Path.addLine(to: CGPoint(x: 4.39, y: 1))
            shape2Path.addCurve(to: CGPoint(x: 4.57, y: 2.25), controlPoint1: CGPoint(x: 4.39, y: 1.7), controlPoint2: CGPoint(x: 4.46, y: 2.25))
            shape2Path.addLine(to: CGPoint(x: 4.57, y: 3.32))
            shape2Path.addCurve(to: CGPoint(x: 4.39, y: 4.57), controlPoint1: CGPoint(x: 4.46, y: 3.32), controlPoint2: CGPoint(x: 4.39, y: 3.87))
            shape2Path.addLine(to: CGPoint(x: 1.18, y: 4.57))
            shape2Path.addCurve(to: CGPoint(x: 1, y: 3.32), controlPoint1: CGPoint(x: 1.18, y: 3.87), controlPoint2: CGPoint(x: 1.11, y: 3.32))
            shape2Path.addLine(to: CGPoint(x: 1, y: 2.25))
            shape2Path.addLine(to: CGPoint(x: 1, y: 2.25))
            shape2Path.close()
            shape2Path.miterLimit = 4;
            
            shape2Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shape2Path.lineWidth = 1
            shape2Path.stroke()
            
            
            //// Shape 3 Drawing
            let shape3Path = UIBezierPath()
            shape3Path.move(to: CGPoint(x: 9.12, y: 8.14))
            shape3Path.addLine(to: CGPoint(x: 25.02, y: 8.14))
            shape3Path.addCurve(to: CGPoint(x: 26, y: 9.39), controlPoint1: CGPoint(x: 25.02, y: 8.84), controlPoint2: CGPoint(x: 25.45, y: 9.39))
            shape3Path.addLine(to: CGPoint(x: 26, y: 10.46))
            shape3Path.addCurve(to: CGPoint(x: 25.02, y: 11.71), controlPoint1: CGPoint(x: 25.45, y: 10.46), controlPoint2: CGPoint(x: 25.02, y: 11.02))
            shape3Path.addLine(to: CGPoint(x: 9.12, y: 11.71))
            shape3Path.addCurve(to: CGPoint(x: 8.14, y: 10.46), controlPoint1: CGPoint(x: 9.12, y: 11.02), controlPoint2: CGPoint(x: 8.7, y: 10.46))
            shape3Path.addLine(to: CGPoint(x: 8.14, y: 9.39))
            shape3Path.addCurve(to: CGPoint(x: 9.12, y: 8.14), controlPoint1: CGPoint(x: 8.7, y: 9.39), controlPoint2: CGPoint(x: 9.12, y: 8.84))
            shape3Path.close()
            shape3Path.miterLimit = 4;
            
            shape3Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shape3Path.lineWidth = 1
            shape3Path.stroke()
            
            
            //// Shape 4 Drawing
            let shape4Path = UIBezierPath()
            shape4Path.move(to: CGPoint(x: 1, y: 9.39))
            shape4Path.addCurve(to: CGPoint(x: 1.18, y: 8.14), controlPoint1: CGPoint(x: 1.11, y: 9.39), controlPoint2: CGPoint(x: 1.18, y: 8.84))
            shape4Path.addLine(to: CGPoint(x: 4.39, y: 8.14))
            shape4Path.addCurve(to: CGPoint(x: 4.57, y: 9.39), controlPoint1: CGPoint(x: 4.39, y: 8.84), controlPoint2: CGPoint(x: 4.46, y: 9.39))
            shape4Path.addLine(to: CGPoint(x: 4.57, y: 10.46))
            shape4Path.addCurve(to: CGPoint(x: 4.39, y: 11.71), controlPoint1: CGPoint(x: 4.46, y: 10.46), controlPoint2: CGPoint(x: 4.39, y: 11.02))
            shape4Path.addLine(to: CGPoint(x: 1.18, y: 11.71))
            shape4Path.addCurve(to: CGPoint(x: 1, y: 10.46), controlPoint1: CGPoint(x: 1.18, y: 11.02), controlPoint2: CGPoint(x: 1.11, y: 10.46))
            shape4Path.addLine(to: CGPoint(x: 1, y: 9.39))
            shape4Path.addLine(to: CGPoint(x: 1, y: 9.39))
            shape4Path.close()
            shape4Path.miterLimit = 4;
            
            shape4Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shape4Path.lineWidth = 1
            shape4Path.stroke()
            
            //// Shape 5 Drawing
            let shape5Path = UIBezierPath()
            shape5Path.move(to: CGPoint(x: 9.12, y: 15.29))
            shape5Path.addLine(to: CGPoint(x: 25.02, y: 15.29))
            shape5Path.addCurve(to: CGPoint(x: 26, y: 16.54), controlPoint1: CGPoint(x: 25.02, y: 15.98), controlPoint2: CGPoint(x: 25.45, y: 16.54))
            shape5Path.addLine(to: CGPoint(x: 26, y: 17.61))
            shape5Path.addCurve(to: CGPoint(x: 25.02, y: 18.86), controlPoint1: CGPoint(x: 25.45, y: 17.61), controlPoint2: CGPoint(x: 25.02, y: 18.16))
            shape5Path.addLine(to: CGPoint(x: 9.12, y: 18.86))
            shape5Path.addCurve(to: CGPoint(x: 8.14, y: 17.61), controlPoint1: CGPoint(x: 9.12, y: 18.16), controlPoint2: CGPoint(x: 8.7, y: 17.61))
            shape5Path.addLine(to: CGPoint(x: 8.14, y: 16.54))
            shape5Path.addCurve(to: CGPoint(x: 9.12, y: 15.29), controlPoint1: CGPoint(x: 8.7, y: 16.54), controlPoint2: CGPoint(x: 9.12, y: 15.98))
            shape5Path.close()
            shape5Path.miterLimit = 4;
            
            shape5Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shape5Path.lineWidth = 1
            shape5Path.stroke()
            
            
            //// Shape 6 Drawing
            let shape6Path = UIBezierPath()
            shape6Path.move(to: CGPoint(x: 1, y: 16.54))
            shape6Path.addCurve(to: CGPoint(x: 1.18, y: 15.29), controlPoint1: CGPoint(x: 1.11, y: 16.54), controlPoint2: CGPoint(x: 1.18, y: 15.98))
            shape6Path.addLine(to: CGPoint(x: 4.39, y: 15.29))
            shape6Path.addCurve(to: CGPoint(x: 4.57, y: 16.54), controlPoint1: CGPoint(x: 4.39, y: 15.98), controlPoint2: CGPoint(x: 4.46, y: 16.54))
            shape6Path.addLine(to: CGPoint(x: 4.57, y: 17.61))
            shape6Path.addCurve(to: CGPoint(x: 4.39, y: 18.86), controlPoint1: CGPoint(x: 4.46, y: 17.61), controlPoint2: CGPoint(x: 4.39, y: 18.16))
            shape6Path.addLine(to: CGPoint(x: 1.18, y: 18.86))
            shape6Path.addCurve(to: CGPoint(x: 1, y: 17.61), controlPoint1: CGPoint(x: 1.18, y: 18.16), controlPoint2: CGPoint(x: 1.11, y: 17.61))
            shape6Path.addLine(to: CGPoint(x: 1, y: 16.54))
            shape6Path.addLine(to: CGPoint(x: 1, y: 16.54))
            shape6Path.close()
            shape6Path.miterLimit = 4;
            
            shape6Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            shape6Path.lineWidth = 1
            shape6Path.stroke()
            
            
        }
        else{
            //// Color Declarations
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 120, height: 30), false, 0)
            let fillColor1 = UIColor(red: 0.538, green: 0.538, blue: 0.538, alpha: 1.000)
            
            //// Group-6
            //// Page-1 Drawing
            let page1Path = UIBezierPath()
            page1Path.move(to: CGPoint(x: 6.5, y: 2.11))
            page1Path.addLine(to: CGPoint(x: 4.49, y: 6.39))
            page1Path.addLine(to: CGPoint(x: 0, y: 7.08))
            page1Path.addLine(to: CGPoint(x: 3.25, y: 10.41))
            page1Path.addLine(to: CGPoint(x: 2.49, y: 15.11))
            page1Path.addLine(to: CGPoint(x: 6.5, y: 12.89))
            page1Path.addLine(to: CGPoint(x: 10.51, y: 15.11))
            page1Path.addLine(to: CGPoint(x: 9.75, y: 10.41))
            page1Path.addLine(to: CGPoint(x: 13, y: 7.08))
            page1Path.addLine(to: CGPoint(x: 8.51, y: 6.39))
            page1Path.addLine(to: CGPoint(x: 6.5, y: 2.11))
            page1Path.close()
            page1Path.miterLimit = 4;
            
            page1Path.usesEvenOddFillRule = true;
            
            fillColor1.setFill()
            page1Path.fill()
            
            
            //// Page- Drawing
            let pagePath = UIBezierPath()
            pagePath.move(to: CGPoint(x: 20.5, y: 2.11))
            pagePath.addLine(to: CGPoint(x: 18.49, y: 6.39))
            pagePath.addLine(to: CGPoint(x: 14, y: 7.08))
            pagePath.addLine(to: CGPoint(x: 17.25, y: 10.41))
            pagePath.addLine(to: CGPoint(x: 16.49, y: 15.11))
            pagePath.addLine(to: CGPoint(x: 20.5, y: 12.89))
            pagePath.addLine(to: CGPoint(x: 24.51, y: 15.11))
            pagePath.addLine(to: CGPoint(x: 23.75, y: 10.41))
            pagePath.addLine(to: CGPoint(x: 27, y: 7.08))
            pagePath.addLine(to: CGPoint(x: 22.51, y: 6.39))
            pagePath.addLine(to: CGPoint(x: 20.5, y: 2.11))
            pagePath.close()
            pagePath.miterLimit = 4;
            
            pagePath.usesEvenOddFillRule = true;
            
            fillColor1.setFill()
            pagePath.fill()
            
            
            //// Page- 2 Drawing
            let page2Path = UIBezierPath()
            page2Path.move(to: CGPoint(x: 34.5, y: 2.11))
            page2Path.addLine(to: CGPoint(x: 32.49, y: 6.39))
            page2Path.addLine(to: CGPoint(x: 28, y: 7.08))
            page2Path.addLine(to: CGPoint(x: 31.25, y: 10.41))
            page2Path.addLine(to: CGPoint(x: 30.49, y: 15.11))
            page2Path.addLine(to: CGPoint(x: 34.5, y: 12.89))
            page2Path.addLine(to: CGPoint(x: 38.51, y: 15.11))
            page2Path.addLine(to: CGPoint(x: 37.75, y: 10.41))
            page2Path.addLine(to: CGPoint(x: 41, y: 7.08))
            page2Path.addLine(to: CGPoint(x: 36.51, y: 6.39))
            page2Path.addLine(to: CGPoint(x: 34.5, y: 2.11))
            page2Path.close()
            page2Path.miterLimit = 4;
            
            page2Path.usesEvenOddFillRule = true;
            
            fillColor1.setFill()
            page2Path.fill()
            
            
            //// Page- 3 Drawing
            let page3Path = UIBezierPath()
            page3Path.move(to: CGPoint(x: 48.5, y: 2.11))
            page3Path.addLine(to: CGPoint(x: 46.49, y: 6.39))
            page3Path.addLine(to: CGPoint(x: 42, y: 7.08))
            page3Path.addLine(to: CGPoint(x: 45.25, y: 10.41))
            page3Path.addLine(to: CGPoint(x: 44.49, y: 15.11))
            page3Path.addLine(to: CGPoint(x: 48.5, y: 12.89))
            page3Path.addLine(to: CGPoint(x: 52.51, y: 15.11))
            page3Path.addLine(to: CGPoint(x: 51.75, y: 10.41))
            page3Path.addLine(to: CGPoint(x: 55, y: 7.08))
            page3Path.addLine(to: CGPoint(x: 50.51, y: 6.39))
            page3Path.addLine(to: CGPoint(x: 48.5, y: 2.11))
            page3Path.close()
            page3Path.miterLimit = 4;
            
            page3Path.usesEvenOddFillRule = true;
            
            fillColor1.setFill()
            page3Path.fill()
            
            
            //// Page- 4 Drawing
            let page4Path = UIBezierPath()
            page4Path.move(to: CGPoint(x: 62.5, y: 2.11))
            page4Path.addLine(to: CGPoint(x: 60.49, y: 6.39))
            page4Path.addLine(to: CGPoint(x: 56, y: 7.08))
            page4Path.addLine(to: CGPoint(x: 59.25, y: 10.41))
            page4Path.addLine(to: CGPoint(x: 58.49, y: 15.11))
            page4Path.addLine(to: CGPoint(x: 62.5, y: 12.89))
            page4Path.addLine(to: CGPoint(x: 66.51, y: 15.11))
            page4Path.addLine(to: CGPoint(x: 65.75, y: 10.41))
            page4Path.addLine(to: CGPoint(x: 69, y: 7.08))
            page4Path.addLine(to: CGPoint(x: 64.51, y: 6.39))
            page4Path.addLine(to: CGPoint(x: 62.5, y: 2.11))
            page4Path.close()
            page4Path.miterLimit = 4;
            
            page4Path.usesEvenOddFillRule = true;
            
            fillColor1.setFill()
            page4Path.fill()
            
            
            
        }
        
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imageViewtool
        
    }
    
    
    
    func drawLogo()-> UIImageView{
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 103, height: 47), false, 0)
        
        let fillColor = UIColor(red: 0.427, green: 0.430, blue: 0.443, alpha: 1.000)
        let fillColor2 = UIColor(red: 0.925, green: 0.315, blue: 0.104, alpha: 1.000)
        
        let fill8Path = UIBezierPath()
        fill8Path.move(to: CGPoint(x: 88.95, y: 18.49))
        fill8Path.addLine(to: CGPoint(x: 88.95, y: 29.03))
        fill8Path.addLine(to: CGPoint(x: 89.02, y: 29.03))
        fill8Path.addCurve(to: CGPoint(x: 91.36, y: 26.26), controlPoint1: CGPoint(x: 89.46, y: 27.88), controlPoint2: CGPoint(x: 90.24, y: 26.95))
        fill8Path.addCurve(to: CGPoint(x: 95.04, y: 25.21), controlPoint1: CGPoint(x: 92.48, y: 25.56), controlPoint2: CGPoint(x: 93.7, y: 25.21))
        fill8Path.addCurve(to: CGPoint(x: 98.34, y: 25.72), controlPoint1: CGPoint(x: 96.35, y: 25.21), controlPoint2: CGPoint(x: 97.45, y: 25.38))
        fill8Path.addCurve(to: CGPoint(x: 100.48, y: 27.17), controlPoint1: CGPoint(x: 99.23, y: 26.07), controlPoint2: CGPoint(x: 99.94, y: 26.55))
        fill8Path.addCurve(to: CGPoint(x: 101.61, y: 29.47), controlPoint1: CGPoint(x: 101.01, y: 27.8), controlPoint2: CGPoint(x: 101.39, y: 28.56))
        fill8Path.addCurve(to: CGPoint(x: 101.93, y: 32.51), controlPoint1: CGPoint(x: 101.83, y: 30.37), controlPoint2: CGPoint(x: 101.93, y: 31.39))
        fill8Path.addLine(to: CGPoint(x: 101.93, y: 44.7))
        fill8Path.addLine(to: CGPoint(x: 99.64, y: 44.7))
        fill8Path.addLine(to: CGPoint(x: 99.64, y: 32.88))
        fill8Path.addCurve(to: CGPoint(x: 99.42, y: 30.62), controlPoint1: CGPoint(x: 99.64, y: 32.07), controlPoint2: CGPoint(x: 99.56, y: 31.32))
        fill8Path.addCurve(to: CGPoint(x: 98.65, y: 28.81), controlPoint1: CGPoint(x: 99.27, y: 29.93), controlPoint2: CGPoint(x: 99.02, y: 29.32))
        fill8Path.addCurve(to: CGPoint(x: 97.17, y: 27.6), controlPoint1: CGPoint(x: 98.29, y: 28.29), controlPoint2: CGPoint(x: 97.79, y: 27.89))
        fill8Path.addCurve(to: CGPoint(x: 94.86, y: 27.15), controlPoint1: CGPoint(x: 96.55, y: 27.3), controlPoint2: CGPoint(x: 95.78, y: 27.15))
        fill8Path.addCurve(to: CGPoint(x: 92.4, y: 27.65), controlPoint1: CGPoint(x: 93.93, y: 27.15), controlPoint2: CGPoint(x: 93.11, y: 27.32))
        fill8Path.addCurve(to: CGPoint(x: 90.57, y: 29.01), controlPoint1: CGPoint(x: 91.68, y: 27.98), controlPoint2: CGPoint(x: 91.07, y: 28.43))
        fill8Path.addCurve(to: CGPoint(x: 89.41, y: 31.06), controlPoint1: CGPoint(x: 90.07, y: 29.58), controlPoint2: CGPoint(x: 89.68, y: 30.27))
        fill8Path.addCurve(to: CGPoint(x: 88.95, y: 33.65), controlPoint1: CGPoint(x: 89.13, y: 31.86), controlPoint2: CGPoint(x: 88.97, y: 32.72))
        fill8Path.addLine(to: CGPoint(x: 88.95, y: 44.7))
        fill8Path.addLine(to: CGPoint(x: 86.65, y: 44.7))
        fill8Path.addLine(to: CGPoint(x: 86.65, y: 18.49))
        fill8Path.addLine(to: CGPoint(x: 88.95, y: 18.49))
        fill8Path.close()
        fill8Path.miterLimit = 4;
        
        fill8Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill8Path.fill()
        
        
        
        
        //// Group-13
        //// path-3 Drawing
        
        
        //// Clip-12
        
        
        //// Fill-11 Drawing
        let fill11Path = UIBezierPath()
        fill11Path.move(to: CGPoint(x: 0, y: 26.12))
        fill11Path.addCurve(to: CGPoint(x: 0.66, y: 22.74), controlPoint1: CGPoint(x: 0.02, y: 24.84), controlPoint2: CGPoint(x: 0.24, y: 23.72))
        fill11Path.addCurve(to: CGPoint(x: 2.3, y: 20.1), controlPoint1: CGPoint(x: 1.07, y: 21.76), controlPoint2: CGPoint(x: 1.62, y: 20.88))
        fill11Path.addCurve(to: CGPoint(x: 4.6, y: 17.95), controlPoint1: CGPoint(x: 2.98, y: 19.31), controlPoint2: CGPoint(x: 3.74, y: 18.6))
        fill11Path.addCurve(to: CGPoint(x: 7.22, y: 16.08), controlPoint1: CGPoint(x: 5.45, y: 17.3), controlPoint2: CGPoint(x: 6.32, y: 16.68))
        fill11Path.addCurve(to: CGPoint(x: 9.9, y: 14.24), controlPoint1: CGPoint(x: 8.12, y: 15.48), controlPoint2: CGPoint(x: 9.02, y: 14.86))
        fill11Path.addCurve(to: CGPoint(x: 12.29, y: 12.24), controlPoint1: CGPoint(x: 10.79, y: 13.62), controlPoint2: CGPoint(x: 11.59, y: 12.95))
        fill11Path.addCurve(to: CGPoint(x: 13.88, y: 10.06), controlPoint1: CGPoint(x: 13, y: 11.53), controlPoint2: CGPoint(x: 13.53, y: 10.8))
        fill11Path.addCurve(to: CGPoint(x: 14.41, y: 7.39), controlPoint1: CGPoint(x: 14.23, y: 9.31), controlPoint2: CGPoint(x: 14.41, y: 8.42))
        fill11Path.addCurve(to: CGPoint(x: 13.95, y: 5.17), controlPoint1: CGPoint(x: 14.41, y: 6.56), controlPoint2: CGPoint(x: 14.26, y: 5.82))
        fill11Path.addCurve(to: CGPoint(x: 12.71, y: 3.52), controlPoint1: CGPoint(x: 13.65, y: 4.53), controlPoint2: CGPoint(x: 13.23, y: 3.98))
        fill11Path.addCurve(to: CGPoint(x: 10.89, y: 2.49), controlPoint1: CGPoint(x: 12.19, y: 3.07), controlPoint2: CGPoint(x: 11.58, y: 2.73))
        fill11Path.addCurve(to: CGPoint(x: 8.68, y: 2.15), controlPoint1: CGPoint(x: 10.19, y: 2.26), controlPoint2: CGPoint(x: 9.46, y: 2.15))
        fill11Path.addCurve(to: CGPoint(x: 6, y: 2.73), controlPoint1: CGPoint(x: 7.64, y: 2.15), controlPoint2: CGPoint(x: 6.74, y: 2.34))
        fill11Path.addCurve(to: CGPoint(x: 4.19, y: 4.31), controlPoint1: CGPoint(x: 5.26, y: 3.12), controlPoint2: CGPoint(x: 4.66, y: 3.65))
        fill11Path.addCurve(to: CGPoint(x: 3.19, y: 6.59), controlPoint1: CGPoint(x: 3.73, y: 4.97), controlPoint2: CGPoint(x: 3.4, y: 5.73))
        fill11Path.addCurve(to: CGPoint(x: 2.92, y: 9.3), controlPoint1: CGPoint(x: 2.98, y: 7.44), controlPoint2: CGPoint(x: 2.89, y: 8.35))
        fill11Path.addLine(to: CGPoint(x: 0.62, y: 9.3))
        fill11Path.addCurve(to: CGPoint(x: 1.08, y: 5.65), controlPoint1: CGPoint(x: 0.6, y: 7.98), controlPoint2: CGPoint(x: 0.75, y: 6.77))
        fill11Path.addCurve(to: CGPoint(x: 2.59, y: 2.77), controlPoint1: CGPoint(x: 1.4, y: 4.54), controlPoint2: CGPoint(x: 1.91, y: 3.58))
        fill11Path.addCurve(to: CGPoint(x: 5.16, y: 0.88), controlPoint1: CGPoint(x: 3.27, y: 1.96), controlPoint2: CGPoint(x: 4.13, y: 1.33))
        fill11Path.addCurve(to: CGPoint(x: 8.79, y: 0.2), controlPoint1: CGPoint(x: 6.19, y: 0.43), controlPoint2: CGPoint(x: 7.4, y: 0.2))
        fill11Path.addCurve(to: CGPoint(x: 11.91, y: 0.66), controlPoint1: CGPoint(x: 9.91, y: 0.2), controlPoint2: CGPoint(x: 10.95, y: 0.35))
        fill11Path.addCurve(to: CGPoint(x: 14.43, y: 2.02), controlPoint1: CGPoint(x: 12.87, y: 0.97), controlPoint2: CGPoint(x: 13.71, y: 1.42))
        fill11Path.addCurve(to: CGPoint(x: 16.1, y: 4.27), controlPoint1: CGPoint(x: 15.14, y: 2.62), controlPoint2: CGPoint(x: 15.7, y: 3.37))
        fill11Path.addCurve(to: CGPoint(x: 16.71, y: 7.43), controlPoint1: CGPoint(x: 16.51, y: 5.18), controlPoint2: CGPoint(x: 16.71, y: 6.23))
        fill11Path.addCurve(to: CGPoint(x: 16.18, y: 10.37), controlPoint1: CGPoint(x: 16.71, y: 8.51), controlPoint2: CGPoint(x: 16.53, y: 9.49))
        fill11Path.addCurve(to: CGPoint(x: 14.75, y: 12.79), controlPoint1: CGPoint(x: 15.82, y: 11.25), controlPoint2: CGPoint(x: 15.35, y: 12.06))
        fill11Path.addCurve(to: CGPoint(x: 12.71, y: 14.83), controlPoint1: CGPoint(x: 14.16, y: 13.52), controlPoint2: CGPoint(x: 13.48, y: 14.2))
        fill11Path.addCurve(to: CGPoint(x: 10.29, y: 16.57), controlPoint1: CGPoint(x: 11.95, y: 15.45), controlPoint2: CGPoint(x: 11.14, y: 16.03))
        fill11Path.addCurve(to: CGPoint(x: 8.13, y: 17.95), controlPoint1: CGPoint(x: 9.68, y: 16.99), controlPoint2: CGPoint(x: 8.96, y: 17.45))
        fill11Path.addCurve(to: CGPoint(x: 5.75, y: 19.62), controlPoint1: CGPoint(x: 7.31, y: 18.45), controlPoint2: CGPoint(x: 6.51, y: 19.01))
        fill11Path.addCurve(to: CGPoint(x: 3.72, y: 21.62), controlPoint1: CGPoint(x: 4.98, y: 20.23), controlPoint2: CGPoint(x: 4.3, y: 20.9))
        fill11Path.addCurve(to: CGPoint(x: 2.63, y: 23.99), controlPoint1: CGPoint(x: 3.14, y: 22.34), controlPoint2: CGPoint(x: 2.77, y: 23.13))
        fill11Path.addLine(to: CGPoint(x: 16.82, y: 23.99))
        fill11Path.addLine(to: CGPoint(x: 16.82, y: 26.12))
        fill11Path.addLine(to: CGPoint(x: 0, y: 26.12))
        fill11Path.close()
        fill11Path.miterLimit = 4;
        
        fill11Path.usesEvenOddFillRule = true;
        
        fillColor2.setFill()
        fill11Path.fill()
        
        
        
        
        //// Fill-14 Drawing
        let fill14Path = UIBezierPath()
        fill14Path.move(to: CGPoint(x: 25.22, y: 5.21))
        fill14Path.addCurve(to: CGPoint(x: 27.34, y: 4.61), controlPoint1: CGPoint(x: 26.04, y: 5.13), controlPoint2: CGPoint(x: 26.74, y: 4.92))
        fill14Path.addCurve(to: CGPoint(x: 28.83, y: 3.16), controlPoint1: CGPoint(x: 27.93, y: 4.29), controlPoint2: CGPoint(x: 28.43, y: 3.8))
        fill14Path.addCurve(to: CGPoint(x: 29.69, y: 0.42), controlPoint1: CGPoint(x: 29.24, y: 2.51), controlPoint2: CGPoint(x: 29.52, y: 1.6))
        fill14Path.addLine(to: CGPoint(x: 31.55, y: 0.42))
        fill14Path.addLine(to: CGPoint(x: 31.55, y: 26.12))
        fill14Path.addLine(to: CGPoint(x: 29.25, y: 26.12))
        fill14Path.addLine(to: CGPoint(x: 29.25, y: 7.03))
        fill14Path.addLine(to: CGPoint(x: 22.51, y: 7.03))
        fill14Path.addLine(to: CGPoint(x: 22.51, y: 5.38))
        fill14Path.addCurve(to: CGPoint(x: 25.22, y: 5.21), controlPoint1: CGPoint(x: 23.5, y: 5.35), controlPoint2: CGPoint(x: 24.41, y: 5.3))
        fill14Path.close()
        fill14Path.miterLimit = 4;
        
        fill14Path.usesEvenOddFillRule = true;
        
        fillColor2.setFill()
        fill14Path.fill()
        
        let fill1Path = UIBezierPath()
        fill1Path.move(to: CGPoint(x: 21.62, y: 18.49))
        fill1Path.addLine(to: CGPoint(x: 36.79, y: 40.66))
        fill1Path.addLine(to: CGPoint(x: 36.86, y: 40.66))
        fill1Path.addLine(to: CGPoint(x: 36.86, y: 18.49))
        fill1Path.addLine(to: CGPoint(x: 39.34, y: 18.49))
        fill1Path.addLine(to: CGPoint(x: 39.34, y: 44.7))
        fill1Path.addLine(to: CGPoint(x: 36.57, y: 44.7))
        fill1Path.addLine(to: CGPoint(x: 21.4, y: 22.53))
        fill1Path.addLine(to: CGPoint(x: 21.32, y: 22.53))
        fill1Path.addLine(to: CGPoint(x: 21.32, y: 44.7))
        fill1Path.addLine(to: CGPoint(x: 18.84, y: 44.7))
        fill1Path.addLine(to: CGPoint(x: 18.84, y: 18.49))
        fill1Path.addLine(to: CGPoint(x: 21.62, y: 18.49))
        fill1Path.close()
        fill1Path.miterLimit = 4;
        
        fill1Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill1Path.fill()
        
        
        //// Group-16
        //// Fill-2 Drawing
        let fill2Path = UIBezierPath()
        fill2Path.move(to: CGPoint(x: 49.19, y: 27.85))
        fill2Path.addCurve(to: CGPoint(x: 47.13, y: 29.69), controlPoint1: CGPoint(x: 48.36, y: 28.32), controlPoint2: CGPoint(x: 47.68, y: 28.93))
        fill2Path.addCurve(to: CGPoint(x: 45.89, y: 32.28), controlPoint1: CGPoint(x: 46.58, y: 30.45), controlPoint2: CGPoint(x: 46.17, y: 31.31))
        fill2Path.addCurve(to: CGPoint(x: 45.47, y: 35.23), controlPoint1: CGPoint(x: 45.61, y: 33.24), controlPoint2: CGPoint(x: 45.47, y: 34.23))
        fill2Path.addCurve(to: CGPoint(x: 45.89, y: 38.19), controlPoint1: CGPoint(x: 45.47, y: 36.23), controlPoint2: CGPoint(x: 45.61, y: 37.22))
        fill2Path.addCurve(to: CGPoint(x: 47.13, y: 40.77), controlPoint1: CGPoint(x: 46.17, y: 39.15), controlPoint2: CGPoint(x: 46.58, y: 40.01))
        fill2Path.addCurve(to: CGPoint(x: 49.19, y: 42.61), controlPoint1: CGPoint(x: 47.68, y: 41.53), controlPoint2: CGPoint(x: 48.36, y: 42.14))
        fill2Path.addCurve(to: CGPoint(x: 52.07, y: 43.31), controlPoint1: CGPoint(x: 50.02, y: 43.07), controlPoint2: CGPoint(x: 50.98, y: 43.31))
        fill2Path.addCurve(to: CGPoint(x: 54.96, y: 42.61), controlPoint1: CGPoint(x: 53.17, y: 43.31), controlPoint2: CGPoint(x: 54.13, y: 43.07))
        fill2Path.addCurve(to: CGPoint(x: 57.02, y: 40.77), controlPoint1: CGPoint(x: 55.78, y: 42.14), controlPoint2: CGPoint(x: 56.47, y: 41.53))
        fill2Path.addCurve(to: CGPoint(x: 58.26, y: 38.19), controlPoint1: CGPoint(x: 57.56, y: 40.01), controlPoint2: CGPoint(x: 57.98, y: 39.15))
        fill2Path.addCurve(to: CGPoint(x: 58.68, y: 35.23), controlPoint1: CGPoint(x: 58.54, y: 37.22), controlPoint2: CGPoint(x: 58.68, y: 36.23))
        fill2Path.addCurve(to: CGPoint(x: 58.26, y: 32.28), controlPoint1: CGPoint(x: 58.68, y: 34.23), controlPoint2: CGPoint(x: 58.54, y: 33.24))
        fill2Path.addCurve(to: CGPoint(x: 57.02, y: 29.69), controlPoint1: CGPoint(x: 57.98, y: 31.31), controlPoint2: CGPoint(x: 57.56, y: 30.45))
        fill2Path.addCurve(to: CGPoint(x: 54.96, y: 27.85), controlPoint1: CGPoint(x: 56.47, y: 28.93), controlPoint2: CGPoint(x: 55.78, y: 28.32))
        fill2Path.addCurve(to: CGPoint(x: 52.07, y: 27.15), controlPoint1: CGPoint(x: 54.13, y: 27.39), controlPoint2: CGPoint(x: 53.17, y: 27.15))
        fill2Path.addCurve(to: CGPoint(x: 49.19, y: 27.85), controlPoint1: CGPoint(x: 50.98, y: 27.15), controlPoint2: CGPoint(x: 50.02, y: 27.39))
        fill2Path.close()
        fill2Path.move(to: CGPoint(x: 55.89, y: 26.02))
        fill2Path.addCurve(to: CGPoint(x: 58.68, y: 28.18), controlPoint1: CGPoint(x: 56.99, y: 26.56), controlPoint2: CGPoint(x: 57.92, y: 27.28))
        fill2Path.addCurve(to: CGPoint(x: 60.39, y: 31.36), controlPoint1: CGPoint(x: 59.43, y: 29.09), controlPoint2: CGPoint(x: 60, y: 30.15))
        fill2Path.addCurve(to: CGPoint(x: 60.97, y: 35.23), controlPoint1: CGPoint(x: 60.78, y: 32.57), controlPoint2: CGPoint(x: 60.97, y: 33.86))
        fill2Path.addCurve(to: CGPoint(x: 60.39, y: 39.1), controlPoint1: CGPoint(x: 60.97, y: 36.6), controlPoint2: CGPoint(x: 60.78, y: 37.89))
        fill2Path.addCurve(to: CGPoint(x: 58.68, y: 42.28), controlPoint1: CGPoint(x: 60, y: 40.31), controlPoint2: CGPoint(x: 59.43, y: 41.37))
        fill2Path.addCurve(to: CGPoint(x: 55.89, y: 44.43), controlPoint1: CGPoint(x: 57.92, y: 43.18), controlPoint2: CGPoint(x: 56.99, y: 43.9))
        fill2Path.addCurve(to: CGPoint(x: 52.07, y: 45.21), controlPoint1: CGPoint(x: 54.78, y: 44.95), controlPoint2: CGPoint(x: 53.51, y: 45.21))
        fill2Path.addCurve(to: CGPoint(x: 48.26, y: 44.43), controlPoint1: CGPoint(x: 50.64, y: 45.21), controlPoint2: CGPoint(x: 49.37, y: 44.95))
        fill2Path.addCurve(to: CGPoint(x: 45.47, y: 42.28), controlPoint1: CGPoint(x: 47.15, y: 43.9), controlPoint2: CGPoint(x: 46.22, y: 43.18))
        fill2Path.addCurve(to: CGPoint(x: 43.76, y: 39.1), controlPoint1: CGPoint(x: 44.72, y: 41.37), controlPoint2: CGPoint(x: 44.15, y: 40.31))
        fill2Path.addCurve(to: CGPoint(x: 43.17, y: 35.23), controlPoint1: CGPoint(x: 43.37, y: 37.89), controlPoint2: CGPoint(x: 43.17, y: 36.6))
        fill2Path.addCurve(to: CGPoint(x: 43.76, y: 31.36), controlPoint1: CGPoint(x: 43.17, y: 33.86), controlPoint2: CGPoint(x: 43.37, y: 32.57))
        fill2Path.addCurve(to: CGPoint(x: 45.47, y: 28.18), controlPoint1: CGPoint(x: 44.15, y: 30.15), controlPoint2: CGPoint(x: 44.72, y: 29.09))
        fill2Path.addCurve(to: CGPoint(x: 48.26, y: 26.02), controlPoint1: CGPoint(x: 46.22, y: 27.28), controlPoint2: CGPoint(x: 47.15, y: 26.56))
        fill2Path.addCurve(to: CGPoint(x: 52.07, y: 25.21), controlPoint1: CGPoint(x: 49.37, y: 25.48), controlPoint2: CGPoint(x: 50.64, y: 25.21))
        fill2Path.addCurve(to: CGPoint(x: 55.89, y: 26.02), controlPoint1: CGPoint(x: 53.51, y: 25.21), controlPoint2: CGPoint(x: 54.78, y: 25.48))
        fill2Path.close()
        fill2Path.miterLimit = 4;
        
        fill2Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill2Path.fill()
        
        
        //// Fill-4 Drawing
        let fill4Path = UIBezierPath()
        fill4Path.move(to: CGPoint(x: 66.52, y: 25.76))
        fill4Path.addLine(to: CGPoint(x: 66.52, y: 30.2))
        fill4Path.addLine(to: CGPoint(x: 66.59, y: 30.2))
        fill4Path.addCurve(to: CGPoint(x: 69.31, y: 26.64), controlPoint1: CGPoint(x: 67.17, y: 28.66), controlPoint2: CGPoint(x: 68.08, y: 27.47))
        fill4Path.addCurve(to: CGPoint(x: 73.7, y: 25.5), controlPoint1: CGPoint(x: 70.54, y: 25.81), controlPoint2: CGPoint(x: 72, y: 25.43))
        fill4Path.addLine(to: CGPoint(x: 73.7, y: 27.82))
        fill4Path.addCurve(to: CGPoint(x: 70.86, y: 28.24), controlPoint1: CGPoint(x: 72.66, y: 27.77), controlPoint2: CGPoint(x: 71.71, y: 27.91))
        fill4Path.addCurve(to: CGPoint(x: 68.65, y: 29.65), controlPoint1: CGPoint(x: 70.01, y: 28.57), controlPoint2: CGPoint(x: 69.27, y: 29.04))
        fill4Path.addCurve(to: CGPoint(x: 67.21, y: 31.83), controlPoint1: CGPoint(x: 68.03, y: 30.26), controlPoint2: CGPoint(x: 67.55, y: 30.99))
        fill4Path.addCurve(to: CGPoint(x: 66.7, y: 34.61), controlPoint1: CGPoint(x: 66.87, y: 32.68), controlPoint2: CGPoint(x: 66.7, y: 33.6))
        fill4Path.addLine(to: CGPoint(x: 66.7, y: 44.7))
        fill4Path.addLine(to: CGPoint(x: 64.4, y: 44.7))
        fill4Path.addLine(to: CGPoint(x: 64.4, y: 25.76))
        fill4Path.addLine(to: CGPoint(x: 66.52, y: 25.76))
        fill4Path.close()
        fill4Path.miterLimit = 4;
        
        fill4Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill4Path.fill()
        
        
        //// Fill-6 Drawing
        let fill6Path = UIBezierPath()
        fill6Path.move(to: CGPoint(x: 83.37, y: 25.76))
        fill6Path.addLine(to: CGPoint(x: 83.37, y: 27.71))
        fill6Path.addLine(to: CGPoint(x: 79.54, y: 27.71))
        fill6Path.addLine(to: CGPoint(x: 79.54, y: 40.48))
        fill6Path.addCurve(to: CGPoint(x: 79.85, y: 42.26), controlPoint1: CGPoint(x: 79.54, y: 41.24), controlPoint2: CGPoint(x: 79.64, y: 41.83))
        fill6Path.addCurve(to: CGPoint(x: 81.4, y: 42.98), controlPoint1: CGPoint(x: 80.06, y: 42.69), controlPoint2: CGPoint(x: 80.57, y: 42.93))
        fill6Path.addCurve(to: CGPoint(x: 83.37, y: 42.87), controlPoint1: CGPoint(x: 82.06, y: 42.98), controlPoint2: CGPoint(x: 82.71, y: 42.94))
        fill6Path.addLine(to: CGPoint(x: 83.37, y: 44.81))
        fill6Path.addCurve(to: CGPoint(x: 82.35, y: 44.85), controlPoint1: CGPoint(x: 83.03, y: 44.81), controlPoint2: CGPoint(x: 82.69, y: 44.82))
        fill6Path.addCurve(to: CGPoint(x: 81.33, y: 44.88), controlPoint1: CGPoint(x: 82.01, y: 44.87), controlPoint2: CGPoint(x: 81.67, y: 44.88))
        fill6Path.addCurve(to: CGPoint(x: 78.12, y: 43.98), controlPoint1: CGPoint(x: 79.79, y: 44.88), controlPoint2: CGPoint(x: 78.72, y: 44.58))
        fill6Path.addCurve(to: CGPoint(x: 77.24, y: 40.66), controlPoint1: CGPoint(x: 77.51, y: 43.39), controlPoint2: CGPoint(x: 77.22, y: 42.28))
        fill6Path.addLine(to: CGPoint(x: 77.24, y: 27.71))
        fill6Path.addLine(to: CGPoint(x: 73.96, y: 27.71))
        fill6Path.addLine(to: CGPoint(x: 73.96, y: 25.76))
        fill6Path.addLine(to: CGPoint(x: 77.24, y: 25.76))
        fill6Path.addLine(to: CGPoint(x: 77.24, y: 20.07))
        fill6Path.addLine(to: CGPoint(x: 79.54, y: 20.07))
        fill6Path.addLine(to: CGPoint(x: 79.54, y: 25.76))
        fill6Path.addLine(to: CGPoint(x: 83.37, y: 25.76))
        fill6Path.close()
        fill6Path.miterLimit = 4;
        
        fill6Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill6Path.fill()
        
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imageViewtool
    }
    func drawRatingStars(_ rating: Int) -> UIImage{
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 120, height: 30), false, 0)
        var fillColor1 = UIColor()
        var fillColor2 = UIColor()
        var fillColor3 = UIColor()
        var fillColor4 = UIColor()
        var fillColor5 = UIColor()
        let defaultColor = UIColor.black
        //        UIColor(red: 0.538, green: 0.538, blue: 0.538, alpha: 1.000)
        let starColor = UIColor.orange
        
        if(rating == 1){
            fillColor1 = starColor
            fillColor2 = defaultColor
            fillColor3 = defaultColor
            fillColor4 = defaultColor
            fillColor5 = defaultColor
        }
        else if(rating == 2){
            fillColor1 = starColor
            fillColor2 = starColor
            fillColor3 = defaultColor
            fillColor4 = defaultColor
            fillColor5 = defaultColor
        }
        else if(rating == 3){
            fillColor1 = starColor
            fillColor2 = starColor
            fillColor3 = starColor
            fillColor4 = defaultColor
            fillColor5 = defaultColor
        }
        else if(rating == 4){
            fillColor1 = starColor
            fillColor2 = starColor
            fillColor3 = starColor
            fillColor4 = starColor
            fillColor5 = defaultColor
        }
        else if(rating == 5){
            fillColor1 = starColor
            fillColor2 = starColor
            fillColor3 = starColor
            fillColor4 = starColor
            fillColor5 = starColor
        }
        
        
        //// Group-6
        //// Page-1 Drawing
        let page1Path = UIBezierPath()
        page1Path.move(to: CGPoint(x: 6.5, y: 2.11))
        page1Path.addLine(to: CGPoint(x: 4.49, y: 6.39))
        page1Path.addLine(to: CGPoint(x: 0, y: 7.08))
        page1Path.addLine(to: CGPoint(x: 3.25, y: 10.41))
        page1Path.addLine(to: CGPoint(x: 2.49, y: 15.11))
        page1Path.addLine(to: CGPoint(x: 6.5, y: 12.89))
        page1Path.addLine(to: CGPoint(x: 10.51, y: 15.11))
        page1Path.addLine(to: CGPoint(x: 9.75, y: 10.41))
        page1Path.addLine(to: CGPoint(x: 13, y: 7.08))
        page1Path.addLine(to: CGPoint(x: 8.51, y: 6.39))
        page1Path.addLine(to: CGPoint(x: 6.5, y: 2.11))
        page1Path.close()
        page1Path.miterLimit = 4;
        
        page1Path.usesEvenOddFillRule = true;
        
        fillColor1.setFill()
        page1Path.fill()
        
        
        //// Page- Drawing
        let pagePath = UIBezierPath()
        pagePath.move(to: CGPoint(x: 20.5, y: 2.11))
        pagePath.addLine(to: CGPoint(x: 18.49, y: 6.39))
        pagePath.addLine(to: CGPoint(x: 14, y: 7.08))
        pagePath.addLine(to: CGPoint(x: 17.25, y: 10.41))
        pagePath.addLine(to: CGPoint(x: 16.49, y: 15.11))
        pagePath.addLine(to: CGPoint(x: 20.5, y: 12.89))
        pagePath.addLine(to: CGPoint(x: 24.51, y: 15.11))
        pagePath.addLine(to: CGPoint(x: 23.75, y: 10.41))
        pagePath.addLine(to: CGPoint(x: 27, y: 7.08))
        pagePath.addLine(to: CGPoint(x: 22.51, y: 6.39))
        pagePath.addLine(to: CGPoint(x: 20.5, y: 2.11))
        pagePath.close()
        pagePath.miterLimit = 4;
        
        pagePath.usesEvenOddFillRule = true;
        
        fillColor2.setFill()
        pagePath.fill()
        
        
        //// Page- 2 Drawing
        let page2Path = UIBezierPath()
        page2Path.move(to: CGPoint(x: 34.5, y: 2.11))
        page2Path.addLine(to: CGPoint(x: 32.49, y: 6.39))
        page2Path.addLine(to: CGPoint(x: 28, y: 7.08))
        page2Path.addLine(to: CGPoint(x: 31.25, y: 10.41))
        page2Path.addLine(to: CGPoint(x: 30.49, y: 15.11))
        page2Path.addLine(to: CGPoint(x: 34.5, y: 12.89))
        page2Path.addLine(to: CGPoint(x: 38.51, y: 15.11))
        page2Path.addLine(to: CGPoint(x: 37.75, y: 10.41))
        page2Path.addLine(to: CGPoint(x: 41, y: 7.08))
        page2Path.addLine(to: CGPoint(x: 36.51, y: 6.39))
        page2Path.addLine(to: CGPoint(x: 34.5, y: 2.11))
        page2Path.close()
        page2Path.miterLimit = 4;
        
        page2Path.usesEvenOddFillRule = true;
        
        fillColor3.setFill()
        page2Path.fill()
        
        
        //// Page- 3 Drawing
        let page3Path = UIBezierPath()
        page3Path.move(to: CGPoint(x: 48.5, y: 2.11))
        page3Path.addLine(to: CGPoint(x: 46.49, y: 6.39))
        page3Path.addLine(to: CGPoint(x: 42, y: 7.08))
        page3Path.addLine(to: CGPoint(x: 45.25, y: 10.41))
        page3Path.addLine(to: CGPoint(x: 44.49, y: 15.11))
        page3Path.addLine(to: CGPoint(x: 48.5, y: 12.89))
        page3Path.addLine(to: CGPoint(x: 52.51, y: 15.11))
        page3Path.addLine(to: CGPoint(x: 51.75, y: 10.41))
        page3Path.addLine(to: CGPoint(x: 55, y: 7.08))
        page3Path.addLine(to: CGPoint(x: 50.51, y: 6.39))
        page3Path.addLine(to: CGPoint(x: 48.5, y: 2.11))
        page3Path.close()
        page3Path.miterLimit = 4;
        
        page3Path.usesEvenOddFillRule = true;
        
        fillColor4.setFill()
        page3Path.fill()
        
        
        //// Page- 4 Drawing
        let page4Path = UIBezierPath()
        page4Path.move(to: CGPoint(x: 62.5, y: 2.11))
        page4Path.addLine(to: CGPoint(x: 60.49, y: 6.39))
        page4Path.addLine(to: CGPoint(x: 56, y: 7.08))
        page4Path.addLine(to: CGPoint(x: 59.25, y: 10.41))
        page4Path.addLine(to: CGPoint(x: 58.49, y: 15.11))
        page4Path.addLine(to: CGPoint(x: 62.5, y: 12.89))
        page4Path.addLine(to: CGPoint(x: 66.51, y: 15.11))
        page4Path.addLine(to: CGPoint(x: 65.75, y: 10.41))
        page4Path.addLine(to: CGPoint(x: 69, y: 7.08))
        page4Path.addLine(to: CGPoint(x: 64.51, y: 6.39))
        page4Path.addLine(to: CGPoint(x: 62.5, y: 2.11))
        page4Path.close()
        page4Path.miterLimit = 4;
        
        page4Path.usesEvenOddFillRule = true;
        
        fillColor5.setFill()
        page4Path.fill()
        
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imgbgc!
    }
    func ratingStar(_ data: String)->UIImage{
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 40, height: 32), false, 0)
        var fillColor: UIColor!
        if(data == "filled"){
            fillColor = UIColor.orange
        }
        else{
            fillColor = UIColor(red: 0.538, green: 0.538, blue: 0.538, alpha: 1.000)
        }
        //// Group-6
        //// Page-1 Drawing
        
        let page1Path = UIBezierPath()
        page1Path.move(to: CGPoint(x: 16.71, y: 0.1))
        page1Path.addLine(to: CGPoint(x: 11.54, y: 10.92))
        page1Path.addLine(to: CGPoint(x: 0, y: 12.65))
        page1Path.addLine(to: CGPoint(x: 8.36, y: 21.06))
        page1Path.addLine(to: CGPoint(x: 6.4, y: 32.94))
        page1Path.addLine(to: CGPoint(x: 16.71, y: 27.34))
        page1Path.addLine(to: CGPoint(x: 27.03, y: 32.94))
        page1Path.addLine(to: CGPoint(x: 25.07, y: 21.06))
        page1Path.addLine(to: CGPoint(x: 33.43, y: 12.65))
        page1Path.addLine(to: CGPoint(x: 21.88, y: 10.92))
        page1Path.addLine(to: CGPoint(x: 16.71, y: 0.1))
        page1Path.close()
        page1Path.miterLimit = 4;
        
        page1Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        page1Path.fill()
        
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imgbgc!
    }
    func right()->UIImage{
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 30), false, 0)
        let strokeColor = UIColor.green//UIColor(red: 0.715, green: 0.723, blue: 0.733, alpha: 1.000)
        
        //// Page-1 Drawing
        let page1Path = UIBezierPath()
        page1Path.move(to: CGPoint(x: 8.42, y: 27.65))
        page1Path.addCurve(to: CGPoint(x: 6, y: 24.32), controlPoint1: CGPoint(x: 7.61, y: 26.54), controlPoint2: CGPoint(x: 6.8, y: 25.43))
        page1Path.addCurve(to: CGPoint(x: 2.74, y: 19.86), controlPoint1: CGPoint(x: 4.91, y: 22.84), controlPoint2: CGPoint(x: 3.83, y: 21.35))
        page1Path.addCurve(to: CGPoint(x: 1.06, y: 17.56), controlPoint1: CGPoint(x: 2.18, y: 19.1), controlPoint2: CGPoint(x: 1.62, y: 18.33))
        page1Path.addCurve(to: CGPoint(x: 1, y: 17.46), controlPoint1: CGPoint(x: 1.04, y: 17.53), controlPoint2: CGPoint(x: 1.02, y: 17.5))
        page1Path.addCurve(to: CGPoint(x: 1.02, y: 17.44), controlPoint1: CGPoint(x: 1.01, y: 17.46), controlPoint2: CGPoint(x: 1.01, y: 17.45))
        page1Path.addCurve(to: CGPoint(x: 7.32, y: 21.65), controlPoint1: CGPoint(x: 3.12, y: 18.84), controlPoint2: CGPoint(x: 5.21, y: 20.24))
        page1Path.addCurve(to: CGPoint(x: 7.63, y: 21.15), controlPoint1: CGPoint(x: 7.42, y: 21.48), controlPoint2: CGPoint(x: 7.52, y: 21.32))
        page1Path.addCurve(to: CGPoint(x: 12.19, y: 14.37), controlPoint1: CGPoint(x: 9.05, y: 18.82), controlPoint2: CGPoint(x: 10.55, y: 16.55))
        page1Path.addCurve(to: CGPoint(x: 14.61, y: 11.28), controlPoint1: CGPoint(x: 12.98, y: 13.33), controlPoint2: CGPoint(x: 13.78, y: 12.29))
        page1Path.addCurve(to: CGPoint(x: 19.07, y: 6.41), controlPoint1: CGPoint(x: 16, y: 9.57), controlPoint2: CGPoint(x: 17.49, y: 7.95))
        page1Path.addCurve(to: CGPoint(x: 21.78, y: 3.98), controlPoint1: CGPoint(x: 19.94, y: 5.57), controlPoint2: CGPoint(x: 20.84, y: 4.75))
        page1Path.addCurve(to: CGPoint(x: 24.18, y: 2.18), controlPoint1: CGPoint(x: 22.56, y: 3.34), controlPoint2: CGPoint(x: 23.35, y: 2.74))
        page1Path.addCurve(to: CGPoint(x: 24.27, y: 2.13), controlPoint1: CGPoint(x: 24.21, y: 2.16), controlPoint2: CGPoint(x: 24.24, y: 2.15))
        page1Path.addCurve(to: CGPoint(x: 24.29, y: 2.15), controlPoint1: CGPoint(x: 24.27, y: 2.14), controlPoint2: CGPoint(x: 24.28, y: 2.14))
        page1Path.addCurve(to: CGPoint(x: 24.2, y: 2.26), controlPoint1: CGPoint(x: 24.26, y: 2.19), controlPoint2: CGPoint(x: 24.23, y: 2.23))
        page1Path.addCurve(to: CGPoint(x: 22.98, y: 3.61), controlPoint1: CGPoint(x: 23.79, y: 2.71), controlPoint2: CGPoint(x: 23.38, y: 3.16))
        page1Path.addCurve(to: CGPoint(x: 21.36, y: 5.51), controlPoint1: CGPoint(x: 22.43, y: 4.24), controlPoint2: CGPoint(x: 21.88, y: 4.87))
        page1Path.addCurve(to: CGPoint(x: 19.24, y: 8.19), controlPoint1: CGPoint(x: 20.64, y: 6.39), controlPoint2: CGPoint(x: 19.93, y: 7.28))
        page1Path.addCurve(to: CGPoint(x: 14.31, y: 15.63), controlPoint1: CGPoint(x: 17.44, y: 10.57), controlPoint2: CGPoint(x: 15.81, y: 13.06))
        page1Path.addCurve(to: CGPoint(x: 10.29, y: 23.42), controlPoint1: CGPoint(x: 12.84, y: 18.16), controlPoint2: CGPoint(x: 11.5, y: 20.76))
        page1Path.addCurve(to: CGPoint(x: 8.45, y: 27.62), controlPoint1: CGPoint(x: 9.65, y: 24.81), controlPoint2: CGPoint(x: 9.06, y: 26.22))
        page1Path.addCurve(to: CGPoint(x: 8.44, y: 27.65), controlPoint1: CGPoint(x: 8.44, y: 27.63), controlPoint2: CGPoint(x: 8.44, y: 27.64))
        page1Path.addLine(to: CGPoint(x: 8.42, y: 27.65))
        page1Path.addLine(to: CGPoint(x: 8.42, y: 27.65))
        page1Path.close()
        page1Path.miterLimit = 4;
        
        strokeColor.setStroke()
        page1Path.lineWidth = 1
        page1Path.stroke()
        
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imgbgc!
    }
    func upload()->UIImage{
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 30), false, 0)
        let strokeColor = UIColor(red: 0.715, green: 0.723, blue: 0.733, alpha: 1.000)
        
        //// Page-1
        //// Stroke-1 Drawing
        let stroke1Path = UIBezierPath()
        stroke1Path.move(to: CGPoint(x: 15.85, y: 6.57))
        stroke1Path.addCurve(to: CGPoint(x: 16.03, y: 6.72), controlPoint1: CGPoint(x: 15.94, y: 6.64), controlPoint2: CGPoint(x: 15.98, y: 6.68))
        stroke1Path.addCurve(to: CGPoint(x: 19.24, y: 9.93), controlPoint1: CGPoint(x: 17.1, y: 7.79), controlPoint2: CGPoint(x: 18.17, y: 8.86))
        stroke1Path.addCurve(to: CGPoint(x: 20.03, y: 10.38), controlPoint1: CGPoint(x: 19.46, y: 10.15), controlPoint2: CGPoint(x: 19.72, y: 10.31))
        stroke1Path.addCurve(to: CGPoint(x: 21.58, y: 9.8), controlPoint1: CGPoint(x: 20.63, y: 10.51), controlPoint2: CGPoint(x: 21.25, y: 10.28))
        stroke1Path.addCurve(to: CGPoint(x: 21.57, y: 8.13), controlPoint1: CGPoint(x: 21.95, y: 9.25), controlPoint2: CGPoint(x: 21.95, y: 8.65))
        stroke1Path.addCurve(to: CGPoint(x: 21.13, y: 7.65), controlPoint1: CGPoint(x: 21.45, y: 7.95), controlPoint2: CGPoint(x: 21.28, y: 7.8))
        stroke1Path.addCurve(to: CGPoint(x: 18.48, y: 4.99), controlPoint1: CGPoint(x: 20.25, y: 6.76), controlPoint2: CGPoint(x: 19.37, y: 5.87))
        stroke1Path.addCurve(to: CGPoint(x: 16, y: 2.51), controlPoint1: CGPoint(x: 17.66, y: 4.16), controlPoint2: CGPoint(x: 16.83, y: 3.34))
        stroke1Path.addCurve(to: CGPoint(x: 15.17, y: 1.75), controlPoint1: CGPoint(x: 15.73, y: 2.25), controlPoint2: CGPoint(x: 15.48, y: 1.95))
        stroke1Path.addCurve(to: CGPoint(x: 13.23, y: 2.07), controlPoint1: CGPoint(x: 14.49, y: 1.32), controlPoint2: CGPoint(x: 13.83, y: 1.46))
        stroke1Path.addCurve(to: CGPoint(x: 9.61, y: 5.7), controlPoint1: CGPoint(x: 12.03, y: 3.28), controlPoint2: CGPoint(x: 10.82, y: 4.49))
        stroke1Path.addCurve(to: CGPoint(x: 7.31, y: 8.02), controlPoint1: CGPoint(x: 8.84, y: 6.47), controlPoint2: CGPoint(x: 8.06, y: 7.23))
        stroke1Path.addCurve(to: CGPoint(x: 7.39, y: 10.01), controlPoint1: CGPoint(x: 6.76, y: 8.59), controlPoint2: CGPoint(x: 6.81, y: 9.4))
        stroke1Path.addCurve(to: CGPoint(x: 9.29, y: 10.11), controlPoint1: CGPoint(x: 7.89, y: 10.52), controlPoint2: CGPoint(x: 8.76, y: 10.6))
        stroke1Path.addCurve(to: CGPoint(x: 12.28, y: 7.19), controlPoint1: CGPoint(x: 10.3, y: 9.15), controlPoint2: CGPoint(x: 11.29, y: 8.17))
        stroke1Path.addCurve(to: CGPoint(x: 12.93, y: 6.56), controlPoint1: CGPoint(x: 12.48, y: 7), controlPoint2: CGPoint(x: 12.68, y: 6.8))
        stroke1Path.addLine(to: CGPoint(x: 12.93, y: 6.87))
        stroke1Path.addCurve(to: CGPoint(x: 12.93, y: 19.12), controlPoint1: CGPoint(x: 12.93, y: 10.96), controlPoint2: CGPoint(x: 12.93, y: 15.04))
        stroke1Path.addCurve(to: CGPoint(x: 12.97, y: 19.59), controlPoint1: CGPoint(x: 12.93, y: 19.28), controlPoint2: CGPoint(x: 12.94, y: 19.43))
        stroke1Path.addCurve(to: CGPoint(x: 14.05, y: 20.73), controlPoint1: CGPoint(x: 13.05, y: 20.13), controlPoint2: CGPoint(x: 13.5, y: 20.59))
        stroke1Path.addCurve(to: CGPoint(x: 15.54, y: 20.21), controlPoint1: CGPoint(x: 14.6, y: 20.86), controlPoint2: CGPoint(x: 15.22, y: 20.64))
        stroke1Path.addCurve(to: CGPoint(x: 15.85, y: 19.2), controlPoint1: CGPoint(x: 15.77, y: 19.91), controlPoint2: CGPoint(x: 15.85, y: 19.57))
        stroke1Path.addCurve(to: CGPoint(x: 15.85, y: 6.89), controlPoint1: CGPoint(x: 15.85, y: 15.1), controlPoint2: CGPoint(x: 15.85, y: 10.99))
        stroke1Path.addLine(to: CGPoint(x: 15.85, y: 6.57))
        stroke1Path.addLine(to: CGPoint(x: 15.85, y: 6.57))
        stroke1Path.close()
        stroke1Path.miterLimit = 4;
        
        stroke1Path.usesEvenOddFillRule = true;
        
        strokeColor.setStroke()
        stroke1Path.lineWidth = 1
        stroke1Path.stroke()
        
        
        //// Stroke-3 Drawing
        let stroke3Path = UIBezierPath()
        stroke3Path.move(to: CGPoint(x: 2.75, y: 27.95))
        stroke3Path.addCurve(to: CGPoint(x: 2.09, y: 27.63), controlPoint1: CGPoint(x: 2.53, y: 27.85), controlPoint2: CGPoint(x: 2.29, y: 27.77))
        stroke3Path.addCurve(to: CGPoint(x: 1.5, y: 26.41), controlPoint1: CGPoint(x: 1.68, y: 27.34), controlPoint2: CGPoint(x: 1.5, y: 26.91))
        stroke3Path.addCurve(to: CGPoint(x: 1.5, y: 18.55), controlPoint1: CGPoint(x: 1.5, y: 23.79), controlPoint2: CGPoint(x: 1.5, y: 21.17))
        stroke3Path.addCurve(to: CGPoint(x: 3.56, y: 17.13), controlPoint1: CGPoint(x: 1.5, y: 17.38), controlPoint2: CGPoint(x: 2.66, y: 16.76))
        stroke3Path.addCurve(to: CGPoint(x: 4.46, y: 18.26), controlPoint1: CGPoint(x: 4.06, y: 17.33), controlPoint2: CGPoint(x: 4.37, y: 17.71))
        stroke3Path.addCurve(to: CGPoint(x: 4.48, y: 18.64), controlPoint1: CGPoint(x: 4.48, y: 18.38), controlPoint2: CGPoint(x: 4.48, y: 18.51))
        stroke3Path.addCurve(to: CGPoint(x: 4.48, y: 24.68), controlPoint1: CGPoint(x: 4.48, y: 20.65), controlPoint2: CGPoint(x: 4.48, y: 22.66))
        stroke3Path.addLine(to: CGPoint(x: 4.48, y: 24.94))
        stroke3Path.addLine(to: CGPoint(x: 24.3, y: 24.94))
        stroke3Path.addLine(to: CGPoint(x: 24.3, y: 24.69))
        stroke3Path.addCurve(to: CGPoint(x: 24.3, y: 18.63), controlPoint1: CGPoint(x: 24.3, y: 22.67), controlPoint2: CGPoint(x: 24.3, y: 20.65))
        stroke3Path.addCurve(to: CGPoint(x: 24.81, y: 17.38), controlPoint1: CGPoint(x: 24.3, y: 18.15), controlPoint2: CGPoint(x: 24.42, y: 17.71))
        stroke3Path.addCurve(to: CGPoint(x: 26.27, y: 17.11), controlPoint1: CGPoint(x: 25.24, y: 17.02), controlPoint2: CGPoint(x: 25.74, y: 16.92))
        stroke3Path.addCurve(to: CGPoint(x: 27.21, y: 18.28), controlPoint1: CGPoint(x: 26.8, y: 17.3), controlPoint2: CGPoint(x: 27.14, y: 17.7))
        stroke3Path.addCurve(to: CGPoint(x: 27.23, y: 19.37), controlPoint1: CGPoint(x: 27.25, y: 18.64), controlPoint2: CGPoint(x: 27.23, y: 19.01))
        stroke3Path.addCurve(to: CGPoint(x: 27.24, y: 26.34), controlPoint1: CGPoint(x: 27.24, y: 21.7), controlPoint2: CGPoint(x: 27.23, y: 24.02))
        stroke3Path.addCurve(to: CGPoint(x: 26.65, y: 27.65), controlPoint1: CGPoint(x: 27.24, y: 26.87), controlPoint2: CGPoint(x: 27.09, y: 27.34))
        stroke3Path.addCurve(to: CGPoint(x: 26.03, y: 27.95), controlPoint1: CGPoint(x: 26.46, y: 27.78), controlPoint2: CGPoint(x: 26.24, y: 27.86))
        stroke3Path.addLine(to: CGPoint(x: 2.75, y: 27.95))
        stroke3Path.addLine(to: CGPoint(x: 2.75, y: 27.95))
        stroke3Path.close()
        stroke3Path.miterLimit = 4;
        
        stroke3Path.usesEvenOddFillRule = true;
        
        strokeColor.setStroke()
        stroke3Path.lineWidth = 1
        stroke3Path.stroke()
        
        
        //// Stroke-5 Drawing
        let stroke5Path = UIBezierPath()
        stroke5Path.move(to: CGPoint(x: 15.85, y: 6.57))
        stroke5Path.addLine(to: CGPoint(x: 15.85, y: 6.89))
        stroke5Path.addCurve(to: CGPoint(x: 15.85, y: 19.2), controlPoint1: CGPoint(x: 15.85, y: 10.99), controlPoint2: CGPoint(x: 15.85, y: 15.1))
        stroke5Path.addCurve(to: CGPoint(x: 15.54, y: 20.21), controlPoint1: CGPoint(x: 15.85, y: 19.57), controlPoint2: CGPoint(x: 15.77, y: 19.91))
        stroke5Path.addCurve(to: CGPoint(x: 14.05, y: 20.73), controlPoint1: CGPoint(x: 15.22, y: 20.64), controlPoint2: CGPoint(x: 14.6, y: 20.86))
        stroke5Path.addCurve(to: CGPoint(x: 12.97, y: 19.59), controlPoint1: CGPoint(x: 13.5, y: 20.59), controlPoint2: CGPoint(x: 13.05, y: 20.13))
        stroke5Path.addCurve(to: CGPoint(x: 12.93, y: 19.12), controlPoint1: CGPoint(x: 12.94, y: 19.43), controlPoint2: CGPoint(x: 12.93, y: 19.28))
        stroke5Path.addCurve(to: CGPoint(x: 12.93, y: 6.87), controlPoint1: CGPoint(x: 12.93, y: 15.04), controlPoint2: CGPoint(x: 12.93, y: 10.96))
        stroke5Path.addLine(to: CGPoint(x: 12.93, y: 6.56))
        stroke5Path.addCurve(to: CGPoint(x: 12.28, y: 7.19), controlPoint1: CGPoint(x: 12.68, y: 6.8), controlPoint2: CGPoint(x: 12.48, y: 7))
        stroke5Path.addCurve(to: CGPoint(x: 9.29, y: 10.11), controlPoint1: CGPoint(x: 11.29, y: 8.17), controlPoint2: CGPoint(x: 10.3, y: 9.15))
        stroke5Path.addCurve(to: CGPoint(x: 7.39, y: 10.01), controlPoint1: CGPoint(x: 8.76, y: 10.6), controlPoint2: CGPoint(x: 7.89, y: 10.52))
        stroke5Path.addCurve(to: CGPoint(x: 7.31, y: 8.02), controlPoint1: CGPoint(x: 6.81, y: 9.4), controlPoint2: CGPoint(x: 6.76, y: 8.59))
        stroke5Path.addCurve(to: CGPoint(x: 9.61, y: 5.7), controlPoint1: CGPoint(x: 8.06, y: 7.23), controlPoint2: CGPoint(x: 8.84, y: 6.47))
        stroke5Path.addCurve(to: CGPoint(x: 13.23, y: 2.07), controlPoint1: CGPoint(x: 10.82, y: 4.49), controlPoint2: CGPoint(x: 12.03, y: 3.28))
        stroke5Path.addCurve(to: CGPoint(x: 15.17, y: 1.75), controlPoint1: CGPoint(x: 13.83, y: 1.46), controlPoint2: CGPoint(x: 14.49, y: 1.32))
        stroke5Path.addCurve(to: CGPoint(x: 16, y: 2.51), controlPoint1: CGPoint(x: 15.48, y: 1.95), controlPoint2: CGPoint(x: 15.73, y: 2.25))
        stroke5Path.addCurve(to: CGPoint(x: 18.48, y: 4.99), controlPoint1: CGPoint(x: 16.83, y: 3.34), controlPoint2: CGPoint(x: 17.66, y: 4.16))
        stroke5Path.addCurve(to: CGPoint(x: 21.13, y: 7.65), controlPoint1: CGPoint(x: 19.37, y: 5.87), controlPoint2: CGPoint(x: 20.25, y: 6.76))
        stroke5Path.addCurve(to: CGPoint(x: 21.57, y: 8.13), controlPoint1: CGPoint(x: 21.28, y: 7.8), controlPoint2: CGPoint(x: 21.45, y: 7.95))
        stroke5Path.addCurve(to: CGPoint(x: 21.58, y: 9.8), controlPoint1: CGPoint(x: 21.95, y: 8.65), controlPoint2: CGPoint(x: 21.95, y: 9.25))
        stroke5Path.addCurve(to: CGPoint(x: 20.03, y: 10.38), controlPoint1: CGPoint(x: 21.25, y: 10.28), controlPoint2: CGPoint(x: 20.63, y: 10.51))
        stroke5Path.addCurve(to: CGPoint(x: 19.24, y: 9.93), controlPoint1: CGPoint(x: 19.72, y: 10.31), controlPoint2: CGPoint(x: 19.46, y: 10.15))
        stroke5Path.addCurve(to: CGPoint(x: 16.03, y: 6.72), controlPoint1: CGPoint(x: 18.17, y: 8.86), controlPoint2: CGPoint(x: 17.1, y: 7.79))
        stroke5Path.addCurve(to: CGPoint(x: 15.85, y: 6.57), controlPoint1: CGPoint(x: 15.98, y: 6.68), controlPoint2: CGPoint(x: 15.94, y: 6.64))
        stroke5Path.addLine(to: CGPoint(x: 15.85, y: 6.57))
        stroke5Path.close()
        stroke5Path.miterLimit = 4;
        
        stroke5Path.usesEvenOddFillRule = true;
        
        strokeColor.setStroke()
        stroke5Path.lineWidth = 1
        stroke5Path.stroke()
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imgbgc!
    }
    
}

