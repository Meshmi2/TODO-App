//
//  GenerateViewController.swift
//  TO-DO-APP
//
//  Created by tran.xuan.diep on 8/3/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    @IBOutlet weak var genderTextField: UITextField!
    
    func loadUserInfo() {
        nameTextField.text = AppData.shared.userInfo?.userName
        emailTextField.text = AppData.shared.userInfo?.userEmail
        passwordTextField.text = AppData.shared.userInfo?.userPassword
        birthdayTextField.text = AppData.shared.userInfo?.userBirthDay
        genderTextField.text = AppData.shared.userInfo?.userGender
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadUserInfo()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
