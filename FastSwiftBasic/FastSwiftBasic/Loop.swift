//
//  Loop.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct Loop: View {
    
    let names: [String] = ["a", "b", "c", "d"]
    
    var body: some View {
        VStack {
            ForEach(names, id: \.self) { item in
                Text(item)
            }
        }
    }
}

#Preview {
    Loop()
}
