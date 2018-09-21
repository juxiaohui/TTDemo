//
//  Const.swift
//  TTDemo
//
//  Created by jxh on 2018/9/19.
//  Copyright © 2018年 juxiaohui. All rights reserved.
//

import UIKit
import Foundation


// MARK: - 屏幕适配相关

/// 屏幕的宽度
let screenWidth = UIScreen.main.bounds.width
/// 屏幕的高度
let screenHeight = UIScreen.main.bounds.height
let isIPhoneX: Bool = screenHeight == 812 ? true : false
let kNavigationbar_hegiht  = (isIPhoneX ? 88 : 64)
let kStatusbar_hegiht      = (isIPhoneX ? 44 : 20)
let kSafebottomarea_hegiht = (isIPhoneX ? 34 : 0)
let kTopsensor_hegiht      = (isIPhoneX ? 32 : 0)
let kTabbar_hegiht         = 49


let baseTabbarImageName = "_tabbar_32x32_"
let baseTabbarSelectedImageName = "_tabbar_press_32x32_"

let BASE_URL = "https://is.snssdk.com"

let device_id: Int = 6096495334
let iid: Int = 5034850950











