//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Trương Thắng on 3/7/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import Foundation

// Chú ý: Model chỉ chứa dữ liệu, không bao giờ chứa giao diện nên nhất định ko được import UIKit vào đây

class CalculatorBrain {
    
    private var accumulator = 0.0
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(operation: String) {
        switch operation {
        case "π":
            accumulator = .pi
        case "√":
            accumulator = sqrt(accumulator)
            
        default:
            break
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}

