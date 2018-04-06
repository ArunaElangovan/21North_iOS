//
//  RefreshResponse.swift
//  21North
//
//  Created by Aruna Elangovan on 13/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class RefreshResponse: Codable {
    var bookingData: Array<BookingData>
    var cancelReason: Array<CancelReason>
    
    required public init(json: JSON) throws {
        bookingData = [BookingData]()
        cancelReason = [CancelReason]()
        
        if json["record0"][0]["-1"] != "-1"{
            let bookingDataArray = json["record0"].arrayValue
            
            for aBooking in bookingDataArray {
                try bookingData.append(BookingData(json: aBooking))
            }
        }
        
        if json["record1"][0]["-1"] != "-1"{
            let cancelReasonsArray = json["record1"].arrayValue
            
            for aReason in cancelReasonsArray {
                try cancelReason.append(CancelReason(json: aReason))
            }
        }
        
    }
    
    public init() {
        bookingData = [BookingData]()
        cancelReason = [CancelReason]()
    }
}
