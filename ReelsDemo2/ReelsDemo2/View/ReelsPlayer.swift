//
//  ReelsPlayer.swift
//  ReelsDemo2
//
//  Created by Jha, Aditya on 04/11/24.
//

import SwiftUI

struct ReelsPlayer: View {

    // @ObservedObject var viewModel: ReelsViewModel
    var reel: Reel
    @Binding var currentReel: String
    @State var showMore: Bool = false
    @State var isMuted: Bool = false
    @State var volumeAnimation: Bool = false

    var body: some View {
        ZStack {
            if let player = reel.player {
                CustomVideoPlayer(player: player)
                
                // Playing video based on offset
                GeometryReader { proxy -> Color in
                    let minY = proxy.frame(in: .global).minY
                    let size = proxy.size
                    DispatchQueue.main.async {
                        // since we have many cards and offset goes beyond
                        // so it starts playing the below videos..
                        // to avoid this checking the current one with current reel id
                        if -minY < (size.height / 2) && minY < (size.height/2) && currentReel == reel.id {
                            player.play()
                        } else {
                            player.pause()
                        }
                    }
                    return Color.clear
                }
                
                // Volume control
                // Allowing control for set of area
                Color.black
                    .opacity(0.01)
                    .frame(width: 150, height: 150)
                    .onTapGesture {
                        if volumeAnimation {
                            return
                        }
                        
                        isMuted.toggle()
                        //Muting Player
                        player.isMuted = isMuted
                        withAnimation{volumeAnimation.toggle()}
                        
                        // closing animation after 0.8 sec
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation{volumeAnimation.toggle()}
                        }
                    }
                // Dimming background when showing more content
                Color.black.opacity(showMore ? 0.35 : 0)
                    .onTapGesture {
                        // Closing it
                        withAnimation{ showMore.toggle()}
                    }
                
                VStack {
                    HStack(alignment: .bottom) {
                        VStack (alignment: .leading, spacing: 10) {
                            HStack (spacing: 15) {
                                Image("person.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                Text("iJustime")
                                    .font(.callout.bold())
                                Button {
                                    
                                } label: {
                                    Text("Follow")
                                        .font(.caption.bold())
                                }
                            }
                            ZStack {
                                if showMore {
                                    ScrollView(.vertical, showsIndicators: false) {
                                        Text(reel.mediaFile.title ?? "" + sampleText)
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                    }
                                    .frame(height: 120)
                                    .onTapGesture {
                                        withAnimation{showMore.toggle()}
                                    }
                                } else {
                                    Button {
                                        withAnimation{showMore.toggle()}
                                    } label: {
                                        HStack {
                                            Text(reel.mediaFile.title ?? "")
                                                .font(.callout)
                                                .fontWeight(.semibold)
                                                .lineLimit(1)
                                            Text("more")
                                                .font(.callout.bold())
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.top, 6)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                            }
                        }
                        
                        Spacer(minLength: 20)
                        
                        // List of Buttons...
                        ActionButtons(reel: reel)
                        
                    }
                    
                    HStack {
                        Text(" A sky full of stars")
                            .font(.caption)
                            .fontWeight(.semibold)
                        Spacer(minLength: 20)
                        Image("album")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .cornerRadius(6)
                            .background(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.white, lineWidth: 3)
                            )
                            .offset(x: -5)
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                .foregroundColor(.white)
                .frame(maxHeight: .infinity, alignment: .bottom)
                
                Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                    .background(.secondary)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.black)
                    .opacity(volumeAnimation ? 1 : 0)
            }
        }.onAppear {
            // currentReel = reel.id
            print("currentReel:- \(currentReel)")
            print("reel.URL:- \(reel.mediaFile.url)")
        }
    }
}
