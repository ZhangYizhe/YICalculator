//
//  CalculatorView.swift
//  YICalculator
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
                            .foregroundColor(Color("InputText"))
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
                                NormalButton(Text("7")) {
                                    model.number("7")
                                }
                                NormalButton(Text("4")) {
                                    model.number("4")
                                }
                                NormalButton(Text("1")) {
                                    model.number("1")
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
                                
                            }
                            VStack {
                                NormalButton(
                                    Text("+/-"),
                                    color: Color("OperationButton"),
                                    bgColor: .clear) {
                                    model.operation("+/-")
                                }
                                NormalButton(
                                    Text(Image(systemName: "divide")),
                                    color: Color("OperationButton"),
                                    bgColor: .clear) {
                                    model.operation("/")
                                }
                                NormalButton(
                                    Text(Image(systemName: "multiply")),
                                    color: Color("OperationButton"),
                                    bgColor: .clear) {
                                    model.operation("x")
                                }
                                NormalButton(
                                    Text(Image(systemName: "minus")),
                                    color: Color("OperationButton"),
                                    bgColor: .clear) {
                                    model.operation("-")
                                }
                                NormalButton(
                                    Text(Image(systemName: "plus")),
                                    color: Color("OperationButton"),
                                    bgColor: .clear) {
                                    model.operation("+")
                                }
                            }
                            .background(Color("OperationBgButton"))
                            .cornerRadius(10)
//                            .padding(.vertical)
                        }
                        HStack {
                            NormalButton(Text(".")) {
                                model.number(".")
                            }
                            NormalButton(Text("0")) {
                                model.number("0")
                            }
                            NormalButton(Text(Image(systemName: "arrow.left"))) {
                                model.delete()
                            }
                            NormalButton(
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
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
