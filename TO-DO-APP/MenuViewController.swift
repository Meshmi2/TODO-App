//
//  MenuViewController.swift
//  TO-DO-APP
//
//  Created by tran.xuan.diep on 8/1/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    let userDefault = UserDefaults()
    @IBAction func onButtonCloseClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func buttonSwitchTimeline(_ sender: Any) {
        let timelineView = TimelineViewController(nibName: "TimelineViewController", bundle: nil)
        navigationController?.pushViewController(timelineView, animated: true)
    }
    @IBAction func switchGroupButton(_ sender: Any) {
        let timelineView = GroupViewController(nibName: "GroupViewController", bundle: nil)
        navigationController?.pushViewController(timelineView, animated: true)
    }
    
    @IBAction func onButtonLogoutClicked(_ sender: Any) {
        performSegue(withIdentifier: "unwindToSignIn", sender: self)
    }
    
    @IBAction func onSwitchListsClicked(_ sender: Any) {
        let autoView = AutoViewController(nibName: "AutoViewController", bundle: nil)
        navigationController?.pushViewController(autoView, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
