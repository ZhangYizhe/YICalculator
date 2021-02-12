//
//  YICalculator.swift
//  YICalculator
//
//  Created by 张艺哲 on 2021/2/8.
//

import SwiftUI

@main
struct YICalculator: App {
    
    init() {
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor(named: "InputText")
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
