//
//  UIBarButtonItem+Extension.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    
    // 类方法创建
    /*
     class func createItem(imageName : String, highlightedImage : String , size : CGSize) -> UIBarButtonItem{
     let btn = UIButton()
     btn.setImage(UIImage(named : imageName), for: .normal)
     btn.setImage(UIImage(named : highlightedImage), for: .highlighted)
     btn.frame = CGRect (origin: CGPoint.zero, size: size)
     return UIBarButtonItem(customView: btn)
     }
     */

    
    /// 快速创建带图片的UIBarButtonItem
    ///
    /// - Parameters:
    ///   - imageName: 普通状态图片名
    ///   - highlightedImageName: 高亮状态图片名
    ///   - selImageName: 选择状态图片名
    ///   - size: BarButtonItem的size
    convenience init(imageName: String, highlightedImageName: String = "", size: CGSize = CGSize.zero) {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        if highlightedImageName != "" {
            button.setImage(UIImage(named: highlightedImageName), for: .highlighted)
        }
        if size != CGSize.zero {
            button.frame = CGRect (origin: CGPoint.zero, size: size)
        } else {
            button.sizeToFit()
        }
        self.init(customView: button)
    }
    
}
