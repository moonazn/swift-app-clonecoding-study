////
////  Setting.swift
////  WarmUp
////
////  Created by 송지연 on 4/7/25.
////
//
//import SwiftUI
//
//
//struct SettingInfo {
//    let title: String
//    let systemName: String
//    let backgroundColor: Color
//    let foregroundColor: Color
//}
//
//struct Setting: View {
//    
//    let data: [SettingInfo] = [
//        SettingInfo(title: "스크린타임", systemName: "hourglass", backgroundColor: .purple, foregroundColor: .white)
//    ]
//    
//    var body: some View {
//        NavigationStack {
//            List {
//                Section {
//                    Label {
//                        Text("스크린 타임")
//                    } icon: {
//                        Image(systemName: "hourglass")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 20, height: 20)
//                            .padding(.all, 7)
//                            .background(.purple)
//                            .foregroundColor(.white)
//                            .cornerRadius(6)
//                    }
//                }
//                
//                
//                Section {
//                    Label {
//                        Text("일반")
//                    } icon: {
//                        Image(systemName: "gear")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 20, height: 20)
//                            .padding(.all, 7)
//                            .background(.gray)
//                            .foregroundColor(.white)
//                            .cornerRadius(6)
//                    }
//                    
//                    Label {
//                        Text("손쉬운 사용")
//                    } icon: {
//                        Image(systemName: "person.crop.circle")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 20, height: 20)
//                            .padding(.all, 7)
//                            .background(.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(6)
//                    }
//                }
//                
//            }
//            .navigationTitle("설정")
//        }
//    }
//}
//
//#Preview {
//    Setting()
//}
import SwiftUI

struct SettingInfo: Identifiable {  // ForEach 사용을 위해 SettingInfo에 UUID id 추가
    let id = UUID()
    let title: String
    let systemName: String
    let backgroundColor: Color
    let foregroundColor: Color
}

struct Setting: View {
    
    let section1: [SettingInfo] = [
        SettingInfo(title: "스크린타임", systemName: "hourglass", backgroundColor: .purple, foregroundColor: .white)
    ]
    
    let section2: [SettingInfo] = [
        SettingInfo(title: "일반", systemName: "gear", backgroundColor: .gray, foregroundColor: .white),
        SettingInfo(title: "손쉬운 사용", systemName: "person.crop.circle", backgroundColor: .blue, foregroundColor: .white)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(section1) { item in     // 리스트를 동적으로 렌더링
                        SettingLabel(info: item)
                    }
                }
                
                Section {
                    ForEach(section2) { item in
                        SettingLabel(info: item)
                    }
                }
            }
            .navigationTitle("설정")
        }
    }
}

// 재사용 가능한 뷰 컴포넌트
struct SettingLabel: View {
    let info: SettingInfo
    
    var body: some View {
        Label {
            Text(info.title)
        } icon: {
            Image(systemName: info.systemName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(7)
                .background(info.backgroundColor)
                .foregroundColor(info.foregroundColor)
                .cornerRadius(6)
        }
    }
}

#Preview {
    Setting()
}
