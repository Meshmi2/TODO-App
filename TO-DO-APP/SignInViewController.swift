//
//  ViewController.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 7/28/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit
import CoreData

class SignInViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var formLoginView: UIView!
    @IBOutlet weak var iconUserView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var iconPasswordView: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    let userDefault = UserDefaults.standard
    
    @IBAction func unwindToSignIn(segue:UIStoryboardSegue) {}

    @IBAction func onButtonSignInClicked(_ sender: Any) {
        let keychain = KeychainSwift()
        
        guard let userName = userDefault.object(forKey: "email") else {return}
        if usernameTextField.text == String(describing: userName) && passwordTextField.text == keychain.get("password") {
            loginSuccess()
        } else {
            loginFail()
        }
    }
    
    func loginFail() {
        displayAlertMessage("Login fail!")
    }
    
    func displayAlertMessage(_ message:String) {
        let myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func loginSuccess() {
        AppData.shared.saveUserInfo()
        userDefault.synchronize()
        self.dismiss(animated: true, completion: nil)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if AppData.shared.userInfo != nil {
            AppData.shared.loadUserInfo()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }   
}
