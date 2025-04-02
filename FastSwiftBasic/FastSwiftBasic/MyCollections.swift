//
//  MyCollections.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct MyCollections: View {
    
    let name: String = "jiyeon" // 상수
    var name2: String = "jiyeon" // 변수
    
    var foods: [String] = ["eggs", "bananas", "beans"]
    
    var jazzs: Set<String> = ["bibidudu", "labdap", "dididudu"]
    var hiphop: Set<String> = ["labdap", "rap", "wow"]
    
    var koEngDict = ["사과":"Apple"]
    
    var body: some View {
        Text(foods[0])
        Text(foods[2])
        
        Text(hiphop.intersection(jazzs).description)
        
        Button {
            var intersectionMusic = hiphop.intersection(jazzs)
        } label: {
            Text("hit!")
        }
        
        Text(koEngDict["사과"]!)
        
        List {
            ForEach(foods, id: \.self) { name in
                var welcome = sayHi(to: name)
                
                if name == "bananas" {
                    Text("기다렸어요. \(welcome)")
                } else {
                    Text(welcome)
                }
            }
        }

    }
    
    func sayHi(to name: String) -> String {
        return "\(name) hi"
    }
}

#Preview {
    MyCollections()
}
