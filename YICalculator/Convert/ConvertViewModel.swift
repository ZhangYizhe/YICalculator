//
//  ConvertViewModel.swift
//  Calculator
//
//  Created by 张艺哲 on 2021/2/9.
//

import SwiftUI
import Combine

class ConvertViewModel: ObservableObject {
    
    var pattern : PatternStruct
    
    init(_ pattern: PatternStruct) {
        self.pattern = pattern
        self.inputString = "0"
    }
    
    @Published private(set) var inputString : String = "0" {
        didSet {
            convert()
        }
    }
    
    private var inputDouble : Double {
        return Double(inputString) ?? 0
    }
    
    @Published private(set) var outputString : String = "0"
    
    func number(_ description: String) {
        if inputString.count > 9 {
            return
        }
        
        var tempInputString = inputString
        if !tempInputString.contains(".") {
            if tempInputString.first == "0" {
                tempInputString = ""
            } else if tempInputString.count > 1 && Array(tempInputString)[0] == "-" && Array(tempInputString)[1] == "0" {
                tempInputString = "-"
            }
        }
        
        
        if description == "." {
            if tempInputString.contains(".") {
                return
            }
            
            if inputDouble == 0 {
                tempInputString = "0"
            }
        }
        
        inputString = tempInputString + description
    }
    
    func minus() {
        if inputString.first == "-" {
            inputString = String(inputString.dropFirst())
        } else {
            inputString = "-" + inputString
        }
    }
    
    func delete() {
        inputString = String(inputString.dropLast())
        
        if inputString == "0" || inputString == "" || inputString == "-" {
            deleteAll()
            return
        }
    }
    
    func deleteAll() {
        inputString = "0"
    }
    
    func convert() {
        switch pattern {
        case .Calculator:
            break
        case .Fahrenheit:
            outputString = String(format: "%.2f", 32 + inputDouble * 1.8)
            break
        case .Centigrade:
            outputString = String(format: "%.2f", (inputDouble - 32) / 1.8)
            break
        case .Foot:
            outputString = String(format: "%.2f", inputDouble * 3.281)
            break
        case .Meter:
            outputString = String(format: "%.2f", inputDouble / 3.281)
            break
        }
    }
}
