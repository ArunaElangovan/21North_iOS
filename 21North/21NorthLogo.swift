//
//  21NorthLogo.swift
//  21North
//
//  Created by Sachin Tomar on 13/12/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation

class Companylogo{

    func coloredLogo()-> UIImageView{
        //// Color Declarations
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 160, height: 71), false, 0)
        
        let fillColor = UIColor.gray//(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
        let fillColor2 = UIColor(red: 0.925, green: 0.315, blue: 0.104, alpha: 1.000)
        
        //// Page-1
//        context!.saveGState()
//        CGContextSetAlpha(context, 0.63)
//        CGContextBeginTransparencyLayer(context, nil)
        
        
        //// Fill-1 Drawing
        let fill1Path = UIBezierPath()
        fill1Path.move(to: CGPoint(x: 33.68, y: 28.7))
        fill1Path.addLine(to: CGPoint(x: 57.32, y: 63.11))
        fill1Path.addLine(to: CGPoint(x: 57.44, y: 63.11))
        fill1Path.addLine(to: CGPoint(x: 57.44, y: 28.7))
        fill1Path.addLine(to: CGPoint(x: 61.3, y: 28.7))
        fill1Path.addLine(to: CGPoint(x: 61.3, y: 69.38))
        fill1Path.addLine(to: CGPoint(x: 56.98, y: 69.38))
        fill1Path.addLine(to: CGPoint(x: 33.34, y: 34.97))
        fill1Path.addLine(to: CGPoint(x: 33.23, y: 34.97))
        fill1Path.addLine(to: CGPoint(x: 33.23, y: 69.38))
        fill1Path.addLine(to: CGPoint(x: 29.36, y: 69.38))
        fill1Path.addLine(to: CGPoint(x: 29.36, y: 28.7))
        fill1Path.addLine(to: CGPoint(x: 33.68, y: 28.7))
        fill1Path.close()
        fill1Path.miterLimit = 4;
        
        fill1Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill1Path.fill()
        
        
        //// Group-16
        //// Fill-2 Drawing
        let fill2Path = UIBezierPath()
        fill2Path.move(to: CGPoint(x: 76.65, y: 43.23))
        fill2Path.addCurve(to: CGPoint(x: 73.43, y: 46.08), controlPoint1: CGPoint(x: 75.36, y: 43.95), controlPoint2: CGPoint(x: 74.29, y: 44.9))
        fill2Path.addCurve(to: CGPoint(x: 71.5, y: 50.09), controlPoint1: CGPoint(x: 72.58, y: 47.25), controlPoint2: CGPoint(x: 71.94, y: 48.59))
        fill2Path.addCurve(to: CGPoint(x: 70.85, y: 54.68), controlPoint1: CGPoint(x: 71.07, y: 51.59), controlPoint2: CGPoint(x: 70.85, y: 53.12))
        fill2Path.addCurve(to: CGPoint(x: 71.5, y: 59.26), controlPoint1: CGPoint(x: 70.85, y: 56.24), controlPoint2: CGPoint(x: 71.07, y: 57.76))
        fill2Path.addCurve(to: CGPoint(x: 73.43, y: 63.28), controlPoint1: CGPoint(x: 71.94, y: 60.76), controlPoint2: CGPoint(x: 72.58, y: 62.1))
        fill2Path.addCurve(to: CGPoint(x: 76.65, y: 66.13), controlPoint1: CGPoint(x: 74.29, y: 64.46), controlPoint2: CGPoint(x: 75.36, y: 65.41))
        fill2Path.addCurve(to: CGPoint(x: 81.14, y: 67.21), controlPoint1: CGPoint(x: 77.93, y: 66.85), controlPoint2: CGPoint(x: 79.43, y: 67.21))
        fill2Path.addCurve(to: CGPoint(x: 85.63, y: 66.13), controlPoint1: CGPoint(x: 82.84, y: 67.21), controlPoint2: CGPoint(x: 84.34, y: 66.85))
        fill2Path.addCurve(to: CGPoint(x: 88.84, y: 63.28), controlPoint1: CGPoint(x: 86.91, y: 65.41), controlPoint2: CGPoint(x: 87.98, y: 64.46))
        fill2Path.addCurve(to: CGPoint(x: 90.77, y: 59.26), controlPoint1: CGPoint(x: 89.69, y: 62.1), controlPoint2: CGPoint(x: 90.33, y: 60.76))
        fill2Path.addCurve(to: CGPoint(x: 91.42, y: 54.68), controlPoint1: CGPoint(x: 91.2, y: 57.76), controlPoint2: CGPoint(x: 91.42, y: 56.24))
        fill2Path.addCurve(to: CGPoint(x: 90.77, y: 50.09), controlPoint1: CGPoint(x: 91.42, y: 53.12), controlPoint2: CGPoint(x: 91.2, y: 51.59))
        fill2Path.addCurve(to: CGPoint(x: 88.84, y: 46.08), controlPoint1: CGPoint(x: 90.33, y: 48.59), controlPoint2: CGPoint(x: 89.69, y: 47.25))
        fill2Path.addCurve(to: CGPoint(x: 85.63, y: 43.23), controlPoint1: CGPoint(x: 87.98, y: 44.9), controlPoint2: CGPoint(x: 86.91, y: 43.95))
        fill2Path.addCurve(to: CGPoint(x: 81.14, y: 42.14), controlPoint1: CGPoint(x: 84.34, y: 42.51), controlPoint2: CGPoint(x: 82.84, y: 42.14))
        fill2Path.addCurve(to: CGPoint(x: 76.65, y: 43.23), controlPoint1: CGPoint(x: 79.43, y: 42.14), controlPoint2: CGPoint(x: 77.93, y: 42.51))
        fill2Path.close()
        fill2Path.move(to: CGPoint(x: 87.07, y: 40.38))
        fill2Path.addCurve(to: CGPoint(x: 91.42, y: 43.74), controlPoint1: CGPoint(x: 88.8, y: 41.21), controlPoint2: CGPoint(x: 90.25, y: 42.33))
        fill2Path.addCurve(to: CGPoint(x: 94.09, y: 48.67), controlPoint1: CGPoint(x: 92.6, y: 45.14), controlPoint2: CGPoint(x: 93.49, y: 46.79))
        fill2Path.addCurve(to: CGPoint(x: 95, y: 54.68), controlPoint1: CGPoint(x: 94.7, y: 50.55), controlPoint2: CGPoint(x: 95, y: 52.55))
        fill2Path.addCurve(to: CGPoint(x: 94.09, y: 60.69), controlPoint1: CGPoint(x: 95, y: 56.8), controlPoint2: CGPoint(x: 94.7, y: 58.81))
        fill2Path.addCurve(to: CGPoint(x: 91.42, y: 65.62), controlPoint1: CGPoint(x: 93.49, y: 62.57), controlPoint2: CGPoint(x: 92.6, y: 64.21))
        fill2Path.addCurve(to: CGPoint(x: 87.07, y: 68.95), controlPoint1: CGPoint(x: 90.25, y: 67.02), controlPoint2: CGPoint(x: 88.8, y: 68.13))
        fill2Path.addCurve(to: CGPoint(x: 81.14, y: 70.17), controlPoint1: CGPoint(x: 85.35, y: 69.76), controlPoint2: CGPoint(x: 83.37, y: 70.17))
        fill2Path.addCurve(to: CGPoint(x: 75.2, y: 68.95), controlPoint1: CGPoint(x: 78.9, y: 70.17), controlPoint2: CGPoint(x: 76.92, y: 69.76))
        fill2Path.addCurve(to: CGPoint(x: 70.85, y: 65.62), controlPoint1: CGPoint(x: 73.47, y: 68.13), controlPoint2: CGPoint(x: 72.02, y: 67.02))
        fill2Path.addCurve(to: CGPoint(x: 68.18, y: 60.69), controlPoint1: CGPoint(x: 69.67, y: 64.21), controlPoint2: CGPoint(x: 68.78, y: 62.57))
        fill2Path.addCurve(to: CGPoint(x: 67.27, y: 54.68), controlPoint1: CGPoint(x: 67.57, y: 58.81), controlPoint2: CGPoint(x: 67.27, y: 56.8))
        fill2Path.addCurve(to: CGPoint(x: 68.18, y: 48.67), controlPoint1: CGPoint(x: 67.27, y: 52.55), controlPoint2: CGPoint(x: 67.57, y: 50.55))
        fill2Path.addCurve(to: CGPoint(x: 70.85, y: 43.74), controlPoint1: CGPoint(x: 68.78, y: 46.79), controlPoint2: CGPoint(x: 69.67, y: 45.14))
        fill2Path.addCurve(to: CGPoint(x: 75.2, y: 40.38), controlPoint1: CGPoint(x: 72.02, y: 42.33), controlPoint2: CGPoint(x: 73.47, y: 41.21))
        fill2Path.addCurve(to: CGPoint(x: 81.14, y: 39.12), controlPoint1: CGPoint(x: 76.92, y: 39.54), controlPoint2: CGPoint(x: 78.9, y: 39.12))
        fill2Path.addCurve(to: CGPoint(x: 87.07, y: 40.38), controlPoint1: CGPoint(x: 83.37, y: 39.12), controlPoint2: CGPoint(x: 85.35, y: 39.54))
        fill2Path.close()
        fill2Path.miterLimit = 4;
        
        fill2Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill2Path.fill()
        
        
        //// Fill-4 Drawing
        let fill4Path = UIBezierPath()
        fill4Path.move(to: CGPoint(x: 103.64, y: 39.98))
        fill4Path.addLine(to: CGPoint(x: 103.64, y: 46.87))
        fill4Path.addLine(to: CGPoint(x: 103.76, y: 46.87))
        fill4Path.addCurve(to: CGPoint(x: 107.99, y: 41.35), controlPoint1: CGPoint(x: 104.66, y: 44.48), controlPoint2: CGPoint(x: 106.08, y: 42.64))
        fill4Path.addCurve(to: CGPoint(x: 114.84, y: 39.58), controlPoint1: CGPoint(x: 109.9, y: 40.06), controlPoint2: CGPoint(x: 112.19, y: 39.47))
        fill4Path.addLine(to: CGPoint(x: 114.84, y: 43.17))
        fill4Path.addCurve(to: CGPoint(x: 110.4, y: 43.82), controlPoint1: CGPoint(x: 113.21, y: 43.09), controlPoint2: CGPoint(x: 111.73, y: 43.31))
        fill4Path.addCurve(to: CGPoint(x: 106.97, y: 46.02), controlPoint1: CGPoint(x: 109.08, y: 44.34), controlPoint2: CGPoint(x: 107.93, y: 45.07))
        fill4Path.addCurve(to: CGPoint(x: 104.72, y: 49.41), controlPoint1: CGPoint(x: 106, y: 46.97), controlPoint2: CGPoint(x: 105.25, y: 48.1))
        fill4Path.addCurve(to: CGPoint(x: 103.93, y: 53.71), controlPoint1: CGPoint(x: 104.19, y: 50.72), controlPoint2: CGPoint(x: 103.93, y: 52.15))
        fill4Path.addLine(to: CGPoint(x: 103.93, y: 69.38))
        fill4Path.addLine(to: CGPoint(x: 100.34, y: 69.38))
        fill4Path.addLine(to: CGPoint(x: 100.34, y: 39.98))
        fill4Path.addLine(to: CGPoint(x: 103.64, y: 39.98))
        fill4Path.close()
        fill4Path.miterLimit = 4;
        
        fill4Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill4Path.fill()
        
        
        //// Fill-14 Drawing
        let fill14Path = UIBezierPath()
        fill14Path.move(to: CGPoint(x: 39.3, y: 8.09))
        fill14Path.addCurve(to: CGPoint(x: 42.6, y: 7.15), controlPoint1: CGPoint(x: 40.57, y: 7.95), controlPoint2: CGPoint(x: 41.67, y: 7.64))
        fill14Path.addCurve(to: CGPoint(x: 44.93, y: 4.9), controlPoint1: CGPoint(x: 43.52, y: 6.65), controlPoint2: CGPoint(x: 44.3, y: 5.9))
        fill14Path.addCurve(to: CGPoint(x: 46.26, y: 0.65), controlPoint1: CGPoint(x: 45.55, y: 3.89), controlPoint2: CGPoint(x: 46, y: 2.48))
        fill14Path.addLine(to: CGPoint(x: 49.16, y: 0.65))
        fill14Path.addLine(to: CGPoint(x: 49.16, y: 40.53))
        fill14Path.addLine(to: CGPoint(x: 45.58, y: 40.53))
        fill14Path.addLine(to: CGPoint(x: 45.58, y: 10.91))
        fill14Path.addLine(to: CGPoint(x: 35.07, y: 10.91))
        fill14Path.addLine(to: CGPoint(x: 35.07, y: 8.34))
        fill14Path.addCurve(to: CGPoint(x: 39.3, y: 8.09), controlPoint1: CGPoint(x: 36.62, y: 8.31), controlPoint2: CGPoint(x: 38.03, y: 8.22))
        fill14Path.close()
        fill14Path.miterLimit = 4;
        
        fill14Path.usesEvenOddFillRule = true;
        
        fillColor2.setFill()
        fill14Path.fill()
        
        //// Fill-8 Drawing
        let fill8Path = UIBezierPath()
        fill8Path.move(to: CGPoint(x: 138.59, y: 28.7))
        fill8Path.addLine(to: CGPoint(x: 138.59, y: 45.05))
        fill8Path.addLine(to: CGPoint(x: 138.71, y: 45.05))
        fill8Path.addCurve(to: CGPoint(x: 142.34, y: 40.75), controlPoint1: CGPoint(x: 139.39, y: 43.26), controlPoint2: CGPoint(x: 140.6, y: 41.83))
        fill8Path.addCurve(to: CGPoint(x: 148.08, y: 39.12), controlPoint1: CGPoint(x: 144.09, y: 39.67), controlPoint2: CGPoint(x: 146, y: 39.12))
        fill8Path.addCurve(to: CGPoint(x: 153.23, y: 39.92), controlPoint1: CGPoint(x: 150.13, y: 39.12), controlPoint2: CGPoint(x: 151.84, y: 39.39))
        fill8Path.addCurve(to: CGPoint(x: 156.55, y: 42.17), controlPoint1: CGPoint(x: 154.61, y: 40.45), controlPoint2: CGPoint(x: 155.72, y: 41.2))
        fill8Path.addCurve(to: CGPoint(x: 158.31, y: 45.73), controlPoint1: CGPoint(x: 157.38, y: 43.14), controlPoint2: CGPoint(x: 157.97, y: 44.33))
        fill8Path.addCurve(to: CGPoint(x: 158.82, y: 50.46), controlPoint1: CGPoint(x: 158.65, y: 47.14), controlPoint2: CGPoint(x: 158.82, y: 48.72))
        fill8Path.addLine(to: CGPoint(x: 158.82, y: 69.38))
        fill8Path.addLine(to: CGPoint(x: 155.24, y: 69.38))
        fill8Path.addLine(to: CGPoint(x: 155.24, y: 51.03))
        fill8Path.addCurve(to: CGPoint(x: 154.9, y: 47.53), controlPoint1: CGPoint(x: 155.24, y: 49.78), controlPoint2: CGPoint(x: 155.13, y: 48.61))
        fill8Path.addCurve(to: CGPoint(x: 153.71, y: 44.71), controlPoint1: CGPoint(x: 154.68, y: 46.45), controlPoint2: CGPoint(x: 154.28, y: 45.51))
        fill8Path.addCurve(to: CGPoint(x: 151.41, y: 42.83), controlPoint1: CGPoint(x: 153.14, y: 43.91), controlPoint2: CGPoint(x: 152.37, y: 43.28))
        fill8Path.addCurve(to: CGPoint(x: 147.8, y: 42.14), controlPoint1: CGPoint(x: 150.44, y: 42.37), controlPoint2: CGPoint(x: 149.24, y: 42.14))
        fill8Path.addCurve(to: CGPoint(x: 143.96, y: 42.91), controlPoint1: CGPoint(x: 146.36, y: 42.14), controlPoint2: CGPoint(x: 145.08, y: 42.4))
        fill8Path.addCurve(to: CGPoint(x: 141.12, y: 45.02), controlPoint1: CGPoint(x: 142.84, y: 43.43), controlPoint2: CGPoint(x: 141.9, y: 44.13))
        fill8Path.addCurve(to: CGPoint(x: 139.3, y: 48.21), controlPoint1: CGPoint(x: 140.34, y: 45.91), controlPoint2: CGPoint(x: 139.74, y: 46.98))
        fill8Path.addCurve(to: CGPoint(x: 138.59, y: 52.23), controlPoint1: CGPoint(x: 138.87, y: 49.45), controlPoint2: CGPoint(x: 138.63, y: 50.78))
        fill8Path.addLine(to: CGPoint(x: 138.59, y: 69.38))
        fill8Path.addLine(to: CGPoint(x: 135.01, y: 69.38))
        fill8Path.addLine(to: CGPoint(x: 135.01, y: 28.7))
        fill8Path.addLine(to: CGPoint(x: 138.59, y: 28.7))
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
        fill11Path.move(to: CGPoint(x: 0, y: 40.53))
        fill11Path.addCurve(to: CGPoint(x: 1.02, y: 35.29), controlPoint1: CGPoint(x: 0.04, y: 38.56), controlPoint2: CGPoint(x: 0.38, y: 36.81))
        fill11Path.addCurve(to: CGPoint(x: 3.58, y: 31.19), controlPoint1: CGPoint(x: 1.67, y: 33.77), controlPoint2: CGPoint(x: 2.52, y: 32.4))
        fill11Path.addCurve(to: CGPoint(x: 7.16, y: 27.86), controlPoint1: CGPoint(x: 4.64, y: 29.97), controlPoint2: CGPoint(x: 5.83, y: 28.86))
        fill11Path.addCurve(to: CGPoint(x: 11.25, y: 24.95), controlPoint1: CGPoint(x: 8.49, y: 26.85), controlPoint2: CGPoint(x: 9.85, y: 25.88))
        fill11Path.addCurve(to: CGPoint(x: 15.43, y: 22.1), controlPoint1: CGPoint(x: 12.65, y: 24.02), controlPoint2: CGPoint(x: 14.05, y: 23.07))
        fill11Path.addCurve(to: CGPoint(x: 19.15, y: 19), controlPoint1: CGPoint(x: 16.81, y: 21.13), controlPoint2: CGPoint(x: 18.05, y: 20.1))
        fill11Path.addCurve(to: CGPoint(x: 21.62, y: 15.61), controlPoint1: CGPoint(x: 20.25, y: 17.9), controlPoint2: CGPoint(x: 21.08, y: 16.77))
        fill11Path.addCurve(to: CGPoint(x: 22.45, y: 11.48), controlPoint1: CGPoint(x: 22.17, y: 14.45), controlPoint2: CGPoint(x: 22.45, y: 13.07))
        fill11Path.addCurve(to: CGPoint(x: 21.74, y: 8.03), controlPoint1: CGPoint(x: 22.45, y: 10.19), controlPoint2: CGPoint(x: 22.21, y: 9.04))
        fill11Path.addCurve(to: CGPoint(x: 19.81, y: 5.47), controlPoint1: CGPoint(x: 21.26, y: 7.02), controlPoint2: CGPoint(x: 20.62, y: 6.17))
        fill11Path.addCurve(to: CGPoint(x: 16.96, y: 3.87), controlPoint1: CGPoint(x: 18.99, y: 4.76), controlPoint2: CGPoint(x: 18.04, y: 4.23))
        fill11Path.addCurve(to: CGPoint(x: 13.53, y: 3.33), controlPoint1: CGPoint(x: 15.88, y: 3.51), controlPoint2: CGPoint(x: 14.74, y: 3.33))
        fill11Path.addCurve(to: CGPoint(x: 9.35, y: 4.24), controlPoint1: CGPoint(x: 11.9, y: 3.33), controlPoint2: CGPoint(x: 10.5, y: 3.63))
        fill11Path.addCurve(to: CGPoint(x: 6.54, y: 6.69), controlPoint1: CGPoint(x: 8.19, y: 4.85), controlPoint2: CGPoint(x: 7.25, y: 5.67))
        fill11Path.addCurve(to: CGPoint(x: 4.97, y: 10.22), controlPoint1: CGPoint(x: 5.82, y: 7.72), controlPoint2: CGPoint(x: 5.29, y: 8.89))
        fill11Path.addCurve(to: CGPoint(x: 4.55, y: 14.44), controlPoint1: CGPoint(x: 4.65, y: 11.55), controlPoint2: CGPoint(x: 4.51, y: 12.96))
        fill11Path.addLine(to: CGPoint(x: 0.97, y: 14.44))
        fill11Path.addCurve(to: CGPoint(x: 1.68, y: 8.77), controlPoint1: CGPoint(x: 0.93, y: 12.39), controlPoint2: CGPoint(x: 1.17, y: 10.5))
        fill11Path.addCurve(to: CGPoint(x: 4.04, y: 4.3), controlPoint1: CGPoint(x: 2.19, y: 7.04), controlPoint2: CGPoint(x: 2.97, y: 5.55))
        fill11Path.addCurve(to: CGPoint(x: 8.04, y: 1.36), controlPoint1: CGPoint(x: 5.1, y: 3.05), controlPoint2: CGPoint(x: 6.43, y: 2.07))
        fill11Path.addCurve(to: CGPoint(x: 13.7, y: 0.31), controlPoint1: CGPoint(x: 9.65, y: 0.66), controlPoint2: CGPoint(x: 11.54, y: 0.31))
        fill11Path.addCurve(to: CGPoint(x: 18.56, y: 1.02), controlPoint1: CGPoint(x: 15.44, y: 0.31), controlPoint2: CGPoint(x: 17.06, y: 0.55))
        fill11Path.addCurve(to: CGPoint(x: 22.48, y: 3.13), controlPoint1: CGPoint(x: 20.05, y: 1.5), controlPoint2: CGPoint(x: 21.36, y: 2.2))
        fill11Path.addCurve(to: CGPoint(x: 25.09, y: 6.63), controlPoint1: CGPoint(x: 23.59, y: 4.06), controlPoint2: CGPoint(x: 24.47, y: 5.23))
        fill11Path.addCurve(to: CGPoint(x: 26.03, y: 11.53), controlPoint1: CGPoint(x: 25.72, y: 8.04), controlPoint2: CGPoint(x: 26.03, y: 9.67))
        fill11Path.addCurve(to: CGPoint(x: 25.21, y: 16.09), controlPoint1: CGPoint(x: 26.03, y: 13.21), controlPoint2: CGPoint(x: 25.75, y: 14.72))
        fill11Path.addCurve(to: CGPoint(x: 22.99, y: 19.85), controlPoint1: CGPoint(x: 24.66, y: 17.46), controlPoint2: CGPoint(x: 23.92, y: 18.71))
        fill11Path.addCurve(to: CGPoint(x: 19.81, y: 23.01), controlPoint1: CGPoint(x: 22.06, y: 20.99), controlPoint2: CGPoint(x: 21, y: 22.04))
        fill11Path.addCurve(to: CGPoint(x: 16.03, y: 25.72), controlPoint1: CGPoint(x: 18.61, y: 23.98), controlPoint2: CGPoint(x: 17.35, y: 24.88))
        fill11Path.addCurve(to: CGPoint(x: 12.67, y: 27.86), controlPoint1: CGPoint(x: 15.08, y: 26.37), controlPoint2: CGPoint(x: 13.96, y: 27.08))
        fill11Path.addCurve(to: CGPoint(x: 8.95, y: 30.45), controlPoint1: CGPoint(x: 11.39, y: 28.63), controlPoint2: CGPoint(x: 10.14, y: 29.5))
        fill11Path.addCurve(to: CGPoint(x: 5.8, y: 33.55), controlPoint1: CGPoint(x: 7.76, y: 31.4), controlPoint2: CGPoint(x: 6.71, y: 32.43))
        fill11Path.addCurve(to: CGPoint(x: 4.09, y: 37.23), controlPoint1: CGPoint(x: 4.89, y: 34.67), controlPoint2: CGPoint(x: 4.32, y: 35.9))
        fill11Path.addLine(to: CGPoint(x: 26.2, y: 37.23))
        fill11Path.addLine(to: CGPoint(x: 26.2, y: 40.53))
        fill11Path.addLine(to: CGPoint(x: 0, y: 40.53))
        fill11Path.close()
        fill11Path.miterLimit = 4;
        
        fill11Path.usesEvenOddFillRule = true;
        
        fillColor2.setFill()
        fill11Path.fill()
        
        //// Group-16
        //// Fill-6 Drawing
        let fill6Path = UIBezierPath()
        fill6Path.move(to: CGPoint(x: 129.9, y: 39.98))
        fill6Path.addLine(to: CGPoint(x: 129.9, y: 43))
        fill6Path.addLine(to: CGPoint(x: 123.93, y: 43))
        fill6Path.addLine(to: CGPoint(x: 123.93, y: 62.82))
        fill6Path.addCurve(to: CGPoint(x: 124.41, y: 65.59), controlPoint1: CGPoint(x: 123.93, y: 64), controlPoint2: CGPoint(x: 124.09, y: 64.92))
        fill6Path.addCurve(to: CGPoint(x: 126.83, y: 66.7), controlPoint1: CGPoint(x: 124.73, y: 66.25), controlPoint2: CGPoint(x: 125.54, y: 66.62))
        fill6Path.addCurve(to: CGPoint(x: 129.9, y: 66.53), controlPoint1: CGPoint(x: 127.85, y: 66.7), controlPoint2: CGPoint(x: 128.87, y: 66.64))
        fill6Path.addLine(to: CGPoint(x: 129.9, y: 69.55))
        fill6Path.addCurve(to: CGPoint(x: 128.31, y: 69.6), controlPoint1: CGPoint(x: 129.37, y: 69.55), controlPoint2: CGPoint(x: 128.84, y: 69.56))
        fill6Path.addCurve(to: CGPoint(x: 126.71, y: 69.66), controlPoint1: CGPoint(x: 127.77, y: 69.64), controlPoint2: CGPoint(x: 127.24, y: 69.66))
        fill6Path.addCurve(to: CGPoint(x: 121.71, y: 68.26), controlPoint1: CGPoint(x: 124.33, y: 69.66), controlPoint2: CGPoint(x: 122.66, y: 69.2))
        fill6Path.addCurve(to: CGPoint(x: 120.35, y: 63.11), controlPoint1: CGPoint(x: 120.77, y: 67.33), controlPoint2: CGPoint(x: 120.31, y: 65.62))
        fill6Path.addLine(to: CGPoint(x: 120.35, y: 43))
        fill6Path.addLine(to: CGPoint(x: 115.23, y: 43))
        fill6Path.addLine(to: CGPoint(x: 115.23, y: 39.98))
        fill6Path.addLine(to: CGPoint(x: 120.35, y: 39.98))
        fill6Path.addLine(to: CGPoint(x: 120.35, y: 31.15))
        fill6Path.addLine(to: CGPoint(x: 123.93, y: 31.15))
        fill6Path.addLine(to: CGPoint(x: 123.93, y: 39.98))
        fill6Path.addLine(to: CGPoint(x: 129.9, y: 39.98))
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
    func net()->UIImageView{
        //// General Declarations
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 44, height: 20), false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let fillColor = UIColor(red: 0.995, green: 0.995, blue: 0.995, alpha: 1.000)
        
        //// Page-1
        context!.saveGState()
        context!.setAlpha(0.63)
        context!.beginTransparencyLayer(auxiliaryInfo: nil)
        
        
        //// Fill-1 Drawing
        let fill1Path = UIBezierPath()
        fill1Path.move(to: CGPoint(x: 9.05, y: 7.68))
        fill1Path.addLine(to: CGPoint(x: 15.41, y: 16.89))
        fill1Path.addLine(to: CGPoint(x: 15.44, y: 16.89))
        fill1Path.addLine(to: CGPoint(x: 15.44, y: 7.68))
        fill1Path.addLine(to: CGPoint(x: 16.47, y: 7.68))
        fill1Path.addLine(to: CGPoint(x: 16.47, y: 18.57))
        fill1Path.addLine(to: CGPoint(x: 15.31, y: 18.57))
        fill1Path.addLine(to: CGPoint(x: 8.96, y: 9.36))
        fill1Path.addLine(to: CGPoint(x: 8.93, y: 9.36))
        fill1Path.addLine(to: CGPoint(x: 8.93, y: 18.57))
        fill1Path.addLine(to: CGPoint(x: 7.89, y: 18.57))
        fill1Path.addLine(to: CGPoint(x: 7.89, y: 7.68))
        fill1Path.addLine(to: CGPoint(x: 9.05, y: 7.68))
        fill1Path.close()
        fill1Path.miterLimit = 4;
        
        fill1Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill1Path.fill()
        
    
        //// Fill-11 Drawing
        let fill11Path = UIBezierPath()
        fill11Path.move(to: CGPoint(x: 0, y: 10.85))
        fill11Path.addCurve(to: CGPoint(x: 0.27, y: 9.44), controlPoint1: CGPoint(x: 0.01, y: 10.32), controlPoint2: CGPoint(x: 0.1, y: 9.85))
        fill11Path.addCurve(to: CGPoint(x: 0.96, y: 8.35), controlPoint1: CGPoint(x: 0.45, y: 9.04), controlPoint2: CGPoint(x: 0.68, y: 8.67))
        fill11Path.addCurve(to: CGPoint(x: 1.92, y: 7.45), controlPoint1: CGPoint(x: 1.25, y: 8.02), controlPoint2: CGPoint(x: 1.57, y: 7.72))
        fill11Path.addCurve(to: CGPoint(x: 3.02, y: 6.68), controlPoint1: CGPoint(x: 2.28, y: 7.19), controlPoint2: CGPoint(x: 2.65, y: 6.93))
        fill11Path.addCurve(to: CGPoint(x: 4.15, y: 5.91), controlPoint1: CGPoint(x: 3.4, y: 6.43), controlPoint2: CGPoint(x: 3.78, y: 6.17))
        fill11Path.addCurve(to: CGPoint(x: 5.15, y: 5.08), controlPoint1: CGPoint(x: 4.52, y: 5.66), controlPoint2: CGPoint(x: 4.85, y: 5.38))
        fill11Path.addCurve(to: CGPoint(x: 5.81, y: 4.18), controlPoint1: CGPoint(x: 5.44, y: 4.79), controlPoint2: CGPoint(x: 5.66, y: 4.49))
        fill11Path.addCurve(to: CGPoint(x: 6.03, y: 3.07), controlPoint1: CGPoint(x: 5.96, y: 3.87), controlPoint2: CGPoint(x: 6.03, y: 3.5))
        fill11Path.addCurve(to: CGPoint(x: 5.84, y: 2.15), controlPoint1: CGPoint(x: 6.03, y: 2.73), controlPoint2: CGPoint(x: 5.97, y: 2.42))
        fill11Path.addCurve(to: CGPoint(x: 5.32, y: 1.46), controlPoint1: CGPoint(x: 5.71, y: 1.88), controlPoint2: CGPoint(x: 5.54, y: 1.65))
        fill11Path.addCurve(to: CGPoint(x: 4.56, y: 1.04), controlPoint1: CGPoint(x: 5.1, y: 1.27), controlPoint2: CGPoint(x: 4.85, y: 1.13))
        fill11Path.addCurve(to: CGPoint(x: 3.64, y: 0.89), controlPoint1: CGPoint(x: 4.27, y: 0.94), controlPoint2: CGPoint(x: 3.96, y: 0.89))
        fill11Path.addCurve(to: CGPoint(x: 2.51, y: 1.14), controlPoint1: CGPoint(x: 3.2, y: 0.89), controlPoint2: CGPoint(x: 2.82, y: 0.97))
        fill11Path.addCurve(to: CGPoint(x: 1.76, y: 1.79), controlPoint1: CGPoint(x: 2.2, y: 1.3), controlPoint2: CGPoint(x: 1.95, y: 1.52))
        fill11Path.addCurve(to: CGPoint(x: 1.34, y: 2.74), controlPoint1: CGPoint(x: 1.56, y: 2.07), controlPoint2: CGPoint(x: 1.42, y: 2.38))
        fill11Path.addCurve(to: CGPoint(x: 1.22, y: 3.86), controlPoint1: CGPoint(x: 1.25, y: 3.09), controlPoint2: CGPoint(x: 1.21, y: 3.47))
        fill11Path.addLine(to: CGPoint(x: 0.26, y: 3.86))
        fill11Path.addCurve(to: CGPoint(x: 0.45, y: 2.35), controlPoint1: CGPoint(x: 0.25, y: 3.32), controlPoint2: CGPoint(x: 0.31, y: 2.81))
        fill11Path.addCurve(to: CGPoint(x: 1.08, y: 1.15), controlPoint1: CGPoint(x: 0.59, y: 1.88), controlPoint2: CGPoint(x: 0.8, y: 1.49))
        fill11Path.addCurve(to: CGPoint(x: 2.16, y: 0.37), controlPoint1: CGPoint(x: 1.37, y: 0.81), controlPoint2: CGPoint(x: 1.73, y: 0.55))
        fill11Path.addCurve(to: CGPoint(x: 3.68, y: 0.08), controlPoint1: CGPoint(x: 2.59, y: 0.18), controlPoint2: CGPoint(x: 3.1, y: 0.08))
        fill11Path.addCurve(to: CGPoint(x: 4.99, y: 0.27), controlPoint1: CGPoint(x: 4.15, y: 0.08), controlPoint2: CGPoint(x: 4.58, y: 0.15))
        fill11Path.addCurve(to: CGPoint(x: 6.04, y: 0.84), controlPoint1: CGPoint(x: 5.39, y: 0.4), controlPoint2: CGPoint(x: 5.74, y: 0.59))
        fill11Path.addCurve(to: CGPoint(x: 6.74, y: 1.78), controlPoint1: CGPoint(x: 6.34, y: 1.09), controlPoint2: CGPoint(x: 6.58, y: 1.4))
        fill11Path.addCurve(to: CGPoint(x: 7, y: 3.09), controlPoint1: CGPoint(x: 6.91, y: 2.15), controlPoint2: CGPoint(x: 7, y: 2.59))
        fill11Path.addCurve(to: CGPoint(x: 6.77, y: 4.31), controlPoint1: CGPoint(x: 7, y: 3.53), controlPoint2: CGPoint(x: 6.92, y: 3.94))
        fill11Path.addCurve(to: CGPoint(x: 6.18, y: 5.31), controlPoint1: CGPoint(x: 6.63, y: 4.67), controlPoint2: CGPoint(x: 6.43, y: 5.01))
        fill11Path.addCurve(to: CGPoint(x: 5.32, y: 6.16), controlPoint1: CGPoint(x: 5.93, y: 5.62), controlPoint2: CGPoint(x: 5.64, y: 5.9))
        fill11Path.addCurve(to: CGPoint(x: 4.31, y: 6.88), controlPoint1: CGPoint(x: 5, y: 6.42), controlPoint2: CGPoint(x: 4.66, y: 6.66))
        fill11Path.addCurve(to: CGPoint(x: 3.41, y: 7.45), controlPoint1: CGPoint(x: 4.05, y: 7.06), controlPoint2: CGPoint(x: 3.75, y: 7.25))
        fill11Path.addCurve(to: CGPoint(x: 2.41, y: 8.15), controlPoint1: CGPoint(x: 3.06, y: 7.66), controlPoint2: CGPoint(x: 2.73, y: 7.89))
        fill11Path.addCurve(to: CGPoint(x: 1.56, y: 8.98), controlPoint1: CGPoint(x: 2.08, y: 8.4), controlPoint2: CGPoint(x: 1.8, y: 8.68))
        fill11Path.addCurve(to: CGPoint(x: 1.1, y: 9.96), controlPoint1: CGPoint(x: 1.31, y: 9.28), controlPoint2: CGPoint(x: 1.16, y: 9.61))
        fill11Path.addLine(to: CGPoint(x: 7.04, y: 9.96))
        fill11Path.addLine(to: CGPoint(x: 7.04, y: 10.85))
        fill11Path.addLine(to: CGPoint(x: 0, y: 10.85))
        fill11Path.close()
        fill11Path.miterLimit = 4;
        
        fill11Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill11Path.fill()
        
        
        
        
        //// Fill-14 Drawing
        let fill14Path = UIBezierPath()
        fill14Path.move(to: CGPoint(x: 10.56, y: 2.16))
        fill14Path.addCurve(to: CGPoint(x: 11.45, y: 1.91), controlPoint1: CGPoint(x: 10.9, y: 2.13), controlPoint2: CGPoint(x: 11.2, y: 2.04))
        fill14Path.addCurve(to: CGPoint(x: 12.07, y: 1.31), controlPoint1: CGPoint(x: 11.7, y: 1.78), controlPoint2: CGPoint(x: 11.91, y: 1.58))
        fill14Path.addCurve(to: CGPoint(x: 12.43, y: 0.17), controlPoint1: CGPoint(x: 12.24, y: 1.04), controlPoint2: CGPoint(x: 12.36, y: 0.66))
        fill14Path.addLine(to: CGPoint(x: 13.21, y: 0.17))
        fill14Path.addLine(to: CGPoint(x: 13.21, y: 10.85))
        fill14Path.addLine(to: CGPoint(x: 12.25, y: 10.85))
        fill14Path.addLine(to: CGPoint(x: 12.25, y: 2.92))
        fill14Path.addLine(to: CGPoint(x: 9.42, y: 2.92))
        fill14Path.addLine(to: CGPoint(x: 9.42, y: 2.23))
        fill14Path.addCurve(to: CGPoint(x: 10.56, y: 2.16), controlPoint1: CGPoint(x: 9.84, y: 2.22), controlPoint2: CGPoint(x: 10.22, y: 2.2))
        fill14Path.close()
        fill14Path.miterLimit = 4;
        
        fill14Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill14Path.fill()
        
        let fill2Path = UIBezierPath()
        fill2Path.move(to: CGPoint(x: 20.6, y: 11.57))
        fill2Path.addCurve(to: CGPoint(x: 19.74, y: 12.33), controlPoint1: CGPoint(x: 20.25, y: 11.76), controlPoint2: CGPoint(x: 19.96, y: 12.01))
        fill2Path.addCurve(to: CGPoint(x: 19.22, y: 13.4), controlPoint1: CGPoint(x: 19.51, y: 12.65), controlPoint2: CGPoint(x: 19.33, y: 13))
        fill2Path.addCurve(to: CGPoint(x: 19.04, y: 14.63), controlPoint1: CGPoint(x: 19.1, y: 13.81), controlPoint2: CGPoint(x: 19.04, y: 14.22))
        fill2Path.addCurve(to: CGPoint(x: 19.22, y: 15.86), controlPoint1: CGPoint(x: 19.04, y: 15.05), controlPoint2: CGPoint(x: 19.1, y: 15.46))
        fill2Path.addCurve(to: CGPoint(x: 19.74, y: 16.93), controlPoint1: CGPoint(x: 19.33, y: 16.26), controlPoint2: CGPoint(x: 19.51, y: 16.62))
        fill2Path.addCurve(to: CGPoint(x: 20.6, y: 17.7), controlPoint1: CGPoint(x: 19.96, y: 17.25), controlPoint2: CGPoint(x: 20.25, y: 17.5))
        fill2Path.addCurve(to: CGPoint(x: 21.81, y: 17.99), controlPoint1: CGPoint(x: 20.94, y: 17.89), controlPoint2: CGPoint(x: 21.35, y: 17.99))
        fill2Path.addCurve(to: CGPoint(x: 23.01, y: 17.7), controlPoint1: CGPoint(x: 22.26, y: 17.99), controlPoint2: CGPoint(x: 22.67, y: 17.89))
        fill2Path.addCurve(to: CGPoint(x: 23.87, y: 16.93), controlPoint1: CGPoint(x: 23.36, y: 17.5), controlPoint2: CGPoint(x: 23.65, y: 17.25))
        fill2Path.addCurve(to: CGPoint(x: 24.39, y: 15.86), controlPoint1: CGPoint(x: 24.1, y: 16.62), controlPoint2: CGPoint(x: 24.28, y: 16.26))
        fill2Path.addCurve(to: CGPoint(x: 24.57, y: 14.63), controlPoint1: CGPoint(x: 24.51, y: 15.46), controlPoint2: CGPoint(x: 24.57, y: 15.05))
        fill2Path.addCurve(to: CGPoint(x: 24.39, y: 13.4), controlPoint1: CGPoint(x: 24.57, y: 14.22), controlPoint2: CGPoint(x: 24.51, y: 13.81))
        fill2Path.addCurve(to: CGPoint(x: 23.87, y: 12.33), controlPoint1: CGPoint(x: 24.28, y: 13), controlPoint2: CGPoint(x: 24.1, y: 12.65))
        fill2Path.addCurve(to: CGPoint(x: 23.01, y: 11.57), controlPoint1: CGPoint(x: 23.65, y: 12.01), controlPoint2: CGPoint(x: 23.36, y: 11.76))
        fill2Path.addCurve(to: CGPoint(x: 21.81, y: 11.28), controlPoint1: CGPoint(x: 22.67, y: 11.37), controlPoint2: CGPoint(x: 22.26, y: 11.28))
        fill2Path.addCurve(to: CGPoint(x: 20.6, y: 11.57), controlPoint1: CGPoint(x: 21.35, y: 11.28), controlPoint2: CGPoint(x: 20.94, y: 11.37))
        fill2Path.close()
        fill2Path.move(to: CGPoint(x: 23.4, y: 10.81))
        fill2Path.addCurve(to: CGPoint(x: 24.57, y: 11.7), controlPoint1: CGPoint(x: 23.86, y: 11.03), controlPoint2: CGPoint(x: 24.25, y: 11.33))
        fill2Path.addCurve(to: CGPoint(x: 25.29, y: 13.02), controlPoint1: CGPoint(x: 24.89, y: 12.08), controlPoint2: CGPoint(x: 25.12, y: 12.52))
        fill2Path.addCurve(to: CGPoint(x: 25.53, y: 14.63), controlPoint1: CGPoint(x: 25.45, y: 13.53), controlPoint2: CGPoint(x: 25.53, y: 14.06))
        fill2Path.addCurve(to: CGPoint(x: 25.29, y: 16.24), controlPoint1: CGPoint(x: 25.53, y: 15.2), controlPoint2: CGPoint(x: 25.45, y: 15.74))
        fill2Path.addCurve(to: CGPoint(x: 24.57, y: 17.56), controlPoint1: CGPoint(x: 25.12, y: 16.74), controlPoint2: CGPoint(x: 24.89, y: 17.18))
        fill2Path.addCurve(to: CGPoint(x: 23.4, y: 18.45), controlPoint1: CGPoint(x: 24.25, y: 17.94), controlPoint2: CGPoint(x: 23.86, y: 18.23))
        fill2Path.addCurve(to: CGPoint(x: 21.81, y: 18.78), controlPoint1: CGPoint(x: 22.94, y: 18.67), controlPoint2: CGPoint(x: 22.41, y: 18.78))
        fill2Path.addCurve(to: CGPoint(x: 20.21, y: 18.45), controlPoint1: CGPoint(x: 21.2, y: 18.78), controlPoint2: CGPoint(x: 20.67, y: 18.67))
        fill2Path.addCurve(to: CGPoint(x: 19.04, y: 17.56), controlPoint1: CGPoint(x: 19.75, y: 18.23), controlPoint2: CGPoint(x: 19.36, y: 17.94))
        fill2Path.addCurve(to: CGPoint(x: 18.32, y: 16.24), controlPoint1: CGPoint(x: 18.72, y: 17.18), controlPoint2: CGPoint(x: 18.49, y: 16.74))
        fill2Path.addCurve(to: CGPoint(x: 18.08, y: 14.63), controlPoint1: CGPoint(x: 18.16, y: 15.74), controlPoint2: CGPoint(x: 18.08, y: 15.2))
        fill2Path.addCurve(to: CGPoint(x: 18.32, y: 13.02), controlPoint1: CGPoint(x: 18.08, y: 14.06), controlPoint2: CGPoint(x: 18.16, y: 13.53))
        fill2Path.addCurve(to: CGPoint(x: 19.04, y: 11.7), controlPoint1: CGPoint(x: 18.49, y: 12.52), controlPoint2: CGPoint(x: 18.72, y: 12.08))
        fill2Path.addCurve(to: CGPoint(x: 20.21, y: 10.81), controlPoint1: CGPoint(x: 19.36, y: 11.33), controlPoint2: CGPoint(x: 19.75, y: 11.03))
        fill2Path.addCurve(to: CGPoint(x: 21.81, y: 10.47), controlPoint1: CGPoint(x: 20.67, y: 10.58), controlPoint2: CGPoint(x: 21.2, y: 10.47))
        fill2Path.addCurve(to: CGPoint(x: 23.4, y: 10.81), controlPoint1: CGPoint(x: 22.41, y: 10.47), controlPoint2: CGPoint(x: 22.94, y: 10.58))
        fill2Path.close()
        fill2Path.miterLimit = 4;
        
        fill2Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill2Path.fill()
        
        
        //// Fill-4 Drawing
        let fill4Path = UIBezierPath()
        fill4Path.move(to: CGPoint(x: 27.85, y: 10.7))
        fill4Path.addLine(to: CGPoint(x: 27.85, y: 12.54))
        fill4Path.addLine(to: CGPoint(x: 27.88, y: 12.54))
        fill4Path.addCurve(to: CGPoint(x: 29.02, y: 11.06), controlPoint1: CGPoint(x: 28.13, y: 11.9), controlPoint2: CGPoint(x: 28.51, y: 11.41))
        fill4Path.addCurve(to: CGPoint(x: 30.86, y: 10.59), controlPoint1: CGPoint(x: 29.54, y: 10.72), controlPoint2: CGPoint(x: 30.15, y: 10.56))
        fill4Path.addLine(to: CGPoint(x: 30.86, y: 11.55))
        fill4Path.addCurve(to: CGPoint(x: 29.67, y: 11.73), controlPoint1: CGPoint(x: 30.42, y: 11.53), controlPoint2: CGPoint(x: 30.03, y: 11.59))
        fill4Path.addCurve(to: CGPoint(x: 28.75, y: 12.31), controlPoint1: CGPoint(x: 29.31, y: 11.86), controlPoint2: CGPoint(x: 29.01, y: 12.06))
        fill4Path.addCurve(to: CGPoint(x: 28.14, y: 13.22), controlPoint1: CGPoint(x: 28.49, y: 12.57), controlPoint2: CGPoint(x: 28.29, y: 12.87))
        fill4Path.addCurve(to: CGPoint(x: 27.93, y: 14.37), controlPoint1: CGPoint(x: 28, y: 13.57), controlPoint2: CGPoint(x: 27.93, y: 13.96))
        fill4Path.addLine(to: CGPoint(x: 27.93, y: 18.57))
        fill4Path.addLine(to: CGPoint(x: 26.97, y: 18.57))
        fill4Path.addLine(to: CGPoint(x: 26.97, y: 10.7))
        fill4Path.addLine(to: CGPoint(x: 27.85, y: 10.7))
        fill4Path.close()
        fill4Path.miterLimit = 4;
        
        fill4Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill4Path.fill()
        
        
        //// Fill-6 Drawing
        let fill6Path = UIBezierPath()
        fill6Path.move(to: CGPoint(x: 34.91, y: 10.7))
        fill6Path.addLine(to: CGPoint(x: 34.91, y: 11.51))
        fill6Path.addLine(to: CGPoint(x: 33.31, y: 11.51))
        fill6Path.addLine(to: CGPoint(x: 33.31, y: 16.81))
        fill6Path.addCurve(to: CGPoint(x: 33.44, y: 17.55), controlPoint1: CGPoint(x: 33.31, y: 17.13), controlPoint2: CGPoint(x: 33.35, y: 17.37))
        fill6Path.addCurve(to: CGPoint(x: 34.09, y: 17.85), controlPoint1: CGPoint(x: 33.52, y: 17.73), controlPoint2: CGPoint(x: 33.74, y: 17.83))
        fill6Path.addCurve(to: CGPoint(x: 34.91, y: 17.8), controlPoint1: CGPoint(x: 34.36, y: 17.85), controlPoint2: CGPoint(x: 34.63, y: 17.83))
        fill6Path.addLine(to: CGPoint(x: 34.91, y: 18.61))
        fill6Path.addCurve(to: CGPoint(x: 34.48, y: 18.63), controlPoint1: CGPoint(x: 34.77, y: 18.61), controlPoint2: CGPoint(x: 34.62, y: 18.62))
        fill6Path.addCurve(to: CGPoint(x: 34.05, y: 18.64), controlPoint1: CGPoint(x: 34.34, y: 18.64), controlPoint2: CGPoint(x: 34.2, y: 18.64))
        fill6Path.addCurve(to: CGPoint(x: 32.71, y: 18.27), controlPoint1: CGPoint(x: 33.41, y: 18.64), controlPoint2: CGPoint(x: 32.96, y: 18.52))
        fill6Path.addCurve(to: CGPoint(x: 32.34, y: 16.89), controlPoint1: CGPoint(x: 32.46, y: 18.02), controlPoint2: CGPoint(x: 32.33, y: 17.56))
        fill6Path.addLine(to: CGPoint(x: 32.34, y: 11.51))
        fill6Path.addLine(to: CGPoint(x: 30.97, y: 11.51))
        fill6Path.addLine(to: CGPoint(x: 30.97, y: 10.7))
        fill6Path.addLine(to: CGPoint(x: 32.34, y: 10.7))
        fill6Path.addLine(to: CGPoint(x: 32.34, y: 8.34))
        fill6Path.addLine(to: CGPoint(x: 33.31, y: 8.34))
        fill6Path.addLine(to: CGPoint(x: 33.31, y: 10.7))
        fill6Path.addLine(to: CGPoint(x: 34.91, y: 10.7))
        fill6Path.close()
        fill6Path.miterLimit = 4;
        
        fill6Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill6Path.fill()
        let fill8Path = UIBezierPath()
        fill8Path.move(to: CGPoint(x: 37.25, y: 7.68))
        fill8Path.addLine(to: CGPoint(x: 37.25, y: 12.06))
        fill8Path.addLine(to: CGPoint(x: 37.28, y: 12.06))
        fill8Path.addCurve(to: CGPoint(x: 38.25, y: 10.9), controlPoint1: CGPoint(x: 37.46, y: 11.58), controlPoint2: CGPoint(x: 37.79, y: 11.19))
        fill8Path.addCurve(to: CGPoint(x: 39.8, y: 10.47), controlPoint1: CGPoint(x: 38.72, y: 10.61), controlPoint2: CGPoint(x: 39.24, y: 10.47))
        fill8Path.addCurve(to: CGPoint(x: 41.18, y: 10.68), controlPoint1: CGPoint(x: 40.35, y: 10.47), controlPoint2: CGPoint(x: 40.81, y: 10.54))
        fill8Path.addCurve(to: CGPoint(x: 42.07, y: 11.29), controlPoint1: CGPoint(x: 41.55, y: 10.83), controlPoint2: CGPoint(x: 41.85, y: 11.03))
        fill8Path.addCurve(to: CGPoint(x: 42.55, y: 12.24), controlPoint1: CGPoint(x: 42.3, y: 11.54), controlPoint2: CGPoint(x: 42.46, y: 11.86))
        fill8Path.addCurve(to: CGPoint(x: 42.68, y: 13.5), controlPoint1: CGPoint(x: 42.64, y: 12.61), controlPoint2: CGPoint(x: 42.68, y: 13.04))
        fill8Path.addLine(to: CGPoint(x: 42.68, y: 18.57))
        fill8Path.addLine(to: CGPoint(x: 41.72, y: 18.57))
        fill8Path.addLine(to: CGPoint(x: 41.72, y: 13.66))
        fill8Path.addCurve(to: CGPoint(x: 41.63, y: 12.72), controlPoint1: CGPoint(x: 41.72, y: 13.32), controlPoint2: CGPoint(x: 41.69, y: 13.01))
        fill8Path.addCurve(to: CGPoint(x: 41.31, y: 11.96), controlPoint1: CGPoint(x: 41.57, y: 12.43), controlPoint2: CGPoint(x: 41.46, y: 12.18))
        fill8Path.addCurve(to: CGPoint(x: 40.69, y: 11.46), controlPoint1: CGPoint(x: 41.16, y: 11.75), controlPoint2: CGPoint(x: 40.95, y: 11.58))
        fill8Path.addCurve(to: CGPoint(x: 39.72, y: 11.28), controlPoint1: CGPoint(x: 40.43, y: 11.34), controlPoint2: CGPoint(x: 40.11, y: 11.28))
        fill8Path.addCurve(to: CGPoint(x: 38.69, y: 11.48), controlPoint1: CGPoint(x: 39.33, y: 11.28), controlPoint2: CGPoint(x: 38.99, y: 11.35))
        fill8Path.addCurve(to: CGPoint(x: 37.93, y: 12.05), controlPoint1: CGPoint(x: 38.39, y: 11.62), controlPoint2: CGPoint(x: 38.13, y: 11.81))
        fill8Path.addCurve(to: CGPoint(x: 37.44, y: 12.9), controlPoint1: CGPoint(x: 37.72, y: 12.29), controlPoint2: CGPoint(x: 37.55, y: 12.57))
        fill8Path.addCurve(to: CGPoint(x: 37.25, y: 13.98), controlPoint1: CGPoint(x: 37.32, y: 13.23), controlPoint2: CGPoint(x: 37.26, y: 13.59))
        fill8Path.addLine(to: CGPoint(x: 37.25, y: 18.57))
        fill8Path.addLine(to: CGPoint(x: 36.28, y: 18.57))
        fill8Path.addLine(to: CGPoint(x: 36.28, y: 7.68))
        fill8Path.addLine(to: CGPoint(x: 37.25, y: 7.68))
        fill8Path.close()
        fill8Path.miterLimit = 4;
        
        fill8Path.usesEvenOddFillRule = true;
        
        fillColor.setFill()
        fill8Path.fill()
        
        context!.endTransparencyLayer()
        context!.restoreGState()
        
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imageViewtool
    }

}
