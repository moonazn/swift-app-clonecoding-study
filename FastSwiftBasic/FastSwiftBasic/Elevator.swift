//
//  Elevator.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct Elevator: View {
    
//    @State var level: Int = 1
    
    @State var myElevator = ElevatorStruct()
    
    var body: some View {
        VStack {
            Text("what floor: \(myElevator.level)")
            
            HStack {
                Button {
                    myElevator.goUp()
                } label: {
                    Text("up")
                }
                Button {
                    myElevator.goDown()
                } label: {
                    Text("down")
                }

            }
        }
    }
    

}

struct ElevatorStruct {
    var level: Int = 1
    
    mutating func goDown() {    // level 프로퍼티의 값을 변화시킬 수 있도록 mutation 키워드 사용
        if level == 1 {
            return
        } else {
            level = level - 1
        }
    }
    
    mutating func goUp() {
        level = level + 1
    }
    // 층 수를 표시해주는 디스플레이
    // 위로 올라갈 수 있어야 함
    // 아래로 내려갈 수 있어야 함
}

#Preview {
    Elevator()
}
