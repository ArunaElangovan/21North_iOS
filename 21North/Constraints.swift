//
//  Constraints.swift
//  21North
//
//  Created by Sachin Tomar on 28/05/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit

class Constraints: UIViewController {
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    
    func picknDropConstraints(_ view:UIView, view1:UIView, view2: UIView, view3:UIView, view4:UIView, width:CGFloat, testView:UIView){
        var viewsDictionary = Dictionary<String, UIView>()
        viewsDictionary = ["view": view, "view1": view1, "view2": view2, "view3": view3, "view4": view4]
        //
        //        //view constraints
        //
        
        
        let view_constraint_H2:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view1]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
        testView.addConstraints(view_constraint_H2 as! [NSLayoutConstraint])
        
        let view_constraint_H3:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view2]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
        testView.addConstraints(view_constraint_H3 as! [NSLayoutConstraint])
        
        let view_constraint_H4:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view3]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
        testView.addConstraints(view_constraint_H4 as! [NSLayoutConstraint])
        
        let view_constraint_H5:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view4]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
        testView.addConstraints(view_constraint_H5 as! [NSLayoutConstraint])
        
        
    }
    //Servicing Constraints
    func textFieldConstraints(_ label:UITextField, view1: UIView, labelType:String)->(UITextField){
        var viewsDictionary = Dictionary<String, UIView>()
        viewsDictionary = ["advisory": label]
        if(labelType == "promocode"){
            let view_constraint_pick_label:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[advisory]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_pick_label as! [NSLayoutConstraint])
            
            let view_constraint_pick_label_H:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:[advisory]-120-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_pick_label_H as! [NSLayoutConstraint])
            
        }
        return label
    }
    func labelConstraints(_ label:UILabel, view1: UIView, labelType:String){
        var viewsDictionary = Dictionary<String, UIView>()
        viewsDictionary = ["advisory": label]
        
        if(labelType == "mainHeading"){
            let view_constraint_pick_label:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[advisory]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_pick_label as! [NSLayoutConstraint])
            
            let view_constraint_pick_label_H:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|-26-[advisory]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_pick_label_H as! [NSLayoutConstraint])
        }
        else if(labelType == "heading"){
            let view_constraint_advisory_V:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[advisory]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_advisory_V as! [NSLayoutConstraint])
            
            let view_constraint_advisory_H:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[advisory]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_advisory_H as! [NSLayoutConstraint])
        }
        else if(labelType == "secHeading"){
            let view_constraint_advisory_V:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[advisory]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_advisory_V as! [NSLayoutConstraint])
            
            let view_constraint_advisory_H:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[advisory]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_advisory_H as! [NSLayoutConstraint])
        }
        else if(labelType == "subHeading"){
            let view_constraint_serCen_V:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[advisory]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_serCen_V as! [NSLayoutConstraint])
            
            let view_constraint_serCen_H:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[advisory]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_serCen_H as! [NSLayoutConstraint])
        }
        else if(labelType == "showFee"){
            let view_constraint_advisory_V:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-70-[advisory]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_advisory_V as! [NSLayoutConstraint])
            
            let view_constraint_advisory_H:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:[advisory]-25-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_advisory_H as! [NSLayoutConstraint])
        }
        else if(labelType == "promocode"){
            let view_constraint_pick_label:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[advisory]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_pick_label as! [NSLayoutConstraint])
            
            let view_constraint_pick_label_H:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:[advisory]-120-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_pick_label_H as! [NSLayoutConstraint])
        }
        else if(labelType == "drop"){
            let view_constraint_advisory_V:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-42-[advisory]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_advisory_V as! [NSLayoutConstraint])
            
            let view_constraint_advisory_H:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[advisory]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_advisory_H as! [NSLayoutConstraint])
        }
        else if(labelType == "carConstraints"){
            
            let view_constraint_advisory_V:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[advisory]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_advisory_V as! [NSLayoutConstraint])
            
            let view_constraint_advisory_H:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[advisory]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_advisory_H as! [NSLayoutConstraint])
        }
        else if(labelType == "serviceName"){
            let view_constraint_advisory_V:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-60-[advisory]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_advisory_V as! [NSLayoutConstraint])
            
            let view_constraint_advisory_H:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[advisory]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_advisory_H as! [NSLayoutConstraint])
            
        }
        // return label
    }
    func vectorConstraints(_ view1: UIView, imageViewTool: UIImageView, type:String){
        var viewsDictionary = Dictionary<String, UIView>()
        
        viewsDictionary = ["view1": view1, "imageViewTool": imageViewTool]
        if(type == "rating"){
            let view_constraint_0:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:[imageViewTool]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_0 as! [NSLayoutConstraint])
        }
        else{
            let view_imageTool_H1: NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:[imageViewTool]-(12)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_imageTool_H1 as! [NSLayoutConstraint])
        }
        if(type == "firstIcon"){
            let view_imageTool_V1: NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[imageViewTool]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_imageTool_V1 as! [NSLayoutConstraint])
        }
            
        else if(type == "secIcon"){
            let view_imageTool_V: NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-70-[imageViewTool]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_imageTool_V as! [NSLayoutConstraint])
        }
        else if(type == "secHeadIcon"){
            let view_imageTool_V: NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[imageViewTool]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_imageTool_V as! [NSLayoutConstraint])
        }
        else if(type == "rating"){
            let view_constraint_V0:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-86-[imageViewTool]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_V0 as! [NSLayoutConstraint])
            
            
        }
            
            //Home Page Vector Constraints
        else if(type == "sandwich"){
            let view_constraint_0:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|-27-[imageViewTool]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_0 as! [NSLayoutConstraint])
            
            let view_constraint_V0:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[imageViewTool]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_V0 as! [NSLayoutConstraint])
            
            
        }
            
        else if(type == "plus"){
            
            let view_constraint_0:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|-24-[imageViewTool]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_0 as! [NSLayoutConstraint])
            
            let view_constraint_V0:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:[imageViewTool]-40-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
            view1.addConstraints(view_constraint_V0 as! [NSLayoutConstraint])
            
            
        }
        
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    //Create Account Constraints
    func accountConstraints(_ textField : UITextField, view1: UIView, verticalConstraints: String){
        var viewsDictionary = Dictionary<String, UIView>()
        viewsDictionary = ["Name": textField]
        let nameConstraintshor: NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|-110-[Name]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
        view1.addConstraints(nameConstraintshor as! [NSLayoutConstraint])
        
        let nameConstraintsVer:NSArray = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraints, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
        view1.addConstraints(nameConstraintsVer as! [NSLayoutConstraint])
    }
    
    func checkMarkConstraints(_ checkMark: UIImageView, view1: UIView, verticalConstraint: String){
        
        var viewsDictionary = Dictionary<String, UIImageView>()
        viewsDictionary = ["checkMark": checkMark]
        let checkMarkConstraintsHor:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|-85-[checkMark]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
        view1.addConstraints(checkMarkConstraintsHor as! [NSLayoutConstraint])
        
        let checkMarkConstraintsVer:NSArray = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraint, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
        view1.addConstraints(checkMarkConstraintsVer as! [NSLayoutConstraint])
        
    }
    
    
}

