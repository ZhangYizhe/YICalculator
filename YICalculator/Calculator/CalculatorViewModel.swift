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
    
    private var resultDouble : Double {
        Double(result) ?? 0.0
    }
    
    private var _isEqual : Bool = false
    private var isEqual : Bool {
        get {
            return _isEqual
        }
        set {
            if newValue == _isEqual {
                return
            }
            _isEqual = newValue
            if !_isEqual {
                deleteAll()
            }
        }
    }
    
    // MARK: - Operation
    func operation(_ description: String) {
        isEqual = false
        
        if description == "+/-" {
            if result.first == "-" {
                result = String(result.dropFirst())
            } else {
                result = "-" + result
            }
            return
        }
        
        var tempResult = result
        
        if resultDouble == 0 {
            return
        }
        
        if tempResult.last == "." {
            tempResult = String(tempResult.dropLast())
        }
        
        formula = formula.replacingOccurrences(of: " ", with: "")
        
        if description == "=" {
            formula += tempResult
            result = "0"
        } else {
            formula += tempResult + description
            result = "0"
        }
        
    }
    
    func number(_ description: String) {
        isEqual = false
        
        if result.count > 9 {
            return
        }
        
        var tempResult = result
        if !tempResult.contains(".") {
            if tempResult.first == "0" {
                tempResult = ""
            } else if tempResult.count > 1 && Array(tempResult)[0] == "-" && Array(tempResult)[1] == "0" {
                tempResult = "-"
            }
        }
        
        if description == "." {
            if tempResult.contains(".") {
                return
            }
            
            if resultDouble == 0 {
                tempResult = "0"
            }
        }
        
        result = tempResult + description
    }
    
    func delete() {
        isEqual = false
        
        var tempString = ""
        if (result.count > 0 && resultDouble != 0) || result == "-"  {
            tempString = String(result.dropLast())
            if tempString == "" {
                tempString = "0"
            }
            result = tempString
            return
        }
        
        var isNum = false
        for c in formula.reversed() {
            if c == "+" || c == "-" || c == "x" || c == "/" {
                if !isNum {
                    formula = String(formula.dropLast())
                }
                break
            }
            formula = String(formula.dropLast())
            isNum = true
        }
        
        if formula.count == 0 {
            formula = " "
        }
    }
    
    private func deleteAll() {
        formula = " "
        result = "0"
    }
    
    func equal() {
        if resultDouble != 0 {
            operation("=")
        }
        
        var resultArr : [String] = []
        var tempNumString : String = ""
        
        for c in formula {
            
            let s : String = String(c)
            
            switch s {
            case "+", "-", "x", "/":
                resultArr.append(tempNumString)
                resultArr.append(s)
                tempNumString = ""
                break
            default:
                tempNumString += s
                break
            }
        }
        
        if tempNumString != "" {
            resultArr.append(tempNumString)
            tempNumString = ""
        }
        
        if resultArr.count == 0 {
            deleteAll()
            return
        }
        
        if (Double(resultArr.last ?? "") ?? 0) == 0 {
            resultArr.removeLast()
        }
        
        var index = 0
        var tempResult : Double = 0
        while index < resultArr.count {
            let s = resultArr[index]
            
            switch s {
            case "+", "-", "x", "/":
                if s == "+" {
                    tempResult += Double(resultArr[index + 1]) ?? 0
                } else if s == "-" {
                    tempResult -= Double(resultArr[index + 1]) ?? 0
                } else if s == "x" {
                    tempResult = tempResult * (Double(resultArr[index + 1]) ?? 0)
                } else if s == "/" {
                    tempResult = tempResult / (Double(resultArr[index + 1]) ?? 0)
                }
                index += 2
                break
            default:
                tempResult = Double(s) ?? 0
                index += 1
                break
            }
        }
        
        result = "\(tempResult)"
        isEqual = true
    }
}
