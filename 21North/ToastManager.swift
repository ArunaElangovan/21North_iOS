//
//  ToastManager.swift
//  21North
//
//  Created by Aruna Elangovan on 20/02/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import Toaster

@objc class ToastManager: NSObject {
    
    //    class func isInternetAvailable() -> Bool {
    //        if let reachability = Reachability.isre() {
    //            if reachability.currentReachabilityStatus() == NotReachable {
    //                return false
    //            }
    //            return true
    //        }
    //        return false
    //    }
    
    /// No network error Toast
    open class func internetError() {
        let toast = Toast(text: NSLocalizedString("NetworkErrorToastMessage", comment: ""), duration: Delay.long)
        ToastView.appearance().self.cornerRadius = 12.0
        ToastView.appearance().self.bottomOffsetPortrait = 60.0
        toast.show()
    }
    
    /// Cannot book Toast
    open class func bookingError() {
        let toast = Toast(text: NSLocalizedString("CannotBookToastMessage", comment: ""), duration: Delay.long)
        ToastView.appearance().self.cornerRadius = 12.0
        ToastView.appearance().self.bottomOffsetPortrait = 60.0
        toast.show()
    }
    
    /// No service centre Toast
    open class func serviceCentreError() {
        let toast = Toast(text: NSLocalizedString("NoServiceToastMessage", comment: ""), duration: Delay.long)
        ToastView.appearance().self.cornerRadius = 12.0
        ToastView.appearance().self.bottomOffsetPortrait = 60.0
        toast.show()
    }
    
    /// No vehicle number Toast
    open class func vehicleNumberEmpty() {
        let toast = Toast(text: NSLocalizedString("NoVehicleNumberToastMessage", comment: ""), duration: Delay.short)
        ToastView.appearance().self.cornerRadius = 12.0
        ToastView.appearance().self.bottomOffsetPortrait = 60.0
        toast.show()
    }
    
    /// No vehicle number Toast
    open class func vehicleTypeEmpty() {
        let toast = Toast(text: NSLocalizedString("NoVehicleTypeToastMessage", comment: ""), duration: Delay.short)
        ToastView.appearance().self.cornerRadius = 12.0
        ToastView.appearance().self.bottomOffsetPortrait = 60.0
        toast.show()
    }
    
    /// Duplicate vehicle number Toast
    open class func vehicleNumberDuplicate() {
        let toast = Toast(text: NSLocalizedString("DuplicateVehicleNumberToastMessage", comment: ""), duration: Delay.short)
        ToastView.appearance().self.cornerRadius = 12.0
        ToastView.appearance().self.bottomOffsetPortrait = 60.0
        toast.show()
    }
    
    /// No mobile number Toast
    open class func mobileNumberEmpty() {
        let toast = Toast(text: NSLocalizedString("NoNumberToastMessage", comment: ""), duration: Delay.short)
        ToastView.appearance().self.cornerRadius = 12.0
        ToastView.appearance().self.bottomOffsetPortrait = 60.0
        toast.show()
    }
    
    /// Rating empty Toast
    open class func ratingEmpty() {
        let toast = Toast(text: NSLocalizedString("NoRatingToastMessage", comment: ""), duration: Delay.short)
        ToastView.appearance().self.cornerRadius = 12.0
        ToastView.appearance().self.bottomOffsetPortrait = 60.0
        toast.show()
    }
}


