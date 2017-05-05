//
//  UIDevice+Extension.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/5.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import Foundation
import UIKit

public extension UIDevice {
    
    // Returns true if the device is iPhone
    public static var  isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    
    // Returns true if the device is iPad
    public static var  isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    
    @available(iOS 9.0, *)
    public static var  isTV: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.tv
    }
    
    @available(iOS 9.0, *)
    public static var  isCar: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.carPlay
    }
}
