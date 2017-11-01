//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ulan Assanov on 11/1/17.
//  Copyright © 2017 Ulan Assanov. All rights reserved.
//

import Foundation
struct CalculatorBrain {
    private var accumulator : Double?
    mutating func performOperation(_ symbol : String){
        switch symbol {
        case "π":
            accumulator = Double.pi
        case "√":
            if let operand = accumulator{
                accumulator =  sqrt(operand)
            }
        case "^":
            if let operand = accumulator{
                accumulator =  (operand*operand)
            }
        default:
            break
        }
    }
    mutating func setOperand(_ operand : Double){
        accumulator = operand
    }
    var  result: Double?{
        get{
            return accumulator
        }
    }
}
