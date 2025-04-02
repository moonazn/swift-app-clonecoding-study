//
//  Function.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct Function: View {
    
    @State var inputNumber: Int = 4
    
    var body: some View {
        VStack {
            Text("input number is \(inputNumber)")
            
            Button {
                inputNumber = plusFive(with: inputNumber)
            } label: {
                Text("+5")
            }

        }
    }
    
    func plusFive(with input: Int) -> Int {
        return input + 5
    }
}

#Preview {
    Function()
}
