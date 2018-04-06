//
//  VehiclesList.swift
//  21North
//
//  Created by Aruna Elangovan on 01/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

//addvehicle check all params

/// SignUpResponse object which comes as a response of PRELEAD
open class BookedVehicleData: Codable {
    var id: String
    var number: String
    var vehstatus: String
    var brandid: String
    var modelid: String
    var smodelid: String
    var category: String
    
    required public init(json: JSON) throws {
        id = json["id"].stringValue
        number = json["reg_no"].stringValue
        vehstatus = json["veh_status"].stringValue
        brandid = json["brand_id"].stringValue
        modelid = json["model_id"].stringValue
        smodelid = json["sub_model_id"].stringValue
        category = json["category"].stringValue
    }
    
    public init() {
        id = ""
        number = ""
        vehstatus = "111"
        brandid = ""
        modelid = ""
        smodelid = ""
        category = ""
    }
}
