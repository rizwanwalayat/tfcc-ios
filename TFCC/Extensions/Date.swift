//
//  Date.swift
//  TFCC
//
//  Created by Phaedra Solutions  on 10/03/2022.
//

import Foundation

extension Date {
//    var iso8601withFractionalSeconds: String { return Formatter.iso8601withFractionalSeconds.string(from: self) }

    func dateToString(_ stringFormatter : String) -> String
    {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.string(from: self)
        let date = formatter.date(from: dateString)
        formatter.dateFormat = stringFormatter
//        formatter.locale = Locale(identifier: AppSettings.appLanguage)
        let returnString = formatter.string(from: date ?? self)
        
        return returnString
    }
    func stringToDate(formate : String, dateString: String) -> Date
    {
        let formatter = DateFormatter()
        formatter.dateFormat = formate
        return formatter.date(from: dateString) ?? self
    }
    
    func getNextMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)
    }
    
    func getPreviousMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
}

extension Date {
     
    public func addMinute(_ minute: Int) -> Date? {
        var comps = DateComponents()
        comps.minute = minute
        let calendar = Calendar.current
        let result = calendar.date(byAdding: comps, to: self)
        return result ?? nil
    }

 }
