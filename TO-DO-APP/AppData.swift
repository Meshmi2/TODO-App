//
//  AppData.swift
//  TO-DO-APP
//
//  Created by tran.xuan.diep on 8/4/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import Foundation

class AppData {
    static let shared = AppData()
    let userDefault = UserDefaults.standard
    private let keyChain = KeychainSwift()
    var userInfo:User?
    private init() {
        
    }
    
    func loadUserInfo() {
        guard let userName = userInfo?.userName else {return}
        guard let userEmail = userInfo?.userEmail else {return}
        guard let userPassword = userInfo?.userPassword else {return}
        guard let userBirthday = userInfo?.userBirthDay else {return}
        guard let userGender = userInfo?.userGender else {return}
        userInfo = User(userName, userEmail, userPassword, userBirthday, userGender)
    }
    
    func saveUserInfo() {
        guard let userName = userDefault.object(forKey: "name") as? String else {return}
        guard let userEmail = userDefault.object(forKey: "email") as? String else {return}
        guard let userPassword = keyChain.get("password") else {return}
        guard let userBirthday = userDefault.object(forKey: "birth_day") as? String else {return}
        guard let userGender = userDefault.object(forKey: "gender") as? String else {return}
        userInfo = User(userName, userEmail, userPassword, userBirthday, userGender)
    }
}
