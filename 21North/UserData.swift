//
//  UserData.swift
//  21North
//
//  Created by Aruna Elangovan on 01/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

//for updateUser and userDetails

/// SignUpResponse object which comes as a response of PRELEAD
open class UserData: Codable {
    var firstName: String
    var mobile: String
    var email: String
    
    required public init(json: JSON) throws {
        firstName = json["first_name"].stringValue
        mobile = json["mobile"].stringValue
        email = json["email"].stringValue
    }
    
    public init() {
        firstName = ""
        mobile = ""
        email = ""
    }
}
