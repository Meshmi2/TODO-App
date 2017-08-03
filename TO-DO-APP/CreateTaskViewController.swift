//
//  CreateTaskViewController.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 8/1/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var labelSelectDate: UILabel!
    @IBOutlet weak var buttonRepeat: UIButton!
    @IBOutlet weak var buttonPeople: UIButton!
    @IBOutlet weak var buttonNitification: UIButton!
    @IBOutlet weak var buttonLocation: UIButton!
    @IBOutlet weak var labelToTime: UILabel!
    @IBOutlet weak var labelFromTime: UILabel!
    @IBOutlet weak var switchAllDay: UISwitch!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var txtNotification: UILabel!
    @IBOutlet weak var labelRepeat: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var txtTitle: UITextField!

    var task = TaskModel()

    @IBAction func buttonCreateTask(_ sender: Any) {}

    @IBAction func buttonCancelCreateTask(_ sender: Any) {}
    
    @IBAction func inputDescription(_ sender: Any) {
        guard let description = txtDescription.text else {return}
        task.descriptionTask = description
        labelDescription.text = task.descriptionTask
    }
    
    @IBAction func inputTitleTask(_ sender: Any) {
        guard let titleTask = txtTitle.text else {return}
        task.titleTask = titleTask
        labelTitle.text = task.titleTask
    }
    
    @IBAction func buttonPressLocation(_ sender: Any) {
        let alert = UIAlertController(title: "Location", message: "Press location for task", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField { (txtLocation) in
            txtLocation.placeholder = "Location"
        }
        alert.addAction(UIAlertAction(title: "Save", style: UIAlertActionStyle.default, handler: { _alert -> Void in
            let firstTextField = alert.textFields![0] as UITextField
            self.task.location = firstTextField.text!
            self.labelLocation.text = self.task.location
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelSelectDate.text = CommonUtility.formatToString(task.selectDate) 
        labelFromTime.text = task.fromTime
        labelToTime.text = task.toTime
        labelRepeat.text = String(task.timeRepeat) + " minute"
        labelLocation.text = task.location
        switchAllDay.setOn(task.allDay, animated: false)
        labelTitle.text = task.titleTask
        txtTitle.text = task.titleTask
        labelDescription.text = task.descriptionTask
        txtDescription.text = task.descriptionTask
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectDate = segue.destination as? DatePickerViewController {
            selectDate.selectDate = task.selectDate
            selectDate.pickDateOptionCompletion = {(selectDate) in
                guard let selectDate = selectDate else {return}
                self.task.selectDate = selectDate
                self.labelSelectDate.text = CommonUtility.formatToString(selectDate)
            }
        }

        if let selectTime = segue.destination as? TimeViewController {
            selectTime.fromTime = task.fromTime
            selectTime.toTime = task.toTime
            selectTime.pickTimeOptionCompletion = {(fromTime, toTime) in
                guard let fromTime = fromTime, let toTime = toTime else {return}
                self.task.fromTime = fromTime
                self.task.toTime = toTime

                self.labelFromTime.text = fromTime
                self.labelToTime.text = toTime
            }
        }

        if let repeatTimeTask = segue.destination as? RepeatTimeViewController {
            repeatTimeTask.timeRepeat = task.timeRepeat
            repeatTimeTask.pickRepeatOptionCompletion = {(timeRepeat) in
                guard let timeRepeat = timeRepeat else {return}
                self.task.timeRepeat = timeRepeat
                self.labelRepeat.text = String(timeRepeat) + " minute"
            }
        }
    }
    
    @IBAction func switchChooseAllDay(_ sender: Any) {
        task.allDay = switchAllDay.isOn ? true : false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
