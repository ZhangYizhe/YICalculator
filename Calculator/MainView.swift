//
//  MainView.swift
//  Calculator
//
//  Created by 张艺哲 on 2021/2/8.
//

import SwiftUI
import CoreData

struct MainView: View {
    var body: some View {
        NavigationView {
            CalculatorView()
                .navigationTitle("艺算")
                .navigationBarItems(trailing:
                                        Button(action: {}, label: {
                                            Text("单位转换")
                                        })
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
