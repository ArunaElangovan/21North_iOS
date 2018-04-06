//
//  topViewShapes.swift
//  21North
//
//  Created by Sachin Tomar on 09/10/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation

class topViewShapes{
    func topViewImageView(_ type: String, color: Int)->UIImageView{
        let strokeColor:UIColor!
        if(color == 1){
            strokeColor = UIColor(red: 0.920, green: 0.319, blue: 0.109, alpha: 1.000)
        }
        else{
            strokeColor = UIColor(red: 0.521, green: 0.521, blue: 0.521, alpha: 1.000)
        }
        if(type == "activeCircle"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 52, height: 52), false, 0)
            
            //            let strokeColor = UIColor(red: 0.920, green: 0.319, blue: 0.109, alpha: 1.000)
            
            //// Group-11
            //// Stroke-16 Drawing
            let stroke16Path = UIBezierPath(ovalIn: CGRect(x: 1, y: 1, width: 50, height: 50))
            strokeColor.setStroke()
            stroke16Path.lineWidth = 1
            stroke16Path.stroke()
            
        }
        else if(type == "circle"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 42, height: 42), false, 0)
            //            let strokeColor = UIColor(red: 0.594, green: 0.602, blue: 0.616, alpha: 1.000)
            
            //// Group-4
            //// Stroke-14 Drawing
            let stroke14Path = UIBezierPath(ovalIn: CGRect(x: 1, y: 1, width: 40, height: 40))
            strokeColor.setStroke()
            stroke14Path.lineWidth = 1
            stroke14Path.stroke()
        }
        else if(type == "line"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 16, height: 42), false, 0)
            //            let strokeColor = UIColor(red: 0.521, green: 0.521, blue: 0.521, alpha: 1.000)
            
            //// Line Drawing
            let linePath = UIBezierPath()
            linePath.move(to: CGPoint(x: 0, y: 0))
            linePath.addLine(to: CGPoint(x: 16, y: 0))
            linePath.miterLimit = 1;
            
            linePath.lineCapStyle = .square;
            
            strokeColor.setStroke()
            linePath.lineWidth = 1
            linePath.stroke()
        }
        else if(type == "location"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 40, height: 40), false, 0)
            //            let strokeColor = UIColor(red: 0.594, green: 0.602, blue: 0.616, alpha: 1.000)
            
            //// Group-9
            //// Stroke-18 Drawing
            let stroke18Path = UIBezierPath()
            stroke18Path.move(to: CGPoint(x: 23.51, y: 13.79))
            stroke18Path.addCurve(to: CGPoint(x: 20.96, y: 16.28), controlPoint1: CGPoint(x: 23.49, y: 15.17), controlPoint2: CGPoint(x: 22.41, y: 16.29))
            stroke18Path.addCurve(to: CGPoint(x: 18.46, y: 13.77), controlPoint1: CGPoint(x: 19.57, y: 16.27), controlPoint2: CGPoint(x: 18.5, y: 15.17))
            stroke18Path.addCurve(to: CGPoint(x: 21.05, y: 11.24), controlPoint1: CGPoint(x: 18.48, y: 12.37), controlPoint2: CGPoint(x: 19.57, y: 11.21))
            stroke18Path.addCurve(to: CGPoint(x: 23.51, y: 13.79), controlPoint1: CGPoint(x: 22.39, y: 11.26), controlPoint2: CGPoint(x: 23.53, y: 12.35))
            stroke18Path.addLine(to: CGPoint(x: 23.51, y: 13.79))
            stroke18Path.close()
            stroke18Path.move(to: CGPoint(x: 28.17, y: 12.02))
            stroke18Path.addCurve(to: CGPoint(x: 27.86, y: 10.89), controlPoint1: CGPoint(x: 28.09, y: 11.64), controlPoint2: CGPoint(x: 28, y: 11.26))
            stroke18Path.addCurve(to: CGPoint(x: 27.33, y: 9.71), controlPoint1: CGPoint(x: 27.72, y: 10.49), controlPoint2: CGPoint(x: 27.53, y: 10.1))
            stroke18Path.addCurve(to: CGPoint(x: 26.46, y: 8.5), controlPoint1: CGPoint(x: 27.1, y: 9.27), controlPoint2: CGPoint(x: 26.8, y: 8.87))
            stroke18Path.addCurve(to: CGPoint(x: 25.47, y: 7.61), controlPoint1: CGPoint(x: 26.16, y: 8.18), controlPoint2: CGPoint(x: 25.83, y: 7.87))
            stroke18Path.addCurve(to: CGPoint(x: 24.1, y: 6.83), controlPoint1: CGPoint(x: 25.04, y: 7.3), controlPoint2: CGPoint(x: 24.58, y: 7.04))
            stroke18Path.addCurve(to: CGPoint(x: 22.59, y: 6.36), controlPoint1: CGPoint(x: 23.61, y: 6.62), controlPoint2: CGPoint(x: 23.11, y: 6.46))
            stroke18Path.addCurve(to: CGPoint(x: 21.82, y: 6.25), controlPoint1: CGPoint(x: 22.34, y: 6.31), controlPoint2: CGPoint(x: 22.08, y: 6.29))
            stroke18Path.addCurve(to: CGPoint(x: 21.44, y: 6.2), controlPoint1: CGPoint(x: 21.69, y: 6.23), controlPoint2: CGPoint(x: 21.57, y: 6.22))
            stroke18Path.addLine(to: CGPoint(x: 20.53, y: 6.2))
            stroke18Path.addCurve(to: CGPoint(x: 20.48, y: 6.22), controlPoint1: CGPoint(x: 20.52, y: 6.21), controlPoint2: CGPoint(x: 20.5, y: 6.22))
            stroke18Path.addCurve(to: CGPoint(x: 19.25, y: 6.38), controlPoint1: CGPoint(x: 20.07, y: 6.28), controlPoint2: CGPoint(x: 19.65, y: 6.3))
            stroke18Path.addCurve(to: CGPoint(x: 17.81, y: 6.86), controlPoint1: CGPoint(x: 18.75, y: 6.49), controlPoint2: CGPoint(x: 18.27, y: 6.65))
            stroke18Path.addCurve(to: CGPoint(x: 15.25, y: 8.82), controlPoint1: CGPoint(x: 16.8, y: 7.31), controlPoint2: CGPoint(x: 15.94, y: 7.96))
            stroke18Path.addCurve(to: CGPoint(x: 14.17, y: 10.74), controlPoint1: CGPoint(x: 14.78, y: 9.4), controlPoint2: CGPoint(x: 14.41, y: 10.04))
            stroke18Path.addCurve(to: CGPoint(x: 13.81, y: 12), controlPoint1: CGPoint(x: 14.02, y: 11.15), controlPoint2: CGPoint(x: 13.91, y: 11.58))
            stroke18Path.addCurve(to: CGPoint(x: 13.68, y: 12.77), controlPoint1: CGPoint(x: 13.75, y: 12.25), controlPoint2: CGPoint(x: 13.71, y: 12.51))
            stroke18Path.addCurve(to: CGPoint(x: 13.61, y: 13.64), controlPoint1: CGPoint(x: 13.65, y: 13.06), controlPoint2: CGPoint(x: 13.62, y: 13.35))
            stroke18Path.addCurve(to: CGPoint(x: 13.72, y: 14.99), controlPoint1: CGPoint(x: 13.58, y: 14.09), controlPoint2: CGPoint(x: 13.61, y: 14.55))
            stroke18Path.addCurve(to: CGPoint(x: 14.09, y: 16.29), controlPoint1: CGPoint(x: 13.82, y: 15.43), controlPoint2: CGPoint(x: 13.94, y: 15.86))
            stroke18Path.addCurve(to: CGPoint(x: 14.85, y: 18.19), controlPoint1: CGPoint(x: 14.32, y: 16.93), controlPoint2: CGPoint(x: 14.57, y: 17.57))
            stroke18Path.addCurve(to: CGPoint(x: 15.88, y: 20.35), controlPoint1: CGPoint(x: 15.17, y: 18.92), controlPoint2: CGPoint(x: 15.53, y: 19.63))
            stroke18Path.addCurve(to: CGPoint(x: 16.64, y: 21.79), controlPoint1: CGPoint(x: 16.13, y: 20.83), controlPoint2: CGPoint(x: 16.38, y: 21.31))
            stroke18Path.addCurve(to: CGPoint(x: 17.69, y: 23.67), controlPoint1: CGPoint(x: 16.98, y: 22.42), controlPoint2: CGPoint(x: 17.33, y: 23.05))
            stroke18Path.addCurve(to: CGPoint(x: 18.46, y: 25.03), controlPoint1: CGPoint(x: 17.94, y: 24.13), controlPoint2: CGPoint(x: 18.2, y: 24.58))
            stroke18Path.addCurve(to: CGPoint(x: 19.62, y: 26.93), controlPoint1: CGPoint(x: 18.84, y: 25.66), controlPoint2: CGPoint(x: 19.23, y: 26.3))
            stroke18Path.addCurve(to: CGPoint(x: 20.93, y: 29.02), controlPoint1: CGPoint(x: 20.05, y: 27.63), controlPoint2: CGPoint(x: 20.49, y: 28.32))
            stroke18Path.addCurve(to: CGPoint(x: 21.05, y: 29.02), controlPoint1: CGPoint(x: 20.97, y: 29.09), controlPoint2: CGPoint(x: 21.01, y: 29.08))
            stroke18Path.addCurve(to: CGPoint(x: 21.82, y: 27.8), controlPoint1: CGPoint(x: 21.31, y: 28.61), controlPoint2: CGPoint(x: 21.57, y: 28.21))
            stroke18Path.addCurve(to: CGPoint(x: 22.89, y: 26.06), controlPoint1: CGPoint(x: 22.18, y: 27.22), controlPoint2: CGPoint(x: 22.53, y: 26.64))
            stroke18Path.addCurve(to: CGPoint(x: 23.6, y: 24.87), controlPoint1: CGPoint(x: 23.13, y: 25.67), controlPoint2: CGPoint(x: 23.37, y: 25.27))
            stroke18Path.addCurve(to: CGPoint(x: 24.43, y: 23.41), controlPoint1: CGPoint(x: 23.88, y: 24.39), controlPoint2: CGPoint(x: 24.16, y: 23.9))
            stroke18Path.addCurve(to: CGPoint(x: 25.25, y: 21.96), controlPoint1: CGPoint(x: 24.71, y: 22.93), controlPoint2: CGPoint(x: 24.98, y: 22.45))
            stroke18Path.addCurve(to: CGPoint(x: 25.75, y: 21), controlPoint1: CGPoint(x: 25.42, y: 21.64), controlPoint2: CGPoint(x: 25.59, y: 21.32))
            stroke18Path.addCurve(to: CGPoint(x: 26.77, y: 18.97), controlPoint1: CGPoint(x: 26.1, y: 20.32), controlPoint2: CGPoint(x: 26.45, y: 19.66))
            stroke18Path.addCurve(to: CGPoint(x: 27.67, y: 16.88), controlPoint1: CGPoint(x: 27.09, y: 18.28), controlPoint2: CGPoint(x: 27.38, y: 17.58))
            stroke18Path.addCurve(to: CGPoint(x: 28.08, y: 15.7), controlPoint1: CGPoint(x: 27.83, y: 16.49), controlPoint2: CGPoint(x: 27.96, y: 16.1))
            stroke18Path.addCurve(to: CGPoint(x: 28.37, y: 14.2), controlPoint1: CGPoint(x: 28.23, y: 15.21), controlPoint2: CGPoint(x: 28.35, y: 14.71))
            stroke18Path.addCurve(to: CGPoint(x: 28.34, y: 13.16), controlPoint1: CGPoint(x: 28.38, y: 13.85), controlPoint2: CGPoint(x: 28.37, y: 13.51))
            stroke18Path.addCurve(to: CGPoint(x: 28.17, y: 12.02), controlPoint1: CGPoint(x: 28.31, y: 12.78), controlPoint2: CGPoint(x: 28.25, y: 12.4))
            stroke18Path.close()
            stroke18Path.miterLimit = 4;
            
            stroke18Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke18Path.lineWidth = 1
            stroke18Path.stroke()
        }
        else if(type == "car"){
            
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 40, height: 40), false, 0)
            
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
        else if(type == "driver"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 40, height: 40), false, 0)
            //            let strokeColor = UIColor(red: 0.594, green: 0.602, blue: 0.616, alpha: 1.000)
            
            //// Group-10
            //// Stroke-24 Drawing
            let stroke24Path = UIBezierPath()
            stroke24Path.move(to: CGPoint(x: 17.82, y: 21.32))
            stroke24Path.addCurve(to: CGPoint(x: 14.41, y: 26.1), controlPoint1: CGPoint(x: 16.6, y: 23.02), controlPoint2: CGPoint(x: 15.48, y: 24.6))
            stroke24Path.addCurve(to: CGPoint(x: 13.64, y: 25.42), controlPoint1: CGPoint(x: 14.12, y: 25.83), controlPoint2: CGPoint(x: 13.91, y: 25.48))
            stroke24Path.addCurve(to: CGPoint(x: 11.98, y: 26.69), controlPoint1: CGPoint(x: 12.64, y: 25.19), controlPoint2: CGPoint(x: 12.6, y: 26.35))
            stroke24Path.addCurve(to: CGPoint(x: 11.88, y: 26.55), controlPoint1: CGPoint(x: 11.93, y: 26.63), controlPoint2: CGPoint(x: 11.89, y: 26.59))
            stroke24Path.addCurve(to: CGPoint(x: 10.26, y: 15.55), controlPoint1: CGPoint(x: 11.34, y: 22.89), controlPoint2: CGPoint(x: 10.8, y: 19.22))
            stroke24Path.addCurve(to: CGPoint(x: 8.85, y: 14.37), controlPoint1: CGPoint(x: 10.11, y: 14.58), controlPoint2: CGPoint(x: 9.65, y: 14.21))
            stroke24Path.addCurve(to: CGPoint(x: 8.09, y: 15.96), controlPoint1: CGPoint(x: 8.23, y: 14.49), controlPoint2: CGPoint(x: 7.96, y: 15.1))
            stroke24Path.addCurve(to: CGPoint(x: 8.92, y: 21.5), controlPoint1: CGPoint(x: 8.38, y: 17.81), controlPoint2: CGPoint(x: 8.65, y: 19.65))
            stroke24Path.addCurve(to: CGPoint(x: 10, y: 28.86), controlPoint1: CGPoint(x: 9.28, y: 23.96), controlPoint2: CGPoint(x: 9.63, y: 26.41))
            stroke24Path.addCurve(to: CGPoint(x: 11.28, y: 30.09), controlPoint1: CGPoint(x: 10.14, y: 29.78), controlPoint2: CGPoint(x: 10.46, y: 30.09))
            stroke24Path.addCurve(to: CGPoint(x: 21.84, y: 30.09), controlPoint1: CGPoint(x: 14.8, y: 30.11), controlPoint2: CGPoint(x: 18.32, y: 30.11))
            stroke24Path.addCurve(to: CGPoint(x: 22.69, y: 29.77), controlPoint1: CGPoint(x: 22.13, y: 30.08), controlPoint2: CGPoint(x: 22.55, y: 29.98))
            stroke24Path.addCurve(to: CGPoint(x: 22.98, y: 28.65), controlPoint1: CGPoint(x: 22.9, y: 29.47), controlPoint2: CGPoint(x: 23.04, y: 29.01))
            stroke24Path.addCurve(to: CGPoint(x: 21.86, y: 27.9), controlPoint1: CGPoint(x: 22.88, y: 28.11), controlPoint2: CGPoint(x: 22.41, y: 27.9))
            stroke24Path.addCurve(to: CGPoint(x: 14.25, y: 27.91), controlPoint1: CGPoint(x: 19.32, y: 27.91), controlPoint2: CGPoint(x: 16.79, y: 27.91))
            stroke24Path.addLine(to: CGPoint(x: 13.15, y: 27.91))
            stroke24Path.addCurve(to: CGPoint(x: 13.92, y: 26.85), controlPoint1: CGPoint(x: 13.52, y: 27.4), controlPoint2: CGPoint(x: 13.79, y: 27.03))
            stroke24Path.addCurve(to: CGPoint(x: 16.64, y: 27.17), controlPoint1: CGPoint(x: 14.93, y: 26.97), controlPoint2: CGPoint(x: 15.78, y: 27.16))
            stroke24Path.addCurve(to: CGPoint(x: 22.84, y: 27.18), controlPoint1: CGPoint(x: 18.7, y: 27.22), controlPoint2: CGPoint(x: 20.77, y: 27.2))
            stroke24Path.addCurve(to: CGPoint(x: 23.89, y: 27.68), controlPoint1: CGPoint(x: 23.3, y: 27.18), controlPoint2: CGPoint(x: 23.6, y: 27.29))
            stroke24Path.addCurve(to: CGPoint(x: 27.76, y: 32.89), controlPoint1: CGPoint(x: 25.16, y: 29.43), controlPoint2: CGPoint(x: 26.45, y: 31.17))
            stroke24Path.addCurve(to: CGPoint(x: 30.51, y: 33.29), controlPoint1: CGPoint(x: 28.46, y: 33.81), controlPoint2: CGPoint(x: 29.63, y: 33.95))
            stroke24Path.addCurve(to: CGPoint(x: 30.92, y: 30.59), controlPoint1: CGPoint(x: 31.35, y: 32.66), controlPoint2: CGPoint(x: 31.56, y: 31.47))
            stroke24Path.addCurve(to: CGPoint(x: 26.08, y: 24.07), controlPoint1: CGPoint(x: 29.33, y: 28.4), controlPoint2: CGPoint(x: 27.7, y: 26.24))
            stroke24Path.addCurve(to: CGPoint(x: 24.3, y: 23.22), controlPoint1: CGPoint(x: 25.64, y: 23.48), controlPoint2: CGPoint(x: 25.05, y: 23.21))
            stroke24Path.addCurve(to: CGPoint(x: 20.01, y: 23.23), controlPoint1: CGPoint(x: 22.87, y: 23.25), controlPoint2: CGPoint(x: 21.44, y: 23.23))
            stroke24Path.addCurve(to: CGPoint(x: 17.82, y: 21.32), controlPoint1: CGPoint(x: 18.25, y: 23.23), controlPoint2: CGPoint(x: 18.25, y: 23.23))
            stroke24Path.addLine(to: CGPoint(x: 17.82, y: 21.32))
            stroke24Path.close()
            stroke24Path.miterLimit = 4;
            
            stroke24Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke24Path.lineWidth = 1
            stroke24Path.stroke()
            
            
            //// Stroke-26 Drawing
            let stroke26Path = UIBezierPath()
            stroke26Path.move(to: CGPoint(x: 13.31, y: 25.18))
            stroke26Path.addCurve(to: CGPoint(x: 17.77, y: 18.82), controlPoint1: CGPoint(x: 14.86, y: 22.99), controlPoint2: CGPoint(x: 16.35, y: 20.93))
            stroke26Path.addCurve(to: CGPoint(x: 17.14, y: 17.64), controlPoint1: CGPoint(x: 18.15, y: 18.26), controlPoint2: CGPoint(x: 17.8, y: 17.77))
            stroke26Path.addCurve(to: CGPoint(x: 15, y: 17.11), controlPoint1: CGPoint(x: 16.42, y: 17.49), controlPoint2: CGPoint(x: 15.7, y: 17.32))
            stroke26Path.addCurve(to: CGPoint(x: 13.86, y: 15.12), controlPoint1: CGPoint(x: 14.03, y: 16.81), controlPoint2: CGPoint(x: 13.59, y: 16))
            stroke26Path.addCurve(to: CGPoint(x: 15.88, y: 14.13), controlPoint1: CGPoint(x: 14.11, y: 14.29), controlPoint2: CGPoint(x: 14.94, y: 13.89))
            stroke26Path.addCurve(to: CGPoint(x: 17.38, y: 14.53), controlPoint1: CGPoint(x: 16.37, y: 14.26), controlPoint2: CGPoint(x: 16.86, y: 14.39))
            stroke26Path.addCurve(to: CGPoint(x: 14.91, y: 12.82), controlPoint1: CGPoint(x: 17.12, y: 13.29), controlPoint2: CGPoint(x: 16.02, y: 12.55))
            stroke26Path.addCurve(to: CGPoint(x: 12.26, y: 15.58), controlPoint1: CGPoint(x: 13.45, y: 13.18), controlPoint2: CGPoint(x: 12.59, y: 14.16))
            stroke26Path.addCurve(to: CGPoint(x: 12.01, y: 17.84), controlPoint1: CGPoint(x: 12.08, y: 16.31), controlPoint2: CGPoint(x: 12.05, y: 17.09))
            stroke26Path.addCurve(to: CGPoint(x: 13.31, y: 25.18), controlPoint1: CGPoint(x: 11.86, y: 20.34), controlPoint2: CGPoint(x: 12.36, y: 22.71))
            stroke26Path.addLine(to: CGPoint(x: 13.31, y: 25.18))
            stroke26Path.close()
            stroke26Path.miterLimit = 4;
            
            stroke26Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke26Path.lineWidth = 1
            stroke26Path.stroke()
            
            
            //// Stroke-28 Drawing
            let stroke28Path = UIBezierPath()
            stroke28Path.move(to: CGPoint(x: 34.49, y: 31.4))
            stroke28Path.addCurve(to: CGPoint(x: 33.97, y: 30.81), controlPoint1: CGPoint(x: 34.35, y: 31.22), controlPoint2: CGPoint(x: 34.18, y: 30.84))
            stroke28Path.addCurve(to: CGPoint(x: 33.05, y: 31.13), controlPoint1: CGPoint(x: 33.67, y: 30.77), controlPoint2: CGPoint(x: 33.2, y: 30.9))
            stroke28Path.addCurve(to: CGPoint(x: 31.04, y: 34.31), controlPoint1: CGPoint(x: 32.33, y: 32.16), controlPoint2: CGPoint(x: 31.7, y: 33.25))
            stroke28Path.addCurve(to: CGPoint(x: 31.17, y: 35.52), controlPoint1: CGPoint(x: 30.76, y: 34.76), controlPoint2: CGPoint(x: 30.65, y: 35.2))
            stroke28Path.addCurve(to: CGPoint(x: 32.32, y: 35.11), controlPoint1: CGPoint(x: 31.69, y: 35.85), controlPoint2: CGPoint(x: 32.03, y: 35.54))
            stroke28Path.addCurve(to: CGPoint(x: 33.88, y: 32.81), controlPoint1: CGPoint(x: 32.84, y: 34.34), controlPoint2: CGPoint(x: 33.39, y: 33.59))
            stroke28Path.addCurve(to: CGPoint(x: 34.49, y: 31.4), controlPoint1: CGPoint(x: 34.12, y: 32.42), controlPoint2: CGPoint(x: 34.25, y: 31.97))
            stroke28Path.addLine(to: CGPoint(x: 34.49, y: 31.4))
            stroke28Path.close()
            stroke28Path.miterLimit = 4;
            
            stroke28Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke28Path.lineWidth = 1
            stroke28Path.stroke()
            
            
            //// Stroke-30 Drawing
            let stroke30Path = UIBezierPath()
            stroke30Path.move(to: CGPoint(x: 13.55, y: 13.05))
            stroke30Path.addCurve(to: CGPoint(x: 10.7, y: 11.24), controlPoint1: CGPoint(x: 12.6, y: 12.43), controlPoint2: CGPoint(x: 11.68, y: 11.78))
            stroke30Path.addCurve(to: CGPoint(x: 9.72, y: 11.5), controlPoint1: CGPoint(x: 10.47, y: 11.11), controlPoint2: CGPoint(x: 9.91, y: 11.28))
            stroke30Path.addCurve(to: CGPoint(x: 9.8, y: 12.44), controlPoint1: CGPoint(x: 9.56, y: 11.67), controlPoint2: CGPoint(x: 9.62, y: 12.3))
            stroke30Path.addCurve(to: CGPoint(x: 12.24, y: 14.12), controlPoint1: CGPoint(x: 10.64, y: 13.1), controlPoint2: CGPoint(x: 11.56, y: 13.66))
            stroke30Path.addCurve(to: CGPoint(x: 13.55, y: 13.05), controlPoint1: CGPoint(x: 12.74, y: 13.71), controlPoint2: CGPoint(x: 13.11, y: 13.4))
            stroke30Path.addLine(to: CGPoint(x: 13.55, y: 13.05))
            stroke30Path.close()
            stroke30Path.miterLimit = 4;
            
            stroke30Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke30Path.lineWidth = 1
            stroke30Path.stroke()
            
            
            //// Stroke-32 Drawing
            let stroke32Path = UIBezierPath()
            stroke32Path.move(to: CGPoint(x: 25.31, y: 13.73))
            stroke32Path.addCurve(to: CGPoint(x: 27.22, y: 14.42), controlPoint1: CGPoint(x: 26.06, y: 14), controlPoint2: CGPoint(x: 26.57, y: 14.19))
            stroke32Path.addCurve(to: CGPoint(x: 27.18, y: 13.12), controlPoint1: CGPoint(x: 27.22, y: 13.97), controlPoint2: CGPoint(x: 27.32, y: 13.5))
            stroke32Path.addCurve(to: CGPoint(x: 26.33, y: 12.79), controlPoint1: CGPoint(x: 27.1, y: 12.92), controlPoint2: CGPoint(x: 26.53, y: 12.69))
            stroke32Path.addCurve(to: CGPoint(x: 25.31, y: 13.73), controlPoint1: CGPoint(x: 25.95, y: 12.98), controlPoint2: CGPoint(x: 25.67, y: 13.38))
            stroke32Path.addLine(to: CGPoint(x: 25.31, y: 13.73))
            stroke32Path.close()
            stroke32Path.miterLimit = 4;
            
            stroke32Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke32Path.lineWidth = 1
            stroke32Path.stroke()
            
            //// Stroke-34 Drawing
            let stroke34Path = UIBezierPath(ovalIn: CGRect(x: 14.3, y: 4.95, width: 7.1, height: 7))
            strokeColor.setStroke()
            stroke34Path.lineWidth = 1
            stroke34Path.stroke()
            
            
            //// Stroke-38 Drawing
            let stroke38Path = UIBezierPath()
            stroke38Path.move(to: CGPoint(x: 20.66, y: 17.9))
            stroke38Path.addCurve(to: CGPoint(x: 15.49, y: 16.96), controlPoint1: CGPoint(x: 19.15, y: 17.63), controlPoint2: CGPoint(x: 17.31, y: 17.34))
            stroke38Path.addCurve(to: CGPoint(x: 14.41, y: 15.29), controlPoint1: CGPoint(x: 14.55, y: 16.77), controlPoint2: CGPoint(x: 14.16, y: 16.06))
            stroke38Path.addCurve(to: CGPoint(x: 16.22, y: 14.56), controlPoint1: CGPoint(x: 14.64, y: 14.56), controlPoint2: CGPoint(x: 15.29, y: 14.31))
            stroke38Path.addCurve(to: CGPoint(x: 25.93, y: 14.43), controlPoint1: CGPoint(x: 19.47, y: 15.46), controlPoint2: CGPoint(x: 22.71, y: 15.56))
            stroke38Path.addCurve(to: CGPoint(x: 27.62, y: 15.15), controlPoint1: CGPoint(x: 26.7, y: 14.16), controlPoint2: CGPoint(x: 27.36, y: 14.46))
            stroke38Path.addCurve(to: CGPoint(x: 26.79, y: 16.8), controlPoint1: CGPoint(x: 27.88, y: 15.83), controlPoint2: CGPoint(x: 27.56, y: 16.52))
            stroke38Path.addCurve(to: CGPoint(x: 24.67, y: 17.4), controlPoint1: CGPoint(x: 26.1, y: 17.05), controlPoint2: CGPoint(x: 25.4, y: 17.28))
            stroke38Path.addCurve(to: CGPoint(x: 20.66, y: 17.9), controlPoint1: CGPoint(x: 23.47, y: 17.6), controlPoint2: CGPoint(x: 22.24, y: 17.71))
            stroke38Path.addLine(to: CGPoint(x: 20.66, y: 17.9))
            stroke38Path.close()
            stroke38Path.miterLimit = 4;
            
            stroke38Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke38Path.lineWidth = 1
            stroke38Path.stroke()
            
            
            //// Stroke-40 Drawing
            let stroke40Path = UIBezierPath()
            stroke40Path.move(to: CGPoint(x: 34.63, y: 20.01))
            stroke40Path.addCurve(to: CGPoint(x: 34.07, y: 21.25), controlPoint1: CGPoint(x: 34.44, y: 20.42), controlPoint2: CGPoint(x: 34.28, y: 20.8))
            stroke40Path.addCurve(to: CGPoint(x: 25.71, y: 17.55), controlPoint1: CGPoint(x: 31.29, y: 20.02), controlPoint2: CGPoint(x: 28.54, y: 18.8))
            stroke40Path.addCurve(to: CGPoint(x: 24.75, y: 19.71), controlPoint1: CGPoint(x: 25.38, y: 18.3), controlPoint2: CGPoint(x: 25.05, y: 19))
            stroke40Path.addCurve(to: CGPoint(x: 23.5, y: 20.41), controlPoint1: CGPoint(x: 24.51, y: 20.28), controlPoint2: CGPoint(x: 24.14, y: 20.63))
            stroke40Path.addCurve(to: CGPoint(x: 23.12, y: 18.97), controlPoint1: CGPoint(x: 22.94, y: 20.22), controlPoint2: CGPoint(x: 22.82, y: 19.69))
            stroke40Path.addCurve(to: CGPoint(x: 23.35, y: 18.43), controlPoint1: CGPoint(x: 23.19, y: 18.79), controlPoint2: CGPoint(x: 23.3, y: 18.62))
            stroke40Path.addCurve(to: CGPoint(x: 24.64, y: 17.36), controlPoint1: CGPoint(x: 23.52, y: 17.75), controlPoint2: CGPoint(x: 23.96, y: 17.46))
            stroke40Path.addCurve(to: CGPoint(x: 26.19, y: 16.89), controlPoint1: CGPoint(x: 25.17, y: 17.29), controlPoint2: CGPoint(x: 25.73, y: 17.15))
            stroke40Path.addCurve(to: CGPoint(x: 27.83, y: 16.94), controlPoint1: CGPoint(x: 26.79, y: 16.55), controlPoint2: CGPoint(x: 27.27, y: 16.69))
            stroke40Path.addCurve(to: CGPoint(x: 34.02, y: 19.71), controlPoint1: CGPoint(x: 29.89, y: 17.89), controlPoint2: CGPoint(x: 31.96, y: 18.79))
            stroke40Path.addCurve(to: CGPoint(x: 34.63, y: 20.01), controlPoint1: CGPoint(x: 34.22, y: 19.8), controlPoint2: CGPoint(x: 34.41, y: 19.9))
            stroke40Path.addLine(to: CGPoint(x: 34.63, y: 20.01))
            stroke40Path.close()
            stroke40Path.miterLimit = 4;
            
            stroke40Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke40Path.lineWidth = 1
            stroke40Path.stroke()
            
        }
        else if(type == "service"){
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 40, height: 40), false, 0)
            //            let strokeColor = UIColor(red: 0.594, green: 0.602, blue: 0.616, alpha: 1.000)
            
            //// Stroke-46 Drawing
            let stroke46Path = UIBezierPath()
            stroke46Path.move(to: CGPoint(x: 26.45, y: 14.98))
            stroke46Path.addCurve(to: CGPoint(x: 25.09, y: 14.9), controlPoint1: CGPoint(x: 25.99, y: 14.91), controlPoint2: CGPoint(x: 25.57, y: 15.53))
            stroke46Path.addCurve(to: CGPoint(x: 25.82, y: 14.53), controlPoint1: CGPoint(x: 25.36, y: 14.76), controlPoint2: CGPoint(x: 25.61, y: 14.68))
            stroke46Path.addCurve(to: CGPoint(x: 26.12, y: 14.09), controlPoint1: CGPoint(x: 25.96, y: 14.43), controlPoint2: CGPoint(x: 26.11, y: 14.25))
            stroke46Path.addCurve(to: CGPoint(x: 27.84, y: 12.5), controlPoint1: CGPoint(x: 26.23, y: 13.15), controlPoint2: CGPoint(x: 26.86, y: 12.55))
            stroke46Path.addCurve(to: CGPoint(x: 29.59, y: 13.93), controlPoint1: CGPoint(x: 28.76, y: 12.45), controlPoint2: CGPoint(x: 29.37, y: 12.99))
            stroke46Path.addCurve(to: CGPoint(x: 28.22, y: 16.14), controlPoint1: CGPoint(x: 29.91, y: 15.23), controlPoint2: CGPoint(x: 29.07, y: 16.04))
            stroke46Path.addCurve(to: CGPoint(x: 26.45, y: 14.98), controlPoint1: CGPoint(x: 27.48, y: 16.23), controlPoint2: CGPoint(x: 26.85, y: 15.83))
            stroke46Path.addLine(to: CGPoint(x: 26.45, y: 14.98))
            stroke46Path.close()
            stroke46Path.miterLimit = 4;
            
            strokeColor.setStroke()
            stroke46Path.lineWidth = 1
            stroke46Path.stroke()
            
            
            //// Oval Drawing
            let ovalPath = UIBezierPath(ovalIn: CGRect(x: 15, y: 24.3, width: 5.7, height: 5.6))
            strokeColor.setStroke()
            ovalPath.lineWidth = 1
            ovalPath.stroke()
            
            
            //// Bezier 2 Drawing
            let bezier2Path = UIBezierPath()
            bezier2Path.move(to: CGPoint(x: 33.58, y: 31))
            bezier2Path.addLine(to: CGPoint(x: 33.58, y: 31))
            bezier2Path.addCurve(to: CGPoint(x: 33.78, y: 29.92), controlPoint1: CGPoint(x: 33.65, y: 30.62), controlPoint2: CGPoint(x: 33.81, y: 30.25))
            bezier2Path.addCurve(to: CGPoint(x: 33.33, y: 26.81), controlPoint1: CGPoint(x: 33.67, y: 28.88), controlPoint2: CGPoint(x: 33.45, y: 27.85))
            bezier2Path.addCurve(to: CGPoint(x: 33.22, y: 24.56), controlPoint1: CGPoint(x: 33.24, y: 26.07), controlPoint2: CGPoint(x: 33.18, y: 25.31))
            bezier2Path.addCurve(to: CGPoint(x: 33.54, y: 22.84), controlPoint1: CGPoint(x: 33.24, y: 23.99), controlPoint2: CGPoint(x: 33.41, y: 23.41))
            bezier2Path.addCurve(to: CGPoint(x: 33.13, y: 19.85), controlPoint1: CGPoint(x: 33.78, y: 21.79), controlPoint2: CGPoint(x: 33.67, y: 20.8))
            bezier2Path.addCurve(to: CGPoint(x: 31.7, y: 17.1), controlPoint1: CGPoint(x: 32.62, y: 18.95), controlPoint2: CGPoint(x: 32.18, y: 18.02))
            bezier2Path.addCurve(to: CGPoint(x: 28.69, y: 16.5), controlPoint1: CGPoint(x: 31.03, y: 15.8), controlPoint2: CGPoint(x: 29.81, y: 15.54))
            bezier2Path.addCurve(to: CGPoint(x: 26.38, y: 18.52), controlPoint1: CGPoint(x: 27.91, y: 17.16), controlPoint2: CGPoint(x: 27.15, y: 17.85))
            bezier2Path.addCurve(to: CGPoint(x: 26.04, y: 18.76), controlPoint1: CGPoint(x: 26.28, y: 18.62), controlPoint2: CGPoint(x: 26.15, y: 18.77))
            bezier2Path.addCurve(to: CGPoint(x: 23.92, y: 18.67), controlPoint1: CGPoint(x: 25.33, y: 18.75), controlPoint2: CGPoint(x: 24.63, y: 18.7))
            bezier2Path.addCurve(to: CGPoint(x: 24.53, y: 18.01), controlPoint1: CGPoint(x: 24.01, y: 18.26), controlPoint2: CGPoint(x: 24.24, y: 18.12))
            bezier2Path.addCurve(to: CGPoint(x: 24.9, y: 16.65), controlPoint1: CGPoint(x: 25.03, y: 17.83), controlPoint2: CGPoint(x: 25.22, y: 17.12))
            bezier2Path.addCurve(to: CGPoint(x: 24.46, y: 17.37), controlPoint1: CGPoint(x: 24.75, y: 16.89), controlPoint2: CGPoint(x: 24.61, y: 17.12))
            bezier2Path.addCurve(to: CGPoint(x: 23.77, y: 16.98), controlPoint1: CGPoint(x: 24.22, y: 17.23), controlPoint2: CGPoint(x: 24, y: 17.11))
            bezier2Path.addCurve(to: CGPoint(x: 23.99, y: 16.57), controlPoint1: CGPoint(x: 23.86, y: 16.82), controlPoint2: CGPoint(x: 23.92, y: 16.7))
            bezier2Path.addCurve(to: CGPoint(x: 24.18, y: 16.16), controlPoint1: CGPoint(x: 24.05, y: 16.45), controlPoint2: CGPoint(x: 24.1, y: 16.33))
            bezier2Path.addCurve(to: CGPoint(x: 23.23, y: 17.49), controlPoint1: CGPoint(x: 23.33, y: 16.43), controlPoint2: CGPoint(x: 23.15, y: 16.72))
            bezier2Path.addCurve(to: CGPoint(x: 23.12, y: 17.93), controlPoint1: CGPoint(x: 23.25, y: 17.63), controlPoint2: CGPoint(x: 23.19, y: 17.8))
            bezier2Path.addCurve(to: CGPoint(x: 22.04, y: 19.88), controlPoint1: CGPoint(x: 22.77, y: 18.58), controlPoint2: CGPoint(x: 22.39, y: 19.22))
            bezier2Path.addLine(to: CGPoint(x: 23.29, y: 20.23))
            bezier2Path.addCurve(to: CGPoint(x: 25.7, y: 20.56), controlPoint1: CGPoint(x: 24.1, y: 20.32), controlPoint2: CGPoint(x: 24.9, y: 20.43))
            bezier2Path.addCurve(to: CGPoint(x: 27.28, y: 20.23), controlPoint1: CGPoint(x: 26.27, y: 20.65), controlPoint2: CGPoint(x: 26.79, y: 20.58))
            bezier2Path.addCurve(to: CGPoint(x: 28.94, y: 19.15), controlPoint1: CGPoint(x: 27.81, y: 19.86), controlPoint2: CGPoint(x: 28.37, y: 19.53))
            bezier2Path.addCurve(to: CGPoint(x: 30.6, y: 21.56), controlPoint1: CGPoint(x: 29.5, y: 19.97), controlPoint2: CGPoint(x: 30.03, y: 20.78))
            bezier2Path.addCurve(to: CGPoint(x: 31.04, y: 23.03), controlPoint1: CGPoint(x: 30.93, y: 22.01), controlPoint2: CGPoint(x: 31.1, y: 22.47))
            bezier2Path.addCurve(to: CGPoint(x: 30.94, y: 25.21), controlPoint1: CGPoint(x: 30.97, y: 23.76), controlPoint2: CGPoint(x: 30.91, y: 24.49))
            bezier2Path.addCurve(to: CGPoint(x: 31.18, y: 27.26), controlPoint1: CGPoint(x: 30.96, y: 25.9), controlPoint2: CGPoint(x: 31.08, y: 26.58))
            bezier2Path.addCurve(to: CGPoint(x: 31.66, y: 29.96), controlPoint1: CGPoint(x: 31.33, y: 28.16), controlPoint2: CGPoint(x: 31.49, y: 29.06))
            bezier2Path.addCurve(to: CGPoint(x: 31.98, y: 30.98), controlPoint1: CGPoint(x: 31.73, y: 30.3), controlPoint2: CGPoint(x: 31.87, y: 30.63))
            bezier2Path.addLine(to: CGPoint(x: 33.58, y: 31))
            bezier2Path.close()
            bezier2Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier2Path.lineWidth = 1
            bezier2Path.stroke()
            
            let bezier3Path = UIBezierPath()
            bezier3Path.move(to: CGPoint(x: 31.81, y: 30.99))
            bezier3Path.addCurve(to: CGPoint(x: 29.07, y: 31.02), controlPoint1: CGPoint(x: 30.93, y: 31), controlPoint2: CGPoint(x: 30.01, y: 31.01))
            bezier3Path.addLine(to: CGPoint(x: 29.07, y: 31.02))
            bezier3Path.addCurve(to: CGPoint(x: 29.55, y: 27.9), controlPoint1: CGPoint(x: 29.5, y: 30.01), controlPoint2: CGPoint(x: 29.4, y: 28.94))
            bezier3Path.addCurve(to: CGPoint(x: 29.73, y: 26.24), controlPoint1: CGPoint(x: 29.63, y: 27.35), controlPoint2: CGPoint(x: 29.63, y: 26.79))
            bezier3Path.addCurve(to: CGPoint(x: 30.11, y: 25.68), controlPoint1: CGPoint(x: 29.77, y: 26.04), controlPoint2: CGPoint(x: 29.94, y: 25.81))
            bezier3Path.addCurve(to: CGPoint(x: 30.62, y: 24.69), controlPoint1: CGPoint(x: 30.46, y: 25.43), controlPoint2: CGPoint(x: 30.61, y: 25.12))
            bezier3Path.addCurve(to: CGPoint(x: 30.69, y: 22.66), controlPoint1: CGPoint(x: 30.62, y: 24.01), controlPoint2: CGPoint(x: 30.67, y: 23.33))
            bezier3Path.addCurve(to: CGPoint(x: 30.61, y: 22.08), controlPoint1: CGPoint(x: 30.7, y: 22.5), controlPoint2: CGPoint(x: 30.65, y: 22.34))
            bezier3Path.addCurve(to: CGPoint(x: 29.47, y: 23.22), controlPoint1: CGPoint(x: 30.17, y: 22.52), controlPoint2: CGPoint(x: 29.82, y: 22.87))
            bezier3Path.addCurve(to: CGPoint(x: 28.82, y: 23.87), controlPoint1: CGPoint(x: 29.25, y: 23.44), controlPoint2: CGPoint(x: 29.05, y: 23.68))
            bezier3Path.addCurve(to: CGPoint(x: 27.68, y: 26.16), controlPoint1: CGPoint(x: 28.08, y: 24.46), controlPoint2: CGPoint(x: 27.73, y: 25.19))
            bezier3Path.addCurve(to: CGPoint(x: 27.3, y: 29.68), controlPoint1: CGPoint(x: 27.63, y: 27.33), controlPoint2: CGPoint(x: 27.41, y: 28.5))
            bezier3Path.addCurve(to: CGPoint(x: 27.37, y: 31.04), controlPoint1: CGPoint(x: 27.26, y: 30.12), controlPoint2: CGPoint(x: 27.35, y: 30.57))
            bezier3Path.addCurve(to: CGPoint(x: 19.35, y: 31.13), controlPoint1: CGPoint(x: 24.81, y: 31.07), controlPoint2: CGPoint(x: 22.13, y: 31.1))
            bezier3Path.addCurve(to: CGPoint(x: 19.73, y: 30.93), controlPoint1: CGPoint(x: 19.53, y: 31.03), controlPoint2: CGPoint(x: 19.64, y: 30.99))
            bezier3Path.addCurve(to: CGPoint(x: 20.94, y: 29.99), controlPoint1: CGPoint(x: 20.14, y: 30.62), controlPoint2: CGPoint(x: 20.64, y: 30.38))
            bezier3Path.addCurve(to: CGPoint(x: 22.3, y: 29.4), controlPoint1: CGPoint(x: 21.32, y: 29.5), controlPoint2: CGPoint(x: 21.74, y: 29.42))
            bezier3Path.addCurve(to: CGPoint(x: 25.54, y: 29.11), controlPoint1: CGPoint(x: 23.38, y: 29.35), controlPoint2: CGPoint(x: 24.46, y: 29.24))
            bezier3Path.addCurve(to: CGPoint(x: 26.54, y: 28.05), controlPoint1: CGPoint(x: 26.15, y: 29.04), controlPoint2: CGPoint(x: 26.45, y: 28.67))
            bezier3Path.addCurve(to: CGPoint(x: 26.81, y: 26.2), controlPoint1: CGPoint(x: 26.63, y: 27.43), controlPoint2: CGPoint(x: 26.73, y: 26.82))
            bezier3Path.addCurve(to: CGPoint(x: 26.6, y: 25.14), controlPoint1: CGPoint(x: 26.87, y: 25.83), controlPoint2: CGPoint(x: 26.84, y: 25.47))
            bezier3Path.addCurve(to: CGPoint(x: 26.5, y: 24.69), controlPoint1: CGPoint(x: 26.52, y: 25.02), controlPoint2: CGPoint(x: 26.5, y: 24.84))
            bezier3Path.addCurve(to: CGPoint(x: 26.56, y: 22.79), controlPoint1: CGPoint(x: 26.51, y: 24.06), controlPoint2: CGPoint(x: 26.55, y: 23.42))
            bezier3Path.addCurve(to: CGPoint(x: 25.65, y: 21.37), controlPoint1: CGPoint(x: 26.56, y: 22.13), controlPoint2: CGPoint(x: 26.26, y: 21.62))
            bezier3Path.addCurve(to: CGPoint(x: 22.88, y: 20.31), controlPoint1: CGPoint(x: 24.77, y: 21.01), controlPoint2: CGPoint(x: 23.88, y: 20.69))
            bezier3Path.addLine(to: CGPoint(x: 21.84, y: 20.12))
            bezier3Path.addCurve(to: CGPoint(x: 21.48, y: 20.14), controlPoint1: CGPoint(x: 21.74, y: 20.17), controlPoint2: CGPoint(x: 21.63, y: 20.17))
            bezier3Path.addCurve(to: CGPoint(x: 16.36, y: 19.02), controlPoint1: CGPoint(x: 19.78, y: 19.75), controlPoint2: CGPoint(x: 18.07, y: 19.4))
            bezier3Path.addCurve(to: CGPoint(x: 15.06, y: 18.72), controlPoint1: CGPoint(x: 15.94, y: 18.93), controlPoint2: CGPoint(x: 15.53, y: 18.83))
            bezier3Path.addCurve(to: CGPoint(x: 21.39, y: 9.61), controlPoint1: CGPoint(x: 17.2, y: 15.64), controlPoint2: CGPoint(x: 19.29, y: 12.63))
            bezier3Path.addCurve(to: CGPoint(x: 19.99, y: 9.86), controlPoint1: CGPoint(x: 20.86, y: 9.42), controlPoint2: CGPoint(x: 20.41, y: 9.46))
            bezier3Path.addCurve(to: CGPoint(x: 18.2, y: 11.82), controlPoint1: CGPoint(x: 19.36, y: 10.48), controlPoint2: CGPoint(x: 18.72, y: 11.11))
            bezier3Path.addCurve(to: CGPoint(x: 13.85, y: 18.05), controlPoint1: CGPoint(x: 16.72, y: 13.87), controlPoint2: CGPoint(x: 15.28, y: 15.97))
            bezier3Path.addCurve(to: CGPoint(x: 13.17, y: 18.27), controlPoint1: CGPoint(x: 13.65, y: 18.34), controlPoint2: CGPoint(x: 13.48, y: 18.38))
            bezier3Path.addCurve(to: CGPoint(x: 7.34, y: 16.18), controlPoint1: CGPoint(x: 11.23, y: 17.56), controlPoint2: CGPoint(x: 9.29, y: 16.85))
            bezier3Path.addCurve(to: CGPoint(x: 4.84, y: 15.54), controlPoint1: CGPoint(x: 6.54, y: 15.91), controlPoint2: CGPoint(x: 5.71, y: 15.76))
            bezier3Path.addCurve(to: CGPoint(x: 4.86, y: 16.72), controlPoint1: CGPoint(x: 4.85, y: 16.02), controlPoint2: CGPoint(x: 4.85, y: 16.39))
            bezier3Path.addCurve(to: CGPoint(x: 7.02, y: 17.3), controlPoint1: CGPoint(x: 5.59, y: 16.91), controlPoint2: CGPoint(x: 6.32, y: 17.05))
            bezier3Path.addCurve(to: CGPoint(x: 11.7, y: 19.07), controlPoint1: CGPoint(x: 8.59, y: 17.86), controlPoint2: CGPoint(x: 10.14, y: 18.47))
            bezier3Path.addCurve(to: CGPoint(x: 12.18, y: 19.34), controlPoint1: CGPoint(x: 11.87, y: 19.14), controlPoint2: CGPoint(x: 12.06, y: 19.21))
            bezier3Path.addCurve(to: CGPoint(x: 12.38, y: 19.87), controlPoint1: CGPoint(x: 12.3, y: 19.48), controlPoint2: CGPoint(x: 12.43, y: 19.74))
            bezier3Path.addCurve(to: CGPoint(x: 11.88, y: 20.25), controlPoint1: CGPoint(x: 12.32, y: 20.04), controlPoint2: CGPoint(x: 12.07, y: 20.15))
            bezier3Path.addCurve(to: CGPoint(x: 11.53, y: 20.25), controlPoint1: CGPoint(x: 11.79, y: 20.3), controlPoint2: CGPoint(x: 11.65, y: 20.25))
            bezier3Path.addCurve(to: CGPoint(x: 5.2, y: 20.12), controlPoint1: CGPoint(x: 9.42, y: 20.21), controlPoint2: CGPoint(x: 7.31, y: 20.17))
            bezier3Path.addCurve(to: CGPoint(x: 4.91, y: 20.15), controlPoint1: CGPoint(x: 5.1, y: 20.12), controlPoint2: CGPoint(x: 5, y: 20.14))
            bezier3Path.addCurve(to: CGPoint(x: 5.01, y: 29.61), controlPoint1: CGPoint(x: 4.94, y: 23.31), controlPoint2: CGPoint(x: 4.97, y: 26.45))
            bezier3Path.addCurve(to: CGPoint(x: 5.52, y: 29.6), controlPoint1: CGPoint(x: 5.2, y: 29.61), controlPoint2: CGPoint(x: 5.36, y: 29.61))
            bezier3Path.addCurve(to: CGPoint(x: 13.96, y: 29.51), controlPoint1: CGPoint(x: 8.33, y: 29.57), controlPoint2: CGPoint(x: 11.14, y: 29.55))
            bezier3Path.addCurve(to: CGPoint(x: 14.56, y: 29.77), controlPoint1: CGPoint(x: 14.22, y: 29.5), controlPoint2: CGPoint(x: 14.37, y: 29.6))
            bezier3Path.addCurve(to: CGPoint(x: 16.12, y: 30.99), controlPoint1: CGPoint(x: 15.05, y: 30.21), controlPoint2: CGPoint(x: 15.59, y: 30.59))
            bezier3Path.addCurve(to: CGPoint(x: 16.36, y: 31.13), controlPoint1: CGPoint(x: 16.19, y: 31.05), controlPoint2: CGPoint(x: 16.28, y: 31.08))
            bezier3Path.addCurve(to: CGPoint(x: 16.34, y: 31.21), controlPoint1: CGPoint(x: 16.35, y: 31.16), controlPoint2: CGPoint(x: 16.35, y: 31.19))
            bezier3Path.addCurve(to: CGPoint(x: 5.03, y: 31.34), controlPoint1: CGPoint(x: 12.57, y: 31.26), controlPoint2: CGPoint(x: 8.8, y: 31.3))
            bezier3Path.addCurve(to: CGPoint(x: 5.04, y: 32.51), controlPoint1: CGPoint(x: 5.03, y: 31.76), controlPoint2: CGPoint(x: 5.04, y: 32.13))
            bezier3Path.addCurve(to: CGPoint(x: 37.16, y: 32.16), controlPoint1: CGPoint(x: 15.76, y: 32.39), controlPoint2: CGPoint(x: 26.45, y: 32.28))
            bezier3Path.addCurve(to: CGPoint(x: 37.14, y: 30.96), controlPoint1: CGPoint(x: 37.15, y: 31.76), controlPoint2: CGPoint(x: 37.15, y: 31.38))
            bezier3Path.addCurve(to: CGPoint(x: 33.85, y: 31), controlPoint1: CGPoint(x: 36.02, y: 30.98), controlPoint2: CGPoint(x: 34.91, y: 30.99))
            bezier3Path.addLine(to: CGPoint(x: 31.81, y: 30.99))
            bezier3Path.close()
            bezier3Path.miterLimit = 4;
            
            strokeColor.setStroke()
            bezier3Path.lineWidth = 1
            bezier3Path.stroke()
        }
        
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imageViewtool
    }
    func chauffeurTopView(_ check: Int)->UIView{
        let drawservicing = DrawServicing()
        let topView = drawservicing.addView(1)
        var coloredCircle = UIImageView()
        var coloredCircle1 = UIImageView()
        var coloredCircle2 = UIImageView()
        
        var v1 = 0
        var v2 = 0
        var v3 = 0
        
        coloredCircle = topViewImageView("circle", color: 0)
        topView.addSubview(coloredCircle)
        
        coloredCircle1 = topViewImageView("circle", color: 0)
        topView.addSubview(coloredCircle1)
        
        coloredCircle2 = topViewImageView("circle", color: 0)
        topView.addSubview(coloredCircle2)
        
        var car = topViewImageView("car", color: 0)
        coloredCircle.addSubview(car)
        
        var location1 = topViewImageView("location", color: 0)
        coloredCircle1.addSubview(location1)
        
        var driver = topViewImageView("driver", color: 0)
        coloredCircle2.addSubview(driver)
        
        coloredCircle.addConstraintsWithFormat("H:|-5-[v0]", views: car)
        coloredCircle.addConstraintsWithFormat("V:|-8-[v0]", views: car)
        
        coloredCircle1.addConstraintsWithFormat("H:|[v0]", views: location1)
        coloredCircle1.addConstraintsWithFormat("V:|-5-[v0]", views: location1)
        
        coloredCircle2.addConstraintsWithFormat("H:|[v0]", views: driver)
        coloredCircle2.addConstraintsWithFormat("V:|[v0]", views: driver)
        
        switch check {
        case 0:
            
            coloredCircle.removeFromSuperview()
            car.removeFromSuperview()
            
            coloredCircle = topViewImageView("activeCircle", color: 1)
            topView.addSubview(coloredCircle)
            
            car = topViewImageView("car", color: 1)
            coloredCircle.addSubview(car)
            coloredCircle.addConstraintsWithFormat("H:|-11-[v0]", views: car)
            coloredCircle.addConstraintsWithFormat("V:|-15-[v0]", views: car)
            
            v1 = 0
            v2 = 5
            v3 = 5
            
            break
            
        case 1:
            
            coloredCircle1.removeFromSuperview()
            location1.removeFromSuperview()
            
            coloredCircle1 = topViewImageView("activeCircle", color: 1)
            topView.addSubview(coloredCircle1)
            
            location1 = topViewImageView("location", color: 1)
            coloredCircle1.addSubview(location1)
            
            coloredCircle1.addConstraintsWithFormat("H:|-5-[v0]", views: location1)
            coloredCircle1.addConstraintsWithFormat("V:|-8-[v0]", views: location1)
            
            v1 = 5
            v3 = 5
            v2 = 0
            break
            
        case 2:
            
            coloredCircle2.removeFromSuperview()
            driver.removeFromSuperview()
            
            coloredCircle2 = topViewImageView("activeCircle", color: 1)
            topView.addSubview(coloredCircle2)
            
            driver = topViewImageView("driver", color: 1)
            coloredCircle2.addSubview(driver)
            
            coloredCircle2.addConstraintsWithFormat("H:|-5-[v0]", views: driver)
            coloredCircle2.addConstraintsWithFormat("V:|-8-[v0]", views: driver)
            v1 = 5
            v2 = 5
            v3 = 0
            break
        default:
            print("")
        }
        topView.addConstraintsWithFormat("V:|-\(v1)-[v0]", views: coloredCircle)
        topView.addConstraintsWithFormat("V:|-\(v2)-[v0]", views: coloredCircle1)
        topView.addConstraintsWithFormat("V:|-\(v3)-[v0]", views: coloredCircle2)
        
        let lineF1 = topViewImageView("line", color: 0)
        topView.addSubview(lineF1)
        let lineF2 = topViewImageView("line", color: 0)
        topView.addSubview(lineF2)
        
        topView.addConstraintsWithFormat("H:|[v0][v1][v2][v3][v4]|", views: coloredCircle, lineF1, coloredCircle1, lineF2, coloredCircle2)
        topView.addConstraintsWithFormat("V:|-25-[v0]|", views: lineF1)
        topView.addConstraintsWithFormat("V:|-25-[v0]|", views: lineF2)
        
        return topView
    }
    func viewForTop(_ check:Int)->UIView{
        let drawservicing = DrawServicing()
        let topView = drawservicing.addView(1)
        var coloredCircle = UIImageView()
        var coloredCircle1 = UIImageView()
        var coloredCircle2 = UIImageView()
        var coloredCircle3 = UIImageView()
        var coloredCircle4 = UIImageView()
        
        var v1 = 0
        var v2 = 0
        var v3 = 0
        var v4 = 0
        var v5 = 0
        
        coloredCircle = topViewImageView("circle", color: 0)
        topView.addSubview(coloredCircle)
        
        coloredCircle1 = topViewImageView("circle", color: 0)
        topView.addSubview(coloredCircle1)
        
        coloredCircle2 = topViewImageView("circle", color: 0)
        topView.addSubview(coloredCircle2)
        
        coloredCircle3 = topViewImageView("circle", color: 0)
        topView.addSubview(coloredCircle3)
        
        coloredCircle4 = topViewImageView("circle", color: 0)
        topView.addSubview(coloredCircle4)
        
        var car = topViewImageView("car", color: 0)
        coloredCircle.addSubview(car)
        
        var location1 = topViewImageView("location", color: 0)
        coloredCircle1.addSubview(location1)
        
        var driver = topViewImageView("driver", color: 0)
        coloredCircle2.addSubview(driver)
        
        var serviceCentre = topViewImageView("service", color: 0)
        coloredCircle3.addSubview(serviceCentre)
        
        var location2 = topViewImageView("location", color: 0)
        coloredCircle4.addSubview(location2)
        
        coloredCircle.addConstraintsWithFormat("H:|-5-[v0]", views: car)
        coloredCircle.addConstraintsWithFormat("V:|-8-[v0]", views: car)
        
        coloredCircle1.addConstraintsWithFormat("H:|[v0]", views: location1)
        coloredCircle1.addConstraintsWithFormat("V:|-5-[v0]", views: location1)
        
        coloredCircle2.addConstraintsWithFormat("H:|[v0]", views: driver)
        coloredCircle2.addConstraintsWithFormat("V:|[v0]", views: driver)
        
        coloredCircle3.addConstraintsWithFormat("H:|[v0]", views: serviceCentre)
        coloredCircle3.addConstraintsWithFormat("V:|[v0]", views: serviceCentre)
        
        coloredCircle4.addConstraintsWithFormat("H:|[v0]", views: location2)
        coloredCircle4.addConstraintsWithFormat("V:|-5-[v0]", views: location2)
        
        switch check {
        case 0:
            coloredCircle.removeFromSuperview()
            car.removeFromSuperview()
            coloredCircle = topViewImageView("activeCircle", color: 1)
            topView.addSubview(coloredCircle)
            car = topViewImageView("car", color: 1)
            coloredCircle.addSubview(car)
            coloredCircle.addConstraintsWithFormat("H:|-11-[v0]", views: car)
            coloredCircle.addConstraintsWithFormat("V:|-15-[v0]", views: car)
            v1 = 0
            v2 = 5
            v3 = 5
            v4 = 5
            v5 = 5
            break
        case 1:
            coloredCircle1.removeFromSuperview()
            location1.removeFromSuperview()
            coloredCircle1 = topViewImageView("activeCircle", color: 1)
            topView.addSubview(coloredCircle1)
            location1 = topViewImageView("location", color: 1)
            coloredCircle1.addSubview(location1)
            coloredCircle1.addConstraintsWithFormat("H:|-5-[v0]", views: location1)
            coloredCircle1.addConstraintsWithFormat("V:|-8-[v0]", views: location1)
            v1 = 5; v4 = 5; v3 = 5; v5 = 5
            v2 = 0
            break
            
        case 2:
            coloredCircle2.removeFromSuperview()
            driver.removeFromSuperview()
            
            coloredCircle2 = topViewImageView("activeCircle", color: 1)
            topView.addSubview(coloredCircle2)
            
            driver = topViewImageView("driver", color: 1)
            coloredCircle2.addSubview(driver)
            
            coloredCircle2.addConstraintsWithFormat("H:|-5-[v0]", views: driver)
            coloredCircle2.addConstraintsWithFormat("V:|-8-[v0]", views: driver)
            v1 = 5
            v2 = 5
            v3 = 0
            v4 = 5
            v5 = 5
            break
        case 3:
            coloredCircle3.removeFromSuperview()
            serviceCentre.removeFromSuperview()
            
            coloredCircle3 = topViewImageView("activeCircle", color: 1)
            topView.addSubview(coloredCircle3)
            
            serviceCentre = topViewImageView("service", color: 1)
            coloredCircle3.addSubview(serviceCentre)
            
            coloredCircle3.addConstraintsWithFormat("H:|-5-[v0]", views: serviceCentre)
            coloredCircle3.addConstraintsWithFormat("V:|-8-[v0]", views: serviceCentre)
            v1 = 5
            v2 = 5
            v3 = 5
            v4 = 0
            v5 = 5
            break
        case 4:
            coloredCircle4.removeFromSuperview()
            location2.removeFromSuperview()
            
            coloredCircle4 = topViewImageView("activeCircle", color: 1)
            topView.addSubview(coloredCircle4)
            
            location2 = topViewImageView("location", color: 1)
            coloredCircle4.addSubview(location2)
            
            coloredCircle4.addConstraintsWithFormat("H:|-5-[v0]", views: location2)
            coloredCircle4.addConstraintsWithFormat("V:|-8-[v0]", views: location2)
            v1 = 5
            v2 = 5
            v3 = 5
            v4 = 5
            v5 = 0
            break
        default:
            print("")
        }
        
        topView.addConstraintsWithFormat("V:|-\(v1)-[v0]", views: coloredCircle)
        topView.addConstraintsWithFormat("V:|-\(v2)-[v0]", views: coloredCircle1)
        topView.addConstraintsWithFormat("V:|-\(v3)-[v0]", views: coloredCircle2)
        topView.addConstraintsWithFormat("V:|-\(v4)-[v0]", views: coloredCircle3)
        topView.addConstraintsWithFormat("V:|-\(v5)-[v0]", views: coloredCircle4)
        
        let lineF1 = topViewImageView("line", color: 0)
        topView.addSubview(lineF1)
        let lineF2 = topViewImageView("line", color: 0)
        topView.addSubview(lineF2)
        let lineF3 = topViewImageView("line", color: 0)
        topView.addSubview(lineF3)
        let lineF4 = topViewImageView("line", color: 0)
        topView.addSubview(lineF4)
        
        topView.addConstraintsWithFormat("H:|[v0][v1][v2][v3][v4][v5][v6][v7][v8]", views: coloredCircle, lineF1, coloredCircle1, lineF2, coloredCircle2, lineF3, coloredCircle3, lineF4, coloredCircle4)
        topView.addConstraintsWithFormat("V:|-25-[v0]|", views: lineF1)
        topView.addConstraintsWithFormat("V:|-25-[v0]|", views: lineF2)
        topView.addConstraintsWithFormat("V:|-25-[v0]|", views: lineF3)
        topView.addConstraintsWithFormat("V:|-25-[v0]|", views: lineF4)
        
        return topView
    }
}

