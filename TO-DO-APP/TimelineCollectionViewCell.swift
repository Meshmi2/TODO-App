//
//  TimelineCollectionViewCell.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 8/9/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class TimelineCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pointColorImageView: UIImageView!
    @IBOutlet weak var taskTimeLabel: UILabel!
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskDescriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func update (with: Task) {
        let task = with
        var imageName = ""
        var date = ""

        if let status = task.status {
            switch status {
            case "completed":
                imageName = "completed.png"
            case "snoozed":
                imageName = "snoozed.png"
            case "overdue":
                imageName = "overdue.png"
            default: imageName = "completed.png"
            }
        }
        if let fromTime = task.from_time, let toTime = task.to_time {
            date = fromTime + " - " + toTime
        }
        pointColorImageView.image = UIImage(named: imageName)
        taskTimeLabel.text = date
        taskTitleLabel.text = task.title
        taskDescriptionLabel.text = task.description_task
    }
}
