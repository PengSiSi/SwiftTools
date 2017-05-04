//
//  NSDate+Extension.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import Foundation

extension NSDate {
    
    class func getCurrentDate() -> String{
        
        return "\(NSDate().timeIntervalSince1970)"//interval
    }
}
