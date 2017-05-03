//
//  UIView+Frame.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/3.
//  Copyright © 2017年 思 彭. All rights reserved.

// UIView的Frmae扩展

import Foundation
import UIKit


extension UIView {
   
    // x
    var x: CGFloat {
        get {
            return frame.origin.x;
        }
        set(x) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x = x
            frame = tempFrame
        }
    }
    
    // y
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(y) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y = y
            frame = tempFrame
        }
    }
    
    // height
    var height: CGFloat {
        get {
            return frame.height
        }
        set(height) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = height
            frame = tempFrame
        }
    }
    
    // width
    var width: CGFloat {
        get {
            return frame.width
        }
        set(width) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = width
            frame = tempFrame
        }
    }
    
    // origin
    var origin: CGPoint {
        get {
            return frame.origin
        }
        set(newPoint) {
            var newframe: CGRect = frame
            newframe.origin = newPoint
            frame = newframe
        }
    }
    
    // size
    var size: CGSize {
        get {
            return frame.size
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    // centerX
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    // centerY
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y = newValue
            center = tempCenter;
        }
    }
    
    // top
    var top: CGFloat {
        get {
            return frame.origin.y
        }
        set(newTop) {
            var newFrame = frame;
            newFrame.origin.y = newTop;
            frame = newFrame;
        }
    }
    
    // left
    var left: CGFloat {
        get {
            return frame.origin.x
        }
        set(newLeft) {
            var newFrame = frame;
            newFrame.origin.x = newLeft;
            frame = newFrame;
        }
    }

    // bottom
    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set(newBottom) {
            var newFrame = frame;
            newFrame.origin.y = newBottom - frame.size.height;
            frame = newFrame;
        }
    }
    
    // right
    var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        set(newRight) {
            let delta = newRight - (frame.origin.x + frame.size.width);
            var newFrame = frame;
            newFrame.origin.x += delta ;
            self.frame = newFrame;
        }
    }
}
