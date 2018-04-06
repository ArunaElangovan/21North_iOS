//
//  PostBookingDetails.swift
//  21North
//
//  Created by Aruna Elangovan on 01/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class PostBookingDetails: Codable {
    var serviceCentreData: Array<ServiceCentreData>
    var subComplaintData: Array<SubComplaintData>
    var complaintData: Array<ComplaintData>
    var bookingData: Array<BookingData>
    var cancelReason: Array<CancelReason>
    var slotData: Array<SlotData>
    
    required public init(json: JSON) throws {
        serviceCentreData = [ServiceCentreData]()
        subComplaintData = [SubComplaintData]()
        complaintData = [ComplaintData]()
        bookingData = [BookingData]()
        cancelReason = [CancelReason]()
        slotData = [SlotData]()
        
        if json["record2"][0]["-1"] != "-1"{
            let serviceCentreArray = json["record2"].arrayValue
            
            for aServiceCentre in serviceCentreArray {
                try serviceCentreData.append(ServiceCentreData(json: aServiceCentre))
            }
        }
        
        if json["record4"][0]["-1"] != "-1"{
            let subComplaintArray = json["record4"].arrayValue
            
            for aSubComplaint in subComplaintArray {
                try subComplaintData.append(SubComplaintData(json: aSubComplaint))
            }
        }
        
        if json["record3"][0]["-1"] != "-1"{
            let complaintArray = json["record3"].arrayValue
            
            for aComplaint in complaintArray {
                try complaintData.append(ComplaintData(json: aComplaint))
            }
        }
        
        if json["record0"][0]["-1"] != "-1"{
            let bookingDataArray = json["record0"].arrayValue
            
            for aBooking in bookingDataArray {
                try bookingData.append(BookingData(json: aBooking))
            }
        }
        
        if json["record5"][0]["-1"] != "-1"{
            let cancelReasonsArray = json["record5"].arrayValue
            
            for aReason in cancelReasonsArray {
                try cancelReason.append(CancelReason(json: aReason))
            }
        }
        
        if json["record7"][0]["-1"] != "-1"{
            let slotArray = json["record7"].arrayValue
            
            for aSlot in slotArray {
                try slotData.append(SlotData(json: aSlot))
            }
        }
        
    }
    
    public init() {
        serviceCentreData = [ServiceCentreData]()
        subComplaintData = [SubComplaintData]()
        complaintData = [ComplaintData]()
        bookingData = [BookingData]()
        cancelReason = [CancelReason]()
        slotData = [SlotData]()
    }
}

