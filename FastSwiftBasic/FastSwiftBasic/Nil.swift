//
//  Nil.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct Nil: View {
    
    var name: String = "rosie"
    var petName: String?
    
    var bami: String = "Bami"
    var petName2: String = "coco"
    
    var body: some View {
        
        VStack{
//            Text("my name is \(name) and my pet's name is \(petName)")    // petName은 옵셔널 값
            Text("his name is \(bami) and his pet's name is \(petName2)")
        }
        .onAppear {
            print("my name is \(name) and my pet's name is \(petName)")    // petName은 옵셔널 값이고 값이 없으므로 nil (빈문자열 ""과 다름)
            print("his name is \(bami) and his pet's name is \(petName2)")
        }
    }
}



#Preview {
    Nil()
}
