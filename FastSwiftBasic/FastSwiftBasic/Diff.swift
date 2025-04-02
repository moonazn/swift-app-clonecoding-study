//
//  Diff.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct Diff: View {
    
    let myCar = Car(name: "jiyeon car", owner: "jiyeon")
    @ObservedObject var myKar = Kar(name: "jiyeon kar", owner: "jiyeon")
    
    @State var name: String = ""
    
    var body: some View {
        Text("\(myCar.name)'s owner is \(myCar.owner)!")
        
        TextField("type your name", text: $name)
        
        Button {
            myCar.sayHi()
        } label: {
            Text("start")
        }

        
        Text("\(myKar.name)'s owner is \(myKar.owner)!")
        
        Button {
            let broKar = myKar
            broKar.name = "jiyeon's sister kar"
            broKar.owner = "jiyeon's sister"
            
            broKar.sayHi()
        } label: {
            Text("start")
        }
    }
}

struct Car {
    let name: String
    let owner: String
    
    func sayHi() {
        print("hi \(owner)")
    }
}

class Kar: ObservableObject {
    @Published var name: String
    var owner: String
    
    init(name: String, owner: String) {
        self.name = name
        self.owner = owner
    }
    
    func sayHi() {
        print("hi \(owner)")
    }
}

#Preview {
    Diff()
}
