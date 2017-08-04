//
//  MainViewController.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 8/3/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var labelWelcome: UILabel!
    @IBOutlet weak var labelDayTime: UILabel!
    @IBOutlet weak var labelDayName: UILabel!
    @IBOutlet weak var taskTableView: UITableView!

    var arrTasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.dataSource = self
        taskTableView.delegate = self
        labelDayTime.text = CommonUtility.formatToString(Date())
        labelDayName.text = CommonUtility.getDayName()
        labelWelcome.text = CommonUtility.getDayInTheDay()

        let shared = DatabaseManager.shared
        shared.connectTable("Task")
        if let tasks = shared.fetchDataFromTable() as? [Task] {
            arrTasks.append(contentsOf: tasks)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let image = UIImage(named: "background_all_task_in_day.png")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        taskTableView.backgroundView = imageView
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        taskTableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TaskTableViewCell else {return UITableViewCell()}
        var fromTime = ""
        var toTime = ""
        var timeTask = "None"
        if let tmpFromTime = arrTasks[indexPath.row].from_time,
            let tmpToTime = arrTasks[indexPath.row].to_time {
            fromTime = tmpFromTime
            toTime = tmpToTime
        }
        if arrTasks[indexPath.row].all_day {
            timeTask = "All day"
        } else {
            if fromTime.isEmpty || toTime.isEmpty {
                timeTask = "None"
            } else {
                timeTask = "\(fromTime) - \(toTime)"
            }
        }
        cell.labelTime.text = timeTask
        var titleTask = arrTasks[indexPath.row].title
        if let empty = titleTask?.isEmpty {
            titleTask = empty ? "Task no title" : titleTask
        }
        cell.labelTitle.text = titleTask
        var description = arrTasks[indexPath.row].description_task
        if let empty = description?.isEmpty {
            description = empty ? "No description" : description
        }
        cell.labelDescription.text = description
        return cell
    }
}
