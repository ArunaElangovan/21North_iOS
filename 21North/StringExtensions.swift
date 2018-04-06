//
//  StringExtensions.swift
//  test
//
//  Created by Sree Kumar on 03/10/15.
//  Copyright © 2015 Sree Kumar. All rights reserved.
//

import Foundation
extension String {
    
    var lastPathComponent: String {
        
        get {
            return (self as NSString).lastPathComponent
        }
    }
    var pathExtension: String {
        
        get {
            
            return (self as NSString).pathExtension
        }
    }
    var stringByDeletingLastPathComponent: String {
        
        get {
            
            return (self as NSString).deletingLastPathComponent
        }
    }
    var stringByDeletingPathExtension: String {
        
        get {
            
            return (self as NSString).deletingPathExtension
        }
    }
    var pathComponents: [String] {
        
        get {
            
            return (self as NSString).pathComponents
        }
    }
    
    func stringByAppendingPathComponent(_ path: String) -> String {
        
        let nsSt = self as NSString
        
        return nsSt.appendingPathComponent(path)
    }
    
    func stringByAppendingPathExtension(_ ext: String) -> String? {
        
        let nsSt = self as NSString
        
        return nsSt.appendingPathExtension(ext)
    }
    
    func convert24To12HoursFormat() -> String{
        var splitTime = self.split(separator: ":").map(String.init)
        let hour = Int(splitTime[0])!
        var amPm = "AM"
        if  hour > 12{
            splitTime[0] = String(hour-12)
            amPm = "PM"
        }
        else if hour == 12{
            amPm = "PM"
        }
        return (splitTime.flatMap({$0}).joined(separator:":")+" "+amPm)
    }
}

