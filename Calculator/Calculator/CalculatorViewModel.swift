//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by 张艺哲 on 2021/2/8.
//

import SwiftUI
import Combine

class CalculatorViewModel: ObservableObject {
    
    @Published private(set) var formula : String = " "
    
    @Published private(set) var result : String = "0"
    
    func add(_ description: String) {
        
        if result == "0" {
            result = ""
        }
        let tempResult = result.replacingOccurrences(of: " ", with: "")
        
        if formula == "" {
            formula = " "
        }
        
        let character = Character(description)
        
        switch character {
        case "+", "-" , "x" , "/":
            switch formula.last {
                case "+", "-" , "x" , "/":
                    if tempResult == "" {
                        return
                    }
                default: break
            }
            
            
            formula += tempResult + description
            result = " "
            return
        default:
            break
        }
        
        
        
        result += description
    }
    
    func delete() {
        var tempFormula = String(formula.dropLast())
        if tempFormula == "" {
            tempFormula = " "
        }
        formula = tempFormula
    }
}
