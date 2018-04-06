//
//  Constants.swift
//  21North
//
//  Created by Aruna Elangovan on 09/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import Foundation

// Please declare Constants in appropriate extensions
// If not category suits your constant, please create new extension
struct Constants {
    // IMPORTANT NOTE: Keep this one clean please. Add constants in appropriate extensions.
}

extension Constants {
    struct ScreenSize {
        static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
}

extension Constants {
    struct DeviceType {
        static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_5_OR_LESS = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 667.0
        static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6_OR_LESS = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH <= 667.0
        static let IS_IPHONE_6_OR_ABOVE = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH >= 667.0
        static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPHONE_X = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    }
}

extension Constants {
    struct Sizes {
        static let NavigationViewHeight_iPhoneX:CGFloat = 86.0
        static let StatusBarHeight_iPhoneX: CGFloat = 44.0
        static let StatusBarSpacing_iPhoneX: CGFloat = 32.0
        static let StatusBarSpacing: CGFloat = 20.0
        static let BottomViewHeight_iPhoneX:CGFloat = 34.0
        static let NavigationViewHeight:CGFloat = 65.0
    }
    
}

extension Constants {
    struct Margins {
        static let NavigationButtonTopSpace:CGFloat = 20.0
        static let NavigationButtonLeadingSpace:CGFloat = 5.0 //15.0
        static let NavigationButtonTrailingSpace:CGFloat = 5.0 // 15.0
        static let NavigationButtonSpacing:CGFloat = 8.0
        static let PageTitleLeadingSpace:CGFloat = NavigationButtonLeadingSpace + 50.0
        static let PageTitleTrailingSpace:CGFloat = NavigationButtonTrailingSpace + 50.0
        static let BackButtonImageTitlePadding:CGFloat = 8.0
        static let GraphLegendTrailingSpace:CGFloat = 10.0
        static let GraphLegendTopSpace:CGFloat = 100.0
    }
}

extension Constants {
    // Configure keys used for NSUserDefaults
    struct UserDefaultKeys {
        static let LoggedIn = "LoggedIn"
        static let MobileNumber = "MobileNumber"
        static let deviceId = "deviceId"
        static let AmbLat = "AmbLat"
        static let AmbLong = "AmbLong"
        
    }
}

extension Constants {
    struct RequestStates {
        static let Signup = "PRELEAD";
        static let Login = "CUSTLOGIN";
        static let GetAllInfo = "GETALLCARS";
        static let AddUser = "ADDUSER";
        static let UserDetails = "GETUSERDETAIL";
        static let UpdateUser = "NEWUPDATEUSERDETAIL";
        static let GenerateOtp = "GENOTP";
        static let AddVehicle = "ADDCAR";
        static let VehicleBrands = "V2GETBRANDS";
        static let VehicleModels = "GETCARMODELS";
        static let VehicleSubModels = "GETCARSUBMODELS";
        static let VehicleDetails = "GETCARDETAIL";
        static let DeleteVehicle = "DELETECAR";
        static let UpdateVehicle = "UPDATECARDETAIL";
        static let UpdateVehicleBrand = "UPDATECARINFO";
        static let Feedback = "FEEDBACK";
        static let Rating = "RATING";
        static let AppLeads = "APPLEADS";
        static let VehicleHistory = "NEWGETCARHISTORY";
        static let BookingData = "NEWPICKDROPDEF";
        static let VerifyPromo = "VERIFYPROMO";
        static let HolidayList = "GETDAYS";
        static let SlotList = "GETAVAILSLOT";
        static let ComplaintList = "ESTIMATE";
        static let AddBooking = "ADDBOOKING";
        static let ModifyBooking = "MODIFYBOOKING";
        static let PostChat = "POSTCHAT";
        static let GetChat = "GETALLCHAT";
        static let CancelBooking = "CANCELBOOKING";
        static let BookingDetails = "NEWGETBOOKINGDETAIL";
        static let DeleteRefresh = "DELETEREFRESH";
        static let UpdateDropLocation = "UPDATEDROPLOC";
    }
}

extension Constants {
    struct ResponseStates {
        static let Signup = "OTP!";
        static let Login = "USERID!";
        static let GetAllInfo = "USERCARS!";
        static let UserDetails = "USERDETAIL!";
        static let UpdateUser = "UPDATEDUSERDETAIL!";
        static let GenerateOtp = "NEWOTP!";
        static let AddVehicle = "CARID!";
        static let VehicleBrands = "BRANDS!";
        static let VehicleModels = "CARMODELS!";
        static let VehicleSubModels = "CARSUBMODELS!";
        static let VehicleDetails = "CARDETAIL!";
        static let DeleteVehicle = "DELETECAR!";
        static let UpdateVehicle = "UPDATEDCARDETAIL!";
        static let UpdateVehicleBrand = "UPDATECARINFO!";
        static let Feedback = "FEEDBACKID!";
        static let Rating = "UPDATERATING!"
        static let AppLeads = "APPLEADS!";
        static let VehicleHistory = "GETCARHISTORY!";
        static let BookingData = "PICKUPPAGEDATA!";
        static let VerifyPromo = "PROMO!";
        static let HolidayList = "DAYS!";
        static let SlotList = "SLOTS!";
        static let ComplaintList = "ESTIMATE!";
        static let AddBooking = "BOOKINGDATA!";
        static let ModifyBooking = "MODIFYBOOKING!";
        static let PostChat = "POSTCHAT!";
        static let GetChat = "GETALLCHAT!";
        static let CancelBooking = "CANCELBOOKING!";
        static let BookingDetails = "BOOKINGDETAILS!";
        static let UpdateDropLocation = "UPDATEDROPLOC!";
        
        static let RefreshQueue = "REFRESHQUE!";
        static let RefreshLocation = "REFRESHLOC!";
        static let ChatRefresh = "REFRESHCHAT!";
        static let rsaEtaRefresh = "REFRESHETARSA!";
        static let chauffEtaRefresh = "REFRESHETARSA!";
    }
}

