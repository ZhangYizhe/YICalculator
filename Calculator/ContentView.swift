//
//  ContentView.swift
//  Calculator
//
//  Created by 张艺哲 on 2021/2/8.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView {
            CalculatorView()
                .padding()
                .navigationTitle("艺算")
                .navigationBarItems(trailing:
                                        Button(action: {}, label: {
                                            Text("汇率转换")
                                        })
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
