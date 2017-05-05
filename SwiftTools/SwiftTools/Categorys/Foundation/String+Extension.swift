//
//  String+Extension.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/5.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import Foundation

extension String {
    
    // Base64解密
    public var base64Decoded: String? {
        // https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
        guard let decodedData = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: decodedData, encoding: .utf8)
    }
    
    // Base64加密
    public var base64Encoded: String? {
        // https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
        let plainData = self.data(using: .utf8)
        return plainData?.base64EncodedString()
    }
    
    
    ///去掉自己前后空格
    public mutating func trim() {
        self = self.trimmed()
    }
    
    //／返回去掉前后空格的字符串
    public func trimmed() -> String {
        let set : CharacterSet = CharacterSet.whitespacesAndNewlines
        return self.trimmingCharacters(in: set)
    }
    
    // 是否包含此字符串
    public func contains(_ string:String) -> Bool {
        if (self.range(of: string) != nil) {
            return true
        } else {
            return false
        }
    }
    
    public func contains(_ string:String, withCompareOptions compareOptions: NSString.CompareOptions) -> Bool {
        if ((self.range(of:string, options: compareOptions)) != nil) {
            return true
        } else {
            return false
        }
    }
    
    // 字符串反转,逆序
    public func reversed() -> String {
        return String(self.characters.reversed())
    }

}
