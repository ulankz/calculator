//
//  ViewController.swift
//  Calculator
//
//  Created by Ulan Assanov on 10/31/17.
//  Copyright © 2017 Ulan Assanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userIsInTheMiddleOfTyping = false
    private var brain = CalculatorBrain()
    @IBOutlet weak var output: UITextView!
    @IBAction func touchDigit(_ sender : UIButton){
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrrentlyInDisplay = output.text!;
            output!.text = textCurrrentlyInDisplay + digit;
        }
        else{
            output.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    @IBAction func clear(_ sender : UIButton){
        output!.text.removeAll();
    }

    var displayValue : Double {
        get{
            return Double(output.text)!
        }
        set{
            output.text = String(newValue)
        }
    }
       @IBAction func performOperation(_ sender : UIButton){
        if userIsInTheMiddleOfTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result{
            displayValue = result
        }
    }
}

