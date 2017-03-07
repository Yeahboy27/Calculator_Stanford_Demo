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
    var operations: Dictionary <String, Operation> = [
        "π": .constant, //.pi
        "e": .constant, // M_E
        "√": .unaryOperation, // sqrt
        "cos": .unaryOperation, //cos
    ]
    
    enum Operation {
        case constant
        case unaryOperation
        case binaryOperation
        case equals
    }
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        // TODO: Answer Quiz: cần binding Bởi vì dictionary có thể không có chưa key như symbol, và kết quả trả ra là nil
        if let constant = operations[symbol] {
            accumulator = constant
        }
        switch symbol {
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

