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
open class sModelData: Codable {
    var id: String
    var submodel: String
    
    required public init(json: JSON) throws {
        id = json["id"].stringValue
        submodel = json["submodel"].stringValue
    }
    
    public init() {
        id = ""
        submodel = ""
    }
}
