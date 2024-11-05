//
//  ReelsView.swift
//  ReelsDemo2
//
//  Created by Jha, Aditya on 04/11/24.
//

import SwiftUI
import AVKit

struct ReelsView: View {
    @ObservedObject var viewModel: ReelsViewModel
    @State var currentReelId = ""
    var body: some View {
        // Settimg width and height for rotated view
        GeometryReader { proxy in
            let size = proxy.size
            // Vertical Page TabView..
            TabView(selection: $currentReelId) {
                ForEach(viewModel.reels ?? []) { reel in
                    ReelsPlayer(reel: reel, currentReel: $currentReelId)
                    .frame(width: size.width)
                    .padding()
                    .rotationEffect(.init(degrees: -90))
                    .ignoresSafeArea(.all, edges: .top)
                    .tag(reel.id)
                }
            }
            // Rotating View..
            .rotationEffect(.init(degrees: 90))
            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: size.width)
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.ignoresSafeArea())
        .onAppear {
            viewModel.fetchAllReels()
            currentReelId = viewModel.reels?.first?.id ?? ""
            print("currentReelId:- \(currentReelId)")
        }
    }
}

#Preview {
    ContentView()
}

let sampleText = "In publishing and graphic design, Lorem Ipsum is a plceholder commonly used to demonstrate the visual form of a document or a typeface without relying on a meaningful content"


/*
if let reelIndex = viewModel.reels?.firstIndex(where: { $0.id == reel.id }) {
    ReelsPlayer(reel: Binding(get: {
        viewModel.reels?[reelIndex] ?? reel
    }, set: { newValue in
        viewModel.reels?[reelIndex] = newValue
    }), currentReel: $currentReelId)
    .frame(width: size.width)
    .padding()
    .rotationEffect(.init(degrees: -90))
    .ignoresSafeArea(.all, edges: .top)
    .tag(reel.id)
}
*/

/*
@State var reels = MediaFileJSON.map { item -> Reel in
    // let url = Bundle.main.path(forResource: item.url, ofType: "mp4") ?? ""
    if let url = URL(string: item.url ?? "") {
        let player = AVPlayer(url: url)
        return Reel(player: player, mediaFile: item)
    }
    return Reel(player: nil, mediaFile: item)
    // let player = AVPlayer(url: URL(fileURLWithPath: url))
}*/
