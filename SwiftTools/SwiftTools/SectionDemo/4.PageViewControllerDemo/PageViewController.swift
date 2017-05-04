//
//  PageViewController.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/4.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

private let kTitleViewH :CGFloat = 40

class PageViewController: BaseViewController, PageTitleViewDelegate, PageContentViewDelegate {

    let titles = ["推荐","手游","娱乐","游戏","趣玩"]
    
    fileprivate lazy var pageTitleView : PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: kStatusBarH+kNavBarH, width: kScreenW, height: kTitleViewH)
        let titleView = PageTitleView(frame: titleFrame, titles: (self?.titles)!)
        //MARK:- 控制器作为PageTitleViewDelegate代理
        titleView.delegate = self
        return titleView
        }()
    
    fileprivate lazy var pageContentView : PageContentView = { [weak self] in
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavBarH + kTitleViewH, width: kScreenW, height: kScreenH - kStatusBarH - kNavBarH - kTitleViewH)
        var childVcs = [UIViewController]()
        childVcs.append(ViewController1())
        childVcs.append(ViewController2())
        childVcs.append(ViewController3())
        childVcs.append(ViewController4())
        childVcs.append(ViewController5())
        //        for _ in 0..<(self?.titles.count)! {
        //            let vc = UIViewController()
        //            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
        //            childVcs.append(vc)
        //        }
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentVc: self)
        //MARK:- 控制器作为PageContentViewDelegate代理
        contentView.delegate = self
        return contentView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(pageTitleView)
        view.addSubview(pageContentView)
    }
}

extension PageViewController {
    
    //MARK:- PageTitleViewDelegate代理实现
    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
    
    //MARK:- PageContentViewDelegate代理实现
    func pageContentView(_ contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
