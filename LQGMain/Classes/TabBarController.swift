//
//  TabBarController.swift
//  LQGMain
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

import UIKit
import LQGBaseView
import LQGCTMediator
import LQGUIStyle

public class TabBarController: LQGBaseTabBarController {
    
    //MARK: - Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置风格
        self.tabBar.style = .white
        
        // 设置控制器
        self.setupViewControllers()
    }
    
    //MARK: - Other Method
    
    func setupViewControllers() {
        var viewControllers: [UIViewController] = []
        
        self.testVC(viewControllers: &viewControllers)
        self.webVC(viewControllers: &viewControllers)
        self.userCenterVC(viewControllers: &viewControllers)
  
        self.viewControllers = viewControllers
    }
    
    func testVC(viewControllers: inout [UIViewController]) {
        let vc = LQGCTMediator.sharedInstance().performTarget("Test", action: "getRootVC", params: [
            kCTMediatorParamsKeySwiftTargetModuleName: "LQGTest_Category"
        ], shouldCacheTarget: false) as? UIViewController
        if vc == nil {
            return
        }
        vc!.tabBarItem.title = "测试"
        vc!.title = "测试"
        viewControllers.append(LQGBaseNavigationController.init(rootViewController: vc!))
    }

    func webVC(viewControllers: inout [UIViewController]) {
        let vc: LQGBaseWebController = .init(isLocal: false, url: "https://www.baidu.com")
        vc.tabBarItem.title = "网页"
        vc.title = "网页"
        viewControllers.append(LQGBaseNavigationController.init(rootViewController: vc))
    }

    func userCenterVC(viewControllers: inout [UIViewController]) {
        let vc = LQGCTMediator.sharedInstance().performTarget("UserCenter", action: "getRootVC", params: [
            kCTMediatorParamsKeySwiftTargetModuleName: "LQGUserCenter_Category"
        ], shouldCacheTarget: false) as? UIViewController
        if vc == nil {
            return
        }
        vc!.tabBarItem.title = "我的"
        vc!.title = "我的"
        viewControllers.append(LQGBaseNavigationController.init(rootViewController: vc!))
    }
    
}
