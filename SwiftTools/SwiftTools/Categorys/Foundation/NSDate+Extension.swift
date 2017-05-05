//
//  NSDate+Extension.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import Foundation

extension NSDate {
    
    
    /// 取得当前日期
    ///
    /// - Returns: 以字符串形式返回当前日期
    class func getCurrentDate() -> String{
        
        return "\(NSDate().timeIntervalSince1970)"//interval
    }
    
    /// 格式化时间
    ///
    /// - Parameters:
    ///   - formatString: 格式符
    ///   - timezoneAbbr: The abbreviation for the time zone.
    ///   - localeIdentifier: the specified identifier.
    /// - Returns: 格式化的字符串
    public func toDateString(formatString: String,timezoneAbbr: String,localeIdentifier:String) -> String{
        return toDasteString(formatString: formatString, timezone: TimeZone(abbreviation: timezoneAbbr)!, localeIdentifier: localeIdentifier)
    }
    
    
    /// 格式化时间
    ///
    /// - Parameters:
    ///   - formatString: 格式符
    ///   - timezone: 时区
    ///   - localeIdentifier: the specified identifier.
    /// - Returns: 格式化的字符串
    public func toDasteString(formatString: String,timezone: TimeZone,localeIdentifier:String) -> String{
        let dataFormat = DateFormatter()
        dataFormat.locale = Locale(identifier: localeIdentifier)
        dataFormat.timeZone = timezone
        dataFormat.dateFormat = formatString
        return dataFormat.string(from: self as Date)
    }

}
