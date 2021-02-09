//
//  CalculatorView.swift
//  Calculator
//
//  Created by 张艺哲 on 2021/2/8.
//

import SwiftUI

struct CalculatorView: View {
    
    @ObservedObject var model : CalculatorViewModel
    
    init() {
        self.model = CalculatorViewModel()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                VStack {
                    Spacer()
                        .frame(height: 50)
                    // Operation Text
                    HStack {
                        Spacer()
                        Text(model.formula)
                            .truncationMode(.middle)
                            .lineLimit(2)
                            .font(Font.system(size: 30, weight: .light))
                            .foregroundColor(.gray)
                            .frame(minHeight: 80)
                    }
                    .padding(.horizontal)
                    // Result Text
                    ScrollView(.horizontal, showsIndicators: false) {
                        Text(model.result)
                            .frame(minWidth: geometry.size.width, alignment: .trailing)
                            .lineLimit(1)
                            .font(Font.system(size: 50, weight: .light))
                            .foregroundColor(Color("EqualButton"))
                    }
                }
                
                GeometryReader { geometry in
                    VStack {
                        HStack {
                            VStack {
                                TypeButton(Text("7")) {
                                    model.number("7")
                                }
                                TypeButton(Text("4")) {
                                    model.number("4")
                                }
                                TypeButton(Text("1")) {
                                    model.number("1")
                                }
                                
                            }
                            VStack {
                                TypeButton(Text("8")) {
                                    model.number("8")
                                }
                                TypeButton(Text("5")) {
                                    model.number("5")
                                }
                                TypeButton(Text("2")) {
                                    model.number("2")
                                }
                                
                            }
                            VStack {
                                TypeButton(Text("9")) {
                                    model.number("9")
                                }
                                TypeButton(Text("6")) {
                                    model.number("6")
                                }
                                TypeButton(Text("3")) {
                                    model.number("3")
                                }
                                
                            }
                            VStack {
                                TypeButton(
                                    Text(Image(systemName: "divide")),
                                    color: Color("OperationButton"),
                                    bgColor: .clear) {
                                    model.operation("/")
                                }
                                TypeButton(
                                    Text(Image(systemName: "multiply")),
                                    color: Color("OperationButton"),
                                    bgColor: .clear) {
                                    model.operation("x")
                                }
                                TypeButton(
                                    Text(Image(systemName: "minus")),
                                    color: Color("OperationButton"),
                                    bgColor: .clear) {
                                    model.operation("-")
                                }
                                TypeButton(
                                    Text(Image(systemName: "plus")),
                                    color: Color("OperationButton"),
                                    bgColor: .clear) {
                                    model.operation("+")
                                }
                            }
                            .background(Color("OperationBgButton"))
                            .cornerRadius(10)
                            .padding(.vertical)
                        }
                        HStack {
                            TypeButton(Text(".")) {
                                model.number(".")
                            }
                            TypeButton(Text("0")) {
                                model.number("0")
                            }
                            TypeButton(Text(Image(systemName: "arrow.left"))) {
                                model.delete()
                            }
                            TypeButton(
                                Text(Image(systemName: "equal")),
                                color: .white,
                                bgColor: Color("EqualButton")) {
                                model.equal()
                            }
                        }.frame(height: geometry.size.height / 4)
                    }
                }
            }
        }
        .padding()
    }
    
    struct TypeButton: View {
        
        var text: Text
        var color: Color
        var bgColor: Color
        var tapHandle : () -> Void
        
        init(_ text: Text, color: Color = Color("NumberButton"), bgColor: Color = Color.white, tapHandle: @escaping () -> Void) {
            self.text = text
            self.color = color
            self.bgColor = bgColor
            self.tapHandle = tapHandle
        }
        
        var body: some View {
            Button(action: {
                self.tapHandle()
            }, label: {
                GeometryReader { geometry in
                    text
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        .foregroundColor(color)
                        .background(bgColor)
                }
            })
            .font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .cornerRadius(10)
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
