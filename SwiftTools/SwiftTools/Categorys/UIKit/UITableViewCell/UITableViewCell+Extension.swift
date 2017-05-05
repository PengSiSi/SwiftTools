//
//  UITableViewCell+Extension.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/5.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    // 类方法调用
    public class func celFromNib() -> UINib {
        return  UINib(nibName: String(describing: self), bundle: nil)
    }
}
