//
//  ProfileUserViewController.swift
//  TO-DO-APP
//
//  Created by tran.xuan.diep on 8/9/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit
import UICircularProgressRing

class UserProgressViewController: UIViewController {
    let shared = DatabaseManager.shared
    var listTasks: [Task]?
    var total = 0.0
    var completedTask = 0.0
    var snoozedTask = 0.0
    var overdueTask = 0.0
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var percentTaskOfUserLabel: UILabel!
    @IBOutlet weak var numberTaskCompleted: UILabel!
    @IBOutlet weak var numberTaskSnoozed: UILabel!
    @IBOutlet weak var numberTaskOverDue: UILabel!
    
    
    @IBOutlet weak var circleViewTotal: UICircularProgressRingView!
    @IBOutlet weak var circleViewSnoozed: UICircularProgressRingView!
    
    @IBOutlet weak var circleViewOverDue: UICircularProgressRingView!
    @IBOutlet weak var circleViewCompleted: UICircularProgressRingView!
    @IBOutlet weak var monthLabel: UILabel!
    var indexMonth = Int(CommonUtility.getCurrenMonth())!
    
    @IBAction func buttonChevronRightClicked(_ sender: Any) {
        if indexMonth < 12 {
            indexMonth += 1
            if let month = CommonUtility.Months(rawValue: indexMonth) {
                monthLabel.text = CommonUtility.getMonth(month)
                listTasks = shared.fetchDataWithQuery(String(indexMonth)) as? [Task]
                setDefaultCircleView(listTasks)
                updateValueCircleView()
            }
        }
    }
    
    @IBAction func buttonChevronLeftClicked(_ sender: Any) {
        if indexMonth > 1 {
            indexMonth -= 1
            if let month = CommonUtility.Months(rawValue: indexMonth) {
                monthLabel.text = CommonUtility.getMonth(month)
                listTasks = shared.fetchDataWithQuery(String(indexMonth)) as? [Task]
                setDefaultCircleView(listTasks)
                updateValueCircleView()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let month = CommonUtility.Months(rawValue: indexMonth) {
            monthLabel.text = CommonUtility.getMonth(month)
        }
        userNameLabel.text = AppData.shared.userInfo?.userName
        listTasks = shared.fetchDataWithQuery(String(indexMonth)) as? [Task]
        setDefaultCircleView(listTasks)
        updateValueCircleView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDefaultCircleView(_ listTasks: [Task]?) {
        total = 0.0
        completedTask = 0.0
        snoozedTask = 0.0
        overdueTask = 0.0

        if let listTasks = listTasks {
            total = Double(listTasks.count)
            for task in listTasks {
                if let status = task.status {
                    switch status {
                        case "completed":
                            completedTask += 1.0
                        case "snoozed":
                            snoozedTask += 1.0
                        case "overdue":
                            overdueTask += 1.0
                        default:
                            total += 0
                    }
                }
            }
        }
        updateNumberOfTaskLabel()
    }
    
    func updateValueCircleView() {
        let percentCompleted = CalculateUtility.percent(completedTask, total)
        let percentSnoozed = CalculateUtility.percent(snoozedTask, total)
        let percentOverdue = CalculateUtility.percent(overdueTask, total)
        percentTaskOfUserLabel.text = "You've completed \(Int(percentCompleted))% more tasks in this month"
        circleViewTotal.value = CGFloat(total)
        circleViewCompleted.value = CGFloat(percentCompleted)
        circleViewSnoozed.value = CGFloat(percentSnoozed)
        circleViewOverDue.value = CGFloat(percentOverdue)
        
        let radiusSnoozed = percentCompleted * 360 / 100
        circleViewSnoozed.value = CGFloat(percentSnoozed)
        circleViewSnoozed.startAngle = CGFloat(radiusSnoozed)

        let radiusOverdue = radiusSnoozed + (percentSnoozed) * 360 / 100
        circleViewOverDue.value = CGFloat(percentOverdue)
        circleViewOverDue.startAngle = CGFloat(radiusOverdue)
    }
    
    func updateNumberOfTaskLabel() {
        numberTaskCompleted.text = String(Int(completedTask))
        numberTaskSnoozed.text = String(Int(snoozedTask))
        numberTaskOverDue.text = String(Int(overdueTask))
    }
}
