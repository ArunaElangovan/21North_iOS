//
//  SignupResponse.swift
//  21North
//
//  Created by Aruna Elangovan on 01/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class SignupResponse: Codable {
    var userId: String
    var otp: String

    required public init(json: JSON) throws {
        userId = json["record0"][0]["user_exists"].stringValue
        otp = json["record0"][0]["otp"].stringValue
    }

    public init() {
        userId = ""
        otp = ""
    }

//    func getJsonString() -> String? {
//        let jsonObj = JSON(parseJSON: jsonString)
//        let otp = jsonObj["otp"].rawString()
//
//        return otp
//    }
}

