//
//  MyGeneric.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct MyGeneric: View {
    
    @State var inputInt = ""
    @State var inputFloat = ""
    @State var myIntStack = MyIntStack()
    @State var myStack = MyStack<Float>()
    
    var body: some View {
        VStack {
            TextField("type number", text: $inputInt)
            Button {
                myIntStack.insertValue(input: Int(inputInt) ?? 0)
            } label: {
                Text("save")
            }
            Button {
                myIntStack.showData()
            } label: {
                Text("print")
            }
            
            TextField("type float", text: $inputFloat)
            Button {
                myStack.insertValue(input: Float(inputFloat) ?? 0.0)
            } label: {
                Text("save")
            }
            Button {
                myStack.showData()
            } label: {
                Text("print")
            }

        }
    }
}

struct MyIntStack {
    var data: [Int] = []
    
    mutating func insertValue(input: Int) {
        data.append(input)
    }
    
    func showData() {
        data.forEach { item in
            print(item)
        }
    }
    
}

struct MyStack<T> {
    var data: [T] = []      // 제네릭 타입 -> 범용적 사용 가능
    
    mutating func insertValue(input: T) {
        data.append(input)
    }
    
    func showData() {
        data.forEach { item in
            print(item)
        }
    }
    
}

#Preview {
    MyGeneric()
}
