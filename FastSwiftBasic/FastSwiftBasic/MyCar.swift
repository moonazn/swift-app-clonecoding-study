//
//  MyCar.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

protocol Drivable {
    func speedDown(with speed: Int) -> Int
}

struct MyCar: View {
    
    var myCar: KIA = KIA()
    var sisterCar: Hyundai = Hyundai()
    
    let cars: [Drivable] = [KIA(), Hyundai()]   // 같은 프로토콜로 설계된 구조체는 배열로 묶을 수 있다.
    
    @State var mySpeed: Int = 10
    @State var sisterSpeed: Int = 20
    @State var randomSpeed: Int = 20
    
    var body: some View {
        
        VStack {
            Text("my car speed: \(mySpeed)")
            Button {
                mySpeed = myCar.speedDown(with: mySpeed)
            } label: {
                Text("rower speed")
            }
            
            Text("sister's car speed: \(sisterSpeed)")
            Button {
                sisterSpeed = sisterCar.speedDown(with: sisterSpeed)
                
                randomSpeed = cars.randomElement()?.speedDown(with: randomSpeed) ?? 0
            } label: {
                Text("rower speed")
            }
        }
        
//        ForEach(cars) { item in
//            
//        }

    }
}

struct KIA: Drivable {

    func speedDown(with speed: Int) -> Int {
        var rowerSpeed: Int = speed - 5
        print("속도가 \(rowerSpeed)으로 줄어듭니다.")
        return rowerSpeed
    }
    
}

struct Hyundai: Drivable {
    
    func speedDown(with speed: Int) -> Int {
        var rowerSpeed: Int = speed - 9
        print("속도가 \(rowerSpeed)으로 줄어듭니다.")
        return rowerSpeed
    }
    
    
}



#Preview {
    MyCar()
}
