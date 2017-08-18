//
//  Group.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 8/16/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import Foundation

class Group {
    var nameGroup = ""
    var numberTask = 0
    var imageGroup = ""

    init(nameGroup: String, numberTask: Int, imageGroup: String) {
        self.nameGroup = nameGroup
        self.numberTask = numberTask
        self.imageGroup = imageGroup
    }
}
