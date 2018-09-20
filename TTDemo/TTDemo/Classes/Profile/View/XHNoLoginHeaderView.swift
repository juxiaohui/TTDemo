//
//  XHNoLoginHeaderView.swift
//  TTDemo
//
//  Created by jxh on 2018/9/19.
//  Copyright © 2018年 juxiaohui. All rights reserved.
//

import UIKit

class XHNoLoginHeaderView: UIView,NibLoadable {
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var bgImageViewTopConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        bgImageViewTopConstraint.constant = -CGFloat(kStatusbar_hegiht)

    }
}
