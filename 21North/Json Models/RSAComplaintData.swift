//
//  RSAComplaintData.swift
//  21North
//
//  Created by Aruna Elangovan on 02/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class RSAComplaintData: Codable {
    var id: String
    var description: String
    var amount: String
    
    required public init(json: JSON) throws {
        id = json["id"].stringValue
        description = json["description"].stringValue
        amount = json["amount"].stringValue
    }
    
    public init() {
        id = ""
        description = ""
        amount = ""
    }
}
