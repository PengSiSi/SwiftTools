//
//  UIApplication+Extension.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/5.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    // application文件大小
    public var applicationFileSize: String {
        func sizeOfFolderPath(_ folderPath: String) -> Int64 {
            let contents: [String]?
            do {
                contents = try FileManager.default.contentsOfDirectory(atPath: folderPath)
            } catch _ {
                contents = nil
            }
            var folderSize: Int64 = 0
            
            if let tempContents = contents{
                for file in tempContents {
                    let dict = try?  FileManager.default.attributesOfItem(atPath: (folderPath as NSString).appendingPathComponent(file))
                    if dict != nil {
                        folderSize += (dict![FileAttributeKey.size] as? Int64) ?? 0
                    }
                }
            }
            return folderSize
        }
        
        let docSize = sizeOfFolderPath(self.m_documentPath)
        let libSzie = sizeOfFolderPath(self.m_libraryPath)
        let cacheSize = sizeOfFolderPath(self.m_cachePath)
        let total = docSize + libSzie + cacheSize + cacheSize
        let folderSizeStr = ByteCountFormatter.string(fromByteCount: total, countStyle: .file)
        
        return folderSizeStr
    }
    
    //Document路径
    public var m_documentPath: String {
        let dstPath =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return dstPath
    }
    
    // library路径
    public var m_libraryPath: String {
        let dstPath =  NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!
        return dstPath
    }
    
    // cache路径
    public var m_cachePath: String {
        let dstPath =  NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        return dstPath
    }
}
