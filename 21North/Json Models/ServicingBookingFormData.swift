//
//  ServicingBookingFormData.swift
//  21North
//
//  Created by Aruna Elangovan on 02/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

/// SignUpResponse object which comes as a response of PRELEAD
open class ServicingBookingFormData: Codable {
    var serviceCentreData: Array<ServiceCentreData>
    var slotData: Array<SlotData>
    var cancelReason: Array<CancelReason>
    var subComplaintData: Array<SubComplaintData>
    var complaintData: Array<ComplaintData>
    var name: String
    var id: String
    var earliestSlotDate: String
    var distance: String
    var earliestSlotTime: String
    var rating: String
    var type_service: String
    var advFee: String
    
    required public init(json: JSON) throws {
        name = json["record0"][0]["name"].stringValue
        id = json["record0"][0]["id"].stringValue
        earliestSlotDate = json["record0"][0]["date_earliest_slot"].stringValue
        distance = json["record0"][0]["distance"].stringValue
        earliestSlotTime = json["record0"][0]["time_earliest_slot"].stringValue
        rating = json["record0"][0]["rating"].stringValue
        type_service = json["record0"][0]["type_service"].stringValue
        advFee = json["record0"][0]["advisory_fee"].stringValue
        serviceCentreData = [ServiceCentreData]()
        subComplaintData = [SubComplaintData]()
        complaintData = [ComplaintData]()
        slotData = [SlotData]()
        cancelReason = [CancelReason]()
        
        if json["record1"][0]["-1"] != "-1"{
            let serviceCentreArray = json["record1"].arrayValue
            
            for aServiceCentre in serviceCentreArray{
                try serviceCentreData.append(ServiceCentreData(json: aServiceCentre))
            }
        }
        
        if json["record3"][0]["-1"] != "-1"{
            let subComplaintArray = json["record3"].arrayValue
            
            for aSubComplaint in subComplaintArray{
                try subComplaintData.append(SubComplaintData(json: aSubComplaint))
            }
        }
        
        if json["record2"][0]["-1"] != "-1"{
            let complaintArray = json["record2"].arrayValue
            
            for aComplaint in complaintArray{
                try complaintData.append(ComplaintData(json: aComplaint))
            }
        }
        
        if json["record6"][0]["-1"] != "-1"{
            let cancelReasonsArray = json["record6"].arrayValue
            
            for aReason in cancelReasonsArray{
                try cancelReason.append(CancelReason(json: aReason))
            }
        }
        
        if json["record4"][0]["-1"] != "-1"{
            let slotArray = json["record4"].arrayValue
            
            for aSlot in slotArray {
                try slotData.append(SlotData(json: aSlot))
            }
        }
    }
    
    public init() {
        name = ""
        id = ""
        earliestSlotDate = ""
        distance = ""
        earliestSlotTime = ""
        rating = ""
        type_service = ""
        advFee = ""
        serviceCentreData = [ServiceCentreData]()
        subComplaintData = [SubComplaintData]()
        complaintData = [ComplaintData]()
        slotData = [SlotData]()
        cancelReason = [CancelReason]()
    }
}

