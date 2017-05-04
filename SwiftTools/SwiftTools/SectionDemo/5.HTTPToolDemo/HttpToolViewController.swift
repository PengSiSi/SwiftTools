//
//  HttpToolViewController.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class HttpToolViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonTitleArray = ["GET", "POST", "上传", "下载"]
        let containView = UIView(frame: CGRect(x: 0, y: 100, width: k_ScreenWidth, height: 300))
        view.addSubview(containView)
        for i in 0..<buttonTitleArray.count {
            
            let btn = UIButton(type: .custom)
            btn.backgroundColor = UIColor.randomColor()
            btn.frame = CGRect(x: 100, y: i * 50 + 20, width: 100, height: 40)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            btn.setTitle(buttonTitleArray[i], for: .normal)
            btn.tag = i
            btn.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
            containView.addSubview(btn)
        }
    }
    
    func buttonClick(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            //  get
            HTTPTool.shareInstance.requestData(.GET, URLString: "https://httpbin.org/get", parameters: ["foo": "bar"], success: { (response) in
                print("response = \(response)")
            }, failture: { (error) in
                print("error = \(error)")
            })
            break
        case 1:
            //  post 同上面一样,改变请求方式即可
            break
        case 2:
            //  上传
//            HTTPTool.shareInstance.upLoadImageRequest(URLString: "", params: ["a" : "a"], data: <#T##[Data]#>, name: <#T##[String]#>, success: <#T##([String : AnyObject]) -> ()#>, failture: <#T##(Error) -> ()#>)
            break
        case 3:
            //  下载
            HTTPTool.shareInstance.downLoadFileRequest(URLString: "http://www.hangge.com/blog/images/logo.png", fileName: "logo.png", filePath: "sisi")
            break
        default:
            break
        }
    }
}
