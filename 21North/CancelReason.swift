//
//  CancelReason.swift
//  21North
//
//  Created by Aruna Elangovan on 01/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class CancelReason: Codable {
    var id: String
    var cancelreason: String

    required public init(json: JSON) throws {
        id = json["id"].stringValue
        cancelreason = json["cancel_reason"].stringValue
    }
    
    public init() {
        id = ""
        cancelreason = ""
    }
}
