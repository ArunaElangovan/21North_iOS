//
//  ChauffeurBookingFormData.swift
//  21North
//
//  Created by Aruna Elangovan on 02/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class ChauffeurBookingFormData: Codable {
    var waitTimeData: WaitTimeData
    var cancelReason: Array<CancelReason>
    var latitude: String
    var cost: String
    var radius: String
    var rnd: String
    var longitude: String
    
    required public init(json: JSON) throws {
        cost = json["record0"][0]["cost"].stringValue
        latitude = json["record0"][0]["latitude"].stringValue
        radius = json["record0"][0]["radius"].stringValue
        rnd = json["record0"][0]["rnd"].stringValue
        longitude = json["record0"][0]["longitude"].stringValue
        waitTimeData = WaitTimeData()
        cancelReason = [CancelReason]()
        
        if json["record1"][0]["-1"] != "-1"{
            try waitTimeData = WaitTimeData(json: json["record1"][0])
        }
        
        if json["record2"][0]["-1"] != "-1"{
            let cancelReasonsArray = json["record2"].arrayValue
            
            for aReason in cancelReasonsArray {
                try cancelReason.append(CancelReason(json: aReason))
            }
        }
    }
    
    public init() {
        cost = ""
        latitude = ""
        radius = ""
        rnd = ""
        longitude = ""
        waitTimeData = WaitTimeData()
        cancelReason = [CancelReason]()
    }
}
