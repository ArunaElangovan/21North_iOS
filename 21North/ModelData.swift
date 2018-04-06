//
//  ModelData.swift
//  21North
//
//  Created by Aruna Elangovan on 02/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class ModelData: Codable {
    var id: String
    var category: String
    var model: String
    var fuel: String
    
    required public init(json: JSON) throws {
        id = json["id"].stringValue
        category = json["category"].stringValue
        model = json["model"].stringValue
        fuel = json["fuel"].stringValue
    }
    
    public init() {
        id = ""
        category = ""
        model = ""
        fuel = ""
    }
}

