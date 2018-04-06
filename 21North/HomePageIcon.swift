//
//  HomePageIcon.swift
//  21North
//
//  Created by Sachin Tomar on 06/10/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation

class HomePageIcon{
    let delegate = UIApplication.shared.delegate as! AppDelegate
    func editIcon(_ type: String)->UIImage{
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 33), false, 0)
        
        if(type == "edit"){
            
            
            //// General Declarations
            let context = UIGraphicsGetCurrentContext()
            
            //// Color Declarations
            let strokeColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
            let strokeColor2 = UIColor(red: 0.225, green: 0.225, blue: 0.225, alpha: 1.000)
            
            //// Group-4
            //// Page-1
            //// Stroke-1 Drawing
            let stroke1Path = UIBezierPath()
            stroke1Path.move(to: CGPoint(x: 30.64, y: 5.18))
            stroke1Path.addCurve(to: CGPoint(x: 28.94, y: 8), controlPoint1: CGPoint(x: 30.49, y: 6.38), controlPoint2: CGPoint(x: 29.75, y: 7.21))
            stroke1Path.addCurve(to: CGPoint(x: 27.26, y: 9.75), controlPoint1: CGPoint(x: 28.36, y: 8.57), controlPoint2: CGPoint(x: 27.82, y: 9.17))
            stroke1Path.addCurve(to: CGPoint(x: 22.49, y: 4.84), controlPoint1: CGPoint(x: 25.66, y: 8.1), controlPoint2: CGPoint(x: 24.09, y: 6.48))
            stroke1Path.addCurve(to: CGPoint(x: 24.86, y: 2.44), controlPoint1: CGPoint(x: 23.27, y: 4.04), controlPoint2: CGPoint(x: 24.05, y: 3.22))
            stroke1Path.addCurve(to: CGPoint(x: 26.01, y: 1.64), controlPoint1: CGPoint(x: 25.19, y: 2.12), controlPoint2: CGPoint(x: 25.6, y: 1.87))
            stroke1Path.addCurve(to: CGPoint(x: 26.93, y: 1.36), controlPoint1: CGPoint(x: 26.28, y: 1.49), controlPoint2: CGPoint(x: 26.62, y: 1.45))
            stroke1Path.addLine(to: CGPoint(x: 27.66, y: 1.36))
            stroke1Path.addCurve(to: CGPoint(x: 27.83, y: 1.42), controlPoint1: CGPoint(x: 27.72, y: 1.38), controlPoint2: CGPoint(x: 27.77, y: 1.41))
            stroke1Path.addCurve(to: CGPoint(x: 30.24, y: 3.23), controlPoint1: CGPoint(x: 28.91, y: 1.64), controlPoint2: CGPoint(x: 29.74, y: 2.22))
            stroke1Path.addCurve(to: CGPoint(x: 30.64, y: 4.43), controlPoint1: CGPoint(x: 30.42, y: 3.6), controlPoint2: CGPoint(x: 30.51, y: 4.03))
            stroke1Path.addLine(to: CGPoint(x: 30.64, y: 5.18))
            stroke1Path.addLine(to: CGPoint(x: 30.64, y: 5.18))
            stroke1Path.close()
            stroke1Path.miterLimit = 4;
            
            stroke1Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke1Path.lineWidth = 1
            stroke1Path.stroke()
            
            //// Stroke-3 Drawing
            let stroke3Path = UIBezierPath()
            stroke3Path.move(to: CGPoint(x: 20.82, y: 6.66))
            stroke3Path.addCurve(to: CGPoint(x: 25.5, y: 11.47), controlPoint1: CGPoint(x: 22.36, y: 8.24), controlPoint2: CGPoint(x: 23.93, y: 9.86))
            stroke3Path.addCurve(to: CGPoint(x: 10.82, y: 26.51), controlPoint1: CGPoint(x: 20.63, y: 16.46), controlPoint2: CGPoint(x: 15.74, y: 21.47))
            stroke3Path.addCurve(to: CGPoint(x: 6.07, y: 21.75), controlPoint1: CGPoint(x: 9.27, y: 24.96), controlPoint2: CGPoint(x: 7.67, y: 23.36))
            stroke3Path.addCurve(to: CGPoint(x: 20.82, y: 6.66), controlPoint1: CGPoint(x: 11.01, y: 16.69), controlPoint2: CGPoint(x: 15.92, y: 11.67))
            stroke3Path.addLine(to: CGPoint(x: 20.82, y: 6.66))
            stroke3Path.close()
            stroke3Path.miterLimit = 4;
            
            stroke3Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke3Path.lineWidth = 1
            stroke3Path.stroke()
            
            
            //// Stroke-5 Drawing
            let stroke5Path = UIBezierPath()
            stroke5Path.move(to: CGPoint(x: 4.62, y: 23.33))
            stroke5Path.addCurve(to: CGPoint(x: 9.34, y: 28.07), controlPoint1: CGPoint(x: 6.21, y: 24.92), controlPoint2: CGPoint(x: 7.76, y: 26.48))
            stroke5Path.addCurve(to: CGPoint(x: 1.24, y: 31.59), controlPoint1: CGPoint(x: 6.62, y: 29.25), controlPoint2: CGPoint(x: 3.96, y: 30.4))
            stroke5Path.addCurve(to: CGPoint(x: 4.62, y: 23.33), controlPoint1: CGPoint(x: 2.37, y: 28.81), controlPoint2: CGPoint(x: 3.49, y: 26.1))
            stroke5Path.addLine(to: CGPoint(x: 4.62, y: 23.33))
            stroke5Path.close()
            stroke5Path.miterLimit = 4;
            
            stroke5Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke5Path.lineWidth = 1
            stroke5Path.stroke()
            
            //// Page-
            context!.saveGState()
            context!.setAlpha(0.54)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            
            //// Stroke- Drawing
            let strokePath = UIBezierPath()
            strokePath.move(to: CGPoint(x: 29.92, y: 4.82))
            strokePath.addCurve(to: CGPoint(x: 28.22, y: 7.64), controlPoint1: CGPoint(x: 29.76, y: 6.02), controlPoint2: CGPoint(x: 29.03, y: 6.85))
            strokePath.addCurve(to: CGPoint(x: 26.54, y: 9.38), controlPoint1: CGPoint(x: 27.64, y: 8.2), controlPoint2: CGPoint(x: 27.09, y: 8.8))
            strokePath.addCurve(to: CGPoint(x: 21.77, y: 4.47), controlPoint1: CGPoint(x: 24.93, y: 7.73), controlPoint2: CGPoint(x: 23.37, y: 6.12))
            strokePath.addCurve(to: CGPoint(x: 24.13, y: 2.08), controlPoint1: CGPoint(x: 22.55, y: 3.68), controlPoint2: CGPoint(x: 23.32, y: 2.86))
            strokePath.addCurve(to: CGPoint(x: 25.28, y: 1.28), controlPoint1: CGPoint(x: 24.47, y: 1.76), controlPoint2: CGPoint(x: 24.87, y: 1.5))
            strokePath.addCurve(to: CGPoint(x: 26.21, y: 1), controlPoint1: CGPoint(x: 25.56, y: 1.13), controlPoint2: CGPoint(x: 25.9, y: 1.09))
            strokePath.addLine(to: CGPoint(x: 26.94, y: 1))
            strokePath.addCurve(to: CGPoint(x: 27.11, y: 1.05), controlPoint1: CGPoint(x: 26.99, y: 1.02), controlPoint2: CGPoint(x: 27.05, y: 1.04))
            strokePath.addCurve(to: CGPoint(x: 29.51, y: 2.87), controlPoint1: CGPoint(x: 28.18, y: 1.28), controlPoint2: CGPoint(x: 29.01, y: 1.86))
            strokePath.addCurve(to: CGPoint(x: 29.92, y: 4.06), controlPoint1: CGPoint(x: 29.7, y: 3.24), controlPoint2: CGPoint(x: 29.79, y: 3.66))
            strokePath.addLine(to: CGPoint(x: 29.92, y: 4.82))
            strokePath.addLine(to: CGPoint(x: 29.92, y: 4.82))
            strokePath.close()
            strokePath.miterLimit = 4;
            
            strokePath.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            strokePath.lineWidth = 1
            strokePath.stroke()
            
            
            //// Stroke- 2 Drawing
            let stroke2Path = UIBezierPath()
            stroke2Path.move(to: CGPoint(x: 20.36, y: 6.38))
            stroke2Path.addCurve(to: CGPoint(x: 25.05, y: 11.2), controlPoint1: CGPoint(x: 21.91, y: 7.97), controlPoint2: CGPoint(x: 23.48, y: 9.58))
            stroke2Path.addCurve(to: CGPoint(x: 10.36, y: 26.24), controlPoint1: CGPoint(x: 20.17, y: 16.19), controlPoint2: CGPoint(x: 15.29, y: 21.19))
            stroke2Path.addCurve(to: CGPoint(x: 5.62, y: 21.47), controlPoint1: CGPoint(x: 8.81, y: 24.68), controlPoint2: CGPoint(x: 7.22, y: 23.08))
            stroke2Path.addCurve(to: CGPoint(x: 20.36, y: 6.38), controlPoint1: CGPoint(x: 10.55, y: 16.42), controlPoint2: CGPoint(x: 15.46, y: 11.4))
            stroke2Path.addLine(to: CGPoint(x: 20.36, y: 6.38))
            stroke2Path.close()
            stroke2Path.miterLimit = 4;
            
            stroke2Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            stroke2Path.lineWidth = 1
            stroke2Path.stroke()
            
            
            //// Stroke- 4 Drawing
            let stroke4Path = UIBezierPath()
            stroke4Path.move(to: CGPoint(x: 4.39, y: 22.54))
            stroke4Path.addCurve(to: CGPoint(x: 9.11, y: 27.28), controlPoint1: CGPoint(x: 5.97, y: 24.14), controlPoint2: CGPoint(x: 7.52, y: 25.69))
            stroke4Path.addCurve(to: CGPoint(x: 1, y: 30.8), controlPoint1: CGPoint(x: 6.39, y: 28.46), controlPoint2: CGPoint(x: 3.73, y: 29.62))
            stroke4Path.addCurve(to: CGPoint(x: 4.39, y: 22.54), controlPoint1: CGPoint(x: 2.14, y: 28.03), controlPoint2: CGPoint(x: 3.25, y: 25.31))
            stroke4Path.addLine(to: CGPoint(x: 4.39, y: 22.54))
            stroke4Path.close()
            stroke4Path.miterLimit = 4;
            
            stroke4Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            stroke4Path.lineWidth = 1
            stroke4Path.stroke()
            
            
            context!.endTransparencyLayer()
            context!.restoreGState()
            
            
        }
        else if(type == "cancelButton"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 30), false, 0)
            let context = UIGraphicsGetCurrentContext()
            
            //// Color Declarations
            let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
            
            //// Group-2
            //// Rectangle-1 Drawing
            context!.saveGState()
            context!.translateBy(x: 14.35, y: 15.15)
            context!.rotate(by: 45 * CGFloat(Double.pi) / 180)
            
            let rectangle1Path = UIBezierPath(rect: CGRect(x: -10, y: -1, width: 20, height: 2))
            fillColor.setFill()
            rectangle1Path.fill()
            
            context!.restoreGState()
            
            
            //// Rectangle- 3 Drawing
            context!.saveGState()
            context!.translateBy(x: 14.35, y: 15.15)
            context!.rotate(by: 45 * CGFloat(Double.pi) / 180)
            
            let rectangle3Path = UIBezierPath(rect: CGRect(x: -1, y: -10, width: 2, height: 20))
            fillColor.setFill()
            rectangle3Path.fill()
            
            context!.restoreGState()
        }
        else if(type == "documents"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 33), false, 0)
            //// General Declarations
            let context = UIGraphicsGetCurrentContext()
            
            //// Color Declarations
            let strokeColor2 = UIColor(red: 0.225, green: 0.225, blue: 0.225, alpha: 1.000)
            
            //// Group-3
            context!.saveGState()
            context!.setAlpha(0.54)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            //// Stroke- 13 Drawing
            let stroke13Path = UIBezierPath(rect: CGRect(x: 5.53, y: 24.68, width: 13.15, height: 1.55))
            strokeColor2.setStroke()
            stroke13Path.lineWidth = 1
            stroke13Path.stroke()
            
            
            //// Stroke- 14 Drawing
            let stroke14Path = UIBezierPath(rect: CGRect(x: 5.53, y: 12.38, width: 13.15, height: 1.55))
            strokeColor2.setStroke()
            stroke14Path.lineWidth = 1
            stroke14Path.stroke()
            
            
            //// Stroke- 15 Drawing
            let stroke15Path = UIBezierPath(rect: CGRect(x: 5.53, y: 16.48, width: 13.15, height: 1.55))
            strokeColor2.setStroke()
            stroke15Path.lineWidth = 1
            stroke15Path.stroke()
            
            
            //// Stroke- 16 Drawing
            let stroke16Path = UIBezierPath(rect: CGRect(x: 5.53, y: 20.58, width: 13.15, height: 1.55))
            strokeColor2.setStroke()
            stroke16Path.lineWidth = 1
            stroke16Path.stroke()
            
            
            //// Stroke- 17 Drawing
            let stroke17Path = UIBezierPath(rect: CGRect(x: 5.53, y: 24.68, width: 13.15, height: 1.55))
            strokeColor2.setStroke()
            stroke17Path.lineWidth = 1
            stroke17Path.stroke()
            
            context!.endTransparencyLayer()
            context!.restoreGState()
            
            //// Group-3
            context!.saveGState()
            context!.setAlpha(0.54)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            //// Page-
            //// Stroke- Drawing
            let strokePath = UIBezierPath()
            strokePath.move(to: CGPoint(x: 21.54, y: 30.02))
            strokePath.addLine(to: CGPoint(x: 2.63, y: 30.02))
            strokePath.addLine(to: CGPoint(x: 2.63, y: 2.29))
            strokePath.addLine(to: CGPoint(x: 12.23, y: 2.29))
            strokePath.addLine(to: CGPoint(x: 12.23, y: 8.27))
            strokePath.addLine(to: CGPoint(x: 5.51, y: 8.27))
            strokePath.addLine(to: CGPoint(x: 5.51, y: 9.85))
            strokePath.addLine(to: CGPoint(x: 12.24, y: 9.85))
            strokePath.addLine(to: CGPoint(x: 12.24, y: 11.11))
            strokePath.addLine(to: CGPoint(x: 21.54, y: 11.11))
            strokePath.addLine(to: CGPoint(x: 21.54, y: 30.02))
            strokePath.addLine(to: CGPoint(x: 21.54, y: 30.02))
            strokePath.close()
            
            strokePath.move(to: CGPoint(x: 13.86, y: 2.78))
            strokePath.addCurve(to: CGPoint(x: 20.48, y: 9.53), controlPoint1: CGPoint(x: 16.07, y: 5.03), controlPoint2: CGPoint(x: 18.27, y: 7.27))
            strokePath.addLine(to: CGPoint(x: 13.86, y: 9.53))
            strokePath.addLine(to: CGPoint(x: 13.86, y: 2.78))
            strokePath.addLine(to: CGPoint(x: 13.86, y: 2.78))
            strokePath.close()
            strokePath.move(to: CGPoint(x: 23.05, y: 9.9))
            strokePath.addCurve(to: CGPoint(x: 14.33, y: 1.1), controlPoint1: CGPoint(x: 20.14, y: 6.97), controlPoint2: CGPoint(x: 17.23, y: 4.04))
            strokePath.addCurve(to: CGPoint(x: 14.12, y: 1.03), controlPoint1: CGPoint(x: 14.26, y: 1.04), controlPoint2: CGPoint(x: 14.2, y: 1.03))
            strokePath.addCurve(to: CGPoint(x: 1.16, y: 1.03), controlPoint1: CGPoint(x: 9.8, y: 1.03), controlPoint2: CGPoint(x: 5.48, y: 1.03))
            strokePath.addLine(to: CGPoint(x: 1.03, y: 1.03))
            strokePath.addLine(to: CGPoint(x: 1.03, y: 31.6))
            strokePath.addLine(to: CGPoint(x: 23.15, y: 31.6))
            strokePath.addLine(to: CGPoint(x: 23.15, y: 31.43))
            strokePath.addCurve(to: CGPoint(x: 23.15, y: 10.15), controlPoint1: CGPoint(x: 23.15, y: 24.34), controlPoint2: CGPoint(x: 23.15, y: 17.25))
            strokePath.addCurve(to: CGPoint(x: 23.05, y: 9.9), controlPoint1: CGPoint(x: 23.15, y: 10.05), controlPoint2: CGPoint(x: 23.12, y: 9.98))
            strokePath.addLine(to: CGPoint(x: 23.05, y: 9.9))
            strokePath.close()
            strokePath.miterLimit = 4;
            
            strokePath.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            strokePath.lineWidth = 1
            strokePath.stroke()
            
            
            //// path-3 Drawing
            
            
            //// Clip-
            
            
            //// Stroke- 2 Drawing
            let stroke2Path = UIBezierPath(rect: CGRect(x: 5.53, y: 12.38, width: 13.15, height: 1.55))
            strokeColor2.setStroke()
            stroke2Path.lineWidth = 1
            stroke2Path.stroke()
            
            
            //// Stroke- 4 Drawing
            let stroke4Path = UIBezierPath(rect: CGRect(x: 5.53, y: 16.48, width: 13.15, height: 1.55))
            strokeColor2.setStroke()
            stroke4Path.lineWidth = 1
            stroke4Path.stroke()
            
            
            //// Stroke- 12 Drawing
            let stroke12Path = UIBezierPath(rect: CGRect(x: 5.53, y: 20.58, width: 13.15, height: 1.55))
            strokeColor2.setStroke()
            stroke12Path.lineWidth = 1
            stroke12Path.stroke()
            
            context!.endTransparencyLayer()
            context!.restoreGState()
            
            //// Color Declarations
            let strokeColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
            
            //// Group-3
            context!.saveGState()
            context!.setAlpha(0.54)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            
            //// Page-1
            //// Stroke-7 Drawing
            let stroke7Path = UIBezierPath(rect: CGRect(x: 6.28, y: 25.43, width: 13.15, height: 1.55))
            strokeColor.setStroke()
            stroke7Path.lineWidth = 1
            stroke7Path.stroke()
            
            
            //// Stroke-8 Drawing
            let stroke8Path = UIBezierPath(rect: CGRect(x: 6.28, y: 13.18, width: 13.15, height: 1.55))
            strokeColor.setStroke()
            stroke8Path.lineWidth = 1
            stroke8Path.stroke()
            
            
            //// Stroke-9 Drawing
            let stroke9Path = UIBezierPath(rect: CGRect(x: 6.28, y: 17.28, width: 13.15, height: 1.55))
            strokeColor.setStroke()
            stroke9Path.lineWidth = 1
            stroke9Path.stroke()
            
            
            //// Stroke-10 Drawing
            let stroke10Path = UIBezierPath(rect: CGRect(x: 6.28, y: 21.33, width: 13.15, height: 1.55))
            strokeColor.setStroke()
            stroke10Path.lineWidth = 1
            stroke10Path.stroke()
            
            
            //// Stroke-11 Drawing
            let stroke11Path = UIBezierPath(rect: CGRect(x: 6.28, y: 25.43, width: 13.15, height: 1.55))
            strokeColor.setStroke()
            stroke11Path.lineWidth = 1
            stroke11Path.stroke()
            
            context!.endTransparencyLayer()
            context!.restoreGState()
            
//            let strokeColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
            
            //// Group-3
            context!.saveGState()
            context!.setAlpha(0.54)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            
            //// Page-1
            //// Stroke-1 Drawing
            let stroke1Path = UIBezierPath()
            stroke1Path.move(to: CGPoint(x: 22.3, y: 30.79))
            stroke1Path.addLine(to: CGPoint(x: 3.39, y: 30.79))
            stroke1Path.addLine(to: CGPoint(x: 3.39, y: 3.06))
            stroke1Path.addLine(to: CGPoint(x: 13, y: 3.06))
            stroke1Path.addLine(to: CGPoint(x: 13, y: 9.04))
            stroke1Path.addLine(to: CGPoint(x: 6.28, y: 9.04))
            stroke1Path.addLine(to: CGPoint(x: 6.28, y: 10.61))
            stroke1Path.addLine(to: CGPoint(x: 13.01, y: 10.61))
            stroke1Path.addLine(to: CGPoint(x: 13.01, y: 11.88))
            stroke1Path.addLine(to: CGPoint(x: 22.3, y: 11.88))
            stroke1Path.addLine(to: CGPoint(x: 22.3, y: 30.79))
            stroke1Path.addLine(to: CGPoint(x: 22.3, y: 30.79))
            stroke1Path.close()
            stroke1Path.move(to: CGPoint(x: 14.62, y: 3.54))
            stroke1Path.addCurve(to: CGPoint(x: 21.25, y: 10.3), controlPoint1: CGPoint(x: 16.83, y: 5.8), controlPoint2: CGPoint(x: 19.03, y: 8.04))
            stroke1Path.addLine(to: CGPoint(x: 14.62, y: 10.3))
            stroke1Path.addLine(to: CGPoint(x: 14.62, y: 3.54))
            stroke1Path.addLine(to: CGPoint(x: 14.62, y: 3.54))
            stroke1Path.close()
            stroke1Path.move(to: CGPoint(x: 23.81, y: 10.67))
            stroke1Path.addCurve(to: CGPoint(x: 15.09, y: 1.87), controlPoint1: CGPoint(x: 20.91, y: 7.74), controlPoint2: CGPoint(x: 18, y: 4.8))
            stroke1Path.addCurve(to: CGPoint(x: 14.88, y: 1.79), controlPoint1: CGPoint(x: 15.03, y: 1.81), controlPoint2: CGPoint(x: 14.97, y: 1.79))
            stroke1Path.addCurve(to: CGPoint(x: 1.93, y: 1.79), controlPoint1: CGPoint(x: 10.57, y: 1.79), controlPoint2: CGPoint(x: 6.25, y: 1.79))
            stroke1Path.addLine(to: CGPoint(x: 1.79, y: 1.79))
            stroke1Path.addLine(to: CGPoint(x: 1.79, y: 32.37))
            stroke1Path.addLine(to: CGPoint(x: 23.92, y: 32.37))
            stroke1Path.addLine(to: CGPoint(x: 23.92, y: 32.2))
            stroke1Path.addCurve(to: CGPoint(x: 23.92, y: 10.92), controlPoint1: CGPoint(x: 23.92, y: 25.11), controlPoint2: CGPoint(x: 23.92, y: 18.01))
            stroke1Path.addCurve(to: CGPoint(x: 23.81, y: 10.67), controlPoint1: CGPoint(x: 23.92, y: 10.82), controlPoint2: CGPoint(x: 23.89, y: 10.74))
            stroke1Path.addLine(to: CGPoint(x: 23.81, y: 10.67))
            stroke1Path.close()
            stroke1Path.miterLimit = 4;
            
            stroke1Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke1Path.lineWidth = 1
            stroke1Path.stroke()
            
            //// Stroke-3 Drawing
            let stroke3Path = UIBezierPath(rect: CGRect(x: 6.28, y: 13.18, width: 13.15, height: 1.55))
            strokeColor.setStroke()
            stroke3Path.lineWidth = 1
            stroke3Path.stroke()
            
            
            //// Stroke-5 Drawing
            let stroke5Path = UIBezierPath(rect: CGRect(x: 6.28, y: 17.28, width: 13.15, height: 1.55))
            strokeColor.setStroke()
            stroke5Path.lineWidth = 1
            stroke5Path.stroke()
            
            
            //// Stroke-6 Drawing
            let stroke6Path = UIBezierPath(rect: CGRect(x: 6.28, y: 21.33, width: 13.15, height: 1.55))
            strokeColor.setStroke()
            stroke6Path.lineWidth = 1
            stroke6Path.stroke()
            
            context!.endTransparencyLayer()
            context!.restoreGState()
        }
        else if(type == "history"){
            
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 33, height: 33), false, 0)
            
            //// General Declarations
            let context = UIGraphicsGetCurrentContext()
            
            //// Color Declarations
            let strokeColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
            
            //// Group-7
            //// Page-1
            context!.saveGState()
            context!.setAlpha(0.62)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            
            //// Stroke-1 Drawing
            let stroke1Path = UIBezierPath()
            stroke1Path.move(to: CGPoint(x: 24.12, y: 13.29))
            stroke1Path.addCurve(to: CGPoint(x: 25.46, y: 12.37), controlPoint1: CGPoint(x: 24.83, y: 13.33), controlPoint2: CGPoint(x: 25.33, y: 12.96))
            stroke1Path.addCurve(to: CGPoint(x: 24.66, y: 11.07), controlPoint1: CGPoint(x: 25.58, y: 11.83), controlPoint2: CGPoint(x: 25.26, y: 11.24))
            stroke1Path.addCurve(to: CGPoint(x: 19.63, y: 9.7), controlPoint1: CGPoint(x: 22.99, y: 10.59), controlPoint2: CGPoint(x: 21.31, y: 10.13))
            stroke1Path.addCurve(to: CGPoint(x: 18.23, y: 10.5), controlPoint1: CGPoint(x: 18.96, y: 9.53), controlPoint2: CGPoint(x: 18.4, y: 9.89))
            stroke1Path.addCurve(to: CGPoint(x: 19.04, y: 11.9), controlPoint1: CGPoint(x: 18.07, y: 11.09), controlPoint2: CGPoint(x: 18.4, y: 11.69))
            stroke1Path.addCurve(to: CGPoint(x: 20.6, y: 12.34), controlPoint1: CGPoint(x: 19.56, y: 12.07), controlPoint2: CGPoint(x: 20.08, y: 12.2))
            stroke1Path.addCurve(to: CGPoint(x: 24.12, y: 13.29), controlPoint1: CGPoint(x: 21.81, y: 12.67), controlPoint2: CGPoint(x: 23.02, y: 13))
            stroke1Path.addLine(to: CGPoint(x: 24.12, y: 13.29))
            stroke1Path.close()
            stroke1Path.miterLimit = 4;
            
            stroke1Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke1Path.lineWidth = 1
            stroke1Path.stroke()
            
            
            //// Stroke-3 Drawing
            let stroke3Path = UIBezierPath()
            stroke3Path.move(to: CGPoint(x: 15.92, y: 10.87))
            stroke3Path.addCurve(to: CGPoint(x: 17.12, y: 9.74), controlPoint1: CGPoint(x: 16.61, y: 10.88), controlPoint2: CGPoint(x: 17.13, y: 10.38))
            stroke3Path.addCurve(to: CGPoint(x: 15.85, y: 8.57), controlPoint1: CGPoint(x: 17.11, y: 9.1), controlPoint2: CGPoint(x: 16.54, y: 8.58))
            stroke3Path.addCurve(to: CGPoint(x: 14.66, y: 9.73), controlPoint1: CGPoint(x: 15.18, y: 8.56), controlPoint2: CGPoint(x: 14.65, y: 9.07))
            stroke3Path.addCurve(to: CGPoint(x: 15.92, y: 10.87), controlPoint1: CGPoint(x: 14.66, y: 10.39), controlPoint2: CGPoint(x: 15.19, y: 10.87))
            stroke3Path.addLine(to: CGPoint(x: 15.92, y: 10.87))
            stroke3Path.close()
            stroke3Path.miterLimit = 4;
            
            stroke3Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke3Path.lineWidth = 1
            stroke3Path.stroke()
            
            
            //// Stroke-5 Drawing
            let stroke5Path = UIBezierPath()
            stroke5Path.move(to: CGPoint(x: 14.12, y: 15.63))
            stroke5Path.addCurve(to: CGPoint(x: 15.31, y: 14.49), controlPoint1: CGPoint(x: 14.8, y: 15.64), controlPoint2: CGPoint(x: 15.31, y: 15.15))
            stroke5Path.addCurve(to: CGPoint(x: 14.06, y: 13.32), controlPoint1: CGPoint(x: 15.31, y: 13.83), controlPoint2: CGPoint(x: 14.78, y: 13.33))
            stroke5Path.addCurve(to: CGPoint(x: 12.85, y: 14.46), controlPoint1: CGPoint(x: 13.4, y: 13.31), controlPoint2: CGPoint(x: 12.85, y: 13.83))
            stroke5Path.addCurve(to: CGPoint(x: 14.12, y: 15.63), controlPoint1: CGPoint(x: 12.86, y: 15.1), controlPoint2: CGPoint(x: 13.42, y: 15.62))
            stroke5Path.addLine(to: CGPoint(x: 14.12, y: 15.63))
            stroke5Path.close()
            stroke5Path.miterLimit = 4;
            
            stroke5Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke5Path.lineWidth = 1
            stroke5Path.stroke()
            
            
            //// Stroke-7 Drawing
            let stroke7Path = UIBezierPath()
            stroke7Path.move(to: CGPoint(x: 12.26, y: 17.73))
            stroke7Path.addCurve(to: CGPoint(x: 11.04, y: 18.85), controlPoint1: CGPoint(x: 11.57, y: 17.72), controlPoint2: CGPoint(x: 11.05, y: 18.2))
            stroke7Path.addCurve(to: CGPoint(x: 12.29, y: 20.04), controlPoint1: CGPoint(x: 11.04, y: 19.5), controlPoint2: CGPoint(x: 11.58, y: 20.02))
            stroke7Path.addCurve(to: CGPoint(x: 13.51, y: 18.9), controlPoint1: CGPoint(x: 12.93, y: 20.06), controlPoint2: CGPoint(x: 13.51, y: 19.53))
            stroke7Path.addCurve(to: CGPoint(x: 12.26, y: 17.73), controlPoint1: CGPoint(x: 13.52, y: 18.26), controlPoint2: CGPoint(x: 12.97, y: 17.75))
            stroke7Path.addLine(to: CGPoint(x: 12.26, y: 17.73))
            stroke7Path.close()
            stroke7Path.miterLimit = 4;
            
            stroke7Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke7Path.lineWidth = 1
            stroke7Path.stroke()
            
            
            //// Stroke-9 Drawing
            let stroke9Path = UIBezierPath()
            stroke9Path.move(to: CGPoint(x: 2.25, y: 21.34))
            stroke9Path.addCurve(to: CGPoint(x: 2.55, y: 19.59), controlPoint1: CGPoint(x: 2.35, y: 20.77), controlPoint2: CGPoint(x: 2.45, y: 20.21))
            stroke9Path.addCurve(to: CGPoint(x: 3.06, y: 19.75), controlPoint1: CGPoint(x: 2.75, y: 19.65), controlPoint2: CGPoint(x: 2.91, y: 19.69))
            stroke9Path.addCurve(to: CGPoint(x: 15.11, y: 24.6), controlPoint1: CGPoint(x: 7.08, y: 21.37), controlPoint2: CGPoint(x: 11.09, y: 23))
            stroke9Path.addCurve(to: CGPoint(x: 15.62, y: 25.36), controlPoint1: CGPoint(x: 15.5, y: 24.76), controlPoint2: CGPoint(x: 15.61, y: 24.96))
            stroke9Path.addCurve(to: CGPoint(x: 15.85, y: 27.2), controlPoint1: CGPoint(x: 15.64, y: 25.98), controlPoint2: CGPoint(x: 15.68, y: 26.61))
            stroke9Path.addCurve(to: CGPoint(x: 20.85, y: 28.61), controlPoint1: CGPoint(x: 16.49, y: 29.56), controlPoint2: CGPoint(x: 19.06, y: 30.31))
            stroke9Path.addCurve(to: CGPoint(x: 22.27, y: 26.66), controlPoint1: CGPoint(x: 21.43, y: 28.07), controlPoint2: CGPoint(x: 21.96, y: 27.38))
            stroke9Path.addCurve(to: CGPoint(x: 25.39, y: 18.92), controlPoint1: CGPoint(x: 23.37, y: 24.11), controlPoint2: CGPoint(x: 24.44, y: 21.54))
            stroke9Path.addCurve(to: CGPoint(x: 29.05, y: 8.17), controlPoint1: CGPoint(x: 26.67, y: 15.36), controlPoint2: CGPoint(x: 27.84, y: 11.76))
            stroke9Path.addCurve(to: CGPoint(x: 29.22, y: 7.63), controlPoint1: CGPoint(x: 29.11, y: 8.01), controlPoint2: CGPoint(x: 29.16, y: 7.84))
            stroke9Path.addCurve(to: CGPoint(x: 14.56, y: 4.72), controlPoint1: CGPoint(x: 24.33, y: 6.66), controlPoint2: CGPoint(x: 19.47, y: 5.69))
            stroke9Path.addCurve(to: CGPoint(x: 12.84, y: 9.42), controlPoint1: CGPoint(x: 13.98, y: 6.3), controlPoint2: CGPoint(x: 13.41, y: 7.86))
            stroke9Path.addCurve(to: CGPoint(x: 9.45, y: 18.73), controlPoint1: CGPoint(x: 11.71, y: 12.52), controlPoint2: CGPoint(x: 10.58, y: 15.63))
            stroke9Path.addCurve(to: CGPoint(x: 8.25, y: 19.63), controlPoint1: CGPoint(x: 9.22, y: 19.36), controlPoint2: CGPoint(x: 8.8, y: 19.67))
            stroke9Path.addCurve(to: CGPoint(x: 7.21, y: 18.78), controlPoint1: CGPoint(x: 7.7, y: 19.6), controlPoint2: CGPoint(x: 7.32, y: 19.3))
            stroke9Path.addCurve(to: CGPoint(x: 7.28, y: 17.94), controlPoint1: CGPoint(x: 7.15, y: 18.52), controlPoint2: CGPoint(x: 7.19, y: 18.2))
            stroke9Path.addCurve(to: CGPoint(x: 12.66, y: 3.18), controlPoint1: CGPoint(x: 9.06, y: 13.01), controlPoint2: CGPoint(x: 10.86, y: 8.09))
            stroke9Path.addCurve(to: CGPoint(x: 14.31, y: 2.3), controlPoint1: CGPoint(x: 12.95, y: 2.38), controlPoint2: CGPoint(x: 13.45, y: 2.13))
            stroke9Path.addCurve(to: CGPoint(x: 29.1, y: 5.26), controlPoint1: CGPoint(x: 19.24, y: 3.29), controlPoint2: CGPoint(x: 24.17, y: 4.28))
            stroke9Path.addCurve(to: CGPoint(x: 30.46, y: 5.52), controlPoint1: CGPoint(x: 29.55, y: 5.35), controlPoint2: CGPoint(x: 30, y: 5.47))
            stroke9Path.addCurve(to: CGPoint(x: 31.91, y: 6.57), controlPoint1: CGPoint(x: 31.16, y: 5.6), controlPoint2: CGPoint(x: 31.65, y: 5.91))
            stroke9Path.addLine(to: CGPoint(x: 31.91, y: 6.92))
            stroke9Path.addCurve(to: CGPoint(x: 31.84, y: 7.01), controlPoint1: CGPoint(x: 31.89, y: 6.95), controlPoint2: CGPoint(x: 31.86, y: 6.97))
            stroke9Path.addCurve(to: CGPoint(x: 27.58, y: 19.63), controlPoint1: CGPoint(x: 30.43, y: 11.22), controlPoint2: CGPoint(x: 29.08, y: 15.45))
            stroke9Path.addCurve(to: CGPoint(x: 24.32, y: 27.74), controlPoint1: CGPoint(x: 26.61, y: 22.37), controlPoint2: CGPoint(x: 25.48, y: 25.07))
            stroke9Path.addCurve(to: CGPoint(x: 21.67, y: 30.9), controlPoint1: CGPoint(x: 23.77, y: 29.03), controlPoint2: CGPoint(x: 22.91, y: 30.17))
            stroke9Path.addCurve(to: CGPoint(x: 15.22, y: 31.16), controlPoint1: CGPoint(x: 19.58, y: 32.13), controlPoint2: CGPoint(x: 17.41, y: 32.15))
            stroke9Path.addCurve(to: CGPoint(x: 5.45, y: 26.74), controlPoint1: CGPoint(x: 11.96, y: 29.7), controlPoint2: CGPoint(x: 8.71, y: 28.22))
            stroke9Path.addCurve(to: CGPoint(x: 2.51, y: 23.28), controlPoint1: CGPoint(x: 3.93, y: 26.05), controlPoint2: CGPoint(x: 2.95, y: 24.89))
            stroke9Path.addCurve(to: CGPoint(x: 2.25, y: 21.92), controlPoint1: CGPoint(x: 2.39, y: 22.84), controlPoint2: CGPoint(x: 2.34, y: 22.37))
            stroke9Path.addLine(to: CGPoint(x: 2.25, y: 21.34))
            stroke9Path.addLine(to: CGPoint(x: 2.25, y: 21.34))
            stroke9Path.close()
            stroke9Path.miterLimit = 4;
            
            stroke9Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke9Path.lineWidth = 1
            stroke9Path.stroke()
            
            
            context!.endTransparencyLayer()
            context!.restoreGState()
            
            
            //// Page-1
            context!.saveGState()
            context!.setAlpha(0.62)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            
            //// Stroke-11 Drawing
            let stroke11Path = UIBezierPath()
            stroke11Path.move(to: CGPoint(x: 24.12, y: 13.29))
            stroke11Path.addCurve(to: CGPoint(x: 20.6, y: 12.34), controlPoint1: CGPoint(x: 23.02, y: 13), controlPoint2: CGPoint(x: 21.81, y: 12.67))
            stroke11Path.addCurve(to: CGPoint(x: 19.04, y: 11.9), controlPoint1: CGPoint(x: 20.08, y: 12.2), controlPoint2: CGPoint(x: 19.56, y: 12.07))
            stroke11Path.addCurve(to: CGPoint(x: 18.23, y: 10.5), controlPoint1: CGPoint(x: 18.4, y: 11.69), controlPoint2: CGPoint(x: 18.07, y: 11.09))
            stroke11Path.addCurve(to: CGPoint(x: 19.63, y: 9.7), controlPoint1: CGPoint(x: 18.4, y: 9.89), controlPoint2: CGPoint(x: 18.96, y: 9.53))
            stroke11Path.addCurve(to: CGPoint(x: 24.66, y: 11.07), controlPoint1: CGPoint(x: 21.31, y: 10.13), controlPoint2: CGPoint(x: 22.99, y: 10.59))
            stroke11Path.addCurve(to: CGPoint(x: 25.46, y: 12.37), controlPoint1: CGPoint(x: 25.26, y: 11.24), controlPoint2: CGPoint(x: 25.58, y: 11.83))
            stroke11Path.addCurve(to: CGPoint(x: 24.12, y: 13.29), controlPoint1: CGPoint(x: 25.33, y: 12.96), controlPoint2: CGPoint(x: 24.83, y: 13.33))
            stroke11Path.addLine(to: CGPoint(x: 24.12, y: 13.29))
            stroke11Path.close()
            stroke11Path.miterLimit = 4;
            
            stroke11Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke11Path.lineWidth = 1
            stroke11Path.stroke()
            
            
            //// Stroke-13 Drawing
            let stroke13Path = UIBezierPath()
            stroke13Path.move(to: CGPoint(x: 15.92, y: 10.87))
            stroke13Path.addCurve(to: CGPoint(x: 14.66, y: 9.73), controlPoint1: CGPoint(x: 15.19, y: 10.87), controlPoint2: CGPoint(x: 14.66, y: 10.39))
            stroke13Path.addCurve(to: CGPoint(x: 15.85, y: 8.57), controlPoint1: CGPoint(x: 14.65, y: 9.07), controlPoint2: CGPoint(x: 15.18, y: 8.56))
            stroke13Path.addCurve(to: CGPoint(x: 17.12, y: 9.74), controlPoint1: CGPoint(x: 16.54, y: 8.58), controlPoint2: CGPoint(x: 17.11, y: 9.1))
            stroke13Path.addCurve(to: CGPoint(x: 15.92, y: 10.87), controlPoint1: CGPoint(x: 17.13, y: 10.38), controlPoint2: CGPoint(x: 16.61, y: 10.88))
            stroke13Path.addLine(to: CGPoint(x: 15.92, y: 10.87))
            stroke13Path.close()
            stroke13Path.miterLimit = 4;
            
            stroke13Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke13Path.lineWidth = 1
            stroke13Path.stroke()
            
            
            //// Stroke-15 Drawing
            context!.saveGState()
            context!.translateBy(x: 14.1, y: 14.5)
            context!.rotate(by: 8.85 * CGFloat(Double.pi) / 180)
            
            let stroke15Path = UIBezierPath(ovalIn: CGRect(x: -1.25, y: -1.15, width: 2.5, height: 2.3))
            strokeColor.setStroke()
            stroke15Path.lineWidth = 1
            stroke15Path.stroke()
            
            context!.restoreGState()
            
            
            //// Stroke-17 Drawing
            context!.saveGState()
            context!.translateBy(x: 12.3, y: 18.9)
            context!.rotate(by: 4.85 * CGFloat(Double.pi) / 180)
            
            let stroke17Path = UIBezierPath(ovalIn: CGRect(x: -1.25, y: -1.15, width: 2.5, height: 2.3))
            strokeColor.setStroke()
            stroke17Path.lineWidth = 1
            stroke17Path.stroke()
            
            context!.restoreGState()
            
            
            //// Stroke-19 Drawing
            let stroke19Path = UIBezierPath()
            stroke19Path.move(to: CGPoint(x: 22.55, y: 17.8))
            stroke19Path.addCurve(to: CGPoint(x: 19.03, y: 16.85), controlPoint1: CGPoint(x: 21.45, y: 17.51), controlPoint2: CGPoint(x: 20.24, y: 17.18))
            stroke19Path.addCurve(to: CGPoint(x: 17.47, y: 16.41), controlPoint1: CGPoint(x: 18.5, y: 16.71), controlPoint2: CGPoint(x: 17.98, y: 16.58))
            stroke19Path.addCurve(to: CGPoint(x: 16.65, y: 15.01), controlPoint1: CGPoint(x: 16.82, y: 16.2), controlPoint2: CGPoint(x: 16.49, y: 15.6))
            stroke19Path.addCurve(to: CGPoint(x: 18.06, y: 14.21), controlPoint1: CGPoint(x: 16.82, y: 14.4), controlPoint2: CGPoint(x: 17.39, y: 14.04))
            stroke19Path.addCurve(to: CGPoint(x: 23.08, y: 15.58), controlPoint1: CGPoint(x: 19.74, y: 14.64), controlPoint2: CGPoint(x: 21.41, y: 15.1))
            stroke19Path.addCurve(to: CGPoint(x: 23.88, y: 16.88), controlPoint1: CGPoint(x: 23.68, y: 15.75), controlPoint2: CGPoint(x: 24.01, y: 16.34))
            stroke19Path.addCurve(to: CGPoint(x: 22.55, y: 17.8), controlPoint1: CGPoint(x: 23.75, y: 17.47), controlPoint2: CGPoint(x: 23.25, y: 17.84))
            stroke19Path.addLine(to: CGPoint(x: 22.55, y: 17.8))
            stroke19Path.close()
            stroke19Path.miterLimit = 4;
            
            stroke19Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke19Path.lineWidth = 1
            stroke19Path.stroke()
            
            
            context!.endTransparencyLayer()
            context!.restoreGState()
            
            //// Page-1
            context!.saveGState()
            context!.setAlpha(0.62)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            
            //// Stroke-21 Drawing
            let stroke21Path = UIBezierPath()
            stroke21Path.move(to: CGPoint(x: 20.6, y: 22.28))
            stroke21Path.addCurve(to: CGPoint(x: 17.07, y: 21.33), controlPoint1: CGPoint(x: 19.49, y: 21.99), controlPoint2: CGPoint(x: 18.28, y: 21.66))
            stroke21Path.addCurve(to: CGPoint(x: 15.51, y: 20.89), controlPoint1: CGPoint(x: 16.55, y: 21.19), controlPoint2: CGPoint(x: 16.03, y: 21.06))
            stroke21Path.addCurve(to: CGPoint(x: 14.7, y: 19.49), controlPoint1: CGPoint(x: 14.87, y: 20.68), controlPoint2: CGPoint(x: 14.54, y: 20.08))
            stroke21Path.addCurve(to: CGPoint(x: 16.1, y: 18.69), controlPoint1: CGPoint(x: 14.87, y: 18.89), controlPoint2: CGPoint(x: 15.43, y: 18.52))
            stroke21Path.addCurve(to: CGPoint(x: 21.13, y: 20.06), controlPoint1: CGPoint(x: 17.78, y: 19.12), controlPoint2: CGPoint(x: 19.46, y: 19.58))
            stroke21Path.addCurve(to: CGPoint(x: 21.93, y: 21.36), controlPoint1: CGPoint(x: 21.73, y: 20.23), controlPoint2: CGPoint(x: 22.05, y: 20.82))
            stroke21Path.addCurve(to: CGPoint(x: 20.6, y: 22.28), controlPoint1: CGPoint(x: 21.8, y: 21.95), controlPoint2: CGPoint(x: 21.3, y: 22.33))
            stroke21Path.addLine(to: CGPoint(x: 20.6, y: 22.28))
            stroke21Path.close()
            stroke21Path.miterLimit = 4;
            
            stroke21Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke21Path.lineWidth = 1
            stroke21Path.stroke()
            
            
            context!.endTransparencyLayer()
            context!.restoreGState()
            
            
            //// Color Declarations
            let strokeColor2 = UIColor(red: 0.225, green: 0.225, blue: 0.225, alpha: 1.000)
            
            //// Group-7
            //// Page-1
            context!.saveGState()
            context!.setAlpha(0.62)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            
            context!.endTransparencyLayer()
            context!.restoreGState()
            
            
            //// Page-
            context!.saveGState()
            context!.setAlpha(0.5)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            
            //// Stroke- Drawing
            let strokePath = UIBezierPath()
            strokePath.move(to: CGPoint(x: 23.12, y: 12.29))
            strokePath.addCurve(to: CGPoint(x: 24.46, y: 11.37), controlPoint1: CGPoint(x: 23.83, y: 12.33), controlPoint2: CGPoint(x: 24.33, y: 11.96))
            strokePath.addCurve(to: CGPoint(x: 23.66, y: 10.07), controlPoint1: CGPoint(x: 24.58, y: 10.83), controlPoint2: CGPoint(x: 24.26, y: 10.24))
            strokePath.addCurve(to: CGPoint(x: 18.63, y: 8.7), controlPoint1: CGPoint(x: 21.99, y: 9.59), controlPoint2: CGPoint(x: 20.31, y: 9.13))
            strokePath.addCurve(to: CGPoint(x: 17.23, y: 9.5), controlPoint1: CGPoint(x: 17.96, y: 8.53), controlPoint2: CGPoint(x: 17.4, y: 8.89))
            strokePath.addCurve(to: CGPoint(x: 18.04, y: 10.9), controlPoint1: CGPoint(x: 17.07, y: 10.09), controlPoint2: CGPoint(x: 17.4, y: 10.69))
            strokePath.addCurve(to: CGPoint(x: 19.6, y: 11.34), controlPoint1: CGPoint(x: 18.56, y: 11.07), controlPoint2: CGPoint(x: 19.08, y: 11.2))
            strokePath.addCurve(to: CGPoint(x: 23.12, y: 12.29), controlPoint1: CGPoint(x: 20.81, y: 11.67), controlPoint2: CGPoint(x: 22.02, y: 12))
            strokePath.addLine(to: CGPoint(x: 23.12, y: 12.29))
            strokePath.close()
            strokePath.miterLimit = 4;
            
            strokePath.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            strokePath.lineWidth = 1
            strokePath.stroke()
            
            
            //// Stroke- 2 Drawing
            let stroke2Path = UIBezierPath()
            stroke2Path.move(to: CGPoint(x: 14.92, y: 9.87))
            stroke2Path.addCurve(to: CGPoint(x: 16.12, y: 8.74), controlPoint1: CGPoint(x: 15.61, y: 9.88), controlPoint2: CGPoint(x: 16.13, y: 9.38))
            stroke2Path.addCurve(to: CGPoint(x: 14.85, y: 7.57), controlPoint1: CGPoint(x: 16.11, y: 8.1), controlPoint2: CGPoint(x: 15.54, y: 7.58))
            stroke2Path.addCurve(to: CGPoint(x: 13.66, y: 8.73), controlPoint1: CGPoint(x: 14.18, y: 7.56), controlPoint2: CGPoint(x: 13.65, y: 8.07))
            stroke2Path.addCurve(to: CGPoint(x: 14.92, y: 9.87), controlPoint1: CGPoint(x: 13.66, y: 9.39), controlPoint2: CGPoint(x: 14.19, y: 9.87))
            stroke2Path.addLine(to: CGPoint(x: 14.92, y: 9.87))
            stroke2Path.close()
            stroke2Path.miterLimit = 4;
            
            stroke2Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            stroke2Path.lineWidth = 1
            stroke2Path.stroke()
            
            
            //// Stroke- 4 Drawing
            let stroke4Path = UIBezierPath()
            stroke4Path.move(to: CGPoint(x: 13.12, y: 14.63))
            stroke4Path.addCurve(to: CGPoint(x: 14.31, y: 13.49), controlPoint1: CGPoint(x: 13.8, y: 14.64), controlPoint2: CGPoint(x: 14.31, y: 14.15))
            stroke4Path.addCurve(to: CGPoint(x: 13.06, y: 12.32), controlPoint1: CGPoint(x: 14.31, y: 12.83), controlPoint2: CGPoint(x: 13.78, y: 12.33))
            stroke4Path.addCurve(to: CGPoint(x: 11.85, y: 13.46), controlPoint1: CGPoint(x: 12.4, y: 12.31), controlPoint2: CGPoint(x: 11.85, y: 12.83))
            stroke4Path.addCurve(to: CGPoint(x: 13.12, y: 14.63), controlPoint1: CGPoint(x: 11.86, y: 14.1), controlPoint2: CGPoint(x: 12.42, y: 14.62))
            stroke4Path.addLine(to: CGPoint(x: 13.12, y: 14.63))
            stroke4Path.close()
            stroke4Path.miterLimit = 4;
            
            stroke4Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            stroke4Path.lineWidth = 1
            stroke4Path.stroke()
            
            
            //// Stroke- 6 Drawing
            let stroke6Path = UIBezierPath()
            stroke6Path.move(to: CGPoint(x: 11.26, y: 16.73))
            stroke6Path.addCurve(to: CGPoint(x: 10.04, y: 17.85), controlPoint1: CGPoint(x: 10.57, y: 16.72), controlPoint2: CGPoint(x: 10.05, y: 17.2))
            stroke6Path.addCurve(to: CGPoint(x: 11.29, y: 19.04), controlPoint1: CGPoint(x: 10.04, y: 18.5), controlPoint2: CGPoint(x: 10.58, y: 19.02))
            stroke6Path.addCurve(to: CGPoint(x: 12.51, y: 17.9), controlPoint1: CGPoint(x: 11.93, y: 19.06), controlPoint2: CGPoint(x: 12.51, y: 18.53))
            stroke6Path.addCurve(to: CGPoint(x: 11.26, y: 16.73), controlPoint1: CGPoint(x: 12.52, y: 17.26), controlPoint2: CGPoint(x: 11.97, y: 16.75))
            stroke6Path.addLine(to: CGPoint(x: 11.26, y: 16.73))
            stroke6Path.close()
            stroke6Path.miterLimit = 4;
            
            stroke6Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            stroke6Path.lineWidth = 1
            stroke6Path.stroke()
            
            
            //// Stroke- 8 Drawing
            let stroke8Path = UIBezierPath()
            stroke8Path.move(to: CGPoint(x: 1.25, y: 20.34))
            stroke8Path.addCurve(to: CGPoint(x: 1.55, y: 18.59), controlPoint1: CGPoint(x: 1.35, y: 19.77), controlPoint2: CGPoint(x: 1.45, y: 19.21))
            stroke8Path.addCurve(to: CGPoint(x: 2.06, y: 18.75), controlPoint1: CGPoint(x: 1.75, y: 18.65), controlPoint2: CGPoint(x: 1.91, y: 18.69))
            stroke8Path.addCurve(to: CGPoint(x: 14.11, y: 23.6), controlPoint1: CGPoint(x: 6.08, y: 20.37), controlPoint2: CGPoint(x: 10.09, y: 22))
            stroke8Path.addCurve(to: CGPoint(x: 14.62, y: 24.36), controlPoint1: CGPoint(x: 14.5, y: 23.76), controlPoint2: CGPoint(x: 14.61, y: 23.96))
            stroke8Path.addCurve(to: CGPoint(x: 14.85, y: 26.2), controlPoint1: CGPoint(x: 14.64, y: 24.98), controlPoint2: CGPoint(x: 14.68, y: 25.61))
            stroke8Path.addCurve(to: CGPoint(x: 19.85, y: 27.61), controlPoint1: CGPoint(x: 15.49, y: 28.56), controlPoint2: CGPoint(x: 18.06, y: 29.31))
            stroke8Path.addCurve(to: CGPoint(x: 21.27, y: 25.66), controlPoint1: CGPoint(x: 20.43, y: 27.07), controlPoint2: CGPoint(x: 20.96, y: 26.38))
            stroke8Path.addCurve(to: CGPoint(x: 24.39, y: 17.92), controlPoint1: CGPoint(x: 22.37, y: 23.11), controlPoint2: CGPoint(x: 23.44, y: 20.54))
            stroke8Path.addCurve(to: CGPoint(x: 28.05, y: 7.17), controlPoint1: CGPoint(x: 25.67, y: 14.36), controlPoint2: CGPoint(x: 26.84, y: 10.76))
            stroke8Path.addCurve(to: CGPoint(x: 28.22, y: 6.63), controlPoint1: CGPoint(x: 28.11, y: 7.01), controlPoint2: CGPoint(x: 28.16, y: 6.84))
            stroke8Path.addCurve(to: CGPoint(x: 13.56, y: 3.72), controlPoint1: CGPoint(x: 23.33, y: 5.66), controlPoint2: CGPoint(x: 18.47, y: 4.69))
            stroke8Path.addCurve(to: CGPoint(x: 11.84, y: 8.42), controlPoint1: CGPoint(x: 12.98, y: 5.3), controlPoint2: CGPoint(x: 12.41, y: 6.86))
            stroke8Path.addCurve(to: CGPoint(x: 8.45, y: 17.73), controlPoint1: CGPoint(x: 10.71, y: 11.52), controlPoint2: CGPoint(x: 9.58, y: 14.63))
            stroke8Path.addCurve(to: CGPoint(x: 7.25, y: 18.63), controlPoint1: CGPoint(x: 8.22, y: 18.36), controlPoint2: CGPoint(x: 7.8, y: 18.67))
            stroke8Path.addCurve(to: CGPoint(x: 6.21, y: 17.78), controlPoint1: CGPoint(x: 6.7, y: 18.6), controlPoint2: CGPoint(x: 6.32, y: 18.3))
            stroke8Path.addCurve(to: CGPoint(x: 6.28, y: 16.94), controlPoint1: CGPoint(x: 6.15, y: 17.52), controlPoint2: CGPoint(x: 6.19, y: 17.2))
            stroke8Path.addCurve(to: CGPoint(x: 11.66, y: 2.18), controlPoint1: CGPoint(x: 8.06, y: 12.01), controlPoint2: CGPoint(x: 9.86, y: 7.09))
            stroke8Path.addCurve(to: CGPoint(x: 13.31, y: 1.3), controlPoint1: CGPoint(x: 11.95, y: 1.38), controlPoint2: CGPoint(x: 12.45, y: 1.13))
            stroke8Path.addCurve(to: CGPoint(x: 28.1, y: 4.26), controlPoint1: CGPoint(x: 18.24, y: 2.29), controlPoint2: CGPoint(x: 23.17, y: 3.28))
            stroke8Path.addCurve(to: CGPoint(x: 29.46, y: 4.52), controlPoint1: CGPoint(x: 28.55, y: 4.35), controlPoint2: CGPoint(x: 29, y: 4.47))
            stroke8Path.addCurve(to: CGPoint(x: 30.91, y: 5.57), controlPoint1: CGPoint(x: 30.16, y: 4.6), controlPoint2: CGPoint(x: 30.65, y: 4.91))
            stroke8Path.addLine(to: CGPoint(x: 30.91, y: 5.92))
            stroke8Path.addCurve(to: CGPoint(x: 30.84, y: 6.01), controlPoint1: CGPoint(x: 30.89, y: 5.95), controlPoint2: CGPoint(x: 30.86, y: 5.97))
            stroke8Path.addCurve(to: CGPoint(x: 26.58, y: 18.63), controlPoint1: CGPoint(x: 29.43, y: 10.22), controlPoint2: CGPoint(x: 28.08, y: 14.45))
            stroke8Path.addCurve(to: CGPoint(x: 23.32, y: 26.74), controlPoint1: CGPoint(x: 25.61, y: 21.37), controlPoint2: CGPoint(x: 24.48, y: 24.07))
            stroke8Path.addCurve(to: CGPoint(x: 20.67, y: 29.9), controlPoint1: CGPoint(x: 22.77, y: 28.03), controlPoint2: CGPoint(x: 21.91, y: 29.17))
            stroke8Path.addCurve(to: CGPoint(x: 14.22, y: 30.16), controlPoint1: CGPoint(x: 18.58, y: 31.13), controlPoint2: CGPoint(x: 16.41, y: 31.15))
            stroke8Path.addCurve(to: CGPoint(x: 4.45, y: 25.74), controlPoint1: CGPoint(x: 10.96, y: 28.7), controlPoint2: CGPoint(x: 7.71, y: 27.22))
            stroke8Path.addCurve(to: CGPoint(x: 1.51, y: 22.28), controlPoint1: CGPoint(x: 2.93, y: 25.05), controlPoint2: CGPoint(x: 1.95, y: 23.89))
            stroke8Path.addCurve(to: CGPoint(x: 1.25, y: 20.92), controlPoint1: CGPoint(x: 1.39, y: 21.84), controlPoint2: CGPoint(x: 1.34, y: 21.37))
            stroke8Path.addLine(to: CGPoint(x: 1.25, y: 20.34))
            stroke8Path.addLine(to: CGPoint(x: 1.25, y: 20.34))
            stroke8Path.close()
            stroke8Path.miterLimit = 4;
            
            stroke8Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            stroke8Path.lineWidth = 1
            stroke8Path.stroke()
            
            
            context!.endTransparencyLayer()
            context!.restoreGState()
            
            //// Page-1
            context!.saveGState()
            context!.setAlpha(0.62)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            
            context!.endTransparencyLayer()
            context!.restoreGState()
            
            
            //// Page-
            context!.saveGState()
            context!.setAlpha(0.5)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            
            //// Stroke- 10 Drawing
            let stroke10Path = UIBezierPath()
            stroke10Path.move(to: CGPoint(x: 23.12, y: 12.29))
            stroke10Path.addCurve(to: CGPoint(x: 19.6, y: 11.34), controlPoint1: CGPoint(x: 22.02, y: 12), controlPoint2: CGPoint(x: 20.81, y: 11.67))
            stroke10Path.addCurve(to: CGPoint(x: 18.04, y: 10.9), controlPoint1: CGPoint(x: 19.08, y: 11.2), controlPoint2: CGPoint(x: 18.56, y: 11.07))
            stroke10Path.addCurve(to: CGPoint(x: 17.23, y: 9.5), controlPoint1: CGPoint(x: 17.4, y: 10.69), controlPoint2: CGPoint(x: 17.07, y: 10.09))
            stroke10Path.addCurve(to: CGPoint(x: 18.63, y: 8.7), controlPoint1: CGPoint(x: 17.4, y: 8.89), controlPoint2: CGPoint(x: 17.96, y: 8.53))
            stroke10Path.addCurve(to: CGPoint(x: 23.66, y: 10.07), controlPoint1: CGPoint(x: 20.31, y: 9.13), controlPoint2: CGPoint(x: 21.99, y: 9.59))
            stroke10Path.addCurve(to: CGPoint(x: 24.46, y: 11.37), controlPoint1: CGPoint(x: 24.26, y: 10.24), controlPoint2: CGPoint(x: 24.58, y: 10.83))
            stroke10Path.addCurve(to: CGPoint(x: 23.12, y: 12.29), controlPoint1: CGPoint(x: 24.33, y: 11.96), controlPoint2: CGPoint(x: 23.83, y: 12.33))
            stroke10Path.addLine(to: CGPoint(x: 23.12, y: 12.29))
            stroke10Path.close()
            stroke10Path.miterLimit = 4;
            
            stroke10Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            stroke10Path.lineWidth = 1
            stroke10Path.stroke()
            
            
            //// Stroke- 12 Drawing
            let stroke12Path = UIBezierPath()
            stroke12Path.move(to: CGPoint(x: 14.92, y: 9.87))
            stroke12Path.addCurve(to: CGPoint(x: 13.66, y: 8.73), controlPoint1: CGPoint(x: 14.19, y: 9.87), controlPoint2: CGPoint(x: 13.66, y: 9.39))
            stroke12Path.addCurve(to: CGPoint(x: 14.85, y: 7.57), controlPoint1: CGPoint(x: 13.65, y: 8.07), controlPoint2: CGPoint(x: 14.18, y: 7.56))
            stroke12Path.addCurve(to: CGPoint(x: 16.12, y: 8.74), controlPoint1: CGPoint(x: 15.54, y: 7.58), controlPoint2: CGPoint(x: 16.11, y: 8.1))
            stroke12Path.addCurve(to: CGPoint(x: 14.92, y: 9.87), controlPoint1: CGPoint(x: 16.13, y: 9.38), controlPoint2: CGPoint(x: 15.61, y: 9.88))
            stroke12Path.addLine(to: CGPoint(x: 14.92, y: 9.87))
            stroke12Path.close()
            stroke12Path.miterLimit = 4;
            
            stroke12Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            stroke12Path.lineWidth = 1
            stroke12Path.stroke()
            
            
            //// Stroke- 14 Drawing
            context!.saveGState()
            context!.translateBy(x: 13.1, y: 13.5)
            context!.rotate(by: 8.85 * CGFloat(Double.pi) / 180)
            
            let stroke14Path = UIBezierPath(ovalIn: CGRect(x: -1.25, y: -1.15, width: 2.5, height: 2.3))
            strokeColor2.setStroke()
            stroke14Path.lineWidth = 1
            stroke14Path.stroke()
            
            context!.restoreGState()
            
            
            //// Stroke- 16 Drawing
            context!.saveGState()
            context!.translateBy(x: 11.3, y: 17.9)
            context!.rotate(by: 4.85 * CGFloat(Double.pi) / 180)
            
            let stroke16Path = UIBezierPath(ovalIn: CGRect(x: -1.25, y: -1.15, width: 2.5, height: 2.3))
            strokeColor2.setStroke()
            stroke16Path.lineWidth = 1
            stroke16Path.stroke()
            
            context!.restoreGState()
            
            
            //// Stroke- 18 Drawing
            let stroke18Path = UIBezierPath()
            stroke18Path.move(to: CGPoint(x: 21.55, y: 16.8))
            stroke18Path.addCurve(to: CGPoint(x: 18.03, y: 15.85), controlPoint1: CGPoint(x: 20.45, y: 16.51), controlPoint2: CGPoint(x: 19.24, y: 16.18))
            stroke18Path.addCurve(to: CGPoint(x: 16.47, y: 15.41), controlPoint1: CGPoint(x: 17.5, y: 15.71), controlPoint2: CGPoint(x: 16.98, y: 15.58))
            stroke18Path.addCurve(to: CGPoint(x: 15.65, y: 14.01), controlPoint1: CGPoint(x: 15.82, y: 15.2), controlPoint2: CGPoint(x: 15.49, y: 14.6))
            stroke18Path.addCurve(to: CGPoint(x: 17.06, y: 13.21), controlPoint1: CGPoint(x: 15.82, y: 13.4), controlPoint2: CGPoint(x: 16.39, y: 13.04))
            stroke18Path.addCurve(to: CGPoint(x: 22.08, y: 14.58), controlPoint1: CGPoint(x: 18.74, y: 13.64), controlPoint2: CGPoint(x: 20.41, y: 14.1))
            stroke18Path.addCurve(to: CGPoint(x: 22.88, y: 15.88), controlPoint1: CGPoint(x: 22.68, y: 14.75), controlPoint2: CGPoint(x: 23.01, y: 15.34))
            stroke18Path.addCurve(to: CGPoint(x: 21.55, y: 16.8), controlPoint1: CGPoint(x: 22.75, y: 16.47), controlPoint2: CGPoint(x: 22.25, y: 16.84))
            stroke18Path.addLine(to: CGPoint(x: 21.55, y: 16.8))
            stroke18Path.close()
            stroke18Path.miterLimit = 4;
            
            stroke18Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            stroke18Path.lineWidth = 1
            stroke18Path.stroke()
            
            
            context!.endTransparencyLayer()
            context!.restoreGState()
            
            context!.saveGState()
            context!.setAlpha(0.62)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            
            context!.endTransparencyLayer()
            context!.restoreGState()
            
            
            //// Page-
            context!.saveGState()
            context!.setAlpha(0.5)
            context!.beginTransparencyLayer(auxiliaryInfo: nil)
            
            
            //// Stroke- 20 Drawing
            let stroke20Path = UIBezierPath()
            stroke20Path.move(to: CGPoint(x: 19.6, y: 21.28))
            stroke20Path.addCurve(to: CGPoint(x: 16.07, y: 20.33), controlPoint1: CGPoint(x: 18.49, y: 20.99), controlPoint2: CGPoint(x: 17.28, y: 20.66))
            stroke20Path.addCurve(to: CGPoint(x: 14.51, y: 19.89), controlPoint1: CGPoint(x: 15.55, y: 20.19), controlPoint2: CGPoint(x: 15.03, y: 20.06))
            stroke20Path.addCurve(to: CGPoint(x: 13.7, y: 18.49), controlPoint1: CGPoint(x: 13.87, y: 19.68), controlPoint2: CGPoint(x: 13.54, y: 19.08))
            stroke20Path.addCurve(to: CGPoint(x: 15.1, y: 17.69), controlPoint1: CGPoint(x: 13.87, y: 17.89), controlPoint2: CGPoint(x: 14.43, y: 17.52))
            stroke20Path.addCurve(to: CGPoint(x: 20.13, y: 19.06), controlPoint1: CGPoint(x: 16.78, y: 18.12), controlPoint2: CGPoint(x: 18.46, y: 18.58))
            stroke20Path.addCurve(to: CGPoint(x: 20.93, y: 20.36), controlPoint1: CGPoint(x: 20.73, y: 19.23), controlPoint2: CGPoint(x: 21.05, y: 19.82))
            stroke20Path.addCurve(to: CGPoint(x: 19.6, y: 21.28), controlPoint1: CGPoint(x: 20.8, y: 20.95), controlPoint2: CGPoint(x: 20.3, y: 21.33))
            stroke20Path.addLine(to: CGPoint(x: 19.6, y: 21.28))
            stroke20Path.close()
            stroke20Path.miterLimit = 4;
            
            stroke20Path.usesEvenOddFillRule = true;
            
            strokeColor2.setStroke()
            stroke20Path.lineWidth = 1
            stroke20Path.stroke()
            
            
            context!.endTransparencyLayer()
            context!.restoreGState()
            
        }
    
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imgbgc!
    }
    
    func launchLogo()-> UIImageView{
        //// Color Declarations
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 200, height: 88), false, 0)
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        
        //// Shadow Declarations
        let shadow = NSShadow()
        shadow.shadowColor = UIColor(white: 0, alpha: 0.7)
        shadow.shadowOffset = CGSize(width: 2, height: 2)
        shadow.shadowBlurRadius = 2
        
        //// Group-2
        context!.saveGState()
        context!.setShadow(offset: shadow.shadowOffset, blur: shadow.shadowBlurRadius, color: (shadow.shadowColor as! UIColor).cgColor)
        context!.beginTransparencyLayer(auxiliaryInfo: nil)
        
        
        //// Page-1
        //// Group-15
        //// Fill-9 Drawing
        let fill9Path = UIBezierPath()
        fill9Path.move(to: CGPoint(x: 172.1, y: 35.17))
        fill9Path.addLine(to: CGPoint(x: 172.03, y: 54.92))
        fill9Path.addLine(to: CGPoint(x: 172.17, y: 54.92))
        fill9Path.addCurve(to: CGPoint(x: 176.65, y: 49.74), controlPoint1: CGPoint(x: 173.01, y: 52.76), controlPoint2: CGPoint(x: 174.51, y: 51.04))
        fill9Path.addCurve(to: CGPoint(x: 183.7, y: 47.8), controlPoint1: CGPoint(x: 178.79, y: 48.44), controlPoint2: CGPoint(x: 181.14, y: 47.79))
        fill9Path.addCurve(to: CGPoint(x: 190.01, y: 48.78), controlPoint1: CGPoint(x: 186.21, y: 47.81), controlPoint2: CGPoint(x: 188.31, y: 48.14))
        fill9Path.addCurve(to: CGPoint(x: 194.08, y: 51.52), controlPoint1: CGPoint(x: 191.7, y: 49.43), controlPoint2: CGPoint(x: 193.06, y: 50.34))
        fill9Path.addCurve(to: CGPoint(x: 196.23, y: 55.82), controlPoint1: CGPoint(x: 195.1, y: 52.69), controlPoint2: CGPoint(x: 195.81, y: 54.13))
        fill9Path.addCurve(to: CGPoint(x: 196.83, y: 61.53), controlPoint1: CGPoint(x: 196.64, y: 57.52), controlPoint2: CGPoint(x: 196.84, y: 59.43))
        fill9Path.addLine(to: CGPoint(x: 196.75, y: 84.37))
        fill9Path.addLine(to: CGPoint(x: 192.36, y: 84.36))
        fill9Path.addLine(to: CGPoint(x: 192.44, y: 62.21))
        fill9Path.addCurve(to: CGPoint(x: 192.03, y: 57.98), controlPoint1: CGPoint(x: 192.44, y: 60.69), controlPoint2: CGPoint(x: 192.31, y: 59.28))
        fill9Path.addCurve(to: CGPoint(x: 190.58, y: 54.57), controlPoint1: CGPoint(x: 191.76, y: 56.67), controlPoint2: CGPoint(x: 191.27, y: 55.53))
        fill9Path.addCurve(to: CGPoint(x: 187.76, y: 52.29), controlPoint1: CGPoint(x: 189.89, y: 53.6), controlPoint2: CGPoint(x: 188.95, y: 52.84))
        fill9Path.addCurve(to: CGPoint(x: 183.34, y: 51.45), controlPoint1: CGPoint(x: 186.58, y: 51.73), controlPoint2: CGPoint(x: 185.11, y: 51.45))
        fill9Path.addCurve(to: CGPoint(x: 178.63, y: 52.36), controlPoint1: CGPoint(x: 181.57, y: 51.44), controlPoint2: CGPoint(x: 180, y: 51.74))
        fill9Path.addCurve(to: CGPoint(x: 175.13, y: 54.89), controlPoint1: CGPoint(x: 177.26, y: 52.97), controlPoint2: CGPoint(x: 176.09, y: 53.82))
        fill9Path.addCurve(to: CGPoint(x: 172.89, y: 58.74), controlPoint1: CGPoint(x: 174.18, y: 55.97), controlPoint2: CGPoint(x: 173.43, y: 57.25))
        fill9Path.addCurve(to: CGPoint(x: 172, y: 63.58), controlPoint1: CGPoint(x: 172.35, y: 60.23), controlPoint2: CGPoint(x: 172.05, y: 61.84))
        fill9Path.addLine(to: CGPoint(x: 171.93, y: 84.29))
        fill9Path.addLine(to: CGPoint(x: 167.54, y: 84.28))
        fill9Path.addLine(to: CGPoint(x: 167.71, y: 35.16))
        fill9Path.addLine(to: CGPoint(x: 172.1, y: 35.17))
        fill9Path.close()
        fill9Path.miterLimit = 4;
        
        fill9Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill9Path.fill()
        
        
        //// Fill-11 Drawing
        let fill11Path = UIBezierPath()
        fill11Path.move(to: CGPoint(x: 2, y: 48.89))
        fill11Path.addCurve(to: CGPoint(x: 3.28, y: 42.56), controlPoint1: CGPoint(x: 2.05, y: 46.5), controlPoint2: CGPoint(x: 2.48, y: 44.39))
        fill11Path.addCurve(to: CGPoint(x: 6.43, y: 37.62), controlPoint1: CGPoint(x: 4.07, y: 40.73), controlPoint2: CGPoint(x: 5.12, y: 39.08))
        fill11Path.addCurve(to: CGPoint(x: 10.84, y: 33.61), controlPoint1: CGPoint(x: 7.74, y: 36.16), controlPoint2: CGPoint(x: 9.21, y: 34.82))
        fill11Path.addCurve(to: CGPoint(x: 15.87, y: 30.12), controlPoint1: CGPoint(x: 12.47, y: 32.4), controlPoint2: CGPoint(x: 14.15, y: 31.24))
        fill11Path.addCurve(to: CGPoint(x: 21.01, y: 26.7), controlPoint1: CGPoint(x: 17.6, y: 29), controlPoint2: CGPoint(x: 19.31, y: 27.86))
        fill11Path.addCurve(to: CGPoint(x: 25.59, y: 22.96), controlPoint1: CGPoint(x: 22.71, y: 25.53), controlPoint2: CGPoint(x: 24.24, y: 24.29))
        fill11Path.addCurve(to: CGPoint(x: 28.64, y: 18.88), controlPoint1: CGPoint(x: 26.94, y: 21.64), controlPoint2: CGPoint(x: 27.96, y: 20.28))
        fill11Path.addCurve(to: CGPoint(x: 29.67, y: 13.89), controlPoint1: CGPoint(x: 29.32, y: 17.48), controlPoint2: CGPoint(x: 29.66, y: 15.82))
        fill11Path.addCurve(to: CGPoint(x: 28.81, y: 9.73), controlPoint1: CGPoint(x: 29.67, y: 12.34), controlPoint2: CGPoint(x: 29.38, y: 10.95))
        fill11Path.addCurve(to: CGPoint(x: 26.45, y: 6.63), controlPoint1: CGPoint(x: 28.23, y: 8.51), controlPoint2: CGPoint(x: 27.44, y: 7.48))
        fill11Path.addCurve(to: CGPoint(x: 22.97, y: 4.69), controlPoint1: CGPoint(x: 25.45, y: 5.77), controlPoint2: CGPoint(x: 24.29, y: 5.13))
        fill11Path.addCurve(to: CGPoint(x: 18.75, y: 4.02), controlPoint1: CGPoint(x: 21.64, y: 4.25), controlPoint2: CGPoint(x: 20.24, y: 4.03))
        fill11Path.addCurve(to: CGPoint(x: 13.62, y: 5.1), controlPoint1: CGPoint(x: 16.75, y: 4.01), controlPoint2: CGPoint(x: 15.04, y: 4.38))
        fill11Path.addCurve(to: CGPoint(x: 10.16, y: 8.05), controlPoint1: CGPoint(x: 12.2, y: 5.83), controlPoint2: CGPoint(x: 11.05, y: 6.82))
        fill11Path.addCurve(to: CGPoint(x: 8.23, y: 12.31), controlPoint1: CGPoint(x: 9.27, y: 9.29), controlPoint2: CGPoint(x: 8.63, y: 10.71))
        fill11Path.addCurve(to: CGPoint(x: 7.69, y: 17.4), controlPoint1: CGPoint(x: 7.83, y: 13.91), controlPoint2: CGPoint(x: 7.65, y: 15.61))
        fill11Path.addLine(to: CGPoint(x: 3.29, y: 17.38))
        fill11Path.addCurve(to: CGPoint(x: 4.19, y: 10.54), controlPoint1: CGPoint(x: 3.26, y: 14.91), controlPoint2: CGPoint(x: 3.56, y: 12.63))
        fill11Path.addCurve(to: CGPoint(x: 7.1, y: 5.15), controlPoint1: CGPoint(x: 4.82, y: 8.46), controlPoint2: CGPoint(x: 5.8, y: 6.66))
        fill11Path.addCurve(to: CGPoint(x: 12.03, y: 1.62), controlPoint1: CGPoint(x: 8.41, y: 3.64), controlPoint2: CGPoint(x: 10.05, y: 2.47))
        fill11Path.addCurve(to: CGPoint(x: 18.97, y: 0.38), controlPoint1: CGPoint(x: 14.01, y: 0.78), controlPoint2: CGPoint(x: 16.32, y: 0.37))
        fill11Path.addCurve(to: CGPoint(x: 24.93, y: 1.26), controlPoint1: CGPoint(x: 21.11, y: 0.38), controlPoint2: CGPoint(x: 23.1, y: 0.68))
        fill11Path.addCurve(to: CGPoint(x: 29.74, y: 3.82), controlPoint1: CGPoint(x: 26.77, y: 1.84), controlPoint2: CGPoint(x: 28.37, y: 2.69))
        fill11Path.addCurve(to: CGPoint(x: 32.93, y: 8.06), controlPoint1: CGPoint(x: 31.1, y: 4.95), controlPoint2: CGPoint(x: 32.17, y: 6.36))
        fill11Path.addCurve(to: CGPoint(x: 34.06, y: 13.98), controlPoint1: CGPoint(x: 33.69, y: 9.76), controlPoint2: CGPoint(x: 34.07, y: 11.73))
        fill11Path.addCurve(to: CGPoint(x: 33.03, y: 19.48), controlPoint1: CGPoint(x: 34.05, y: 16), controlPoint2: CGPoint(x: 33.71, y: 17.83))
        fill11Path.addCurve(to: CGPoint(x: 30.29, y: 24.01), controlPoint1: CGPoint(x: 32.35, y: 21.13), controlPoint2: CGPoint(x: 31.44, y: 22.64))
        fill11Path.addCurve(to: CGPoint(x: 26.38, y: 27.81), controlPoint1: CGPoint(x: 29.15, y: 25.38), controlPoint2: CGPoint(x: 27.84, y: 26.65))
        fill11Path.addCurve(to: CGPoint(x: 21.73, y: 31.07), controlPoint1: CGPoint(x: 24.91, y: 28.98), controlPoint2: CGPoint(x: 23.36, y: 30.06))
        fill11Path.addCurve(to: CGPoint(x: 17.6, y: 33.63), controlPoint1: CGPoint(x: 20.56, y: 31.84), controlPoint2: CGPoint(x: 19.19, y: 32.7))
        fill11Path.addCurve(to: CGPoint(x: 13.02, y: 36.75), controlPoint1: CGPoint(x: 16.02, y: 34.57), controlPoint2: CGPoint(x: 14.49, y: 35.61))
        fill11Path.addCurve(to: CGPoint(x: 9.14, y: 40.48), controlPoint1: CGPoint(x: 11.56, y: 37.89), controlPoint2: CGPoint(x: 10.26, y: 39.13))
        fill11Path.addCurve(to: CGPoint(x: 7.03, y: 44.91), controlPoint1: CGPoint(x: 8.02, y: 41.83), controlPoint2: CGPoint(x: 7.32, y: 43.31))
        fill11Path.addLine(to: CGPoint(x: 34.16, y: 45))
        fill11Path.addLine(to: CGPoint(x: 34.15, y: 48.99))
        fill11Path.addLine(to: CGPoint(x: 2, y: 48.89))
        fill11Path.close()
        fill11Path.miterLimit = 4;
        
        fill11Path.usesEvenOddFillRule = true;
        
        context!.saveGState()
//        context!.setShadow(offset: shadow.shadowOffset, blur: shadow.shadowBlurRadius, color: (shadow.shadowColor as! UIColor).cgColor)
        fillColor.setFill()
        fill11Path.fill()
        context!.restoreGState()
        
        
        
        //// Fill-13 Drawing
        let fill13Path = UIBezierPath()
        fill13Path.move(to: CGPoint(x: 50.36, y: 9.87))
        fill13Path.addCurve(to: CGPoint(x: 54.4, y: 8.75), controlPoint1: CGPoint(x: 51.91, y: 9.72), controlPoint2: CGPoint(x: 53.26, y: 9.34))
        fill13Path.addCurve(to: CGPoint(x: 57.27, y: 6.04), controlPoint1: CGPoint(x: 55.54, y: 8.16), controlPoint2: CGPoint(x: 56.5, y: 7.26))
        fill13Path.addCurve(to: CGPoint(x: 58.93, y: 0.92), controlPoint1: CGPoint(x: 58.04, y: 4.83), controlPoint2: CGPoint(x: 58.6, y: 3.12))
        fill13Path.addLine(to: CGPoint(x: 62.49, y: 0.93))
        fill13Path.addLine(to: CGPoint(x: 62.32, y: 49.09))
        fill13Path.addLine(to: CGPoint(x: 57.93, y: 49.07))
        fill13Path.addLine(to: CGPoint(x: 58.05, y: 13.3))
        fill13Path.addLine(to: CGPoint(x: 45.15, y: 13.26))
        fill13Path.addLine(to: CGPoint(x: 45.16, y: 10.16))
        fill13Path.addCurve(to: CGPoint(x: 50.36, y: 9.87), controlPoint1: CGPoint(x: 47.07, y: 10.12), controlPoint2: CGPoint(x: 48.8, y: 10.03))
        fill13Path.close()
        fill13Path.miterLimit = 4;
        
        fill13Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill13Path.fill()
        
        //// Fill-2 Drawing
        let fill2Path = UIBezierPath()
        fill2Path.move(to: CGPoint(x: 96.03, y: 52.46))
        fill2Path.addCurve(to: CGPoint(x: 92.08, y: 55.88), controlPoint1: CGPoint(x: 94.45, y: 53.32), controlPoint2: CGPoint(x: 93.13, y: 54.47))
        fill2Path.addCurve(to: CGPoint(x: 89.69, y: 60.73), controlPoint1: CGPoint(x: 91.03, y: 57.3), controlPoint2: CGPoint(x: 90.23, y: 58.92))
        fill2Path.addCurve(to: CGPoint(x: 88.87, y: 66.26), controlPoint1: CGPoint(x: 89.15, y: 62.54), controlPoint2: CGPoint(x: 88.88, y: 64.38))
        fill2Path.addCurve(to: CGPoint(x: 89.65, y: 71.8), controlPoint1: CGPoint(x: 88.86, y: 68.14), controlPoint2: CGPoint(x: 89.12, y: 69.99))
        fill2Path.addCurve(to: CGPoint(x: 92.01, y: 76.66), controlPoint1: CGPoint(x: 90.18, y: 73.62), controlPoint2: CGPoint(x: 90.97, y: 75.24))
        fill2Path.addCurve(to: CGPoint(x: 95.94, y: 80.11), controlPoint1: CGPoint(x: 93.05, y: 78.09), controlPoint2: CGPoint(x: 94.36, y: 79.24))
        fill2Path.addCurve(to: CGPoint(x: 101.44, y: 81.44), controlPoint1: CGPoint(x: 97.51, y: 80.99), controlPoint2: CGPoint(x: 99.35, y: 81.43))
        fill2Path.addCurve(to: CGPoint(x: 106.95, y: 80.15), controlPoint1: CGPoint(x: 103.53, y: 81.45), controlPoint2: CGPoint(x: 105.37, y: 81.02))
        fill2Path.addCurve(to: CGPoint(x: 110.91, y: 76.72), controlPoint1: CGPoint(x: 108.54, y: 79.28), controlPoint2: CGPoint(x: 109.85, y: 78.14))
        fill2Path.addCurve(to: CGPoint(x: 113.29, y: 71.88), controlPoint1: CGPoint(x: 111.96, y: 75.31), controlPoint2: CGPoint(x: 112.75, y: 73.69))
        fill2Path.addCurve(to: CGPoint(x: 114.11, y: 66.35), controlPoint1: CGPoint(x: 113.83, y: 70.07), controlPoint2: CGPoint(x: 114.11, y: 68.23))
        fill2Path.addCurve(to: CGPoint(x: 113.33, y: 60.81), controlPoint1: CGPoint(x: 114.12, y: 64.47), controlPoint2: CGPoint(x: 113.86, y: 62.62))
        fill2Path.addCurve(to: CGPoint(x: 110.98, y: 55.95), controlPoint1: CGPoint(x: 112.8, y: 58.99), controlPoint2: CGPoint(x: 112.02, y: 57.37))
        fill2Path.addCurve(to: CGPoint(x: 107.05, y: 52.5), controlPoint1: CGPoint(x: 109.94, y: 54.52), controlPoint2: CGPoint(x: 108.63, y: 53.37))
        fill2Path.addCurve(to: CGPoint(x: 101.54, y: 51.17), controlPoint1: CGPoint(x: 105.47, y: 51.62), controlPoint2: CGPoint(x: 103.64, y: 51.18))
        fill2Path.addCurve(to: CGPoint(x: 96.03, y: 52.46), controlPoint1: CGPoint(x: 99.45, y: 51.16), controlPoint2: CGPoint(x: 97.61, y: 51.59))
        fill2Path.close()
        fill2Path.move(to: CGPoint(x: 108.84, y: 49.06))
        fill2Path.addCurve(to: CGPoint(x: 114.16, y: 53.14), controlPoint1: CGPoint(x: 110.95, y: 50.08), controlPoint2: CGPoint(x: 112.72, y: 51.44))
        fill2Path.addCurve(to: CGPoint(x: 117.42, y: 59.1), controlPoint1: CGPoint(x: 115.59, y: 54.84), controlPoint2: CGPoint(x: 116.68, y: 56.83))
        fill2Path.addCurve(to: CGPoint(x: 118.51, y: 66.36), controlPoint1: CGPoint(x: 118.15, y: 61.37), controlPoint2: CGPoint(x: 118.52, y: 63.79))
        fill2Path.addCurve(to: CGPoint(x: 117.37, y: 73.62), controlPoint1: CGPoint(x: 118.5, y: 68.93), controlPoint2: CGPoint(x: 118.12, y: 71.35))
        fill2Path.addCurve(to: CGPoint(x: 114.07, y: 79.55), controlPoint1: CGPoint(x: 116.61, y: 75.88), controlPoint2: CGPoint(x: 115.51, y: 77.86))
        fill2Path.addCurve(to: CGPoint(x: 108.72, y: 83.56), controlPoint1: CGPoint(x: 112.62, y: 81.25), controlPoint2: CGPoint(x: 110.84, y: 82.58))
        fill2Path.addCurve(to: CGPoint(x: 101.43, y: 85.02), controlPoint1: CGPoint(x: 106.6, y: 84.54), controlPoint2: CGPoint(x: 104.17, y: 85.02))
        fill2Path.addCurve(to: CGPoint(x: 94.15, y: 83.51), controlPoint1: CGPoint(x: 98.68, y: 85.01), controlPoint2: CGPoint(x: 96.26, y: 84.5))
        fill2Path.addCurve(to: CGPoint(x: 88.82, y: 79.47), controlPoint1: CGPoint(x: 92.03, y: 82.52), controlPoint2: CGPoint(x: 90.26, y: 81.17))
        fill2Path.addCurve(to: CGPoint(x: 85.57, y: 73.51), controlPoint1: CGPoint(x: 87.39, y: 77.77), controlPoint2: CGPoint(x: 86.3, y: 75.78))
        fill2Path.addCurve(to: CGPoint(x: 84.48, y: 66.25), controlPoint1: CGPoint(x: 84.83, y: 71.24), controlPoint2: CGPoint(x: 84.47, y: 68.82))
        fill2Path.addCurve(to: CGPoint(x: 85.62, y: 58.99), controlPoint1: CGPoint(x: 84.49, y: 63.68), controlPoint2: CGPoint(x: 84.87, y: 61.26))
        fill2Path.addCurve(to: CGPoint(x: 88.92, y: 53.05), controlPoint1: CGPoint(x: 86.37, y: 56.72), controlPoint2: CGPoint(x: 87.47, y: 54.75))
        fill2Path.addCurve(to: CGPoint(x: 94.27, y: 49.01), controlPoint1: CGPoint(x: 90.36, y: 51.36), controlPoint2: CGPoint(x: 92.15, y: 50.01))
        fill2Path.addCurve(to: CGPoint(x: 101.56, y: 47.52), controlPoint1: CGPoint(x: 96.38, y: 48.01), controlPoint2: CGPoint(x: 98.81, y: 47.51))
        fill2Path.addCurve(to: CGPoint(x: 108.84, y: 49.06), controlPoint1: CGPoint(x: 104.3, y: 47.53), controlPoint2: CGPoint(x: 106.73, y: 48.05))
        fill2Path.close()
        fill2Path.miterLimit = 4;
        
        fill2Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill2Path.fill()
        
        
        //// Fill-1 Drawing
        let fill1Path = UIBezierPath()
        fill1Path.move(to: CGPoint(x: 43.37, y: 34.74))
        fill1Path.addLine(to: CGPoint(x: 72.24, y: 76.39))
        fill1Path.addLine(to: CGPoint(x: 72.38, y: 76.39))
        fill1Path.addLine(to: CGPoint(x: 72.52, y: 34.84))
        fill1Path.addLine(to: CGPoint(x: 77.26, y: 34.85))
        fill1Path.addLine(to: CGPoint(x: 77.09, y: 83.97))
        fill1Path.addLine(to: CGPoint(x: 71.79, y: 83.95))
        fill1Path.addLine(to: CGPoint(x: 42.93, y: 42.3))
        fill1Path.addLine(to: CGPoint(x: 42.79, y: 42.3))
        fill1Path.addLine(to: CGPoint(x: 42.65, y: 83.85))
        fill1Path.addLine(to: CGPoint(x: 37.9, y: 83.84))
        fill1Path.addLine(to: CGPoint(x: 38.07, y: 34.72))
        fill1Path.addLine(to: CGPoint(x: 43.37, y: 34.74))
        fill1Path.close()
        fill1Path.miterLimit = 4;
        
        fill1Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill1Path.fill()
        
        
        //// Fill-5 Drawing
        let fill5Path = UIBezierPath()
        fill5Path.move(to: CGPoint(x: 129.17, y: 48.65))
        fill5Path.addLine(to: CGPoint(x: 129.14, y: 56.97))
        fill5Path.addLine(to: CGPoint(x: 129.28, y: 56.97))
        fill5Path.addCurve(to: CGPoint(x: 134.5, y: 50.32), controlPoint1: CGPoint(x: 130.4, y: 54.09), controlPoint2: CGPoint(x: 132.14, y: 51.87))
        fill5Path.addCurve(to: CGPoint(x: 142.91, y: 48.21), controlPoint1: CGPoint(x: 136.85, y: 48.77), controlPoint2: CGPoint(x: 139.65, y: 48.06))
        fill5Path.addLine(to: CGPoint(x: 142.89, y: 52.55))
        fill5Path.addCurve(to: CGPoint(x: 137.45, y: 53.32), controlPoint1: CGPoint(x: 140.89, y: 52.45), controlPoint2: CGPoint(x: 139.08, y: 52.71))
        fill5Path.addCurve(to: CGPoint(x: 133.22, y: 55.95), controlPoint1: CGPoint(x: 135.82, y: 53.93), controlPoint2: CGPoint(x: 134.41, y: 54.81))
        fill5Path.addCurve(to: CGPoint(x: 130.45, y: 60.04), controlPoint1: CGPoint(x: 132.03, y: 57.1), controlPoint2: CGPoint(x: 131.11, y: 58.46))
        fill5Path.addCurve(to: CGPoint(x: 129.46, y: 65.23), controlPoint1: CGPoint(x: 129.8, y: 61.62), controlPoint2: CGPoint(x: 129.47, y: 63.35))
        fill5Path.addLine(to: CGPoint(x: 129.39, y: 84.15))
        fill5Path.addLine(to: CGPoint(x: 125, y: 84.13))
        fill5Path.addLine(to: CGPoint(x: 125.12, y: 48.63))
        fill5Path.addLine(to: CGPoint(x: 129.17, y: 48.65))
        fill5Path.close()
        fill5Path.miterLimit = 4;
        
        fill5Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill5Path.fill()
        
        
        //// Fill-7 Drawing
        let fill7Path = UIBezierPath()
        fill7Path.move(to: CGPoint(x: 161.38, y: 48.76))
        fill7Path.addLine(to: CGPoint(x: 161.37, y: 52.4))
        fill7Path.addLine(to: CGPoint(x: 154.05, y: 52.38))
        fill7Path.addLine(to: CGPoint(x: 153.97, y: 76.32))
        fill7Path.addCurve(to: CGPoint(x: 154.55, y: 79.66), controlPoint1: CGPoint(x: 153.96, y: 77.74), controlPoint2: CGPoint(x: 154.15, y: 78.85))
        fill7Path.addCurve(to: CGPoint(x: 157.51, y: 81.01), controlPoint1: CGPoint(x: 154.94, y: 80.46), controlPoint2: CGPoint(x: 155.93, y: 80.91))
        fill7Path.addCurve(to: CGPoint(x: 161.27, y: 80.81), controlPoint1: CGPoint(x: 158.76, y: 81.01), controlPoint2: CGPoint(x: 160.02, y: 80.95))
        fill7Path.addLine(to: CGPoint(x: 161.26, y: 84.46))
        fill7Path.addCurve(to: CGPoint(x: 159.31, y: 84.52), controlPoint1: CGPoint(x: 160.61, y: 84.46), controlPoint2: CGPoint(x: 159.96, y: 84.48))
        fill7Path.addCurve(to: CGPoint(x: 157.35, y: 84.58), controlPoint1: CGPoint(x: 158.66, y: 84.57), controlPoint2: CGPoint(x: 158.01, y: 84.59))
        fill7Path.addCurve(to: CGPoint(x: 151.22, y: 82.88), controlPoint1: CGPoint(x: 154.43, y: 84.58), controlPoint2: CGPoint(x: 152.38, y: 84.01))
        fill7Path.addCurve(to: CGPoint(x: 149.57, y: 76.65), controlPoint1: CGPoint(x: 150.07, y: 81.75), controlPoint2: CGPoint(x: 149.51, y: 79.67))
        fill7Path.addLine(to: CGPoint(x: 149.66, y: 52.36))
        fill7Path.addLine(to: CGPoint(x: 143.38, y: 52.34))
        fill7Path.addLine(to: CGPoint(x: 143.39, y: 48.7))
        fill7Path.addLine(to: CGPoint(x: 149.67, y: 48.72))
        fill7Path.addLine(to: CGPoint(x: 149.71, y: 38.05))
        fill7Path.addLine(to: CGPoint(x: 154.1, y: 38.07))
        fill7Path.addLine(to: CGPoint(x: 154.06, y: 48.73))
        fill7Path.addLine(to: CGPoint(x: 161.38, y: 48.76))
        fill7Path.close()
        fill7Path.miterLimit = 4;
        
        fill7Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill7Path.fill()
        
        
        
        
        context!.endTransparencyLayer()
        context!.restoreGState()
        
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imageViewtool
    }
    
    func grad()->UIImage{
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 320, height: 18), false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let gradientColor = UIColor(red: 0.802, green: 0.802, blue: 0.802, alpha: 1.000)
        let gradientColor2 = UIColor(red: 0.530, green: 0.530, blue: 0.530, alpha: 1.000)
        
        //// Gradient Declarations
        let colorsFor = [gradientColor.cgColor, gradientColor2.cgColor, gradientColor.cgColor] as CFArray
        let radialGradient1 = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),colors: colorsFor, locations: [0, 0.48, 1])!
        
        //// Rectangle-2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 320, height: 18))
        context!.saveGState()
        rectangle2Path.addClip()
        context!.drawRadialGradient(radialGradient1,
                                    startCenter: CGPoint(x: 0.83, y: 8.96), startRadius: 0,
                                    endCenter: CGPoint(x: 0.83, y: 8.96), endRadius: 323.2,
                                    options: [CGGradientDrawingOptions.drawsBeforeStartLocation, CGGradientDrawingOptions.drawsAfterEndLocation])
        context!.restoreGState()
        
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imgbgc!
    }
    func bottomLine()->UIImage{
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: UIScreen.main.bounds.width, height: 6), false, 0)
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let gradientColor = UIColor(red: 0.802, green: 0.802, blue: 0.802, alpha: 1.000)
        let gradientColor2 = UIColor(red: 0.530, green: 0.530, blue: 0.530, alpha: 1.000)
        let strokeColor = UIColor(red: 0.760, green: 0.760, blue: 0.760, alpha: 1.000)
        
        //// Gradient Declarations
        let colorsFor = [gradientColor.cgColor, gradientColor2.cgColor, gradientColor.cgColor] as CFArray
        let radialGradient1 = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colorsFor, locations: [0, 0.48, 1])!
        
        //// Group-8
        //// Rectangle-2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: 0, y: 0.2, width: UIScreen.main.bounds.width, height: 5.33))
        context!.saveGState()
        rectangle2Path.addClip()
        context!.drawRadialGradient(radialGradient1,
                                    startCenter: CGPoint(x: 2.83, y: 2.86), startRadius: 0,
                                    endCenter: CGPoint(x: 2.83, y: 2.86), endRadius: 323.2,
                                    options: [CGGradientDrawingOptions.drawsBeforeStartLocation, CGGradientDrawingOptions.drawsAfterEndLocation])
        context!.restoreGState()
        
        
        //// Line Drawing
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0, y: 3.36))
        linePath.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 3.36))
        linePath.miterLimit = 4;
        
        linePath.lineCapStyle = .square;
        
        linePath.usesEvenOddFillRule = true;
        
        strokeColor.setStroke()
        linePath.lineWidth = 1
        linePath.stroke()
        
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imgbgc!
    }
}
