//
//  SlotData.swift
//  21North
//
//  Created by Aruna Elangovan on 01/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class SlotData: Codable {
    var id: String
    var slottime: String
    
    required public init(json: JSON) throws {
        id = json["id"].stringValue
        slottime = json["slot_hour"].stringValue
    }
    
    public init() {
        id = ""
        slottime = ""
    }
}
