
//
//  Extension+Date.swift
//  Pro Services
//
//  Created by Riddhi on 11/01/18.
//  Copyright © 2018 Riddhi. All rights reserved.
//

import UIKit

extension Date {
    
    func toString(dateFormatFormat:String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = dateFormatFormat
        
        return dateFormatter.string(from: self)
    }
    
    var startOfWeek: Date? {
        
        //return Calendar.current.date(byAdding: .day, value: -6, to: Date())
        
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 1, to: sunday)
    }
    
    var endOfWeek: Date? {
        
        //return Calendar.current.date(byAdding: .day, value: 6, to: Date())
        
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 7, to: sunday)
    }
    
    /*
    Example
     
    if let startDay = Date().startOfWeek {
        let startWeekDay =  startDay.toString(dateFormatFormat: "yyyy-MM-dd")
        print("startWeekDay",startWeekDay)
    }
    if let endDay = Date().endOfWeek {
        let endWeekDay =  endDay.toString(dateFormatFormat: "yyyy-MM-dd")
        print("startWeekDay",endWeekDay)
    }
    
     */
    
    
}

extension String {
    
    func toDate(dateFormatFormat:String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = dateFormatFormat
        
        return dateFormatter.date(from: self)!
    }
    
}
