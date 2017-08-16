//
//  AutoViewController.swift
//  TO-DO-APP
//
//  Created by tran.xuan.diep on 8/16/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class AutoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var taskTableView: UITableView!
    var listTask = [[String : Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource = self
        let nibName = UINib(nibName: "AutoTableViewCell", bundle: nil)
        taskTableView.register(nibName, forCellReuseIdentifier: "autoTableViewCell")
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Auto"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "Avenir", size: 17)!]
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "header_backgroud_create_task"), for: .default)
        navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: "icon_back")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: .done, target: self, action: #selector(onButtonBackClicked(_:))), animated: true)
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(named: "icon_search")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: .done, target: self, action: nil), animated: true)
    }
    
    @IBAction func onButtonCreateTaskClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let createTaskView = storyboard.instantiateViewController(withIdentifier: "ScreenCreateTask") as? CreateTaskViewController
        self.present(createTaskView!, animated: true, completion: nil)
    }
    
    func onButtonBackClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTask.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.listTask = SqliteManager.shared.findTaskByGroup()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "autoTableViewCell", for: indexPath) as! AutoTableViewCell
        cell.titleTaskLabel.text = listTask[indexPath.item]["title"] as? String
        cell.timeTaskLabel.text = listTask[indexPath.item]["select_date"] as? String
        if let statusTask = listTask[indexPath.item]["status"] as? String {
            cell.updateCellItemByStatusTask(statusTask)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
