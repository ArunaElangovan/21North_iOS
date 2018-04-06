//
//  HistoryData.swift
//  21North
//
//  Created by Aruna Elangovan on 02/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON




//screen_id
//screen_name?
//payment_type
//
//adv_number
//
//adv_fee
//
//estimate_time
//pick_up_lat
//pick_up_long
//drop_lat
//drop_long



/// SignUpResponse object which comes as a response of PRELEAD
open class HistoryData: Codable {
    var pickup_address: String
    var drop_address: String
    var vehicleid: String
    var svctype: String
    var inv_amount: String
    var promo_code: String
    var promo_amount: String
    var amount_saved: String
    var id_complaint: String
    var svc_name: String
    var svc_rating: String
    var chauf_cost: String
    var chauf_start_time: String
    var chauf_end_time: String
    var chauf_appx_hours: String
    var rsa_amount: String
    var rsa_types: String
    var ambassador_id: String
    var queue_id: String
    var queue_time: String
    var screen_name: String
    var cfee: String
    var total_amount: String
    var ambname: String
    var ambmob: String
    
    required public init(json: JSON) throws {
        pickup_address = json["pickup_address"].stringValue
        drop_address = json["drop_address"].stringValue
        vehicleid = json["car_id"].stringValue
        svctype = json["svc_type"].stringValue
        inv_amount = json["invoice_amount"].stringValue
        promo_code = json["promo_code"].stringValue
        promo_amount = json["promo_amount"].stringValue
        amount_saved = json["amount_saved"].stringValue
        id_complaint = json["complaint_id"].stringValue
        svc_name = json["svc_name"].stringValue
        svc_rating = json["svc_rating"].stringValue
        chauf_cost = json["cost_of_chaf"].stringValue
        chauf_start_time = json["chaf_start_time"].stringValue
        chauf_end_time = json["chaf_end_time"].stringValue
        chauf_appx_hours = json["chaf_appx_hours"].stringValue
        rsa_amount = json["rsa_cost"].stringValue
        rsa_types = json["rsa_desc"].stringValue
        ambassador_id = json["amb_id"].stringValue
        queue_id = json["queue_id"].stringValue
        queue_time = json["queue_time"].stringValue
        screen_name = json["screen_name"].stringValue
        cfee = json["conv_fee"].stringValue
        total_amount = json["total_amount"].stringValue
        ambname = json["amb_name"].stringValue
        ambmob = json["amb_mob"].stringValue
    }
    
    public init() {
        pickup_address = ""
        drop_address = ""
        vehicleid = ""
        svctype = ""
        inv_amount = ""
        promo_code = ""
        promo_amount = ""
        amount_saved = ""
        id_complaint = ""
        svc_name = ""
        svc_rating = ""
        chauf_cost = ""
        chauf_start_time = ""
        chauf_end_time = ""
        chauf_appx_hours = ""
        rsa_amount = ""
        rsa_types = ""
        ambassador_id = ""
        queue_id = ""
        queue_time = ""
        screen_name = ""
        cfee = ""
        total_amount = ""
        ambname = ""
        ambmob = ""
    }
}

