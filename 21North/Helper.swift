//
//  Helper.swift
//  21North
//
//  Created by Aruna Elangovan on 13/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import Foundation
import libPhoneNumber_iOS

class Helper{
    static func getBookingIndex() -> Int{
        for i in 0 ..< DataCreator.sharedInstance.postBookingData.count{
            if DataCreator.sharedInstance.postBookingData[i].vehicleid == DataCreator.sharedInstance.selectedVehicleID{
                return i
            }
        }
        return 0
    }
    
    static func getPostBookingFormData(bookingData: BookingData){
        var splitQTime = [String]()
        var splitDate = [String]()
        var defaultSelectedDate = ""
        var defaultSelectedSlot = ""
        DataCreator.sharedInstance.postBookingFormData.removeAll()
        DataCreator.sharedInstance.serviceType = bookingData.typesvc
        for i in 0 ..< DataCreator.sharedInstance.vehicleArray.count{
            if DataCreator.sharedInstance.vehicleArray[i].id == bookingData.vehicleid{
                DataCreator.sharedInstance.currentVehicleId = i
                DataCreator.sharedInstance.vehicleArray[i].vehstatus = bookingData.vehstatus
                break
            }
        }
        DataCreator.sharedInstance.currentScreenId = Int(bookingData.screenid)!
        DataCreator.sharedInstance.currentBookingId = bookingData.queueid
        if bookingData.screenid != "8" && bookingData.screenid != "25" && bookingData.screenid != "35"{
            //Convert date and time to required format before displaying
            splitQTime = bookingData.qtime.split(separator: " ").map(String.init)
            splitDate = splitQTime[0].split(separator: "-").map(String.init)
            splitDate[1] = getMonthNameFromNumber(monthNumber: Int(splitDate[1])!)
            defaultSelectedDate = splitDate[1]+" "+splitDate[2]+", "+splitDate[0]
            defaultSelectedSlot = splitQTime[1].convert24To12HoursFormat()+", "
            if DataCreator.sharedInstance.serviceType == "1" || DataCreator.sharedInstance.serviceType == "0"{
                if bookingData.screenid == "2" || bookingData.screenid == "3" || bookingData.screenid == "7"{
                    DataCreator.sharedInstance.postBookingFormData.append(["ambCall","","ambLocation",bookingData.ambname,"ambassador"])
                }
                DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("ServiceCentreText", comment: ""),bookingData.svcname,"","","ServiceCentre"])
                DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("TimeSlotText", comment: ""),defaultSelectedSlot+defaultSelectedDate,"","",""])//datepicker for slot
                if DataCreator.sharedInstance.serviceType == "1"{
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("PickupLocationText", comment: ""),bookingData.paddy,"","",""])//1 = switch req, 2 = button image, 3 = button text
                    if bookingData.screenid == "7"{
                        DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("DropoffLocationText", comment: ""),bookingData.daddy,"2","",""])
                    }
                    else{
                        DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("DropoffLocationText", comment: ""),bookingData.daddy,"2","locationIcon","2"])
                    }
                    
                }
                var complaintsCount = "0"
                if bookingData.idcomplaint != "0"{
                    complaintsCount = String(bookingData.idcomplaint.split(separator: ",").map(String.init).count)
                }
                if bookingData.screenid == "5" || bookingData.screenid == "6" || bookingData.screenid == "7"{
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("ViewComplaintsText", comment: ""),complaintsCount + " " + NSLocalizedString("ComplaintsAddedText", comment: ""),"2","addComp","ViewComplaints"])
                }
                if bookingData.screenid == "5" || bookingData.screenid == "6" || bookingData.screenid == "7"{
                    splitQTime = (bookingData.esttime.split(separator: " ").map(String.init))
                    splitDate = (splitQTime[0].split(separator: "-").map(String.init))
                    splitDate[1] = getMonthNameFromNumber(monthNumber: Int(splitDate[1])!)
                    defaultSelectedDate = splitDate[1]+" "+splitDate[2]+", "+splitDate[0]
                    defaultSelectedSlot = splitQTime[1].convert24To12HoursFormat()+", "
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("ViewEstimateText", comment: ""),"\u{20B9} "+bookingData.estimate + "/ " + defaultSelectedSlot+defaultSelectedDate,"2","estimate","ViewEstimate"])
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("ServiceAdvisorText", comment: ""),NSLocalizedString("ExpertAdviceText", comment: ""),"2","call","call"])
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("ChatServiceAdvisorText", comment: ""),NSLocalizedString("ChatExpertAdvisorText", comment: ""),"2","chat","chat"])
                }
                if  bookingData.screenid == "6" || bookingData.screenid == "7"{
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("InvoiceAmountText", comment: ""),"","3","\u{20B9} "+bookingData.invamount,""])
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("AmountSavedText", comment: ""),"","3","\u{20B9} "+bookingData.amountsaved,""])
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("21NorthConvenienceFeeText", comment: ""),"","3","\u{20B9} "+bookingData.cfee,""])
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("PromoDiscountText", comment: ""),"","3","\u{20B9} "+bookingData.promodiscount,""])
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("AmountPayableText", comment: ""),"","3","\u{20B9} "+bookingData.totalamount,""])
                }
            }
            if DataCreator.sharedInstance.serviceType == "2"{
                if bookingData.screenid == "20" || bookingData.screenid == "21" {
                    DataCreator.sharedInstance.postBookingFormData.append(["ambCall",bookingData.ambid,"ambLocation",bookingData.ambname,"ambassador"])
                }
                DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("PickupLocationText", comment: ""),bookingData.paddy,"","",""])//1 = switch req, 2 = button image, 3 = button text
                if bookingData.screenid == "20" || bookingData.screenid == "21"{
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("DropoffLocationText", comment: ""),bookingData.daddy,"2","locationIcon","2"])
                }
                else{
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("DropoffLocationText", comment: ""),bookingData.daddy,"2","",""])
                }
                DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("ApproxHoursText", comment: ""),bookingData.chafappxhours+" "+NSLocalizedString("HoursText", comment: ""),"","",""])
                let cost = "\u{20B9} "+bookingData.costofchaf+" "+NSLocalizedString("PerMinuteText", comment: "")
                DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("ChauffeurCostText", comment: ""),cost,"3",String(Float(bookingData.chafappxhours)!*60*Float(bookingData.costofchaf)!),""])
                if bookingData.screenid == "24"{
                    //Convert date and time to required format before displaying
                    splitQTime = bookingData.chafstarttime.split(separator: " ").map(String.init)
                    splitDate = splitQTime[0].split(separator: "-").map(String.init)
                    splitDate[1] = getMonthNameFromNumber(monthNumber: Int(splitDate[1])!)
                    defaultSelectedDate = splitDate[1]+" "+splitDate[2]+", "+splitDate[0]
                    defaultSelectedSlot = splitQTime[1].convert24To12HoursFormat()+", "
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("StartedAtText", comment: ""),defaultSelectedSlot+defaultSelectedDate,"","",""])
                    splitQTime = bookingData.chafendtime.split(separator: " ").map(String.init)
                    splitDate = splitQTime[0].split(separator: "-").map(String.init)
                    splitDate[1] = getMonthNameFromNumber(monthNumber: Int(splitDate[1])!)
                    defaultSelectedDate = splitDate[1]+" "+splitDate[2]+", "+splitDate[0]
                    defaultSelectedSlot = splitQTime[1].convert24To12HoursFormat()+", "
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("EndedAtText", comment: ""),defaultSelectedSlot+defaultSelectedDate,"","",""])
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("PromoDiscountText", comment: ""),bookingData.promocode,"3","\u{20B9} "+bookingData.promoamount,""])
                    DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("TotalPayableAmountText", comment: ""),"","3","\u{20B9} "+bookingData.totalamount,""])
                }
            }
            if DataCreator.sharedInstance.serviceType == "3"{
                DataCreator.sharedInstance.postBookingFormData.append(["ambCall",bookingData.ambid,"ambLocation",bookingData.ambname,"ambassador"])
                DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("PickupLocationText", comment: ""),bookingData.paddy,"","",""])//1 = switch req, 2 = button image, 3 = button text
                DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("ServiceCentreText", comment: ""),bookingData.svcname,"","","ServiceCentre"])
                DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("TypeOfServiceText", comment: ""),bookingData.rsadesc,"","",""])
                DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("ConvenienceFeeText", comment: ""),NSLocalizedString("ServiceChargesText", comment: ""),"3","\u{20B9} "+bookingData.cfee,""])
            }
        }
    }
    
    static func getMonthNameFromNumber(monthNumber: Int)-> String{
        let fmt = DateFormatter()
        fmt.dateFormat = "MM"
        let monthName = fmt.monthSymbols[monthNumber - 1]
        return monthName
    }
    
    static func convertSlotToDisplayFormat(slot: String) -> String{
        //Convert date and time to required format before displaying
        let splitSlot = slot.split(separator: " ").map(String.init)
        var splitDate = (splitSlot[0].split(separator: "-").map(String.init))
        splitDate[1] = getMonthNameFromNumber(monthNumber: Int(splitDate[1])!)
        let selectedDate = splitDate[1]+" "+splitDate[2]+", "+splitDate[0]
        let selectedSlot = splitSlot[1].convert24To12HoursFormat()+", "
        return selectedSlot+selectedDate
    }
    
    static func callNumber(_ phoneNumber:String) {
        if let phoneCallURL:URL = URL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.openURL(phoneCallURL);
            }
        }
    }
    
    static func loadImageFromPath() -> UIImage? {
        let imagePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc") as String
        let path = imagePath + "/profileImage.jpg"
        let image = UIImage(contentsOfFile: path)
        return image
    }
    
    //MARK: Get flag symbol from flag code
    static func getFlag(country:String) -> String {
        let base : UInt32 = 127397
        var symbol = ""
        for ch in country.unicodeScalars {
            symbol.unicodeScalars.append(UnicodeScalar(base + ch.value)!)
        }
        return String(symbol)
    }
    
    static func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }
    
    static func dateToSystem(_ date1: String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let date = dateFormatter.date(from: date1)
        // To convert the date into an HH:mm format
        dateFormatter.dateFormat = "yyyy-MM-dd" // or //h:mm a
        let dateString = dateFormatter.string(from: date!)
        return dateString
    }
    static func dateFormateChange(_ date: String)->String{
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
    
    static func countryNamesByCode() -> [Country] {
        var countries = [Country]()
        for code in NSLocale.isoCountryCodes {
            let countryName = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: code)
            let phoneNumberUtil = NBPhoneNumberUtil.sharedInstance()
            let phoneCode = "+\(phoneNumberUtil!.getCountryCode(forRegion: code).stringValue)"
            if phoneCode != "+0" {
                let country = Country(code: code, name: countryName!, phoneCode: phoneCode)
                countries.append(country)
            }
        }
        countries = countries.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == ComparisonResult.orderedAscending }
        return countries
    }
    
    static func presentDismissTransition() -> CATransition{
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        return transition
    }
}

