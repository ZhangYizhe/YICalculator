//
//  MainView.swift
//  YICalculator
//
//  Created by 张艺哲 on 2021/2/8.
//

import SwiftUI
import CoreData

struct MainView: View {
    
    @State var pattern : PatternStruct = .Calculator
    
    @State var isPresentedConvert : Bool = false
    
    var body: some View {
        NavigationView {
            Group {
                if pattern == .Calculator {
                    CalculatorView()
                } else {
                    ConvertView(pattern: $pattern)
                }
            }
            .actionSheet(isPresented: $isPresentedConvert) {
                ActionSheet(title: Text("功能切换"), message: nil, buttons: [
                    .default(Text("计算器")) {
                        pattern = .Calculator
                    },
                    .default(Text("摄氏度转华氏度")) {
                        pattern = .Fahrenheit
                    },
                    .default(Text("华氏度转摄氏度")) {
                        pattern = .Centigrade
                    },
                    .default(Text("米转英尺")) {
                        pattern = .Foot
                    },
                    .default(Text("英尺转米")) {
                        pattern = .Meter
                    },
                    .cancel()
                ])
            }
            .navigationTitle("艺算")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        isPresentedConvert = true
                                    }, label: {
                                        Text("功能切换")
                                            .foregroundColor(Color("InputText"))
                                    })
            )
        }
    }
}

enum PatternStruct {
    case Calculator
    case Fahrenheit
    case Centigrade
    case Foot
    case Meter
    
    var friendlyName : String {
        switch self {
        case .Calculator:
            return "计算器"
        case .Fahrenheit:
            return "摄氏度转华氏度"
        case .Centigrade:
            return "华氏度转摄氏度"
        case .Foot:
            return "米转英尺"
        case .Meter:
            return "英尺转米"
        }
    }
    
    var previousUnit : String {
        switch self {
        case .Calculator:
            return ""
        case .Fahrenheit:
            return "摄氏度"
        case .Centigrade:
            return "华氏度"
        case .Foot:
            return "米"
        case .Meter:
            return "英尺"
        }
    }
    
    var currentUnit : String {
        switch self {
        case .Calculator:
            return ""
        case .Fahrenheit:
            return "华氏度"
        case .Centigrade:
            return "摄氏度"
        case .Foot:
            return "英尺"
        case .Meter:
            return "米"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
