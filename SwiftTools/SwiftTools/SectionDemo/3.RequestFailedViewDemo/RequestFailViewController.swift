//
//  RequestFailViewController.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class RequestFailViewController: BaseViewController {

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
    }
    
    // 3. RequestFailedView
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.addSubview(self.failedView)
    }
}
