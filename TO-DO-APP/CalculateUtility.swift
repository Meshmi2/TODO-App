//
//  CalculateUtility.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 8/8/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import Foundation

final class CalculateUtility {
    static func percent(_ params: Double, _ total: Double) -> Double {
        var result = 0.0
        if params > 0 && total > 0 {
            result = Double(params * 100 / total)
        }
        return result
    }
}
