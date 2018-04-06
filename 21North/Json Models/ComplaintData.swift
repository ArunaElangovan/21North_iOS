//
//  ComplaintData.swift
//  21North
//
//  Created by Aruna Elangovan on 01/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class ComplaintData: Codable {
    var desc: String
    var id: String
    
    required public init(json: JSON) throws {
        desc = json["description"].stringValue
        id = json["id"].stringValue
    }
    
    public init() {
        desc = ""
        id = ""
    }
}
