//
//  Selection.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct Selection: View {
    
    @State var myDirection: DirectionInSelection = .north
    
    var body: some View {
        switch myDirection {
        case .north:
            Text("\(myDirection.rawValue)쪽은 추워요")
        case .west:
            Text(myDirection.rawValue)
        case .east:
            Text(myDirection.rawValue)
        case .south:
            Text(myDirection.rawValue)
        case .myway:
            Text("myway direction")
        }
        
        
        Button {
            switch myDirection {
            case .north, .west:
                myDirection = .east
//            case .west:
//                myDirection = .south
            case .east:
                myDirection = .south
//            case .south:
//                myDirection = .north
            default:
                myDirection = .north
            }
        } label: {
            Text("돌리기")
        }

    }
}

enum DirectionInSelection: String {
    case north = "북"
    case west = "서"
    case east = "동"
    case south = "남"
    case myway
}

#Preview {
    Selection()
}
