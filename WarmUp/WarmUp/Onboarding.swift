//
//  Onboarding.swift
//  WarmUp
//
//  Created by 송지연 on 4/6/25.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        VStack {
            Text("What's New in Photos")
//                .font(.system(size: 35))
                .font(.largeTitle)
                .bold()
                .padding()
                .padding(.top, 50)
            
            HStack {
                Image(systemName: "person.2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 7)
                
                VStack(alignment: .leading) {
                    Text("Shared Library")
                        .font(.headline)
                        
                    Text("Combine photos and videos with the people Combine photos and videos with the people Combine photos and videos with the people")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.trailing)
            }
            .padding(.vertical)
            
            HStack {
                Image(systemName: "slider.horizontal.2.square.on.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 7)

                VStack(alignment: .leading) {
                    Text("Copy & Paste Edits")
                        .font(.headline)
                    Text("Combine photos and videos with the people Combine photos and videos with the people Combine photos and videos with the people")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.trailing)
            }
            .padding(.vertical)
            
            HStack {
                Image(systemName: "square.on.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 7)

                VStack(alignment: .leading) {
                    Text("Merge Duplicates")
                        .font(.headline)
                    Text("Combine photos and videos with the people Combine photos and videos with the people Combine photos and videos with the people")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.trailing)
            }
            .padding(.vertical)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Continue")
                    .bold()
                    .frame(width: 320)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
            }
            .padding(.bottom, 50)
            
        }
    }
}

#Preview {
    Onboarding()
}
