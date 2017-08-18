//
//  GroupViewController.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 8/16/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var listGroupTableView: UITableView!
    @IBOutlet weak var popularButton: UIButton!
    @IBOutlet weak var latestBottomImage: UIImageView!
    @IBOutlet weak var popularBottomImage: UIImageView!
    @IBOutlet weak var archivedBottomImage: UIImageView!

    private var countTaskInGroup: [Group]?

    override func viewDidLoad() {
        super.viewDidLoad()
        listGroupTableView.dataSource = self
        listGroupTableView.delegate = self

        countTaskInGroup = SqliteManager.shared.countTasksAllGroup()

        let groupNid = UINib(nibName: "GroupTableViewCell", bundle: nil)
        listGroupTableView.register(groupNid, forCellReuseIdentifier: "Cell")

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "header_backgroud_create_task"), for: .default)
        navigationItem.title = "Group"
        navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: "icon_menu")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: .done, target: self, action: #selector(openMenuSidebar(_:))), animated: true)

        let image = UIImage(named: "icon_search.png")?.withRenderingMode(.alwaysOriginal)
        navigationItem.setRightBarButton(UIBarButtonItem(image: image, style: .done, target: self, action: nil), animated: true)

        popularBottomImage.isHidden = false
        latestBottomImage.isHidden = true
        archivedBottomImage.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func openMenuSidebar(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countTaskInGroup?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? GroupTableViewCell else {return UITableViewCell()}
        if let nameGroup = countTaskInGroup?[indexPath.row].name,
            let numberTask = countTaskInGroup?[indexPath.row].numberTask,
            let imageGroup = countTaskInGroup?[indexPath.row].image {
            cell.updateCell(nameGroup: nameGroup, numberTask: String(numberTask), imageGroup: imageGroup)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupId = countTaskInGroup?[indexPath.row].groupId else {return}
        let destinationScreen = AutoViewController()
        destinationScreen.groupId = groupId
        navigationController?.pushViewController(destinationScreen, animated: true)
    }

    @IBAction func popularButtonClicked (_ sender: Any) {
        popularBottomImage.isHidden = false
        latestBottomImage.isHidden = true
        archivedBottomImage.isHidden = true
    }

    @IBAction func latestButtonClicked (_ sender: Any) {
        popularBottomImage.isHidden = true
        latestBottomImage.isHidden = false
        archivedBottomImage.isHidden = true
    }

    @IBAction func archivedButtonClicked (_ sender: Any) {
        popularBottomImage.isHidden = true
        latestBottomImage.isHidden = true
        archivedBottomImage.isHidden = false
    }
}
