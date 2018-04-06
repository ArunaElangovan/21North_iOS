//
//  ChatData.swift
//  21North
//
//  Created by Aruna Elangovan on 02/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class ChatData: Codable {
    var isincoming: String
    var chat: String
    
    required public init(json: JSON) throws {
        isincoming = json["isincoming"].stringValue
        chat = json["chat"].stringValue
    }
    
    public init(incoming: String, chatString: String) throws {
        isincoming = incoming
        chat = chatString
    }
    
    public init() {
        isincoming = ""
        chat = ""
    }
}
