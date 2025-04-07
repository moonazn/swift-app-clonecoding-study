//
//  ListLoop.swift
//  WarmUp
//
//  Created by 송지연 on 4/7/25.
//

import SwiftUI


struct Fruit: Hashable {
    let name: String
    let matchFruitName: String
    let price: Int
}

struct ListLoop: View {
    
    @State var favoriteFruits = [
        Fruit(name: "Apple", matchFruitName: "Banana", price: 1000),
        Fruit(name: "Banana", matchFruitName: "Cherry", price: 2400),
        Fruit(name: "Cherry", matchFruitName: "Elderberry", price: 5200),
        Fruit(name: "Elderberry", matchFruitName: "Apple", price: 8300),
        Fruit(name: "Elderberry", matchFruitName: "Apple", price: 8300),
        Fruit(name: "Elderberry", matchFruitName: "Apple", price: 8300),
        Fruit(name: "Elderberry", matchFruitName: "Apple", price: 8300),
        Fruit(name: "Elderberry", matchFruitName: "Apple", price: 8300),
        Fruit(name: "Elderberry", matchFruitName: "Apple", price: 8300)
    ]
    
//    var fruits = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]
//    
//    var matchFruits = ["Banana", "Cherry", "Date", "Elderberry", "Apple"]
//    
//    var price = ["1000", "3000", "5000", "2500", "8000"]
//    var count = 0
    
    @State var fruitName: String = ""
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                HStack {
                    TextField("insert fruit name", text: $fruitName)
                    Button {
                        favoriteFruits.append(Fruit(name: fruitName, matchFruitName: "Apple", price: 2000))
                    } label: {
                        Text("insert")
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                }
                .padding()
                
                List {
                    ForEach(favoriteFruits, id: \.self) { fruit in
                        VStack(alignment: .leading) {
                            Text("name: \(fruit.name)")
                            Text("matchFruitName: \(fruit.matchFruitName)")
                            Text("price: \(fruit.price)")
                        }
                    }.onDelete { indexSet in        // 스와이프 해서 요소 삭제
                        favoriteFruits.remove(atOffsets: indexSet)
                    }
                }
                .navigationTitle("Fruit List")
            }
            
            
        }
        
    }
}

#Preview {
    ListLoop()
}
