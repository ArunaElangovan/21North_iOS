//
//  loadingPage.swift
//  LoadingCircle
//
//  Created by Sachin Tomar on 09/09/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation
import UIKit

class LoadingPage{

    let drawservicing = DrawServicing()
    let style = Style()
    
    func networkIssue(view1:UIView, width:CGFloat)->UIView{
        let networkView = UIView()
        networkView.frame = CGRect(x: 0, y: -100, width: width, height: 100)
        networkView.backgroundColor = UIColor.black
        
        let companyLogo = Companylogo()
        let logo21 = companyLogo.net()
        networkView.addSubview(logo21)
        logo21.translatesAutoresizingMaskIntoConstraints = false
        let gap = (width-44)/2
        networkView.addConstraintsWithFormat("H:|-(\(gap))-[v0]", views: logo21)
        
        let line2 = drawservicing.drawLine(-3, y: 22, width: 50, color: "service")
        logo21.layer.addSublayer(line2)
        
        let contentLabel1 = drawservicing.makeLabel("We are unable to reach the network at the moment.", screenWidth: width, heading: "heading")
        contentLabel1.font = style.networkFont
        contentLabel1.textColor = style.networkFontColor
        contentLabel1.textAlignment = .center
        networkView.addSubview(contentLabel1)
        networkView.addConstraintsWithFormat("H:|[v0]|", views: contentLabel1)
        
        let contentLabel2 = drawservicing.makeLabel("Please try again after sometime alternatively", screenWidth: width, heading: "heading")
        contentLabel2.font = style.networkFont
        contentLabel2.textColor = style.networkFontColor
        contentLabel2.textAlignment = .center
        networkView.addSubview(contentLabel2)
        networkView.addConstraintsWithFormat("H:|[v0]|", views: contentLabel2)
        
        let contentLabel3 = drawservicing.makeLabel("please disable wifi and retry", screenWidth: width, heading: "heading")
        contentLabel3.font = style.networkFont
        contentLabel3.textColor = style.networkFontColor
        contentLabel3.textAlignment = .center
        networkView.addSubview(contentLabel3)
        networkView.addConstraintsWithFormat("H:|[v0]|", views: contentLabel3)
        
        networkView.addConstraintsWithFormat("V:|-17-[v0(20)]-11-[v1][v2][v3]", views: logo21, contentLabel1, contentLabel2, contentLabel3)
        
        return networkView
    }
    func loadingViewMake(_ view1:UIView, width:CGFloat, height:CGFloat) -> UIView{
        let loadingView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        loadingView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        var loadingView2 = RVEffort()
        loadingView2 = RVEffort(frame: CGRect(x: (width-80)/2, y: (height-100)/2, width: 100, height: 100))
        loadingView.addSubview(loadingView2)
        loadingView2.addStartAnimation()
       
        return loadingView
    }
    func loadImageFromPath() -> UIImage? {
        
        let imagePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc") as String
        
        let path = imagePath + "/profileImage.jpg"
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
        }
//        print("Loading image from path: \(path)")
        return image
        
    }
    func dateChange(date1: String)->String{
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        let date = dateFormatter.date(from: date1)
        
        // To convert the date into an HH:mm format
        dateFormatter.dateFormat = "yyyy-MM-dd" // or //h:mm a
        let dateString = dateFormatter.string(from: date!)
        return dateString
    }
    func datePickerFormatting(date1:String)->String{
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        let date = dateFormatter.date(from: date1)
        
        // To convert the date into an HH:mm format
        dateFormatter.dateFormat = "MMMM dd, yyyy" // or //h:mm a
        var dateString: String!
        if(date != nil){
            dateString = dateFormatter.string(from: date!)
        }
        else{
            dateString = date1
        }
        return dateString
    }
    func dateToSystem(_ date1: String)->String{
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let date = dateFormatter.date(from: date1)
        
        // To convert the date into an HH:mm format
        dateFormatter.dateFormat = "yyyy-MM-dd" // or //h:mm a
        let dateString = dateFormatter.string(from: date!)
        return dateString
    }
    func dateFormateChange(_ date: String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
            if dateFormatter.date(from: date) != nil{
                let date = dateFormatter.date(from: date)
                
                // To convert the date into an HH:mm format
                dateFormatter.dateFormat = "MMMM dd, yyyy" // or //h:mm a
                let dateString = dateFormatter.string(from: date!)
                return dateString
            }
        return "Null"
    }
    func timeTo12(_ time: String) ->String{
        if(time != "(null)"){
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm:ss"
        let date = dateFormatter.date(from: time)
        
        // To convert the date into an HH:mm format
        dateFormatter.dateFormat = "hh:mm a" // or //h:mm a
        let dateString = dateFormatter.string(from: date!)
        
        return dateString
        }
        return "Slot Not Available"
    }
    func timeTo24(_ time: String)-> String{
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "hh:mm a"
        let date = dateFormatter.date(from: time)
        
        // To convert the date into an HH:mm format
        dateFormatter.dateFormat = "HH:mm" // or //h:mm a
        let dateString = dateFormatter.string(from: date!)
        return dateString
    }
    func getNumberOfDays(_ year1: Int, month1: Int, holidays:[String])->[Int]{
        let datecur = Date()
        let calendarcur = Calendar.current
        let componentscur = (calendarcur as NSCalendar).components([.day , .month , .year], from: datecur)
        let date1 = componentscur.day
        let month2 = componentscur.month!
        let yearForDays = componentscur.year!
        if(yearForDays == year1){
        
        }
        if(month2 == month1){
            
        }
        var array = [1]
        var dateComponents = DateComponents()
        dateComponents.year = year1
        dateComponents.month = month1
        
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        let range = (calendar as NSCalendar).range(of: .day, in: .month, for: date)
        let numDays = range.length
        array.removeAll()
        for index in 0 ..< numDays{
            var check = 0
            for i in 0 ..< holidays.count{
                if(index+1 == Int(holidays[i])){
                    check = 1
                }
            }
            if(check == 0){
                if(yearForDays == year1 && month2 == month1){
                        if(index+1 >= date1!){
                            array.append(index+1)
                        }
                }
                else{
                    array.append(index+1)
                }
            }
        }
        return array
    }
    let strokeEndAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let group = CAAnimationGroup()
        group.duration = 2.5
        group.repeatCount = MAXFLOAT
        group.animations = [animation]
        
        return group
    }()
    let strokeStartAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.beginTime = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let group = CAAnimationGroup()
        group.duration = 2.5
        group.repeatCount = MAXFLOAT
        group.animations = [animation]
        
        return group
    }()
}
