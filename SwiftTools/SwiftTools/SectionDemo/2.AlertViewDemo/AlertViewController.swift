//
//  AlertViewController.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class AlertViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 100, y:100, width: 100, height: 40)
        btn.setTitle("弹出alertView", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(showAlertView), for: .touchUpInside)
        view.addSubview(btn)
        
        // BarButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(imageName: "home_more_btn", highlightedImageName: "ico_location",  size: CGSize(width: 40, height: 40))
}
    
    func showAlertView() {
        
        AlertView.showAlertView(vc: self, title: "提示", messgae: "看到消息了么?", cancleStr: "取消", sureStr: "确定", cancleButtonClickClosure: {
            print("取消...")
        }) {
            print("确定...")
        }
    }
}
