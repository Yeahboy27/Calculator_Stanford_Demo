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
    var operation: Dictionary <String, Double> = [
        "π": .pi,
        "e": M_E,
        "√": sqrt, // TODO: xuất hiện 1 vấn đề ở đây là operation của chúng ta không chỉ là số, mà còn là các phép tính toán nữa. Bạn hãy thử nghĩ cách làm thế nào để có thể nhét 1 function vào dictionary này?
        "cos": cos
    ]
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        // TODO: Quiz: Tại sao operation không có chứa 1 optional nào nhưng kết quả trả ra của Opration[symbol] lại là 1 optional
        if let constant = operation[symbol] {
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

