//
//  Dictionary+Extension.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/5.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import Foundation

extension Dictionary {
    
    /// 转JSON
    ///
    /// - Returns: 可选的格式化的JSON字符串
    public func prettyJSONString() -> String?{
        return JSONString(option: [.prettyPrinted])
    }
    
    /// 转JSON
    ///
    /// - Returns: 可选的一行JSON字符串
    public func JSONStringRepresentation()  -> String?{
        return JSONString(option: [])
    }
    
    /// 转JSON
    ///
    /// - Returns: 可选的JSON字符串
    private func JSONString(option: JSONSerialization.WritingOptions) -> String?{
        do{
            let data = try JSONSerialization.data(withJSONObject: self, options: option)
            return  String(data: data, encoding: String.Encoding.utf8)
        } catch {
            return nil
        }
        
    }
}
