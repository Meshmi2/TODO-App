//
//  SelectTimeViewController.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 8/1/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    @IBOutlet weak var fromTimePicker: UIDatePicker!
    @IBOutlet weak var toTimePicker: UIDatePicker!

    var fromTime: String?
    var toTime: String?

    var pickTimeOptionCompletion: ((String?, String?) -> Void)?


    @IBAction func selectFormTimePicker(_ sender: Any) {
        fromTime = CommonUtility.formatTimeToString(fromTimePicker.date)
    }
    
    @IBAction func selectToTimePicker(_ sender: Any) {
        toTime = CommonUtility.formatTimeToString(toTimePicker.date)
    }

    @IBAction func dismissViewController(_ sender: Any) {
        pickTimeOptionCompletion?(fromTime, toTime)
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let fromTime = fromTime, let toTime = toTime else {return}
        fromTimePicker.datePickerMode = .time
        toTimePicker.datePickerMode = .time
        fromTimePicker.setDate(CommonUtility.formatStringToTime(fromTime), animated: false)
        toTimePicker.setDate(CommonUtility.formatStringToTime(toTime), animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
