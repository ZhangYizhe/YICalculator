//
//  NormalButton.swift
//  Calculator
//
//  Created by 张艺哲 on 2021/2/9.
//

import SwiftUI

struct NormalButton: View {
    var text: Text
    var color: Color
    var bgColor: Color
    var tapHandle : () -> Void
    
    init(_ text: Text, color: Color = Color("NumberButton"), bgColor: Color = Color("White"), tapHandle: @escaping () -> Void) {
        self.text = text
        self.color = color
        self.bgColor = bgColor
        self.tapHandle = tapHandle
    }
    
    var body: some View {
        Button(action: {
            self.tapHandle()
            
            let impact = UIImpactFeedbackGenerator(style: .medium)
            impact.impactOccurred()
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

struct NormalButton_Previews: PreviewProvider {
    static var previews: some View {
        NormalButton(Text("+")) {
            
        }
    }
}
