//
//  ViewController.swift
//  Calculator
//
//  Created by Trương Thắng on 3/6/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var displayValue : Double {
        get {
            return Double(display.text!) ?? 0
        }
        set {
            display.text = String(newValue)
        }
    }
    var userIsInTheMiddleOfTyping = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction func performOperator(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        let mathematicalSymbol = sender.currentTitle!
        if mathematicalSymbol == "π" {
            displayValue = .pi
        } else if mathematicalSymbol == "√" {
            displayValue = sqrt(displayValue)
        }
    }


}

