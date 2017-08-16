//
//  AutoTableViewCell.swift
//  TO-DO-APP
//
//  Created by tran.xuan.diep on 8/16/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class AutoTableViewCell: UITableViewCell {

    @IBOutlet weak var checkedIconImage: UIImageView!
    @IBOutlet weak var unCheckStatusImage: UIImageView!
    @IBOutlet weak var titleTaskLabel: UILabel!
    @IBOutlet weak var timeTaskLabel: UILabel!
    @IBOutlet weak var attentionStatusImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.checkedIconImage.image = nil
        self.unCheckStatusImage.image = nil
        self.titleTaskLabel.text = ""
        self.timeTaskLabel.text = ""
        self.attentionStatusImage.image = nil
    }
    
    func updateCellItemByStatusTask(_ statusTask: String) {
        if statusTask == "completed" {
            self.unCheckStatusImage.image = UIImage(named: "background_status_check")
            self.checkedIconImage.image = UIImage(named: "icon_check")
            self.titleTaskLabel.textColor = UIColor.lightGray
            self.timeTaskLabel.textColor = UIColor.lightGray
        }
        if statusTask == "overdue" {
            self.attentionStatusImage.image = UIImage(named: "icon_attention")
        }
    }
    
}
