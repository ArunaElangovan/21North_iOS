//
//  DateExtension.swift
//  21North
//
//  Created by Aruna Elangovan on 20/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import Foundation
extension Date {
    
    func dateAfterXMonths(x: Int) -> Date {
        let dateAfterXMonths = NSCalendar.current.date(byAdding: .month, value: x, to: self as Date, wrappingComponents: false)!
        return  dateAfterXMonths}
    
    func generateDatesArrayBetweenTwoDates(startDate: Date , endDate: Date) -> [Date]{
        var datesArray: [Date] =  [Date]()
        var startDate = startDate
        let calendar = Calendar.current
        
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        fmt.timeStyle = .none
        
        while startDate <= endDate {
            datesArray.append(startDate)
            startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
            
        }
        return datesArray
    }
}

