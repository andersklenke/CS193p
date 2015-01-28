//
//  ViewController.swift
//  Calculator
//
//  Created by Anders Friis Klenke on 28/01/15.
//  Copyright (c) 2015 Anders Friis Klenke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var display: UILabel!
  
  var userIsInTheMiddleOfTypingAnumber = false
  var operandStack = Array<Double>()
  var displayValue: Double {
    get {
      return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
    }
    set {
      display.text = "\(newValue)"
      userIsInTheMiddleOfTypingAnumber = false
    }
  }
  
  @IBAction func appendDigit(sender: UIButton) {
    let digit = sender.currentTitle!
    
    if userIsInTheMiddleOfTypingAnumber {
      display.text = display.text! + digit
    } else {
      display.text = digit
      userIsInTheMiddleOfTypingAnumber = true
    }
  }
  
  @IBAction func enter() {
    userIsInTheMiddleOfTypingAnumber = false
    operandStack.append(displayValue)
    println("operandStack = \(operandStack)")
  }
  
  @IBAction func operate(sender: UIButton) {
    let operation = sender.currentTitle!
    
    if userIsInTheMiddleOfTypingAnumber {
      enter()
    }
    
    switch operation {
    case "×": performOperation { $0 * $1 }
    case "÷": performOperation { $1 / $0 }
    case "+": performOperation { $0 + $1 }
    case "−": performOperation { $1 - $0 }
    case "√": performOperation { sqrt($0) }
    default: break
    }
  }
  
  func performOperation(operation: Double -> Double) {
    if operandStack.count >= 2 {
      displayValue = operation(operandStack.removeLast())
      enter()
    }
  }
  
  func performOperation(operation: (Double, Double) -> Double) {
    if operandStack.count >= 2 {
      displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
      enter()
    }
  }
}

