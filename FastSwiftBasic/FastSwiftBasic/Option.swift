//
//  Option.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct Option: View {
    
    var rosie: People? = People(name: "rosie", mbti: MBTI(name: "isfj"))
    var tommy = People(name: "tommy", petName: "coco")
    var mimi = People(name: "mimi", petName: "cookie")
    
    var body: some View {
        VStack {
            
            // 옵셔널 바인딩
            
            if let rosie = rosie {
                if let mbti = rosie.mbti {
                    if let name = mbti.name {
                        // 중첩...
                    }
                }
            }
            
            if let rosieMbtiName = rosie?.mbti?.name {  // 옵셔널 체이닝
                Text(rosieMbtiName)
            } else {
                Text("no mbti name")
            }
            
//            if let petName = rosie.petName {
//                Text("\(rosie.name)'s pet is \(rosie.petName)")
//            } else {
//                Text("\(rosie.name) doesn't have a pet")
//            }
            
            if let petName = tommy.petName {
                Text("\(tommy.name)'s pet is \(petName)")
            } else {
                Text("\(tommy.name) doesn't have a pet")
            }
            
            if let petName = mimi.petName {
                Text("\(mimi.name)'s pet is \(petName)")
            } else {
                Text("\(mimi.name) doesn't have a pet")
            }
        }
    }
}

struct People {
    let name: String
    var petName: String?
    var mbti: MBTI?
}

struct MBTI {
    let name: String?
}

#Preview {
    Option()
}
