//
//  Home.swift
//  ReelsDemo2
//
//  Created by Jha, Aditya on 04/11/24.
//

import SwiftUI

struct Home: View {

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab = "Reels"

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                Text("Home")
                    .tag("house.fill")
                Text("Search")
                    .tag("magnifyingglass")
                ReelsView(viewModel: ReelsViewModel())
                    .tag("Reels")
                Text("Liked")
                    .tag("suit.heart")
                Text("Profile")
                    .tag("person.circle")
            }
            
            HStack(spacing: 0) {
                // simple creating array of images
                ForEach(["house.fill", "magnifyingglass", "Reels", "suit.heart", "person.circle"], id: \.self) { image in
                    TabBarButton(image: image, isSystemImage: image != "Reels", currentTab: $currentTab)
                }
            }
            .padding(.horizontal)
            .padding(.vertical,10)
            .overlay(Divider(), alignment: .top)
            .background(currentTab == "Reels" ? .black : .clear)
        }
    }
}

struct TabBarButton: View {

    var image: String
    var isSystemImage: Bool
    @Binding var currentTab: String
    var body: some View {
        Button {
            withAnimation {
                currentTab = image
            }
        } label: {
            ZStack {
                if isSystemImage {
                    Image(systemName: image)
                        .font(.title2)
                } else {
                    Image(image)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                }
            }
            .foregroundColor(currentTab == image ? currentTab == "Reels" ? .white : .primary : .gray)
            .frame(maxWidth: .infinity)
        }
    }
}
