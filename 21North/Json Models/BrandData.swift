//
//  BrandData.swift
//  21North
//
//  Created by Aruna Elangovan on 02/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class BrandData: Codable {
    var id: String
    var brandname: String
    
    required public init(json: JSON) throws {
        id = json["id"].stringValue
        brandname = json["brandname"].stringValue
    }
    
    public init() {
        id = ""
        brandname = ""
    }
}
