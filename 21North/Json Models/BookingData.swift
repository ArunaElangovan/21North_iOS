//
//  BookingData.swift
//  21North
//
//  Created by Aruna Elangovan on 01/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON


//payment_type
//used_minutes
//cancel_reason  except getbookingdetails
//
//svc_id in getbookingdetails add in custlogin r2



/// SignUpResponse object which comes as a response of PRELEAD
open class BookingData: Codable {
    var stage: String
    var screenid: String
    var statusdesc: String
    var queueid: String
    var vehicleid: String
//    var cancelreason: String!
    var qtime: String
    var paddy: String
    var daddy: String
    var idcomplaint: String
    var svcname: String
    var typesvc: String
    var svcrating: String
    var cfee: String
    var advnumber: String
    var ambid: String
    var ambname: String
    var ambmob: String
    var etavar: String
    var promoamount: String
    var promodiscount: String
    var invamount: String
    var advfee: String
    var totalamount: String
    var amountsaved: String
    var promocode: String
    var estimate: String
    var esttime: String
    var costofchaf: String
    var plat: String
    var plong: String
    var dlat: String
    var dlong: String
    var chafstarttime: String
    var chafendtime: String
    var chafappxhours: String
    var rsacost: String
    var rsadesc: String
    var amblat: String
    var amblong: String
    var vehstatus: String
    var paymentType: String
    var complaintText: String
    var usedMinutes: String
    var svcId: String
    var estimateUrl: String
    var invoiceUrl: String

    required public init(json: JSON) throws {
        stage = json["stage"].stringValue  //custlogin  //
        screenid = json["screen_id"].stringValue  //  //bookingdetails
        statusdesc = json["statusdesc"].stringValue
        queueid = json["queue_id"].stringValue  //  //
        svcname = json["svc_name"].stringValue  //  //
        vehicleid = json["car_id"].stringValue  //  //
        paddy = json["pickup_address"].stringValue  //  //
        qtime = json["queue_time"].stringValue  //  //
        daddy = json["drop_address"].stringValue //  //
        svcrating = json["svc_rating"].stringValue  //  //
        typesvc = json["svc_type"].stringValue  //  //
        advnumber = json["adv_number"].stringValue  //
        cfee = json["conv_fee"].stringValue  //  //
        ambid = json["amb_id"].stringValue  //
        ambname = json["amb_name"].stringValue  //
        ambmob = json["amb_mob"].stringValue  //
        promoamount = json["promo_amount"].stringValue  //  //
        etavar = json["eta"].stringValue  //
        invamount = json["invoice_amount"].stringValue   //
        advfee = json["adv_fee"].stringValue  //  //
        totalamount = json["total_amount"].stringValue  //  //
        amountsaved = json["amount_saved"].stringValue  //
        promocode = json["promo_code"].stringValue //  //
        estimate = json["estimate"].stringValue  //
        esttime = json["estimate_time"].stringValue  //
        chafendtime = json["chaf_end_time"].stringValue  //
        costofchaf = json["cost_of_chaf"].stringValue  //
        chafappxhours = json["chaf_appx_hours"].stringValue  //
        plat = json["pick_up_lat"].stringValue  //  //
        plong = json["pick_up_long"].stringValue  //  //
        dlat = json["drop_lat"].stringValue  //  //
        dlong = json["drop_long"].stringValue  //  //
        chafstarttime = json["chaf_start_time"].stringValue  //
        rsacost = json["rsa_cost"].stringValue  //
        rsadesc = json["rsa_desc"].stringValue  //
        idcomplaint = json["complaint_id"].stringValue //  //
        complaintText = json["complaint_text"].stringValue  //  //
        vehstatus = json["veh_status"].stringValue  //  //
        paymentType = json["payment_type"].stringValue  //
        usedMinutes = json["used_minutes"].stringValue  //
        svcId = json["svc_id"].stringValue     //bookingdetails
        invoiceUrl = json["invoice_url"].stringValue
        estimateUrl = json["estimate_url"].stringValue
        
        
        promodiscount = json["promo_discount"].stringValue  //
        amblat = json["amb_lat"].stringValue //
        amblong = json["amb_long"].stringValue  //
    }
    
    public init(stage1: String,screenid1: String,svcrating1: String) {
        stage = stage1
        screenid = screenid1
        statusdesc = ""
        idcomplaint = ""
        queueid = ""
        svcname = ""
        vehicleid = ""
        paddy = ""
        qtime = ""
        daddy = ""
        svcrating = svcrating1
        typesvc = ""
        advnumber = ""
        cfee = ""
        ambid = ""
        ambname = ""
        ambmob = ""
        promoamount = ""
        etavar = ""
        invamount = ""
        advfee = ""
        totalamount = ""
        amountsaved = ""
        promocode = ""
        estimate = ""
        esttime = ""
        chafendtime = ""
        costofchaf = ""
        chafappxhours = ""
        plat = ""
        plong = ""
        dlat = ""
        dlong = ""
        chafstarttime = ""
        rsacost = ""
        rsadesc = ""
        idcomplaint = ""
        amblat = ""
        amblong = ""
        vehstatus = ""
        promodiscount = ""
        paymentType = ""
        complaintText = ""
        usedMinutes = ""
        svcId = ""
        estimateUrl = ""
        invoiceUrl = ""
    }
    
    public init() {
        stage = ""
        screenid = ""
        statusdesc = ""
        idcomplaint = ""
        queueid = ""
        svcname = ""
        vehicleid = ""
        paddy = ""
        qtime = ""
        daddy = ""
        svcrating = ""
        typesvc = ""
        advnumber = ""
        cfee = ""
        ambid = ""
        ambname = ""
        ambmob = ""
        promoamount = ""
        etavar = ""
        invamount = ""
        advfee = ""
        totalamount = ""
        amountsaved = ""
        promocode = ""
        estimate = ""
        esttime = ""
        chafendtime = ""
        costofchaf = ""
        chafappxhours = ""
        plat = ""
        plong = ""
        dlat = ""
        dlong = ""
        chafstarttime = ""
        rsacost = ""
        rsadesc = ""
        idcomplaint = ""
        amblat = ""
        amblong = ""
        vehstatus = ""
        promodiscount = ""
        paymentType = ""
        complaintText = ""
        usedMinutes = ""
        svcId = ""
        estimateUrl = ""
        invoiceUrl = ""
    }
}
