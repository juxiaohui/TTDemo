//
//  XHProfileViewController.swift
//  TTDemo
//
//  Created by jxh on 2018/9/19.
//  Copyright © 2018年 juxiaohui. All rights reserved.
//

import UIKit

let kHeaderViewHeight = 280

class XHProfileViewController: UITableViewController {

    // MARK: - 懒加载属性

    private var headerView = XHNoLoginHeaderView.loadViewFromNib()


    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableHeaderView = headerView

        tableView.contentInset = UIEdgeInsets.zero

//        if #available(iOS 11.0, *) {
//            tableView.contentInsetAdjustmentBehavior = .never
//        } else {
//            automaticallyAdjustsScrollViewInsets = false
//        }
//
        scrollViewDidScroll(tableView)


    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }


    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - UIScrollViewDelagate

extension XHProfileViewController {

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let offsetY = scrollView.contentOffset.y

        if offsetY < 0 {
            headerView.bgImageView.frame = CGRect.init(x: 0, y: offsetY, width: screenWidth, height: CGFloat(kHeaderViewHeight) + abs(offsetY))
        }

    }
}
