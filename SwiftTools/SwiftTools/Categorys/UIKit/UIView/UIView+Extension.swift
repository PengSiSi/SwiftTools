//
//  UIView+Extension.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/5.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /// 返回view依赖的viewController
    public var viewController: UIViewController? {
        get {
            var responder = self as UIResponder
            while let nextResponder = responder.next {
                if (responder is UIViewController) {
                    return (responder as! UIViewController)
                }
                responder = nextResponder
            }
            return nil
        }
    }
    
    /// 查找aClass类型的subview（没递归）
    ///
    /// - Parameter aClass: 类的类型
    /// - Returns: 查找aClass类型的subview
    public func findSubView(aClass: AnyClass) -> UIView? {
        for subView in self.subviews {
            if (type(of: subView) === aClass) {
                return subView
            }
        }
        return nil
    }
    
    
    /// 查找aClass类型的superview
    ///
    /// - Parameter aClass: 类的类型
    /// - Returns: 查找aClass类型的superview
    public func  findSuperView(aClass: AnyClass) -> UIView? {
        guard let parentView = self.superview else {
            return nil
        }
        if (type(of: parentView) === aClass) {
            return parentView
        }
        
        return self.findSuperView(aClass: aClass)
    }
    
    // 判断View是不是第一响应者
    public func  findAndResignFirstResponder() -> Bool {
        if self.isFirstResponder {
            self.resignFirstResponder()
            return true
        }
        for v in self.subviews {
            if v.findAndResignFirstResponder() {
                return true
            }
        }
        return false
    }
    
    // 找到当前view的第一响应者
    public func  findFirstResponder() -> UIView? {
        if (self is UITextField || self is UITextView) && self.isFirstResponder{
            return self
        }
        for v: UIView in self.subviews {
            let fv = v.findFirstResponder()
            if fv != nil {
                return fv
            }
        }
        return nil
    }

}
