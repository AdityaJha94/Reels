//
//  ActionButtons.swift
//  ReelsDemo2
//
//  Created by Jha, Aditya on 04/11/24.
//

import SwiftUI

struct ActionButtons: View {
    var reel: Reel
    var body: some View {
        VStack(spacing: 25) {
            Button {
                
            } label: {
                VStack(spacing: 10) {
                    Image(systemName: "suit.heart")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("233K")
                        .font(.caption.bold())
                }
            }
            
            Button {
                
            } label: {
                VStack(spacing: 10) {
                    Image(systemName: "bubble.right")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("120")
                        .font(.caption.bold())
                }
            }
            
            Button {
                
            } label: {
                VStack(spacing: 10) {
                    Image(systemName: "paperplane")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
            
            Button {
                
            } label: {
                 Image("menu")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    //.rotationEffect(.init(degrees: 90))
            }
        }
    }
}
