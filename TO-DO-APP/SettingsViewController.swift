//
//  SettingsViewController.swift
//  TO-DO-APP
//
//  Created by tran.xuan.diep on 8/1/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var activeProfileTab: UIImageView!
    @IBOutlet weak var activeAlertTab: UIImageView!
    @IBAction func onButtonProfileClicked(_ sender: Any) {
        if self.profileView.isHidden != false {
            self.profileView.isHidden = false
            self.activeProfileTab.isHidden = false
            self.activeAlertTab.isHidden = true
            self.alertView.isHidden = true
        }
    }
    @IBAction func onButtonAlertClicked(_ sender: Any) {
        if self.alertView.isHidden != false {
            self.profileView.isHidden = true
            self.activeProfileTab.isHidden = true
            self.activeAlertTab.isHidden = false
            self.alertView.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileView.isHidden = false
        self.activeProfileTab.isHidden = false
        self.activeAlertTab.isHidden = true
        self.alertView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
