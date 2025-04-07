//
//  SimpleView.swift
//  WarmUp
//
//  Created by 송지연 on 4/6/25.
//

import SwiftUI

struct SimpleView: View {
    var body: some View {
        VStack {
            Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text("헤드라인 입니다")
                .font(.headline)
                .bold()
                .padding()
            
            Text("서브헤드라인 입니다")
                .font(.subheadline)
                .padding()
            
            Text("바디 입니다")
                .font(.body)
                .padding()
            
            Button {
                //
            } label: {
                Text("Click me")
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                    .bold()
            }

        }
    }
}

#Preview {
    SimpleView()
}
