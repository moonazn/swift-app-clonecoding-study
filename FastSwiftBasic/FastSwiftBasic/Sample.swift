//
//  Sample.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct Sample: View {
    
    let data = [
        Destination(direction: .north,
                    food: "pasta",
                    image: Image(systemName: "carrot.fill")),
        Destination(direction: .east,
                    food: nil,
                    image: Image(systemName: "sunrise.fill")),
        Destination(direction: .west,
                    food: nil,
                    image: Image(systemName: "archivebox.fill")),
        Destination(direction: .south,
                    food: "pizza",
                    image: Image(systemName: "balloon.fill")),
    ]
    
    @State var selectedDestination: Destination?
    
    var body: some View {
        VStack {
            selectedDestination?.image
                .resizable()    // 이미지 크기 수정 가능하도록 설정
                .scaledToFit()  // 이미지 비율 맞춰주기
                .frame(width: 200, height: 200) // 200*200 사이즈 설정
            
            if let destination = selectedDestination {
                Text(destination.direction.rawValue)
                if let food = destination.food {
                    Text(food)
                }
            }
            

            
            Button {
                selectedDestination = data.randomElement()
            } label: {
                Text("roll")
            }

        }
    }
}

struct Destination {
    let direction: RealDirection
    let food: String?
    let image: Image
}

enum RealDirection: String {
    case north = "북"
    case west = "서"
    case east = "동"
    case south = "남"}

#Preview {
    Sample()
}
