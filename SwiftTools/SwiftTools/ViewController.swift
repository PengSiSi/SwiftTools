//
//  ViewController.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/3.
//  Copyright © 2017年 思 彭. All rights reserved.

// 封装,类目,Util测试Demo

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    lazy var tableView = UITableView()
    var titleArray: [String]? = nil
    var classVcArray: [String]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SwiftDemo"
        configureData()
        setupTableView()
   }
    
    func configureData() {
        
        titleArray = ["1.UIView+FrameDemo",
                      "2.AlertViewDemo",
                      "3.RequestFailedViewDemo",
                      "4.PageViewControllerDemo",
                      "5.HttpToolViewControllerDemo"
                     ]
        classVcArray = [
                      "FrameViewController",
                      "AlertViewController",
                      "RequestFailViewController",
                      "PageViewController",
                      "HttpToolViewController"
                       ]
    }
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
    }
}

// MARK: UITableViewDelegate && UITableViewDataSource

extension ViewController {
    
    // 组数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleArray!.count
    }
    // 创建cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        let text = titleArray![indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.red
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
    }
    // 行数
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
    }
    // 点击单元格
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let classVc: UIViewController = getViewController(classVcArray![indexPath.row])!
        self.navigationController?.pushViewController(classVc, animated: true)
    }
}

extension ViewController {
    
    /// 类文件字符串转换为ViewController
    ///
    /// - Parameter childControllerName: VC的字符串
    /// - Returns: ViewController
    
    func getViewController(_ childControllerName: String) -> UIViewController?{
        
        // 1.获取命名空间
        // 通过字典的键来取值,如果键名不存在,那么取出来的值有可能就为没值.所以通过字典取出的值的类型为AnyObject?
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            print("命名空间不存在")
            return nil
        }
        // 2.通过命名空间和类名转换成类
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + childControllerName)
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard let clsType = cls as? UIViewController.Type else {
            print("无法转换成UIViewController")
            return nil
        }
        // 3.通过Class创建对象
        let childController = clsType.init()
        return childController
    }
}

