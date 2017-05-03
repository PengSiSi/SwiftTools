//
//  ViewController.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/3.
//  Copyright © 2017年 思 彭. All rights reserved.

// 封装,类目,Util测试Demo

import UIKit

class ViewController: UIViewController {

    // 懒加载
    
    fileprivate lazy var failedView: RequestFailedView = {
       
        let failedView = RequestFailedView.show()
        failedView.frame = CGRect(x: 0, y: 0, width: k_ScreenWidth, height: k_ScreenHeight)
        failedView.imgName = "cry"
        failedView.reloadBtnClosure = {() -> Void in
            
            print("重新加载...")
            failedView.removeFromSuperview()
        }
        return failedView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 4. 快速设置颜色
//        view.backgroundColor = UIColor(255, 0, 0, 0.9)
        
        // 5. 获取随机颜色
        view.backgroundColor = UIColor.randomColor()
        
        // 1.UIView+Frame
        let myView1 = UIView(frame: CGRect(x: 100, y: 50, width: 30, height: 40))
        myView1.backgroundColor = UIColor.green
        view.addSubview(myView1)
        
        let myView2 = UIView()
        myView2.frame = CGRect(x: myView1.x, y: myView1.bottom + 10, width: myView1.width + 20, height: myView1.height - 30)
        myView2.backgroundColor = UIColor.orange
        view.addSubview(myView2)
        
        // 2.AlertView
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: myView2.left, y: myView2.bottom + 10, width: 100, height: 40)
        btn.setTitle("弹出alertView", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(showAlertView), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    func showAlertView() {
        
        AlertView.showAlertView(vc: self, title: "提示", messgae: "看到消息了么?", cancleStr: "取消", sureStr: "确定", cancleButtonClickClosure: {
            print("取消...")
        }) { 
            print("确定...")
        }
    }

    // 3. RequestFailedView
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.addSubview(self.failedView)
    }
}

