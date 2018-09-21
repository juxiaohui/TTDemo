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

    private lazy var headerView = XHNoLoginHeaderView.loadViewFromNib()

    private lazy var profileViewModel = XHProfileViewModel.init()


    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()


        tableView.tableHeaderView = headerView
        tableView.separatorStyle = .none

        tableView.xh_registerCell(cell: XHProfileCell.self)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.init(r: 246, g: 246, b: 246)



        profileViewModel.loadData {
           self.tableView.reloadData()
        }


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



extension XHProfileViewController {


    // 组数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return profileViewModel.profileList.count
    }

    // 每组头部的高度
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    // 每组头部视图
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 10))
        view.backgroundColor = UIColor.init(r: 246, g: 246, b: 246)
        return view
    }

    // 每组的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileViewModel.profileList[section].count
    }

    // 行高
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }



//     cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.xh_dequeueReusableCell(indexPath: indexPath) as XHProfileCell
        let model = profileViewModel.profileList[indexPath.section][indexPath.row]
        cell.profile = model
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
