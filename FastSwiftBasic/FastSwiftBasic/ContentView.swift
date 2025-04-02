//
//  ContentView.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct ContentView: View {
    
    var place: String = "Paris"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(place) good")
            Text(place)
            Text(place)
            Text(place)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
