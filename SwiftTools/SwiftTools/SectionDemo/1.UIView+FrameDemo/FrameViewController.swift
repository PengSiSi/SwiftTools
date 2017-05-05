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
        
        // 设置圆角
//        setViewBorder(myView2, borderWidth: 1, borderColor: UIColor.red, cornerRadius: 5)
        CommonTool.setViewBorder(myView2, borderWidth: 2, borderColor: UIColor.green, cornerRadius: 2)
        
        // 计算文字的高度  161.103515625
        let textHeight = CommonTool.getLabelTextRectSize(text: "思思就动脑筋呢今年放你飞机份额金额呢减肥呢减肥呢积分思思就动脑筋呢今年放你飞机份额金额呢减肥呢减肥呢积分", font: UIFont.systemFont(ofSize: 15), size: CGSize(width: 100, height: 99999))
        print(textHeight)
        
        // 当前日期
        let date: NSDate = NSDate()
        // 当前日期转String
        let str = date.toDasteString(formatString: "yyyy-MM-dd", timezone: .current, localeIdentifier: "en")
        print("date = \(date) dateStr = \(str)")
    }
}
