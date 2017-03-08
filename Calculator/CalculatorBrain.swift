//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Trương Thắng on 3/7/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import Foundation

// Chú ý: Model chỉ chứa dữ liệu, không bao giờ chứa giao diện nên nhất định ko được import UIKit vào đây


func div(_ first: Double, _ second: Double) -> Double {
    return first / second
}

func sub(_ first: Double, _ second: Double) -> Double {
    return first - second
}

func add(_ first: Double, _ second: Double) -> Double {
    return first + second
}


class CalculatorBrain {
    
    private var accumulator = 0.0
    var operations: Dictionary <String, Operation> = [
        "π": .constant(.pi),
        "e": .constant(M_E),
        "√": .unaryOperation(sqrt),
        "cos": .unaryOperation(cos),
        // Move func multiply to here
        "×" : .binaryOperation(func multiply(_ first: Double, _ second: Double) -> Double {
            return first * second
    }),
        "÷" : .binaryOperation(div),
        "+" : .binaryOperation(add),
        "-" : .binaryOperation(sub),
        "=": .equals
    ]
    
    enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    private var pending: PendingBinaryOperation?
    
    struct PendingBinaryOperation {
        var binaryOperation: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        // TODO: Answer Quiz: cần binding Bởi vì dictionary có thể không có chưa key như symbol, và kết quả trả ra là nil
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                accumulator = function(accumulator)
            case .binaryOperation(let function):
                pending = PendingBinaryOperation(binaryOperation: function, firstOperand: accumulator)
                executePendingBinaryOperation()
            case .equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryOperation(pending!.firstOperand, accumulator)
            pending = nil
        }

    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}

