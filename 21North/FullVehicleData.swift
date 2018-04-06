//
//  FullVehicleData.swift
//  21North
//
//  Created by Aruna Elangovan on 01/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class FullVehicleData: Codable {
    var vehiclemake_id: String
    var vehiclemodelid: String
    var model: String
    var sub_model_id: String
    var sub_model_name: String
    var number: String
    var insurance: String
    var puc: String
    var duedate: String
    var chassisnumber: String
    var enginenumber: String
    
    required public init(json: JSON) throws {
        vehiclemake_id = json["carmake_id"].stringValue
        vehiclemodelid = json["carmodelid"].stringValue
        model = json["model"].stringValue
        sub_model_id = json["sub_model_id"].stringValue
        sub_model_name = json["sub_model_name"].stringValue
        number = json["number"].stringValue
        insurance = json["insurance"].stringValue
        puc = json["puc"].stringValue
        duedate = json["duedate"].stringValue
        chassisnumber = json["chassisnumber"].stringValue
        enginenumber = json["enginenumber"].stringValue
    }
    
    public init() {
        vehiclemake_id = ""
        vehiclemodelid = ""
        model = ""
        sub_model_id = ""
        sub_model_name = ""
        number = ""
        insurance = ""
        puc = ""
        duedate = ""
        chassisnumber = ""
        enginenumber = ""
    }
}

