//
//  VariableType.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct VariableType: View {
    
    var name: String = "jiyeon"
    var age: Int = 24
    var height: Float = 165
    var weight: Double = 41.5
    var havePet: Bool = false
    
    var body: some View {
        Text(String(10))
        Text("\(havePet.description)")
    }
}

#Preview {
    VariableType()
}
