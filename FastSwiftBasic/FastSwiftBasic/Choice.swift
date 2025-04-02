//
//  Choice.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct Choice: View {
    
    var direction: Direction = .north
    var member: Member = .cd
    var menu: Menu = .steak("rare")
    
    var body: some View {
        Text("direction is \(direction.rawValue)")
        Text("direction is \(direction)")
        
        Text("member is \(member)")
        }
}

enum Menu {
    case pasta
    case pizza
    case steak(String)
}

enum Member {
    case ab
    case b
    case cd
    case d
    case e
}

enum Direction: String {
    case north
    case west
    case east
    case south
}

#Preview {
    Choice()
}
