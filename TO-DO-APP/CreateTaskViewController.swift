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
    @IBOutlet weak var buttonSelectTime: UIButton!

    var task: TaskModel?
    let sharedDatabaseManager = DatabaseManager.shared

    @IBAction func buttonCreateTask(_ sender: Any) {
        let saveInfo = DatabaseManager.shared.addTask(task)
        var message = ""
        if saveInfo {
            message = "Save success!"
        } else {
            message = "Sorry save task failure!"
        }
        let alert = UIAlertController(title: "Save task", message: message,
            preferredStyle: UIAlertControllerStyle.alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(actionCancel)
        if !message.isEmpty {
            let actionOk = UIAlertAction(title: "Ok",
                style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                    self.task = nil
                    self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(actionOk)
        }
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func buttonCancelCreateTask(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        task = nil
    }

    @IBAction func inputDescriptionChanged(_ sender: Any) {
        guard let description = txtDescription.text else {return}
        task?.descriptionTask = description
        labelDescription.text = description
    }

    @IBAction func inputTitleChanged(_ sender: Any) {
        guard let titleTask = txtTitle.text else {return}
        task?.titleTask = titleTask
        labelTitle.text = titleTask
    }

    @IBAction func buttonPressLocation(_ sender: Any) {
        let alert = UIAlertController(title: "Location", message: "Press location for task", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField { (txtLocation) in
            txtLocation.text = self.task?.location
            txtLocation.placeholder = "Location"
        }
        alert.addAction(UIAlertAction(title: "Save", style: UIAlertActionStyle.default, handler: { _alert -> Void in
            guard let firstTextField = alert.textFields?[0] else {return}
            if let location = firstTextField.text {
                self.task?.location = location
                self.labelLocation.text = location
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        task = TaskModel()
        updateTaskInfo()
    }

    func updateTaskInfo () {
        var tmpSelectDate = CommonUtility.formatToString(Date())
        var turnSwitch = false
        if let descriptionTask = task?.descriptionTask,
            let repeatTime = task?.timeRepeat,
            let location = task?.location,
            let tmpTurnSwitch = task?.allDay,
            let fromTime = task?.fromTime,
            let toTime = task?.toTime,
            let title = task?.titleTask,
            let selectDate = task?.selectDate {
                labelDescription.text = descriptionTask
                txtDescription.text = descriptionTask
                labelRepeat.text = "\(repeatTime) minute"
                labelLocation.text = location
                turnSwitch = tmpTurnSwitch
                labelFromTime.text = fromTime
                labelToTime.text = toTime
                labelTitle.text = title
                txtTitle.text = title
                tmpSelectDate = CommonUtility.formatToString(selectDate)
        }
        labelSelectDate.text = tmpSelectDate
        switchAllDay.setOn(turnSwitch, animated: false)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectDate = segue.destination as? DatePickerViewController {
            selectDate.selectDate = task?.selectDate
            selectDate.pickDateOptionCompletion = {(selectDate) in
                guard let selectDate = selectDate else {return}
                self.task?.selectDate = selectDate
                self.labelSelectDate.text = CommonUtility.formatToString(selectDate)
            }
        }

        if let selectTime = segue.destination as? TimeViewController {
            selectTime.fromTime = task?.fromTime
            selectTime.toTime = task?.toTime
            selectTime.pickTimeOptionCompletion = {(fromTime, toTime) in
                guard let fromTime = fromTime, let toTime = toTime else {return}
                self.task?.fromTime = fromTime
                self.task?.toTime = toTime
                self.labelFromTime.text = fromTime
                self.labelToTime.text = toTime
            }
        }

        if let repeatTimeTask = segue.destination as? RepeatTimeViewController {
            repeatTimeTask.timeRepeat = task?.timeRepeat
            repeatTimeTask.pickRepeatOptionCompletion = {(timeRepeat) in
                guard let timeRepeat = timeRepeat else {return}
                self.task?.timeRepeat = timeRepeat
                self.labelRepeat.text = String(timeRepeat) + " minute"
            }
        }
    }

    @IBAction func switchChooseAllDay(_ sender: Any) {
        var current_time = ""
        if switchAllDay.isOn {
            task?.allDay = true
            current_time = ""
            buttonSelectTime.isEnabled = false
        } else {
            task?.allDay = false
            current_time = CommonUtility.currentTime()
            buttonSelectTime.isEnabled = true
        }
        task?.fromTime = current_time
        task?.toTime = current_time
        labelFromTime.text = current_time
        labelToTime.text = current_time

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
