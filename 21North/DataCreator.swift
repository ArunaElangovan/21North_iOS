//
//  DataCreator.swift
//  21North
//
//  Created by Aruna Elangovan on 01/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit

class DataCreator: NSObject {
    
    static let sharedInstance = DataCreator()
    
    var signupResponse = SignupResponse()
    var loginResponse = LoginResponse()
    var userData = UserData()
    var postBookingDetails = PostBookingDetails()
    var servicingBookingFormData = ServicingBookingFormData()
    var chauffeurBookingFormData = ChauffeurBookingFormData()
    var rsaBookingFormData = RSABookingFormData()
    var fullVehicleData = FullVehicleData()
    
    var networkCheck = "1"
    
    var vehicleArray = [BookedVehicleData]()
    var postBookingData = [BookingData]()
    var slotList = [SlotData]()
    var complaintList = [ComplaintData]()
    var subComplaintList = [SubComplaintData]()
    var chatArray = [ChatData]()
    var historyData = [BookingData]()
    var brandArray = [BrandData]()
    var modelArray = [ModelData]()
    var subModelArray = [SubModelData]()
    var cancelReasons = [CancelReason]()
    var serviceCentreList = [ServiceCentreData]()
    var rsaComplaintList = [RSAComplaintData]()
    var waitTimeForRequest = WaitTimeData()
    
    var isPickupOn = 1
    var currentLocation = ""
    var latitude = CLLocationDegrees()
    var longitude = CLLocationDegrees()
    var city = ""
    var currentScreenNo = 0
    var helpNumber: String!
    var referralCode = ""
    var referralText = ""
    var promoStatus: String!
    var userCredits: String! = "0"
    var sponserImageLink: UIImage!
    var sponserLink: String!
    var mobileNumber = ""
    var deviceId = ""
    var username = ""
    var selectedSlot = ""
    var selectedServiceCentre = ""
    var selectedPickLoc = ""
    var selectedDropLoc = ""
    var bookedVehicle = [[String]]()
    var loginChatString = ""
    var serviceType = "" //1 for servicing, 2 for chauffeur, 3 for rsa
    var chatList = [[String]]()
    var currentBookingId = ""
    var currentScreen = ""
    var currentScreenId = 0
    var connserver = "202.56.203.38"
    //202.56.203.38
    //202.56.203.44
    var connport:Int = 7416
    //7425
    //7416
    //7407//7420//7415
    //7412
    var dateList: [String] = []
    var userName = ""
    var refralCode = ""
    var fileExist = 0
    var connected = 0
    var reconnect = 0
    var login = 0
    var mobilenumber: String!
    var returnData = 0
    var selectedVehicleID = ""
    var selectedVehicleNumber = ""
    var bookingCompleteInfo = [String]()
    var loginstring:String!
    var reconnectCheck = 0
    var loginTryTimer: Timer!
    var homePageCheck = 0
    var currentVehicleId = 0
    var shouldReloadSubModel = false
    var version = "ios Client v0.001"
    var ambLat = ""
    var ambLong = ""
    //    var isAmbMapOpen = false
    var screenNo = 0
    var modelPageTriggeredFrom = ""
    var googleApiKey = "AIzaSyD2--igrkqS8F6XgIxHOHCw8JWL6atRMXQ"
    var bookingFormTitle = ""
    var bookingFormData = [[String]]()
    var postBookingFormData = [[String]]()
    var check = 1
    var cityName = ""
    var reachCount = 0
    var servicingLabel = NSLocalizedString("Book Now", comment: "")
    var servicingLabelCheck = 0
    var chaufferLabelCheck = 0
    var rsaLabelCheck = 0
    var chauffeurLabel = NSLocalizedString("Book Now", comment: "")
    var rsaLabel = NSLocalizedString("Book Now", comment: "")
    
    fileprivate override init() {
        super.init()
    }
}
