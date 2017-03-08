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
        "π": .constant(.pi),
        "e": .constant(M_E),
        "√": .unaryOperation(sqrt),
        "cos": .unaryOperation(cos),
        
        // do các tham số truyền vào có vẻ cũng không cần thiết phải có tên do Swift có thể hiểu được giá trị truyền vào dựa trên vị trí của nó vì vậy first và second được thay thế bằng $0, $1.
        
        // Nhưng trông nó vẫn thừa và lặp nội dung. vì vậy xoá nốt phần khai báo. chỉ cần trả về kết quả là lấy phần tử thứ 1 nhân phần tử thứ 2
        
        
        "×" : .binaryOperation({ $0 * $1 }),
        
        // áp dụng tương tự
        "÷" : .binaryOperation({$0 / $1}),
        "+" : .binaryOperation({$0 + $1}),
        "-" : .binaryOperation({$0 - $1}),
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

