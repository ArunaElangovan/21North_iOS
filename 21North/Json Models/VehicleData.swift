//
//  VehiclesList.swift
//  21North
//
//  Created by Aruna Elangovan on 01/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class BookedVehicleData: Codable {
    
    var id: String!
    var number: String!
    var vehstatus: String!
    var brandid: String!
    var modelid: String!
    var smodelid: String!
    var category: String!
    
    required public init(json: JSON) throws {
        id = json["id"].stringValue
        number = json["number"].stringValue
        vehstatus = json["vehstatus"].stringValue
        brandid = json["brandid"].stringValue
        modelid = json["modelid"].stringValue
        smodelid = json["smodelid"].stringValue
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
