//
//  SelectDatePickerViewController.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 8/1/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datepicker: UIDatePicker!
    var selectDate: Date?

    var pickDateOptionCompletion: ((Date?) -> Void)?
    
    @IBAction func selectDatePicker(_ sender: Any) {
        selectDate = datepicker.date
    }

    @IBAction func dismissViewController(_ sender: Any) {
        pickDateOptionCompletion?(selectDate)
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        datepicker.datePickerMode = .date
        guard let selectDate = selectDate else {return}
        datepicker.setDate(selectDate, animated: false)
    }
}
