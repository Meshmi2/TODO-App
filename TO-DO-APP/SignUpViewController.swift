//
//  ViewController.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 7/28/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtBirthDay: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    
    let datePicker = UIDatePicker()
    var resultGender:String = "Nam"
    let userDefault = UserDefaults.standard
    
    @IBAction func chooseGender(_ sender: Any) {
        resultGender = gender.selectedSegmentIndex == 0 ? "Nam" : "Nu"
    }
    
    @IBAction func onButtonRegisterClicked(_ sender: Any) {
        userDefault.set(txtName.text, forKey: "name")
        userDefault.set(txtEmail.text, forKey: "email")
        userDefault.set(resultGender, forKey: "gender")
        let birth_day = CommonUtility.formatToString(datePicker.date)
        userDefault.set(birth_day, forKey: "birth_day")
        guard let password = txtPassword.text else {return}
        let keychain = KeychainSwift()
        keychain.set(password, forKey: "password")
    }
    
    func createDatePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        datePicker.datePickerMode = .date
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePress(_ :)))
        toolBar.setItems([doneButton], animated: false)
        txtBirthDay.inputAccessoryView = toolBar
        txtBirthDay.inputView = datePicker
    }
    
    func donePress (_ sender: Any) {
        txtBirthDay.text = CommonUtility.formatToString(datePicker.date)
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
