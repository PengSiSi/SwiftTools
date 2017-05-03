//
//  UIColor+Color.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/3.
//  Copyright © 2017年 思 彭. All rights reserved.

// UIColor的遍历构造器

import Foundation
import UIKit

extension UIColor {
    
    convenience init(_ r : CGFloat, _ g : CGFloat, _ b : CGFloat) {
        
        let red = r / 255.0
        let green = g / 255.0
        let blue = b / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    convenience init(_ r : CGFloat, _ g : CGFloat, _ b : CGFloat, _ a : CGFloat) {
        
        let red = r / 255.0
        let green = g / 255.0
        let blue = b / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: a)
    }
    
    /**
     *  16进制 转 RGBA
     */
    class func rgbaColorFromHex(rgb:Int, alpha: CGFloat) -> UIColor {
        
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: alpha)
    }
    
    /**
     *  16进制 转 RGB
     */
    class func rgbColorFromHex(rgb:Int) -> UIColor {
        
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: 1.0)
    }
    
    //用数值初始化颜色，便于生成设计图上标明的十六进制颜色
    // let testColor = UIColor(valueRGB: 0x666666, alpha: 1.0)
    
    convenience init(valueRGB: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((valueRGB & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((valueRGB & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(valueRGB & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
   class  func randomColor() -> UIColor{
        
        /**
         *  RGB 随机颜色
         */
        let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
        let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let alpha = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        
        let color = UIColor.init(red:red, green:green, blue:blue , alpha: alpha)
        return color
    }
}
