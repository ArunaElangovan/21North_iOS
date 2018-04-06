//
//  RSABookingFormData.swift
//  21North
//
//  Created by Aruna Elangovan on 02/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class RSABookingFormData: Codable {
    var serviceCentreData: Array<ServiceCentreData>
    var rsaComplaintData: Array<RSAComplaintData>
    var waitTimeData: WaitTimeData
    var cancelReason: Array<CancelReason>
    var city_id: String
    var rsaCost: String
    var latitude: String
    var radius: String
    var rnd: String
    var longitude: String
    var time_accept: String
    
    required public init(json: JSON) throws {
        city_id = json["record0"][0]["city_id"].stringValue
        rsaCost = json["record0"][0]["cost_rsa"].stringValue
        latitude = json["record0"][0]["latitude"].stringValue
        radius = json["record0"][0]["radius"].stringValue
        rnd = json["record0"][0]["rnd"].stringValue
        longitude = json["record0"][0]["longitude"].stringValue
        time_accept = json["record0"][0]["time_accept"].stringValue
        rsaComplaintData = [RSAComplaintData]()
        waitTimeData = WaitTimeData()
        serviceCentreData = [ServiceCentreData]()
        cancelReason = [CancelReason]()
        
        if json["record1"][0]["-1"] != "-1"{
            let serviceCentreArray = json["record1"].arrayValue
            
            for aServiceCentre in serviceCentreArray {
                try serviceCentreData.append(ServiceCentreData(json: aServiceCentre))
            }
        }
        
        if json["record2"][0]["-1"] != "-1"{
            let rsaComplaintDataArray = json["record2"].arrayValue
            
            for aRsaComplaint in rsaComplaintDataArray {
                try rsaComplaintData.append(RSAComplaintData(json: aRsaComplaint))
            }
        }
        
        if json["record3"][0]["-1"] != "-1"{
            try waitTimeData = WaitTimeData(json: json["record3"][0])
        }
        
        if json["record4"][0]["-1"] != "-1"{
            let cancelReasonsArray = json["record4"].arrayValue
            
            for aReason in cancelReasonsArray {
                try cancelReason.append(CancelReason(json: aReason))
            }
        }
    }
    
    public init() {
        city_id = ""
        rsaCost = ""
        latitude = ""
        radius = ""
        rnd = ""
        longitude = ""
        time_accept = ""
        rsaComplaintData = [RSAComplaintData]()
        waitTimeData = WaitTimeData()
        serviceCentreData = [ServiceCentreData]()
        cancelReason = [CancelReason]()
    }
}
