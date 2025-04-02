//
//  Exception.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

struct Exception: View {
    
    @State var inputNumber = ""
    @State var resultNumber: Float = 0
    
    var body: some View {
        TextField("나눌 숫자를 입력해주세요.", text: $inputNumber)
        Text("result is : \(resultNumber)")
        Button {
            
            do {    // 에러 처리
                try resultNumber = divideTen(with: (Float(inputNumber) ?? 0) )  // dbwj가 입력한 inputNumber이 올바른 double값이 아니어서 Float(inputNumber)가 nil이 되어버릴 경우 0을 사용함 - nil 병합 연산자 (nil-coalescing) ??
            } catch DivideError.dividedByZero {
                print("0으로 나눠버림")
                resultNumber = -99
                inputNumber = "Invalid input"
            } catch {
                print(error.localizedDescription)
            }
            
            
        } label: {
            Text("divide")
        }
        
    }
    func divideTen(with inputNumber: Float) throws -> Float {   // 에러를 던질 수 있는 함수라는 점을 명시
        var result: Float = 0
        if inputNumber == 0 {
            // error
            throw DivideError.dividedByZero
        } else {
            result = 10 / inputNumber
        }
        
        return result
    }
}

enum DivideError: Error {   // 에러 정의
    case dividedByZero
}

#Preview {
    Exception()
}
