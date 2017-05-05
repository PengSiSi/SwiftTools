//
//  CommonTool.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/5.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import Foundation
import UIKit

class CommonTool {
    
    
    /// 设置view的圆角,边框
    ///
    /// - Parameters:
    ///   - view: 当前设置的view
    ///   - borderWidth: 边框值
    ///   - borderColor: 边框颜色
    ///   - cornerRadius: 圆角值
    class func setViewBorder(_ view: UIView, borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat) {
        
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = borderWidth
        view.layer.cornerRadius = cornerRadius
        view.layer.masksToBounds = true
    }
    
    
    /// 根据文字多少计算label的高度
    ///
    /// - Parameters:
    ///   - text: 计算的文字
    ///   - font: 文字的字体大小
    ///   - size: 计算的范围
    /// - Returns: 返回计算好的高度
    class func getLabelTextRectSize(text:String,font:UIFont,size:CGSize) -> CGFloat {
        
        let attributes = [NSFontAttributeName: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let height:CGFloat = text.boundingRect(with: size, options: option, attributes: attributes, context: nil).size.height
        return height
    }
}
