//
//  ServiceCentreData.swift
//  21North
//
//  Created by Aruna Elangovan on 01/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON


//svc_type?

/// SignUpResponse object which comes as a response of PRELEAD
open class ServiceCentreData: Codable {
    var name: String
    var rating: String
    var svclat: String
    var svclong: String
    var id: String
    var servicecentretype: String
    var distance: String
    
    required public init(json: JSON) throws {
        name = json["name"].stringValue
        rating = json["rating"].stringValue
        svclat = json["svc_lat"].stringValue
        svclong = json["svc_long"].stringValue
        id = json["id"].stringValue
        servicecentretype = json["svc_type"].stringValue
        distance = json["distance"].stringValue
    }
    
    public init() {
        id = ""
        name = ""
        rating = ""
        svclat = ""
        svclong = ""
        servicecentretype = ""
        distance = ""
    }
}
