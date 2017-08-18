//
//  Group.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 8/16/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import Foundation

class Group {
    var groupId = 1
    var name = ""
    var numberTask = 0
    var image = ""

    init(groupId: Int, name: String, numberTask: Int, image: String) {
        self.groupId = groupId
        self.name = name
        self.numberTask = numberTask
        self.image = image
    }
}
