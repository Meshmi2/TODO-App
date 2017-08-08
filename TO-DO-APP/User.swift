//
//  User.swift
//  TO-DO-APP
//
//  Created by tran.xuan.diep on 8/3/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import Foundation

class User {
    let userDefault = UserDefaults.standard
    let keyChain = KeychainSwift()
    var userName = ""
    var userEmail = ""
    var userPassword = ""
    var userBirthDay = ""
    var userGender = ""
    
    init(_ userName:String, _ userEmail:String, _ userPassword:String, _ userBirthday:String, _ userGender:String){
        self.userName = userName
        self.userEmail = userEmail
        self.userPassword = userPassword
        self.userBirthDay = userBirthday
        self.userGender = userGender
    }
}
