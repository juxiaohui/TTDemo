//
//  XHProfileViewModel.swift
//  TTDemo
//
//  Created by jxh on 2018/9/20.
//  Copyright © 2018年 juxiaohui. All rights reserved.
//

import UIKit
import MJExtension

class XHProfileViewModel: NSObject {

    lazy var profileList : [[XHProfileModel]] = [[XHProfileModel]]()

    func loadData(finishedCallback : @escaping () -> ())  {

        let url = BASE_URL + "/user/tab/tabs/?"
        let params = ["device_id": device_id]
        XHNetworkTools.requestData(.get, URLString: url, parameters: params) { (response) in

            //最外层数据
            guard let resultDict = response as? [String : Any] else { return }

            //data
            guard let dataDict = resultDict["data"] as? [String : Any] else { return }

            //sections
            guard let dataArray = dataDict["sections"] as? [[[String : Any]]] else { return }

//            print(dataArray)

            for sectionsArray : [[String : Any]] in dataArray {

                let modelArr = XHProfileModel.mj_objectArray(withKeyValuesArray: sectionsArray) as? [XHProfileModel]

                if modelArr != nil  {
                    self.profileList.append(modelArr!)
                }
            }

            finishedCallback()
        }
    }
}
