//
//  ConvertView.swift
//  Calculator
//
//  Created by 张艺哲 on 2021/2/9.
//

import SwiftUI

struct ConvertView: View {
    
    @Binding var pattern : PatternStruct
    
    @ObservedObject var model : ConvertViewModel
    
    init(pattern: Binding<PatternStruct>) {
        self._pattern = pattern
        self.model = ConvertViewModel(pattern.wrappedValue)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: 20) {
                HStack {
                    Text(pattern.friendlyName)
                        .font(Font.system(size: 30, weight: .light))
                    Spacer()
                }
                
                Spacer()
                
                VStack (spacing: 20) {
                    HStack {
                        Spacer()
                        Text(model.outputString)
                            .font(Font.system(size: 30, weight: .light))
                        Text(pattern.currentUnit)
                            .font(Font.system(size: 30, weight: .light))
                    }
                    HStack {
                        Spacer()
                        Text(model.inputString)
                            .font(Font.system(size: 30, weight: .light))
                        Text(pattern.previousUnit)
                            .font(Font.system(size: 30, weight: .light))
                    }
                }
                
                HStack {
                    VStack {
                        NormalButton(Text("7")) {
                            model.number("7")
                        }
                        NormalButton(Text("4")) {
                            model.number("4")
                        }
                        NormalButton(Text("1")) {
                            model.number("1")
                        }
                        NormalButton(Text(".")) {
                            model.number(".")
                        }
                    }
                    VStack {
                        NormalButton(Text("8")) {
                            model.number("8")
                        }
                        NormalButton(Text("5")) {
                            model.number("5")
                        }
                        NormalButton(Text("2")) {
                            model.number("2")
                        }
                        NormalButton(Text("0")) {
                            model.number("0")
                        }
                    }
                    VStack {
                        NormalButton(Text("9")) {
                            model.number("9")
                        }
                        NormalButton(Text("6")) {
                            model.number("6")
                        }
                        NormalButton(Text("3")) {
                            model.number("3")
                        }
                        NormalButton(Text(Image(systemName: "arrow.left"))) {
                            model.delete()
                        }
                    }
                }
                .frame(height: geometry.size.height / 2)
            }
        }
        .padding()
    }
}

struct ConvertView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertView(pattern: Binding<PatternStruct>.constant(PatternStruct.Centigrade))
    }
}
