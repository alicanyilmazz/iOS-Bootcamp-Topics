//
//  MathOperations.swift
//  BasicUIComponents
//
//  Created by alican on 18.09.2021.
//

import Foundation

enum Process{
    case add, subtract, multiply, divide
}

struct MathOperations {
   static var firstNumber : Double = 0
   static var secondNumber : Double = 0
   static var result : Double = 0
   static var operationType : Process?
    
   static func calculate(number1 : Double , number2 : Double) -> Double {
        switch operationType! {
        case .add : return MathOperations.firstNumber + MathOperations.secondNumber
        case .subtract : return MathOperations.firstNumber - MathOperations.secondNumber
        case .multiply : return MathOperations.firstNumber * MathOperations.secondNumber
        case .divide : return MathOperations.firstNumber / MathOperations.secondNumber
        }
    }
}


