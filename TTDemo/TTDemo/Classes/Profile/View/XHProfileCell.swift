//
//  XHProfileCell.swift
//  TTDemo
//
//  Created by jxh on 2018/9/21.
//  Copyright © 2018年 juxiaohui. All rights reserved.
//

import UIKit

class XHProfileCell: UITableViewCell , RegisterCellFromNib{

    @IBOutlet weak var text_label: UILabel!
    @IBOutlet weak var detail_label: UILabel!

    var profile : XHProfileModel? {

        didSet{
            guard let profile = profile else { return }
            text_label.text = profile.text
            detail_label.text = profile.grey_text
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
