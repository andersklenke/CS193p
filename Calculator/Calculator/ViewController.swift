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
  
  var userIsInTheMiddleOfTypingAnumber: Bool = false
  
  @IBAction func appendDigit(sender: UIButton) {
    let digit = sender.currentTitle!
    
    if userIsInTheMiddleOfTypingAnumber {
      display.text = display.text! + digit
    } else {
      display.text = digit
      userIsInTheMiddleOfTypingAnumber = true
    }
  }
}

