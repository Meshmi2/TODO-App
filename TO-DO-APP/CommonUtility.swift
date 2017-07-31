//
//  CommonUtility.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 7/31/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

final class CommonUtility {
    static func formatToString(_ date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
}
