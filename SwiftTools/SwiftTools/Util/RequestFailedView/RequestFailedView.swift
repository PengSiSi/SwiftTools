//
//  RequestFailedView.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/3.
//  Copyright © 2017年 思 彭. All rights reserved.

// 数据请求失败显示的View

import UIKit

typealias ReloadButtonClick = () -> Void

class RequestFailedView: UIView {

    var reloadBtnClosure: ReloadButtonClick? = nil
    var imgName: String? {
        didSet {
            self.imgView.image = UIImage(named:imgName!)
        }
    }
    var titleStr: String? {
        didSet {
            self.titleLabel.text = titleStr
        }
    }
    
    var reloadBtnTitle: String? {
        didSet {
          self.reloadBtn.setTitle(reloadBtnTitle, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var imgView: UIImageView = {
        
        let imgView = UIImageView(frame: CGRect(x: (k_ScreenWidth - 180) / 2, y: 80, width: 180, height: 260))
//        imgView.image = UIImage(named: "cry")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    fileprivate lazy var titleLabel: UILabel =  {
       
        let titleLabel = UILabel(frame: CGRect(x:0, y: self.imgView.bottom + 10, width: k_ScreenWidth, height: 30))
        titleLabel.text = "网络请求失败，请稍后再试~"
        titleLabel.textColor = UIColor.lightGray
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        return titleLabel
    }()
    
    fileprivate lazy var reloadBtn: UIButton = {
       
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: self.titleLabel.x, y: self.titleLabel.bottom + 10, width: self.titleLabel.width, height: 30)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitle("重新加载", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(reloadButtonAction(_:)), for: .touchUpInside)
        return button
    }()
}

// MARK: 设置界面

extension RequestFailedView {
    
    func setupUI() {
        
//        let containerView = UIView (frame: CGRect(x: 20, y:( 20, width: k_ScreenWidth - 40, height: k_ScreenHeight - 40))
//        self.addSubview(containerView)
        self.addSubview(self.imgView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.reloadBtn)
    }
    
    func reloadButtonAction(_ sender: AnyObject) {
        
        if (self.reloadBtnClosure != nil) {
            self.reloadBtnClosure!()
        }
    }
    
   class func show() -> RequestFailedView {
        
        return RequestFailedView()
    }
}
