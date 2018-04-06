//
//  SharingIcon.swift
//  21North
//
//  Created by Sachin Tomar on 29/11/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation


class SharingIcon{
    func whatsAppIcon(data: String)->UIImageView
    {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 32), false, 0)
        //// PaintCode Trial Version
        //// www.paintcodeapp.com
        
        //// Color Declarations
        if(data == "whatsApp"){
        let strokeColor = UIColor(red: 0.715, green: 0.723, blue: 0.733, alpha: 1.000)
        
        //// Page-1
        //// Stroke-1 Drawing
        let stroke1Path = UIBezierPath()
        stroke1Path.move(to: CGPoint(x: 25.78, y: 16.68))
        stroke1Path.addCurve(to: CGPoint(x: 18.03, y: 25.92), controlPoint1: CGPoint(x: 25.44, y: 20.98), controlPoint2: CGPoint(x: 22.44, y: 24.78))
        stroke1Path.addCurve(to: CGPoint(x: 10.65, y: 25.11), controlPoint1: CGPoint(x: 15.48, y: 26.59), controlPoint2: CGPoint(x: 13.01, y: 26.29))
        stroke1Path.addCurve(to: CGPoint(x: 10.23, y: 25.07), controlPoint1: CGPoint(x: 10.53, y: 25.05), controlPoint2: CGPoint(x: 10.36, y: 25.03))
        stroke1Path.addCurve(to: CGPoint(x: 5.11, y: 26.4), controlPoint1: CGPoint(x: 8.52, y: 25.5), controlPoint2: CGPoint(x: 6.81, y: 25.95))
        stroke1Path.addCurve(to: CGPoint(x: 4.98, y: 26.43), controlPoint1: CGPoint(x: 5.08, y: 26.41), controlPoint2: CGPoint(x: 5.05, y: 26.41))
        stroke1Path.addCurve(to: CGPoint(x: 5.37, y: 24.95), controlPoint1: CGPoint(x: 5.11, y: 25.92), controlPoint2: CGPoint(x: 5.24, y: 25.43))
        stroke1Path.addCurve(to: CGPoint(x: 6.38, y: 21.28), controlPoint1: CGPoint(x: 5.71, y: 23.73), controlPoint2: CGPoint(x: 6.05, y: 22.51))
        stroke1Path.addCurve(to: CGPoint(x: 6.33, y: 20.89), controlPoint1: CGPoint(x: 6.41, y: 21.16), controlPoint2: CGPoint(x: 6.39, y: 21))
        stroke1Path.addCurve(to: CGPoint(x: 5.07, y: 15.19), controlPoint1: CGPoint(x: 5.36, y: 19.11), controlPoint2: CGPoint(x: 4.93, y: 17.21))
        stroke1Path.addCurve(to: CGPoint(x: 7.09, y: 9.71), controlPoint1: CGPoint(x: 5.21, y: 13.18), controlPoint2: CGPoint(x: 5.86, y: 11.33))
        stroke1Path.addCurve(to: CGPoint(x: 13.38, y: 5.72), controlPoint1: CGPoint(x: 8.68, y: 7.61), controlPoint2: CGPoint(x: 10.78, y: 6.22))
        stroke1Path.addCurve(to: CGPoint(x: 22.09, y: 7.95), controlPoint1: CGPoint(x: 16.62, y: 5.1), controlPoint2: CGPoint(x: 19.55, y: 5.84))
        stroke1Path.addCurve(to: CGPoint(x: 25.58, y: 13.71), controlPoint1: CGPoint(x: 23.92, y: 9.46), controlPoint2: CGPoint(x: 25.07, y: 11.4))
        stroke1Path.addCurve(to: CGPoint(x: 25.78, y: 16.68), controlPoint1: CGPoint(x: 25.8, y: 14.69), controlPoint2: CGPoint(x: 25.86, y: 15.69))
        stroke1Path.addLine(to: CGPoint(x: 25.78, y: 16.68))
        stroke1Path.close()
        stroke1Path.move(to: CGPoint(x: 29.68, y: 9.24))
        stroke1Path.addCurve(to: CGPoint(x: 29.52, y: 6.33), controlPoint1: CGPoint(x: 29.67, y: 8.27), controlPoint2: CGPoint(x: 29.67, y: 7.29))
        stroke1Path.addCurve(to: CGPoint(x: 26.33, y: 2.11), controlPoint1: CGPoint(x: 29.21, y: 4.38), controlPoint2: CGPoint(x: 28.11, y: 2.97))
        stroke1Path.addCurve(to: CGPoint(x: 22.93, y: 1.51), controlPoint1: CGPoint(x: 25.26, y: 1.59), controlPoint2: CGPoint(x: 24.09, y: 1.51))
        stroke1Path.addCurve(to: CGPoint(x: 7.22, y: 1.51), controlPoint1: CGPoint(x: 17.69, y: 1.5), controlPoint2: CGPoint(x: 12.46, y: 1.5))
        stroke1Path.addCurve(to: CGPoint(x: 4.52, y: 1.85), controlPoint1: CGPoint(x: 6.31, y: 1.51), controlPoint2: CGPoint(x: 5.4, y: 1.57))
        stroke1Path.addCurve(to: CGPoint(x: 0.63, y: 6.54), controlPoint1: CGPoint(x: 2.55, y: 2.48), controlPoint2: CGPoint(x: 0.93, y: 4.15))
        stroke1Path.addCurve(to: CGPoint(x: 0.52, y: 9.58), controlPoint1: CGPoint(x: 0.5, y: 7.54), controlPoint2: CGPoint(x: 0.52, y: 8.56))
        stroke1Path.addCurve(to: CGPoint(x: 0.51, y: 20.49), controlPoint1: CGPoint(x: 0.5, y: 13.21), controlPoint2: CGPoint(x: 0.49, y: 16.85))
        stroke1Path.addCurve(to: CGPoint(x: 0.63, y: 25.5), controlPoint1: CGPoint(x: 0.51, y: 22.16), controlPoint2: CGPoint(x: 0.49, y: 23.84))
        stroke1Path.addCurve(to: CGPoint(x: 3.96, y: 30.17), controlPoint1: CGPoint(x: 0.8, y: 27.68), controlPoint2: CGPoint(x: 1.98, y: 29.24))
        stroke1Path.addCurve(to: CGPoint(x: 7.05, y: 30.71), controlPoint1: CGPoint(x: 4.93, y: 30.62), controlPoint2: CGPoint(x: 5.99, y: 30.71))
        stroke1Path.addCurve(to: CGPoint(x: 22.95, y: 30.71), controlPoint1: CGPoint(x: 12.35, y: 30.72), controlPoint2: CGPoint(x: 17.65, y: 30.72))
        stroke1Path.addCurve(to: CGPoint(x: 24.82, y: 30.57), controlPoint1: CGPoint(x: 23.58, y: 30.7), controlPoint2: CGPoint(x: 24.21, y: 30.68))
        stroke1Path.addCurve(to: CGPoint(x: 29.19, y: 27.12), controlPoint1: CGPoint(x: 26.89, y: 30.22), controlPoint2: CGPoint(x: 28.35, y: 29.06))
        stroke1Path.addCurve(to: CGPoint(x: 29.67, y: 23.97), controlPoint1: CGPoint(x: 29.62, y: 26.12), controlPoint2: CGPoint(x: 29.67, y: 25.04))
        stroke1Path.addCurve(to: CGPoint(x: 29.68, y: 16.13), controlPoint1: CGPoint(x: 29.69, y: 21.36), controlPoint2: CGPoint(x: 29.68, y: 18.74))
        stroke1Path.addLine(to: CGPoint(x: 29.69, y: 16.13))
        stroke1Path.addCurve(to: CGPoint(x: 29.68, y: 9.24), controlPoint1: CGPoint(x: 29.69, y: 13.83), controlPoint2: CGPoint(x: 29.7, y: 11.53))
        stroke1Path.addLine(to: CGPoint(x: 29.68, y: 9.24))
        stroke1Path.close()
        stroke1Path.miterLimit = 4;
        
        stroke1Path.usesEvenOddFillRule = true;
        
        strokeColor.setStroke()
        stroke1Path.lineWidth = 1
        stroke1Path.stroke()
        
        
        //// Stroke-3 Drawing
        let stroke3Path = UIBezierPath()
        stroke3Path.move(to: CGPoint(x: 18.53, y: 20.83))
        stroke3Path.addCurve(to: CGPoint(x: 15.4, y: 20.05), controlPoint1: CGPoint(x: 17.39, y: 20.99), controlPoint2: CGPoint(x: 16.39, y: 20.5))
        stroke3Path.addCurve(to: CGPoint(x: 11.99, y: 17.28), controlPoint1: CGPoint(x: 14.03, y: 19.42), controlPoint2: CGPoint(x: 12.95, y: 18.42))
        stroke3Path.addCurve(to: CGPoint(x: 10.57, y: 15.19), controlPoint1: CGPoint(x: 11.45, y: 16.63), controlPoint2: CGPoint(x: 10.94, y: 15.96))
        stroke3Path.addCurve(to: CGPoint(x: 10.15, y: 13.59), controlPoint1: CGPoint(x: 10.32, y: 14.67), controlPoint2: CGPoint(x: 10.16, y: 14.13))
        stroke3Path.addCurve(to: CGPoint(x: 11.14, y: 11.35), controlPoint1: CGPoint(x: 10.17, y: 12.67), controlPoint2: CGPoint(x: 10.49, y: 11.93))
        stroke3Path.addCurve(to: CGPoint(x: 11.79, y: 11.11), controlPoint1: CGPoint(x: 11.31, y: 11.21), controlPoint2: CGPoint(x: 11.57, y: 11.12))
        stroke3Path.addCurve(to: CGPoint(x: 12.96, y: 11.88), controlPoint1: CGPoint(x: 12.64, y: 11.08), controlPoint2: CGPoint(x: 12.64, y: 11.09))
        stroke3Path.addCurve(to: CGPoint(x: 13.57, y: 13.34), controlPoint1: CGPoint(x: 13.15, y: 12.37), controlPoint2: CGPoint(x: 13.33, y: 12.87))
        stroke3Path.addCurve(to: CGPoint(x: 13.44, y: 14.27), controlPoint1: CGPoint(x: 13.76, y: 13.71), controlPoint2: CGPoint(x: 13.65, y: 13.99))
        stroke3Path.addCurve(to: CGPoint(x: 12.94, y: 14.86), controlPoint1: CGPoint(x: 13.29, y: 14.48), controlPoint2: CGPoint(x: 13.12, y: 14.67))
        stroke3Path.addCurve(to: CGPoint(x: 12.88, y: 15.35), controlPoint1: CGPoint(x: 12.8, y: 15.02), controlPoint2: CGPoint(x: 12.77, y: 15.16))
        stroke3Path.addCurve(to: CGPoint(x: 16.5, y: 18.47), controlPoint1: CGPoint(x: 13.74, y: 16.8), controlPoint2: CGPoint(x: 14.93, y: 17.86))
        stroke3Path.addCurve(to: CGPoint(x: 17.03, y: 18.32), controlPoint1: CGPoint(x: 16.72, y: 18.56), controlPoint2: CGPoint(x: 16.89, y: 18.5))
        stroke3Path.addCurve(to: CGPoint(x: 17.77, y: 17.39), controlPoint1: CGPoint(x: 17.28, y: 18.01), controlPoint2: CGPoint(x: 17.54, y: 17.71))
        stroke3Path.addCurve(to: CGPoint(x: 18.35, y: 17.21), controlPoint1: CGPoint(x: 17.93, y: 17.18), controlPoint2: CGPoint(x: 18.11, y: 17.1))
        stroke3Path.addCurve(to: CGPoint(x: 20.49, y: 18.25), controlPoint1: CGPoint(x: 19.06, y: 17.55), controlPoint2: CGPoint(x: 19.78, y: 17.89))
        stroke3Path.addCurve(to: CGPoint(x: 20.68, y: 18.64), controlPoint1: CGPoint(x: 20.59, y: 18.31), controlPoint2: CGPoint(x: 20.68, y: 18.5))
        stroke3Path.addCurve(to: CGPoint(x: 18.53, y: 20.83), controlPoint1: CGPoint(x: 20.68, y: 19.99), controlPoint2: CGPoint(x: 19.68, y: 20.68))
        stroke3Path.addLine(to: CGPoint(x: 18.53, y: 20.83))
        stroke3Path.close()
        stroke3Path.move(to: CGPoint(x: 23.92, y: 14.34))
        stroke3Path.addCurve(to: CGPoint(x: 21.32, y: 9.6), controlPoint1: CGPoint(x: 23.6, y: 12.47), controlPoint2: CGPoint(x: 22.72, y: 10.88))
        stroke3Path.addCurve(to: CGPoint(x: 13.53, y: 7.47), controlPoint1: CGPoint(x: 19.09, y: 7.56), controlPoint2: CGPoint(x: 16.47, y: 6.84))
        stroke3Path.addCurve(to: CGPoint(x: 6.8, y: 15.54), controlPoint1: CGPoint(x: 9.73, y: 8.29), controlPoint2: CGPoint(x: 6.92, y: 11.7))
        stroke3Path.addCurve(to: CGPoint(x: 8.05, y: 20.37), controlPoint1: CGPoint(x: 6.75, y: 17.28), controlPoint2: CGPoint(x: 7.13, y: 18.89))
        stroke3Path.addCurve(to: CGPoint(x: 8.18, y: 21.32), controlPoint1: CGPoint(x: 8.25, y: 20.69), controlPoint2: CGPoint(x: 8.29, y: 20.97))
        stroke3Path.addCurve(to: CGPoint(x: 7.44, y: 23.99), controlPoint1: CGPoint(x: 7.92, y: 22.19), controlPoint2: CGPoint(x: 7.69, y: 23.07))
        stroke3Path.addCurve(to: CGPoint(x: 10.45, y: 23.2), controlPoint1: CGPoint(x: 8.47, y: 23.72), controlPoint2: CGPoint(x: 9.46, y: 23.46))
        stroke3Path.addCurve(to: CGPoint(x: 10.93, y: 23.26), controlPoint1: CGPoint(x: 10.62, y: 23.15), controlPoint2: CGPoint(x: 10.77, y: 23.16))
        stroke3Path.addCurve(to: CGPoint(x: 17.07, y: 24.37), controlPoint1: CGPoint(x: 12.84, y: 24.4), controlPoint2: CGPoint(x: 14.89, y: 24.79))
        stroke3Path.addCurve(to: CGPoint(x: 22.37, y: 21.01), controlPoint1: CGPoint(x: 19.26, y: 23.94), controlPoint2: CGPoint(x: 21.04, y: 22.8))
        stroke3Path.addCurve(to: CGPoint(x: 23.92, y: 14.34), controlPoint1: CGPoint(x: 23.85, y: 19.03), controlPoint2: CGPoint(x: 24.34, y: 16.77))
        stroke3Path.addLine(to: CGPoint(x: 23.92, y: 14.34))
        stroke3Path.close()
        stroke3Path.miterLimit = 4;
        
        stroke3Path.usesEvenOddFillRule = true;
        
        strokeColor.setStroke()
        stroke3Path.lineWidth = 1
        stroke3Path.stroke()
        }
        else if(data == "text"){
            let fillColor = UIColor(red: 0.715, green: 0.723, blue: 0.733, alpha: 1.000)
            let strokeColor = UIColor(red: 0.715, green: 0.723, blue: 0.733, alpha: 1.000)
            
            //// Page-1
            //// Fill-1 Drawing
            let fill1Path = UIBezierPath()
            fill1Path.move(to: CGPoint(x: 9.11, y: 22.52))
            fill1Path.addLine(to: CGPoint(x: 9.47, y: 22.71))
            fill1Path.addCurve(to: CGPoint(x: 15.04, y: 24.01), controlPoint1: CGPoint(x: 11.16, y: 23.56), controlPoint2: CGPoint(x: 13.08, y: 24.01))
            fill1Path.addCurve(to: CGPoint(x: 26.07, y: 14.48), controlPoint1: CGPoint(x: 21.12, y: 24.01), controlPoint2: CGPoint(x: 26.07, y: 19.74))
            fill1Path.addCurve(to: CGPoint(x: 15.04, y: 4.96), controlPoint1: CGPoint(x: 26.07, y: 9.23), controlPoint2: CGPoint(x: 21.12, y: 4.96))
            fill1Path.addCurve(to: CGPoint(x: 4, y: 14.48), controlPoint1: CGPoint(x: 8.95, y: 4.96), controlPoint2: CGPoint(x: 4, y: 9.23))
            fill1Path.addCurve(to: CGPoint(x: 6.48, y: 20.49), controlPoint1: CGPoint(x: 4, y: 16.67), controlPoint2: CGPoint(x: 4.88, y: 18.8))
            fill1Path.addLine(to: CGPoint(x: 6.64, y: 20.66))
            fill1Path.addLine(to: CGPoint(x: 6.65, y: 20.9))
            fill1Path.addCurve(to: CGPoint(x: 5.77, y: 24.01), controlPoint1: CGPoint(x: 6.67, y: 21.75), controlPoint2: CGPoint(x: 6.52, y: 22.9))
            fill1Path.addCurve(to: CGPoint(x: 8.8, y: 22.78), controlPoint1: CGPoint(x: 7.21, y: 23.99), controlPoint2: CGPoint(x: 8.54, y: 22.98))
            fill1Path.addLine(to: CGPoint(x: 9.11, y: 22.52))
            fill1Path.close()
            fill1Path.move(to: CGPoint(x: 5.72, y: 25.26))
            fill1Path.addCurve(to: CGPoint(x: 4.37, y: 25.04), controlPoint1: CGPoint(x: 5.25, y: 25.26), controlPoint2: CGPoint(x: 4.8, y: 25.18))
            fill1Path.addLine(to: CGPoint(x: 3.4, y: 24.7))
            fill1Path.addLine(to: CGPoint(x: 4.14, y: 23.99))
            fill1Path.addCurve(to: CGPoint(x: 5.4, y: 21.17), controlPoint1: CGPoint(x: 5.13, y: 23.06), controlPoint2: CGPoint(x: 5.38, y: 21.98))
            fill1Path.addCurve(to: CGPoint(x: 2.75, y: 14.48), controlPoint1: CGPoint(x: 3.69, y: 19.27), controlPoint2: CGPoint(x: 2.75, y: 16.91))
            fill1Path.addCurve(to: CGPoint(x: 15.04, y: 3.71), controlPoint1: CGPoint(x: 2.75, y: 8.54), controlPoint2: CGPoint(x: 8.26, y: 3.71))
            fill1Path.addCurve(to: CGPoint(x: 27.32, y: 14.48), controlPoint1: CGPoint(x: 21.81, y: 3.71), controlPoint2: CGPoint(x: 27.32, y: 8.54))
            fill1Path.addCurve(to: CGPoint(x: 15.04, y: 25.26), controlPoint1: CGPoint(x: 27.32, y: 20.42), controlPoint2: CGPoint(x: 21.81, y: 25.26))
            fill1Path.addCurve(to: CGPoint(x: 9.26, y: 23.99), controlPoint1: CGPoint(x: 13.02, y: 25.26), controlPoint2: CGPoint(x: 11.03, y: 24.82))
            fill1Path.addCurve(to: CGPoint(x: 5.72, y: 25.26), controlPoint1: CGPoint(x: 8.59, y: 24.46), controlPoint2: CGPoint(x: 7.24, y: 25.26))
            fill1Path.addLine(to: CGPoint(x: 5.72, y: 25.26))
            fill1Path.close()
            fill1Path.miterLimit = 4;
            
            fill1Path.usesEvenOddFillRule = true;
            
            fillColor.setFill()
            fill1Path.fill()
            
            
            //// Stroke-9 Drawing
            let stroke9Path = UIBezierPath()
            stroke9Path.move(to: CGPoint(x: 29.68, y: 8.24))
            stroke9Path.addCurve(to: CGPoint(x: 29.52, y: 5.33), controlPoint1: CGPoint(x: 29.67, y: 7.27), controlPoint2: CGPoint(x: 29.67, y: 6.29))
            stroke9Path.addCurve(to: CGPoint(x: 26.33, y: 1.11), controlPoint1: CGPoint(x: 29.21, y: 3.38), controlPoint2: CGPoint(x: 28.11, y: 1.97))
            stroke9Path.addCurve(to: CGPoint(x: 22.93, y: 0.51), controlPoint1: CGPoint(x: 25.26, y: 0.59), controlPoint2: CGPoint(x: 24.09, y: 0.51))
            stroke9Path.addCurve(to: CGPoint(x: 7.22, y: 0.51), controlPoint1: CGPoint(x: 17.69, y: 0.5), controlPoint2: CGPoint(x: 12.46, y: 0.5))
            stroke9Path.addCurve(to: CGPoint(x: 4.52, y: 0.85), controlPoint1: CGPoint(x: 6.31, y: 0.51), controlPoint2: CGPoint(x: 5.4, y: 0.57))
            stroke9Path.addCurve(to: CGPoint(x: 0.63, y: 5.54), controlPoint1: CGPoint(x: 2.55, y: 1.48), controlPoint2: CGPoint(x: 0.93, y: 3.15))
            stroke9Path.addCurve(to: CGPoint(x: 0.52, y: 8.58), controlPoint1: CGPoint(x: 0.5, y: 6.54), controlPoint2: CGPoint(x: 0.52, y: 7.56))
            stroke9Path.addCurve(to: CGPoint(x: 0.51, y: 19.49), controlPoint1: CGPoint(x: 0.5, y: 12.21), controlPoint2: CGPoint(x: 0.49, y: 15.85))
            stroke9Path.addCurve(to: CGPoint(x: 0.63, y: 24.5), controlPoint1: CGPoint(x: 0.51, y: 21.16), controlPoint2: CGPoint(x: 0.49, y: 22.84))
            stroke9Path.addCurve(to: CGPoint(x: 3.96, y: 29.17), controlPoint1: CGPoint(x: 0.8, y: 26.68), controlPoint2: CGPoint(x: 1.98, y: 28.24))
            stroke9Path.addCurve(to: CGPoint(x: 7.05, y: 29.71), controlPoint1: CGPoint(x: 4.93, y: 29.62), controlPoint2: CGPoint(x: 5.99, y: 29.71))
            stroke9Path.addCurve(to: CGPoint(x: 22.95, y: 29.71), controlPoint1: CGPoint(x: 12.35, y: 29.72), controlPoint2: CGPoint(x: 17.65, y: 29.72))
            stroke9Path.addCurve(to: CGPoint(x: 24.82, y: 29.57), controlPoint1: CGPoint(x: 23.58, y: 29.71), controlPoint2: CGPoint(x: 24.21, y: 29.68))
            stroke9Path.addCurve(to: CGPoint(x: 29.19, y: 26.13), controlPoint1: CGPoint(x: 26.89, y: 29.22), controlPoint2: CGPoint(x: 28.35, y: 28.06))
            stroke9Path.addCurve(to: CGPoint(x: 29.67, y: 22.97), controlPoint1: CGPoint(x: 29.62, y: 25.12), controlPoint2: CGPoint(x: 29.67, y: 24.04))
            stroke9Path.addCurve(to: CGPoint(x: 29.68, y: 15.13), controlPoint1: CGPoint(x: 29.69, y: 20.36), controlPoint2: CGPoint(x: 29.68, y: 17.74))
            stroke9Path.addLine(to: CGPoint(x: 29.69, y: 15.13))
            stroke9Path.addCurve(to: CGPoint(x: 29.68, y: 8.24), controlPoint1: CGPoint(x: 29.69, y: 12.83), controlPoint2: CGPoint(x: 29.7, y: 10.54))
            stroke9Path.addLine(to: CGPoint(x: 29.68, y: 8.24))
            stroke9Path.close()
            stroke9Path.miterLimit = 4;
            
            stroke9Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke9Path.lineWidth = 1
            stroke9Path.stroke()
            
//            let fillColor = UIColor(red: 0.715, green: 0.723, blue: 0.733, alpha: 1.000)
            
            //// Page-1
            //// Fill-3 Drawing
            let fill3Path = UIBezierPath()
            fill3Path.move(to: CGPoint(x: 9.08, y: 17.43))
            fill3Path.addCurve(to: CGPoint(x: 7.96, y: 17.32), controlPoint1: CGPoint(x: 8.62, y: 17.43), controlPoint2: CGPoint(x: 8.25, y: 17.39))
            fill3Path.addCurve(to: CGPoint(x: 7.37, y: 17.1), controlPoint1: CGPoint(x: 7.67, y: 17.25), controlPoint2: CGPoint(x: 7.48, y: 17.18))
            fill3Path.addCurve(to: CGPoint(x: 7.34, y: 16.91), controlPoint1: CGPoint(x: 7.34, y: 17.08), controlPoint2: CGPoint(x: 7.33, y: 17.01))
            fill3Path.addCurve(to: CGPoint(x: 7.38, y: 16.61), controlPoint1: CGPoint(x: 7.34, y: 16.81), controlPoint2: CGPoint(x: 7.36, y: 16.71))
            fill3Path.addCurve(to: CGPoint(x: 7.47, y: 16.32), controlPoint1: CGPoint(x: 7.41, y: 16.5), controlPoint2: CGPoint(x: 7.44, y: 16.41))
            fill3Path.addCurve(to: CGPoint(x: 7.58, y: 16.21), controlPoint1: CGPoint(x: 7.51, y: 16.24), controlPoint2: CGPoint(x: 7.55, y: 16.2))
            fill3Path.addCurve(to: CGPoint(x: 8.16, y: 16.39), controlPoint1: CGPoint(x: 7.76, y: 16.27), controlPoint2: CGPoint(x: 7.95, y: 16.33))
            fill3Path.addCurve(to: CGPoint(x: 8.96, y: 16.48), controlPoint1: CGPoint(x: 8.37, y: 16.45), controlPoint2: CGPoint(x: 8.63, y: 16.48))
            fill3Path.addCurve(to: CGPoint(x: 9.79, y: 16.33), controlPoint1: CGPoint(x: 9.28, y: 16.48), controlPoint2: CGPoint(x: 9.56, y: 16.43))
            fill3Path.addCurve(to: CGPoint(x: 10.14, y: 15.82), controlPoint1: CGPoint(x: 10.02, y: 16.24), controlPoint2: CGPoint(x: 10.14, y: 16.07))
            fill3Path.addCurve(to: CGPoint(x: 9.91, y: 15.3), controlPoint1: CGPoint(x: 10.14, y: 15.61), controlPoint2: CGPoint(x: 10.06, y: 15.44))
            fill3Path.addCurve(to: CGPoint(x: 9.1, y: 14.88), controlPoint1: CGPoint(x: 9.76, y: 15.17), controlPoint2: CGPoint(x: 9.49, y: 15.03))
            fill3Path.addCurve(to: CGPoint(x: 8.5, y: 14.61), controlPoint1: CGPoint(x: 8.89, y: 14.8), controlPoint2: CGPoint(x: 8.69, y: 14.71))
            fill3Path.addCurve(to: CGPoint(x: 8, y: 14.26), controlPoint1: CGPoint(x: 8.31, y: 14.51), controlPoint2: CGPoint(x: 8.14, y: 14.39))
            fill3Path.addCurve(to: CGPoint(x: 7.66, y: 13.78), controlPoint1: CGPoint(x: 7.86, y: 14.13), controlPoint2: CGPoint(x: 7.75, y: 13.97))
            fill3Path.addCurve(to: CGPoint(x: 7.54, y: 13.12), controlPoint1: CGPoint(x: 7.58, y: 13.6), controlPoint2: CGPoint(x: 7.54, y: 13.38))
            fill3Path.addCurve(to: CGPoint(x: 7.66, y: 12.54), controlPoint1: CGPoint(x: 7.54, y: 12.92), controlPoint2: CGPoint(x: 7.58, y: 12.73))
            fill3Path.addCurve(to: CGPoint(x: 8.02, y: 12.06), controlPoint1: CGPoint(x: 7.74, y: 12.36), controlPoint2: CGPoint(x: 7.86, y: 12.2))
            fill3Path.addCurve(to: CGPoint(x: 8.65, y: 11.75), controlPoint1: CGPoint(x: 8.19, y: 11.93), controlPoint2: CGPoint(x: 8.4, y: 11.83))
            fill3Path.addCurve(to: CGPoint(x: 9.57, y: 11.63), controlPoint1: CGPoint(x: 8.91, y: 11.67), controlPoint2: CGPoint(x: 9.21, y: 11.63))
            fill3Path.addCurve(to: CGPoint(x: 10.15, y: 11.64), controlPoint1: CGPoint(x: 9.8, y: 11.63), controlPoint2: CGPoint(x: 10, y: 11.63))
            fill3Path.addCurve(to: CGPoint(x: 10.53, y: 11.69), controlPoint1: CGPoint(x: 10.3, y: 11.65), controlPoint2: CGPoint(x: 10.43, y: 11.67))
            fill3Path.addCurve(to: CGPoint(x: 10.77, y: 11.74), controlPoint1: CGPoint(x: 10.63, y: 11.7), controlPoint2: CGPoint(x: 10.71, y: 11.72))
            fill3Path.addCurve(to: CGPoint(x: 10.94, y: 11.79), controlPoint1: CGPoint(x: 10.83, y: 11.76), controlPoint2: CGPoint(x: 10.89, y: 11.78))
            fill3Path.addCurve(to: CGPoint(x: 11.02, y: 11.97), controlPoint1: CGPoint(x: 10.99, y: 11.81), controlPoint2: CGPoint(x: 11.02, y: 11.87))
            fill3Path.addCurve(to: CGPoint(x: 10.97, y: 12.29), controlPoint1: CGPoint(x: 11.02, y: 12.07), controlPoint2: CGPoint(x: 11, y: 12.18))
            fill3Path.addCurve(to: CGPoint(x: 10.86, y: 12.59), controlPoint1: CGPoint(x: 10.95, y: 12.4), controlPoint2: CGPoint(x: 10.91, y: 12.5))
            fill3Path.addCurve(to: CGPoint(x: 10.72, y: 12.7), controlPoint1: CGPoint(x: 10.81, y: 12.67), controlPoint2: CGPoint(x: 10.77, y: 12.71))
            fill3Path.addCurve(to: CGPoint(x: 10.24, y: 12.58), controlPoint1: CGPoint(x: 10.6, y: 12.66), controlPoint2: CGPoint(x: 10.44, y: 12.62))
            fill3Path.addCurve(to: CGPoint(x: 9.65, y: 12.52), controlPoint1: CGPoint(x: 10.04, y: 12.54), controlPoint2: CGPoint(x: 9.84, y: 12.52))
            fill3Path.addCurve(to: CGPoint(x: 8.85, y: 12.68), controlPoint1: CGPoint(x: 9.26, y: 12.52), controlPoint2: CGPoint(x: 9, y: 12.58))
            fill3Path.addCurve(to: CGPoint(x: 8.63, y: 13.13), controlPoint1: CGPoint(x: 8.7, y: 12.79), controlPoint2: CGPoint(x: 8.63, y: 12.94))
            fill3Path.addCurve(to: CGPoint(x: 8.87, y: 13.6), controlPoint1: CGPoint(x: 8.63, y: 13.32), controlPoint2: CGPoint(x: 8.71, y: 13.48))
            fill3Path.addCurve(to: CGPoint(x: 9.64, y: 13.97), controlPoint1: CGPoint(x: 9.04, y: 13.72), controlPoint2: CGPoint(x: 9.29, y: 13.84))
            fill3Path.addCurve(to: CGPoint(x: 10.87, y: 14.72), controlPoint1: CGPoint(x: 10.2, y: 14.19), controlPoint2: CGPoint(x: 10.6, y: 14.44))
            fill3Path.addCurve(to: CGPoint(x: 11.26, y: 15.79), controlPoint1: CGPoint(x: 11.13, y: 15), controlPoint2: CGPoint(x: 11.26, y: 15.36))
            fill3Path.addCurve(to: CGPoint(x: 11.08, y: 16.59), controlPoint1: CGPoint(x: 11.26, y: 16.11), controlPoint2: CGPoint(x: 11.2, y: 16.38))
            fill3Path.addCurve(to: CGPoint(x: 10.59, y: 17.09), controlPoint1: CGPoint(x: 10.95, y: 16.8), controlPoint2: CGPoint(x: 10.79, y: 16.97))
            fill3Path.addCurve(to: CGPoint(x: 9.88, y: 17.35), controlPoint1: CGPoint(x: 10.38, y: 17.22), controlPoint2: CGPoint(x: 10.15, y: 17.3))
            fill3Path.addCurve(to: CGPoint(x: 9.08, y: 17.43), controlPoint1: CGPoint(x: 9.62, y: 17.41), controlPoint2: CGPoint(x: 9.35, y: 17.43))
            fill3Path.close()
            fill3Path.miterLimit = 4;
            
            fill3Path.usesEvenOddFillRule = true;
            
            fillColor.setFill()
            fill3Path.fill()
            
//            let fillColor = UIColor(red: 0.715, green: 0.723, blue: 0.733, alpha: 1.000)
            
            //// Page-1
            //// Fill-5 Drawing
            let fill5Path = UIBezierPath()
            fill5Path.move(to: CGPoint(x: 16.47, y: 17.38))
            fill5Path.addCurve(to: CGPoint(x: 16.19, y: 17.31), controlPoint1: CGPoint(x: 16.33, y: 17.38), controlPoint2: CGPoint(x: 16.23, y: 17.36))
            fill5Path.addCurve(to: CGPoint(x: 16.12, y: 17.03), controlPoint1: CGPoint(x: 16.14, y: 17.26), controlPoint2: CGPoint(x: 16.12, y: 17.17))
            fill5Path.addLine(to: CGPoint(x: 16.12, y: 13.44))
            fill5Path.addCurve(to: CGPoint(x: 15.49, y: 14.47), controlPoint1: CGPoint(x: 15.85, y: 13.89), controlPoint2: CGPoint(x: 15.64, y: 14.23))
            fill5Path.addCurve(to: CGPoint(x: 15.17, y: 15.01), controlPoint1: CGPoint(x: 15.34, y: 14.72), controlPoint2: CGPoint(x: 15.24, y: 14.89))
            fill5Path.addCurve(to: CGPoint(x: 15.04, y: 15.21), controlPoint1: CGPoint(x: 15.1, y: 15.12), controlPoint2: CGPoint(x: 15.06, y: 15.19))
            fill5Path.addCurve(to: CGPoint(x: 15.02, y: 15.25), controlPoint1: CGPoint(x: 15.03, y: 15.23), controlPoint2: CGPoint(x: 15.02, y: 15.24))
            fill5Path.addCurve(to: CGPoint(x: 14.9, y: 15.45), controlPoint1: CGPoint(x: 14.96, y: 15.35), controlPoint2: CGPoint(x: 14.92, y: 15.42))
            fill5Path.addCurve(to: CGPoint(x: 14.75, y: 15.49), controlPoint1: CGPoint(x: 14.87, y: 15.48), controlPoint2: CGPoint(x: 14.82, y: 15.49))
            fill5Path.addLine(to: CGPoint(x: 14.58, y: 15.49))
            fill5Path.addCurve(to: CGPoint(x: 14.41, y: 15.45), controlPoint1: CGPoint(x: 14.49, y: 15.49), controlPoint2: CGPoint(x: 14.44, y: 15.48))
            fill5Path.addCurve(to: CGPoint(x: 14.29, y: 15.25), controlPoint1: CGPoint(x: 14.38, y: 15.42), controlPoint2: CGPoint(x: 14.34, y: 15.35))
            fill5Path.addLine(to: CGPoint(x: 13.24, y: 13.46))
            fill5Path.addLine(to: CGPoint(x: 13.24, y: 17.09))
            fill5Path.addCurve(to: CGPoint(x: 13.19, y: 17.3), controlPoint1: CGPoint(x: 13.24, y: 17.18), controlPoint2: CGPoint(x: 13.22, y: 17.25))
            fill5Path.addCurve(to: CGPoint(x: 12.95, y: 17.38), controlPoint1: CGPoint(x: 13.16, y: 17.35), controlPoint2: CGPoint(x: 13.08, y: 17.38))
            fill5Path.addLine(to: CGPoint(x: 12.52, y: 17.38))
            fill5Path.addCurve(to: CGPoint(x: 12.27, y: 17.33), controlPoint1: CGPoint(x: 12.43, y: 17.38), controlPoint2: CGPoint(x: 12.34, y: 17.36))
            fill5Path.addCurve(to: CGPoint(x: 12.16, y: 17.03), controlPoint1: CGPoint(x: 12.2, y: 17.3), controlPoint2: CGPoint(x: 12.16, y: 17.2))
            fill5Path.addLine(to: CGPoint(x: 12.16, y: 12.11))
            fill5Path.addCurve(to: CGPoint(x: 12.24, y: 11.84), controlPoint1: CGPoint(x: 12.16, y: 11.97), controlPoint2: CGPoint(x: 12.19, y: 11.88))
            fill5Path.addCurve(to: CGPoint(x: 12.46, y: 11.77), controlPoint1: CGPoint(x: 12.29, y: 11.79), controlPoint2: CGPoint(x: 12.37, y: 11.77))
            fill5Path.addLine(to: CGPoint(x: 12.97, y: 11.77))
            fill5Path.addCurve(to: CGPoint(x: 13.16, y: 11.8), controlPoint1: CGPoint(x: 13.05, y: 11.77), controlPoint2: CGPoint(x: 13.11, y: 11.78))
            fill5Path.addCurve(to: CGPoint(x: 13.32, y: 11.96), controlPoint1: CGPoint(x: 13.21, y: 11.82), controlPoint2: CGPoint(x: 13.27, y: 11.87))
            fill5Path.addLine(to: CGPoint(x: 14.69, y: 14.13))
            fill5Path.addLine(to: CGPoint(x: 16.05, y: 11.98))
            fill5Path.addCurve(to: CGPoint(x: 16.2, y: 11.82), controlPoint1: CGPoint(x: 16.09, y: 11.9), controlPoint2: CGPoint(x: 16.14, y: 11.85))
            fill5Path.addCurve(to: CGPoint(x: 16.37, y: 11.77), controlPoint1: CGPoint(x: 16.26, y: 11.79), controlPoint2: CGPoint(x: 16.31, y: 11.77))
            fill5Path.addLine(to: CGPoint(x: 16.93, y: 11.77))
            fill5Path.addCurve(to: CGPoint(x: 17.16, y: 11.85), controlPoint1: CGPoint(x: 17.06, y: 11.77), controlPoint2: CGPoint(x: 17.14, y: 11.8))
            fill5Path.addCurve(to: CGPoint(x: 17.19, y: 12.12), controlPoint1: CGPoint(x: 17.18, y: 11.91), controlPoint2: CGPoint(x: 17.19, y: 12))
            fill5Path.addLine(to: CGPoint(x: 17.19, y: 17.08))
            fill5Path.addCurve(to: CGPoint(x: 17.15, y: 17.31), controlPoint1: CGPoint(x: 17.19, y: 17.18), controlPoint2: CGPoint(x: 17.17, y: 17.26))
            fill5Path.addCurve(to: CGPoint(x: 16.91, y: 17.38), controlPoint1: CGPoint(x: 17.12, y: 17.36), controlPoint2: CGPoint(x: 17.04, y: 17.38))
            fill5Path.addLine(to: CGPoint(x: 16.47, y: 17.38))
            fill5Path.close()
            fill5Path.miterLimit = 4;
            
            fill5Path.usesEvenOddFillRule = true;
            
            fillColor.setFill()
            fill5Path.fill()
            
//            let fillColor = UIColor(red: 0.715, green: 0.723, blue: 0.733, alpha: 1.000)
            
            //// Page-1
            //// Fill-7 Drawing
            let fill7Path = UIBezierPath()
            fill7Path.move(to: CGPoint(x: 19.88, y: 17.43))
            fill7Path.addCurve(to: CGPoint(x: 18.77, y: 17.32), controlPoint1: CGPoint(x: 19.42, y: 17.43), controlPoint2: CGPoint(x: 19.05, y: 17.39))
            fill7Path.addCurve(to: CGPoint(x: 18.17, y: 17.1), controlPoint1: CGPoint(x: 18.48, y: 17.25), controlPoint2: CGPoint(x: 18.28, y: 17.18))
            fill7Path.addCurve(to: CGPoint(x: 18.14, y: 16.91), controlPoint1: CGPoint(x: 18.14, y: 17.08), controlPoint2: CGPoint(x: 18.13, y: 17.01))
            fill7Path.addCurve(to: CGPoint(x: 18.19, y: 16.61), controlPoint1: CGPoint(x: 18.15, y: 16.81), controlPoint2: CGPoint(x: 18.16, y: 16.71))
            fill7Path.addCurve(to: CGPoint(x: 18.28, y: 16.33), controlPoint1: CGPoint(x: 18.21, y: 16.5), controlPoint2: CGPoint(x: 18.24, y: 16.41))
            fill7Path.addCurve(to: CGPoint(x: 18.39, y: 16.21), controlPoint1: CGPoint(x: 18.32, y: 16.24), controlPoint2: CGPoint(x: 18.35, y: 16.2))
            fill7Path.addCurve(to: CGPoint(x: 18.97, y: 16.39), controlPoint1: CGPoint(x: 18.56, y: 16.27), controlPoint2: CGPoint(x: 18.76, y: 16.33))
            fill7Path.addCurve(to: CGPoint(x: 19.76, y: 16.48), controlPoint1: CGPoint(x: 19.17, y: 16.45), controlPoint2: CGPoint(x: 19.44, y: 16.48))
            fill7Path.addCurve(to: CGPoint(x: 20.6, y: 16.33), controlPoint1: CGPoint(x: 20.09, y: 16.48), controlPoint2: CGPoint(x: 20.37, y: 16.43))
            fill7Path.addCurve(to: CGPoint(x: 20.94, y: 15.82), controlPoint1: CGPoint(x: 20.82, y: 16.24), controlPoint2: CGPoint(x: 20.94, y: 16.07))
            fill7Path.addCurve(to: CGPoint(x: 20.71, y: 15.3), controlPoint1: CGPoint(x: 20.94, y: 15.61), controlPoint2: CGPoint(x: 20.86, y: 15.44))
            fill7Path.addCurve(to: CGPoint(x: 19.9, y: 14.88), controlPoint1: CGPoint(x: 20.56, y: 15.17), controlPoint2: CGPoint(x: 20.29, y: 15.03))
            fill7Path.addCurve(to: CGPoint(x: 19.3, y: 14.61), controlPoint1: CGPoint(x: 19.69, y: 14.8), controlPoint2: CGPoint(x: 19.49, y: 14.71))
            fill7Path.addCurve(to: CGPoint(x: 18.81, y: 14.26), controlPoint1: CGPoint(x: 19.12, y: 14.51), controlPoint2: CGPoint(x: 18.95, y: 14.39))
            fill7Path.addCurve(to: CGPoint(x: 18.47, y: 13.78), controlPoint1: CGPoint(x: 18.66, y: 14.13), controlPoint2: CGPoint(x: 18.55, y: 13.97))
            fill7Path.addCurve(to: CGPoint(x: 18.34, y: 13.13), controlPoint1: CGPoint(x: 18.39, y: 13.6), controlPoint2: CGPoint(x: 18.34, y: 13.38))
            fill7Path.addCurve(to: CGPoint(x: 18.46, y: 12.54), controlPoint1: CGPoint(x: 18.34, y: 12.92), controlPoint2: CGPoint(x: 18.38, y: 12.73))
            fill7Path.addCurve(to: CGPoint(x: 18.83, y: 12.06), controlPoint1: CGPoint(x: 18.54, y: 12.36), controlPoint2: CGPoint(x: 18.66, y: 12.2))
            fill7Path.addCurve(to: CGPoint(x: 19.46, y: 11.75), controlPoint1: CGPoint(x: 18.99, y: 11.93), controlPoint2: CGPoint(x: 19.2, y: 11.83))
            fill7Path.addCurve(to: CGPoint(x: 20.37, y: 11.63), controlPoint1: CGPoint(x: 19.71, y: 11.67), controlPoint2: CGPoint(x: 20.02, y: 11.63))
            fill7Path.addCurve(to: CGPoint(x: 20.95, y: 11.64), controlPoint1: CGPoint(x: 20.61, y: 11.63), controlPoint2: CGPoint(x: 20.8, y: 11.63))
            fill7Path.addCurve(to: CGPoint(x: 21.33, y: 11.69), controlPoint1: CGPoint(x: 21.11, y: 11.65), controlPoint2: CGPoint(x: 21.23, y: 11.67))
            fill7Path.addCurve(to: CGPoint(x: 21.57, y: 11.74), controlPoint1: CGPoint(x: 21.43, y: 11.7), controlPoint2: CGPoint(x: 21.51, y: 11.72))
            fill7Path.addCurve(to: CGPoint(x: 21.75, y: 11.79), controlPoint1: CGPoint(x: 21.64, y: 11.76), controlPoint2: CGPoint(x: 21.69, y: 11.78))
            fill7Path.addCurve(to: CGPoint(x: 21.82, y: 11.97), controlPoint1: CGPoint(x: 21.8, y: 11.81), controlPoint2: CGPoint(x: 21.82, y: 11.87))
            fill7Path.addCurve(to: CGPoint(x: 21.78, y: 12.29), controlPoint1: CGPoint(x: 21.82, y: 12.07), controlPoint2: CGPoint(x: 21.81, y: 12.18))
            fill7Path.addCurve(to: CGPoint(x: 21.67, y: 12.59), controlPoint1: CGPoint(x: 21.75, y: 12.4), controlPoint2: CGPoint(x: 21.71, y: 12.5))
            fill7Path.addCurve(to: CGPoint(x: 21.52, y: 12.7), controlPoint1: CGPoint(x: 21.62, y: 12.67), controlPoint2: CGPoint(x: 21.57, y: 12.71))
            fill7Path.addCurve(to: CGPoint(x: 21.05, y: 12.58), controlPoint1: CGPoint(x: 21.41, y: 12.66), controlPoint2: CGPoint(x: 21.25, y: 12.62))
            fill7Path.addCurve(to: CGPoint(x: 20.46, y: 12.52), controlPoint1: CGPoint(x: 20.85, y: 12.54), controlPoint2: CGPoint(x: 20.65, y: 12.52))
            fill7Path.addCurve(to: CGPoint(x: 19.65, y: 12.68), controlPoint1: CGPoint(x: 20.07, y: 12.52), controlPoint2: CGPoint(x: 19.8, y: 12.58))
            fill7Path.addCurve(to: CGPoint(x: 19.43, y: 13.13), controlPoint1: CGPoint(x: 19.51, y: 12.79), controlPoint2: CGPoint(x: 19.43, y: 12.94))
            fill7Path.addCurve(to: CGPoint(x: 19.68, y: 13.6), controlPoint1: CGPoint(x: 19.43, y: 13.32), controlPoint2: CGPoint(x: 19.51, y: 13.48))
            fill7Path.addCurve(to: CGPoint(x: 20.45, y: 13.97), controlPoint1: CGPoint(x: 19.84, y: 13.72), controlPoint2: CGPoint(x: 20.1, y: 13.84))
            fill7Path.addCurve(to: CGPoint(x: 21.67, y: 14.72), controlPoint1: CGPoint(x: 21, y: 14.19), controlPoint2: CGPoint(x: 21.41, y: 14.44))
            fill7Path.addCurve(to: CGPoint(x: 22.07, y: 15.79), controlPoint1: CGPoint(x: 21.94, y: 15), controlPoint2: CGPoint(x: 22.07, y: 15.36))
            fill7Path.addCurve(to: CGPoint(x: 21.88, y: 16.59), controlPoint1: CGPoint(x: 22.07, y: 16.11), controlPoint2: CGPoint(x: 22.01, y: 16.38))
            fill7Path.addCurve(to: CGPoint(x: 21.39, y: 17.09), controlPoint1: CGPoint(x: 21.76, y: 16.8), controlPoint2: CGPoint(x: 21.6, y: 16.97))
            fill7Path.addCurve(to: CGPoint(x: 20.69, y: 17.35), controlPoint1: CGPoint(x: 21.19, y: 17.22), controlPoint2: CGPoint(x: 20.95, y: 17.3))
            fill7Path.addCurve(to: CGPoint(x: 19.88, y: 17.43), controlPoint1: CGPoint(x: 20.42, y: 17.41), controlPoint2: CGPoint(x: 20.16, y: 17.43))
            fill7Path.close()
            fill7Path.miterLimit = 4;
            
            fill7Path.usesEvenOddFillRule = true;
            
            fillColor.setFill()
            fill7Path.fill()
        }
        else if(data == "mail"){
            
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 32, height: 32), false, 0)
            let strokeColor = UIColor(red: 0.715, green: 0.723, blue: 0.733, alpha: 1.000)
            let fillColor = UIColor(red: 0.715, green: 0.723, blue: 0.733, alpha: 1.000)
            //// Page-1
            //// Stroke-1 Drawing
            let stroke1Path = UIBezierPath()
            stroke1Path.move(to: CGPoint(x: 30.68, y: 8.24))
            stroke1Path.addCurve(to: CGPoint(x: 30.52, y: 5.33), controlPoint1: CGPoint(x: 30.67, y: 7.27), controlPoint2: CGPoint(x: 30.67, y: 6.29))
            stroke1Path.addCurve(to: CGPoint(x: 27.33, y: 1.11), controlPoint1: CGPoint(x: 30.21, y: 3.38), controlPoint2: CGPoint(x: 29.11, y: 1.97))
            stroke1Path.addCurve(to: CGPoint(x: 23.93, y: 0.51), controlPoint1: CGPoint(x: 26.26, y: 0.59), controlPoint2: CGPoint(x: 25.09, y: 0.51))
            stroke1Path.addCurve(to: CGPoint(x: 8.22, y: 0.51), controlPoint1: CGPoint(x: 18.69, y: 0.5), controlPoint2: CGPoint(x: 13.46, y: 0.5))
            stroke1Path.addCurve(to: CGPoint(x: 5.52, y: 0.85), controlPoint1: CGPoint(x: 7.31, y: 0.51), controlPoint2: CGPoint(x: 6.4, y: 0.57))
            stroke1Path.addCurve(to: CGPoint(x: 1.63, y: 5.54), controlPoint1: CGPoint(x: 3.55, y: 1.48), controlPoint2: CGPoint(x: 1.93, y: 3.15))
            stroke1Path.addCurve(to: CGPoint(x: 1.52, y: 8.58), controlPoint1: CGPoint(x: 1.5, y: 6.54), controlPoint2: CGPoint(x: 1.52, y: 7.56))
            stroke1Path.addCurve(to: CGPoint(x: 1.51, y: 19.49), controlPoint1: CGPoint(x: 1.5, y: 12.21), controlPoint2: CGPoint(x: 1.49, y: 15.85))
            stroke1Path.addCurve(to: CGPoint(x: 1.63, y: 24.5), controlPoint1: CGPoint(x: 1.51, y: 21.16), controlPoint2: CGPoint(x: 1.49, y: 22.84))
            stroke1Path.addCurve(to: CGPoint(x: 4.96, y: 29.17), controlPoint1: CGPoint(x: 1.8, y: 26.68), controlPoint2: CGPoint(x: 2.98, y: 28.24))
            stroke1Path.addCurve(to: CGPoint(x: 8.05, y: 29.71), controlPoint1: CGPoint(x: 5.93, y: 29.62), controlPoint2: CGPoint(x: 6.99, y: 29.71))
            stroke1Path.addCurve(to: CGPoint(x: 23.95, y: 29.71), controlPoint1: CGPoint(x: 13.35, y: 29.72), controlPoint2: CGPoint(x: 18.65, y: 29.72))
            stroke1Path.addCurve(to: CGPoint(x: 25.82, y: 29.57), controlPoint1: CGPoint(x: 24.58, y: 29.71), controlPoint2: CGPoint(x: 25.21, y: 29.68))
            stroke1Path.addCurve(to: CGPoint(x: 30.19, y: 26.13), controlPoint1: CGPoint(x: 27.89, y: 29.22), controlPoint2: CGPoint(x: 29.35, y: 28.06))
            stroke1Path.addCurve(to: CGPoint(x: 30.67, y: 22.97), controlPoint1: CGPoint(x: 30.62, y: 25.12), controlPoint2: CGPoint(x: 30.67, y: 24.04))
            stroke1Path.addCurve(to: CGPoint(x: 30.68, y: 15.13), controlPoint1: CGPoint(x: 30.69, y: 20.36), controlPoint2: CGPoint(x: 30.68, y: 17.74))
            stroke1Path.addLine(to: CGPoint(x: 30.69, y: 15.13))
            stroke1Path.addCurve(to: CGPoint(x: 30.68, y: 8.24), controlPoint1: CGPoint(x: 30.69, y: 12.83), controlPoint2: CGPoint(x: 30.7, y: 10.54))
            stroke1Path.addLine(to: CGPoint(x: 30.68, y: 8.24))
            stroke1Path.close()
            stroke1Path.miterLimit = 4;
            
            stroke1Path.usesEvenOddFillRule = true;
            
            strokeColor.setStroke()
            stroke1Path.lineWidth = 1
            stroke1Path.stroke()
            
            let fill3Path = UIBezierPath()
            fill3Path.move(to: CGPoint(x: 16.5, y: 9.22))
            fill3Path.addCurve(to: CGPoint(x: 16.7, y: 9.87), controlPoint1: CGPoint(x: 16.63, y: 9.37), controlPoint2: CGPoint(x: 16.7, y: 9.59))
            fill3Path.addCurve(to: CGPoint(x: 16.55, y: 10.68), controlPoint1: CGPoint(x: 16.7, y: 10.12), controlPoint2: CGPoint(x: 16.65, y: 10.39))
            fill3Path.addCurve(to: CGPoint(x: 16.21, y: 11.35), controlPoint1: CGPoint(x: 16.46, y: 10.97), controlPoint2: CGPoint(x: 16.34, y: 11.2))
            fill3Path.addCurve(to: CGPoint(x: 15.93, y: 11.58), controlPoint1: CGPoint(x: 16.12, y: 11.45), controlPoint2: CGPoint(x: 16.03, y: 11.53))
            fill3Path.addCurve(to: CGPoint(x: 15.54, y: 11.68), controlPoint1: CGPoint(x: 15.81, y: 11.65), controlPoint2: CGPoint(x: 15.68, y: 11.68))
            fill3Path.addCurve(to: CGPoint(x: 15.06, y: 11.46), controlPoint1: CGPoint(x: 15.35, y: 11.68), controlPoint2: CGPoint(x: 15.19, y: 11.61))
            fill3Path.addCurve(to: CGPoint(x: 14.87, y: 10.76), controlPoint1: CGPoint(x: 14.93, y: 11.31), controlPoint2: CGPoint(x: 14.87, y: 11.08))
            fill3Path.addCurve(to: CGPoint(x: 15.01, y: 9.95), controlPoint1: CGPoint(x: 14.87, y: 10.53), controlPoint2: CGPoint(x: 14.91, y: 10.26))
            fill3Path.addCurve(to: CGPoint(x: 15.41, y: 9.24), controlPoint1: CGPoint(x: 15.1, y: 9.64), controlPoint2: CGPoint(x: 15.23, y: 9.41))
            fill3Path.addCurve(to: CGPoint(x: 16.01, y: 9), controlPoint1: CGPoint(x: 15.6, y: 9.08), controlPoint2: CGPoint(x: 15.79, y: 9))
            fill3Path.addCurve(to: CGPoint(x: 16.5, y: 9.22), controlPoint1: CGPoint(x: 16.21, y: 9), controlPoint2: CGPoint(x: 16.37, y: 9.07))
            fill3Path.addLine(to: CGPoint(x: 16.5, y: 9.22))
            fill3Path.close()
            fill3Path.move(to: CGPoint(x: 26.51, y: 23.22))
            fill3Path.addLine(to: CGPoint(x: 18.24, y: 16.82))
            fill3Path.addLine(to: CGPoint(x: 26.51, y: 11.27))
            fill3Path.addLine(to: CGPoint(x: 26.51, y: 23.22))
            fill3Path.close()
            fill3Path.move(to: CGPoint(x: 6.31, y: 23.64))
            fill3Path.addLine(to: CGPoint(x: 16.1, y: 16.07))
            fill3Path.addLine(to: CGPoint(x: 25.88, y: 23.64))
            fill3Path.addLine(to: CGPoint(x: 6.31, y: 23.64))
            fill3Path.close()
            fill3Path.move(to: CGPoint(x: 5.68, y: 11.27))
            fill3Path.addLine(to: CGPoint(x: 13.95, y: 16.82))
            fill3Path.addLine(to: CGPoint(x: 5.68, y: 23.22))
            fill3Path.addLine(to: CGPoint(x: 5.68, y: 11.27))
            fill3Path.close()
            fill3Path.move(to: CGPoint(x: 13, y: 8.61))
            fill3Path.addCurve(to: CGPoint(x: 14.35, y: 7.26), controlPoint1: CGPoint(x: 13.33, y: 8.01), controlPoint2: CGPoint(x: 13.78, y: 7.56))
            fill3Path.addCurve(to: CGPoint(x: 16.32, y: 6.81), controlPoint1: CGPoint(x: 14.93, y: 6.96), controlPoint2: CGPoint(x: 15.58, y: 6.81))
            fill3Path.addCurve(to: CGPoint(x: 17.99, y: 7.17), controlPoint1: CGPoint(x: 16.94, y: 6.81), controlPoint2: CGPoint(x: 17.5, y: 6.93))
            fill3Path.addCurve(to: CGPoint(x: 19.11, y: 8.21), controlPoint1: CGPoint(x: 18.48, y: 7.42), controlPoint2: CGPoint(x: 18.85, y: 7.76))
            fill3Path.addCurve(to: CGPoint(x: 19.49, y: 9.68), controlPoint1: CGPoint(x: 19.36, y: 8.66), controlPoint2: CGPoint(x: 19.49, y: 9.15))
            fill3Path.addCurve(to: CGPoint(x: 18.9, y: 11.4), controlPoint1: CGPoint(x: 19.49, y: 10.31), controlPoint2: CGPoint(x: 19.3, y: 10.88))
            fill3Path.addCurve(to: CGPoint(x: 17.02, y: 12.36), controlPoint1: CGPoint(x: 18.41, y: 12.04), controlPoint2: CGPoint(x: 17.79, y: 12.36))
            fill3Path.addCurve(to: CGPoint(x: 16.56, y: 12.26), controlPoint1: CGPoint(x: 16.82, y: 12.36), controlPoint2: CGPoint(x: 16.66, y: 12.33))
            fill3Path.addCurve(to: CGPoint(x: 16.35, y: 11.94), controlPoint1: CGPoint(x: 16.45, y: 12.18), controlPoint2: CGPoint(x: 16.38, y: 12.08))
            fill3Path.addCurve(to: CGPoint(x: 15.34, y: 12.37), controlPoint1: CGPoint(x: 16.06, y: 12.22), controlPoint2: CGPoint(x: 15.72, y: 12.37))
            fill3Path.addCurve(to: CGPoint(x: 14.31, y: 11.94), controlPoint1: CGPoint(x: 14.92, y: 12.37), controlPoint2: CGPoint(x: 14.58, y: 12.22))
            fill3Path.addCurve(to: CGPoint(x: 13.9, y: 10.81), controlPoint1: CGPoint(x: 14.04, y: 11.66), controlPoint2: CGPoint(x: 13.9, y: 11.28))
            fill3Path.addCurve(to: CGPoint(x: 14.39, y: 9.21), controlPoint1: CGPoint(x: 13.9, y: 10.22), controlPoint2: CGPoint(x: 14.07, y: 9.69))
            fill3Path.addCurve(to: CGPoint(x: 15.92, y: 8.33), controlPoint1: CGPoint(x: 14.79, y: 8.62), controlPoint2: CGPoint(x: 15.3, y: 8.33))
            fill3Path.addCurve(to: CGPoint(x: 16.9, y: 8.83), controlPoint1: CGPoint(x: 16.36, y: 8.33), controlPoint2: CGPoint(x: 16.69, y: 8.5))
            fill3Path.addLine(to: CGPoint(x: 16.99, y: 8.42))
            fill3Path.addLine(to: CGPoint(x: 17.98, y: 8.42))
            fill3Path.addLine(to: CGPoint(x: 17.42, y: 11.09))
            fill3Path.addCurve(to: CGPoint(x: 17.36, y: 11.42), controlPoint1: CGPoint(x: 17.38, y: 11.26), controlPoint2: CGPoint(x: 17.36, y: 11.37))
            fill3Path.addCurve(to: CGPoint(x: 17.41, y: 11.56), controlPoint1: CGPoint(x: 17.36, y: 11.48), controlPoint2: CGPoint(x: 17.38, y: 11.53))
            fill3Path.addCurve(to: CGPoint(x: 17.51, y: 11.61), controlPoint1: CGPoint(x: 17.43, y: 11.59), controlPoint2: CGPoint(x: 17.47, y: 11.61))
            fill3Path.addCurve(to: CGPoint(x: 17.97, y: 11.39), controlPoint1: CGPoint(x: 17.63, y: 11.61), controlPoint2: CGPoint(x: 17.78, y: 11.54))
            fill3Path.addCurve(to: CGPoint(x: 18.59, y: 10.63), controlPoint1: CGPoint(x: 18.22, y: 11.2), controlPoint2: CGPoint(x: 18.43, y: 10.95))
            fill3Path.addCurve(to: CGPoint(x: 18.82, y: 9.64), controlPoint1: CGPoint(x: 18.74, y: 10.31), controlPoint2: CGPoint(x: 18.82, y: 9.98))
            fill3Path.addCurve(to: CGPoint(x: 18.16, y: 8.11), controlPoint1: CGPoint(x: 18.82, y: 9.03), controlPoint2: CGPoint(x: 18.6, y: 8.52))
            fill3Path.addCurve(to: CGPoint(x: 16.31, y: 7.49), controlPoint1: CGPoint(x: 17.71, y: 7.7), controlPoint2: CGPoint(x: 17.1, y: 7.49))
            fill3Path.addCurve(to: CGPoint(x: 14.59, y: 7.91), controlPoint1: CGPoint(x: 15.63, y: 7.49), controlPoint2: CGPoint(x: 15.06, y: 7.63))
            fill3Path.addCurve(to: CGPoint(x: 13.53, y: 9.06), controlPoint1: CGPoint(x: 14.13, y: 8.18), controlPoint2: CGPoint(x: 13.77, y: 8.57))
            fill3Path.addCurve(to: CGPoint(x: 13.18, y: 10.62), controlPoint1: CGPoint(x: 13.3, y: 9.56), controlPoint2: CGPoint(x: 13.18, y: 10.08))
            fill3Path.addCurve(to: CGPoint(x: 13.58, y: 12.05), controlPoint1: CGPoint(x: 13.18, y: 11.14), controlPoint2: CGPoint(x: 13.31, y: 11.62))
            fill3Path.addCurve(to: CGPoint(x: 14.69, y: 12.99), controlPoint1: CGPoint(x: 13.84, y: 12.48), controlPoint2: CGPoint(x: 14.21, y: 12.79))
            fill3Path.addCurve(to: CGPoint(x: 16.33, y: 13.29), controlPoint1: CGPoint(x: 15.17, y: 13.19), controlPoint2: CGPoint(x: 15.72, y: 13.29))
            fill3Path.addCurve(to: CGPoint(x: 17.86, y: 13.04), controlPoint1: CGPoint(x: 16.92, y: 13.29), controlPoint2: CGPoint(x: 17.43, y: 13.2))
            fill3Path.addCurve(to: CGPoint(x: 18.89, y: 12.29), controlPoint1: CGPoint(x: 18.29, y: 12.87), controlPoint2: CGPoint(x: 18.63, y: 12.63))
            fill3Path.addLine(to: CGPoint(x: 19.69, y: 12.29))
            fill3Path.addCurve(to: CGPoint(x: 18.54, y: 13.48), controlPoint1: CGPoint(x: 19.44, y: 12.8), controlPoint2: CGPoint(x: 19.06, y: 13.19))
            fill3Path.addCurve(to: CGPoint(x: 16.39, y: 13.97), controlPoint1: CGPoint(x: 17.96, y: 13.81), controlPoint2: CGPoint(x: 17.24, y: 13.97))
            fill3Path.addCurve(to: CGPoint(x: 14.27, y: 13.56), controlPoint1: CGPoint(x: 15.57, y: 13.97), controlPoint2: CGPoint(x: 14.86, y: 13.83))
            fill3Path.addCurve(to: CGPoint(x: 12.94, y: 12.33), controlPoint1: CGPoint(x: 13.67, y: 13.28), controlPoint2: CGPoint(x: 13.23, y: 12.87))
            fill3Path.addCurve(to: CGPoint(x: 12.5, y: 10.57), controlPoint1: CGPoint(x: 12.65, y: 11.79), controlPoint2: CGPoint(x: 12.5, y: 11.2))
            fill3Path.addCurve(to: CGPoint(x: 13, y: 8.61), controlPoint1: CGPoint(x: 12.5, y: 9.87), controlPoint2: CGPoint(x: 12.67, y: 9.22))
            fill3Path.addLine(to: CGPoint(x: 13, y: 8.61))
            fill3Path.close()
            fill3Path.move(to: CGPoint(x: 16.1, y: 2.65))
            fill3Path.addLine(to: CGPoint(x: 4.89, y: 11.01))
            fill3Path.addLine(to: CGPoint(x: 4.89, y: 24.31))
            fill3Path.addLine(to: CGPoint(x: 27.3, y: 24.31))
            fill3Path.addLine(to: CGPoint(x: 27.3, y: 11.01))
            fill3Path.addLine(to: CGPoint(x: 16.1, y: 2.65))
            fill3Path.close()
            fill3Path.miterLimit = 4;
            
            fill3Path.usesEvenOddFillRule = true;
            
            fillColor.setFill()
            fill3Path.fill()
        }
        let imgbgc = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageViewtool: UIImageView = UIImageView()
        imageViewtool.image = imgbgc
        imageViewtool.translatesAutoresizingMaskIntoConstraints = false
        return imageViewtool
    }
}
