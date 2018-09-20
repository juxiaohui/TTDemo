//
//  XHTabBarController.swift
//  TTDemo
//
//  Created by jxh on 2018/9/19.
//  Copyright © 2018年 juxiaohui. All rights reserved.
//

import UIKit

class XHTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabbar()
        addChildController()
    }


    private func setupTabbar() {

        var normalDict = [NSAttributedStringKey : Any].init()
        normalDict[NSAttributedStringKey.foregroundColor] = UIColor.gray
        normalDict[NSAttributedStringKey.font] = UIFont.systemFont(ofSize: 12)

        var selectDict = [NSAttributedStringKey : Any].init()
        selectDict[NSAttributedStringKey.foregroundColor] = UIColor.red

        UITabBarItem.appearance().setTitleTextAttributes(normalDict, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(selectDict, for: .selected)

    }

    private func addChildController() {
        //首页
        setupChildVc(childController: XHHomeViewController(), title: "首页", imageName: "home" + baseTabbarImageName, selectedImageName: "home" + baseTabbarSelectedImageName)

        setupChildVc(childController: XHVideoViewController(), title: "西瓜视频", imageName: "video" + baseTabbarImageName, selectedImageName: "video" + baseTabbarSelectedImageName)

        setupChildVc(childController: XHWeitoutiaoViewController(), title: "微头条", imageName: "weitoutiao" + baseTabbarImageName, selectedImageName: "weitoutiao" + baseTabbarSelectedImageName)

        setupChildVc(childController: XHProfileViewController(), title: "我的", imageName: "no_login" + baseTabbarImageName, selectedImageName: "no_login" + baseTabbarSelectedImageName)

    }


    func setupChildVc(childController: UIViewController, title: String, imageName: String, selectedImageName: String) {

        let nav = XHNavigationController.init(rootViewController: childController)
        addChildViewController(nav)

        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage.init(named: imageName)
        nav.tabBarItem.selectedImage = UIImage.init(named: selectedImageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
