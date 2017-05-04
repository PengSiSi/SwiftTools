//
//  ViewController.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class FrameViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.UIView+Frame
        let myView1 = UIView(frame: CGRect(x: 100, y: 100, width: 30, height: 40))
        myView1.backgroundColor = UIColor.green
        view.addSubview(myView1)
        
        let myView2 = UIView()
        myView2.frame = CGRect(x: myView1.x, y: myView1.bottom + 10, width: myView1.width + 20, height: myView1.height - 30)
        myView2.backgroundColor = UIColor.orange
        view.addSubview(myView2)

        // 取得随机颜色
        // 5. 获取随机颜色
        view.backgroundColor = UIColor.randomColor()
        
    }
}
