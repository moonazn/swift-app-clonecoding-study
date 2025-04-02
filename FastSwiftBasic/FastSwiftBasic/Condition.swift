//
//  Condition.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct Condition: View {
    
    var count = 4
    
    var body: some View {
        
        if count > 4 {
            Text("upper than 4")
        } else {
            Text("equal or upper than 4")
        }
        
    }
}

#Preview {
    Condition()
}
