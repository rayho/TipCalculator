//
//  Calculator.swift
//  TipCalculator
//
//  Created by Ray Ho on 8/26/14.
//  Copyright (c) 2014 Ray Ho. All rights reserved.
//

import Foundation

class Calculator {
    // Pre-tip amount
    var subtotal: Double = 0

    // Percentage amount, i.e. 15, 20, etc
    var percentage: Double = 0

    // Tip amount
    var tip: Double {
        return subtotal * (percentage / 100)
    }

    // Grand total, including tip amount
    var total: Double {
        return subtotal + tip
    }
}