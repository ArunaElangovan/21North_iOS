//
//  LoginResponse.swift
//  21North
//
//  Created by Aruna Elangovan on 01/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class LoginResponse: Codable {
    var userId: String
    var userCredits: String
    var fname: String
    var support: String
    var pcodeText: String
    var pcode: String
    var gapiios: String
    var advertLink: String
    var advertImage: String
    var vehiclesList: Array<BookedVehicleData>
    var bookingData: Array<BookingData>
    var cancelReason: Array<CancelReason>
    
    required public init(json: JSON) throws {
        userId = json["record0"][0]["user_id"].stringValue
        userCredits = json["record0"][0]["user_credits"].stringValue
        fname = json["record0"][0]["full_name"].stringValue
        support = json["record0"][0]["support"].stringValue
        pcodeText = json["record0"][0]["promo_code_text"].stringValue
        pcode = json["record0"][0]["promo_code"].stringValue
        gapiios = json["record0"][0]["g_api_ios"].stringValue
        advertLink = json["record0"][0]["advert_link"].stringValue
        advertImage = json["record0"][0]["advert_image"].stringValue
        vehiclesList = [BookedVehicleData]()
        bookingData = [BookingData]()
        cancelReason = [CancelReason]()
        
        if json["record1"][0]["-1"] != "-1"{
        let vehiclesArray = json["record1"].arrayValue
        
        for aVehicle in vehiclesArray {
            try vehiclesList.append(BookedVehicleData(json: aVehicle))
        }
        }
        
        if json["record2"][0]["-1"] != "-1"{
            let bookingDataArray = json["record2"].arrayValue
            
            for aBooking in bookingDataArray {
                try bookingData.append(BookingData(json: aBooking))
            }
        }
        
        if json["record3"][0]["-1"] != "-1"{
            let cancelReasonsArray = json["record3"].arrayValue
            
            for aReason in cancelReasonsArray {
                try cancelReason.append(CancelReason(json: aReason))
            }
        }

    }
    
    public init() {
        userId = ""
        userCredits = ""
        fname = ""
        support = ""
        pcodeText = ""
        pcode = ""
        gapiios = ""
        advertLink = ""
        advertImage = ""
        vehiclesList = [BookedVehicleData]()
        bookingData = [BookingData]()
        cancelReason = [CancelReason]()
    }
}
