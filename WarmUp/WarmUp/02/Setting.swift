//
//  Setting.swift
//  WarmUp
//
//  Created by 송지연 on 4/7/25.
//

import SwiftUI


struct SettingInfo {
    let title: String
    let systemName: String
    let backgroundColor: Color
    let foregroundColor: Color
}

struct Setting: View {
    
    let data: [SettingInfo] = [
        SettingInfo(title: "스크린타임", systemName: "hourglass", backgroundColor: .purple, foregroundColor: .white)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Label {
                        Text("스크린 타임")
                    } icon: {
                        Image(systemName: "hourglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.all, 7)
                            .background(.purple)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                    }
                }
                
                
                Section {
                    Label {
                        Text("일반")
                    } icon: {
                        Image(systemName: "gear")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.all, 7)
                            .background(.gray)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                    }
                    
                    Label {
                        Text("손쉬운 사용")
                    } icon: {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.all, 7)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                    }
                }
                
            }
            .navigationTitle("설정")
        }
    }
}

#Preview {
    Setting()
}
