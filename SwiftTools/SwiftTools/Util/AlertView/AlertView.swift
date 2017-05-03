//
//  AlertView.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/3.
//  Copyright © 2017年 思 彭. All rights reserved.

// AlertViewController的封装

import UIKit


/// "取消"
typealias CancleButtonClick = () -> Void

/// "确定"
typealias SureButtonClick = () -> Void

/// 类方法调用
class AlertView{
    
    var cancleButtonClickClosure: CancleButtonClick? = nil
    var sureButtonClickClosure: SureButtonClick? = nil
    
    static func showAlertView(vc: UIViewController, title: String, messgae: String, cancleStr: String, sureStr: String, cancleButtonClickClosure: @escaping CancleButtonClick, sureButtonClickClosure: @escaping SureButtonClick) {
        
        let alertView = AlertView()
        let alertController = UIAlertController(title: title, message: messgae, preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: cancleStr, style: .cancel) { (action) in
            alertView.clickCancleBtn(cancleBtnClickClosure: cancleButtonClickClosure)
        }
        let sureAction = UIAlertAction(title: sureStr, style: .default) { (action) in
            alertView.clickSureBtn(sureBtnClickClosure: sureButtonClickClosure)
        }
        if cancleStr.characters.count > 0 {
            alertController.addAction(cancleAction)
        }
        if sureStr.characters.count > 0 {
            alertController.addAction(sureAction)
        }
        vc.present(alertController, animated: true, completion: nil)
    }
    
    func clickCancleBtn(cancleBtnClickClosure: @escaping CancleButtonClick) {
        self.cancleButtonClickClosure = cancleBtnClickClosure
        if (self.cancleButtonClickClosure != nil) {
            self.cancleButtonClickClosure!()
        }
    }
    
    func clickSureBtn(sureBtnClickClosure: @escaping SureButtonClick) {
        
        self.sureButtonClickClosure = sureBtnClickClosure
        if self.sureButtonClickClosure != nil {
            self.sureButtonClickClosure!()
        }
    }
}
