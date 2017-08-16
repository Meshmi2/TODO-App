//
//  TimelineViewController.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 8/9/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var timelineCollectionView: UICollectionView!
    @IBOutlet weak var labelNumberDay: UILabel!
    @IBOutlet weak var labelNameDay: UILabel!
    @IBOutlet weak var labelFullDay: UILabel!

    var taskList = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        timelineCollectionView.dataSource = self
        timelineCollectionView.delegate = self
        let nidName = UINib(nibName: "TimelineCollectionViewCell", bundle: nil)
        timelineCollectionView.register(nidName, forCellWithReuseIdentifier: "Cell")

        if let tasks = DatabaseManager.shared.fetchDataCurrentdateWithStatus() as? [Task] {
            taskList.append(contentsOf: tasks)
        }
        let currentDay = Date()
        labelFullDay.text = CommonUtility.getMonthInYear(currentDay)
        labelNameDay.text = CommonUtility.getDayName(currentDay)
        labelNumberDay.text = CommonUtility.getNumberDay(currentDay)

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "header_backgroud_create_task"), for: .default)
        navigationItem.title = "Timeline"
        navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: "icon_menu")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: .done, target: self, action: #selector(openMenuSidebar(_:))), animated: true)

        var image = UIImage(named: "avatar.png")
        image = image?.withRenderingMode(.alwaysOriginal)

        navigationItem.setRightBarButton(UIBarButtonItem(image: image, style: .done, target: self, action: nil), animated: true)

    }

    func openMenuSidebar(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TimelineCollectionViewCell
        let task = taskList[indexPath.row]
                
        cell.update(with: task)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
}
