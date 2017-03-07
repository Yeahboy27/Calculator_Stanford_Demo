//
//  ViewController.swift
//  Calculator
//
//  Created by Trương Thắng on 3/6/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    private var displayValue : Double {
        get {
            return Double(display.text!) ?? 0
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperator(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }


}

