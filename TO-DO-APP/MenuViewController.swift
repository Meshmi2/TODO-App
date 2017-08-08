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
        
    }
    
    @IBAction func onButtonLogoutClicked(_ sender: Any) {
        performSegue(withIdentifier: "unwindToSignIn", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
