//
//  MyButton.swift
//  WarmUp
//
//  Created by 송지연 on 4/6/25.
//

import SwiftUI

struct MyButton: View {
    
    var buttonTitle: String
    var buttonColor: Color
    var body: some View {
        Button {
            
        } label: {
            Text(buttonTitle)
                .padding()
                .background(buttonColor)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(10)
        }
    }
}

#Preview {
    MyButton(buttonTitle: "Button 4", buttonColor: .brown)
}
