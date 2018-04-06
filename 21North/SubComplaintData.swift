//
//  SubComplaintData.swift
//  21North
//
//  Created by Aruna Elangovan on 01/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class SubComplaintData: NSObject, Codable {
    var desc: String
    var headId: String
    var subHeadId: String
    var cost: String
    
    required public init(json: JSON) throws {
        desc = json["description"].stringValue
        headId = json["head_id"].stringValue
        subHeadId = json["sub_head_id"].stringValue
        cost = json["cost"].stringValue
    }
    
    public override init() {
        desc = ""
        headId = ""
        subHeadId = ""
        cost = ""
    }
}
