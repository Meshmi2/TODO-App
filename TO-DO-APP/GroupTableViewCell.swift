//
//  GroupTableViewCell.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 8/16/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateCell (nameGroup: String, numberTask: String, imageGroup: String) {
        nameLabel.text = nameGroup
        numberLabel.text = numberTask
        backgroundImage.image = UIImage(named: imageGroup)

    }
}
