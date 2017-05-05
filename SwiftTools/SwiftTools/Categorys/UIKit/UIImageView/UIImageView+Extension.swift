//
//  UIImageView+Extension.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/5.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    ///  Make image view blurry
    ///  设置模糊效果
    /// - Parameter withStyle: UIBlurEffectStyle (default is .light).
    func blur(withStyle: UIBlurEffectStyle = .light) {
        let blurEffect = UIBlurEffect(style: withStyle)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
        self.clipsToBounds = true
    }
}

