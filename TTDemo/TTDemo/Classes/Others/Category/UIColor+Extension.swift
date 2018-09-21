//
//  UIColor+Extension.swift
//  TTDemo
//
//  Created by jxh on 2018/9/21.
//  Copyright © 2018年 juxiaohui. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        if #available(iOS 10.0, *) {
            self.init(displayP3Red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
        } else {
            self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
        }
    }


    convenience init(hexColor : Int64) {
        let red = ((CGFloat)((hexColor & 0xFF0000) >> 16))/255.0;
        let green = ((CGFloat)((hexColor & 0xFF00) >> 8))/255.0;
        let blue = ((CGFloat)(hexColor & 0xFF))/255.0;
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }

    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }



}
