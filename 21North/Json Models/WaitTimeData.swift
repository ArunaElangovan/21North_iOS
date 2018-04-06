//
//  WaitTimeData.swift
//  21North
//
//  Created by Aruna Elangovan on 02/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class WaitTimeData: Codable {
    var eta: String
    var wait_time: String
    
    required public init(json: JSON) throws {
        eta = json["eta"].stringValue
        wait_time = json["wait_time"].stringValue
    }
    
    public init() {
        eta = ""
        wait_time = ""
    }
}
