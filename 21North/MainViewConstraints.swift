//
//  MainViewConstraints.swift
//  21North
//
//  Created by Sachin Tomar on 08/06/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit

class MainViewConstraints: UIViewController {
    
    func mainViewConstraints(_ note:UILabel, number: UILabel, numberText: UITextField, mainView: UIView){
        
        var viewsDictionary = Dictionary<String, UIView>()
        viewsDictionary = ["note": note, "number": number, "numberText": numberText]
        
        
        let noteHorConstraints:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[note]|", options: .alignAllCenterY, metrics: nil, views: viewsDictionary) as NSArray
        mainView.addConstraints(noteHorConstraints as! [NSLayoutConstraint])
        
        let noteVerConstraints:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-142-[note]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
        mainView.addConstraints(noteVerConstraints as! [NSLayoutConstraint])
        let  width = UIScreen.main.bounds.width
        let gap = width/2
        
        let noteHorConstraints1:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[number(\(gap-40))]-2-[numberText]|", options: .alignAllCenterY, metrics: nil, views: viewsDictionary) as NSArray
        mainView.addConstraints(noteHorConstraints1 as! [NSLayoutConstraint])
        
        let noteVerConstraints1:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-183-[number]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
        mainView.addConstraints(noteVerConstraints1 as! [NSLayoutConstraint])
        
        let noteVerConstraints2:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-183-[numberText]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
        mainView.addConstraints(noteVerConstraints2 as! [NSLayoutConstraint])
        
        
    }
    
}

