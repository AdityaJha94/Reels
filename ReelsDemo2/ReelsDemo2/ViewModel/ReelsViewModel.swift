//
//  ReelsViewModel.swift
//  ReelsDemo2
//
//  Created by Jha, Aditya on 04/11/24.
//

import Foundation
import AVKit

class ReelsViewModel: ObservableObject {
    @Published var reels: [Reel]?
    
    func fetchAllReels() {
        // Ensure the file exists in the app bundle
            guard let url = Bundle.main.url(forResource: "webmd_video_feed_content", withExtension: "json") else {
                print("JSON file not found")
                return
            }
            
            do {
                // Load the data from the file
                let data = try Data(contentsOf: url)
                
                // Decode the JSON data into an array of Article structs
                let decoder = JSONDecoder()
                let articles = try decoder.decode([MediaFile].self, from: data)
                self.reels = makeReels(items: articles)
                print("articles:- \(String(describing: articles))")
                print("reels:- \(String(describing: self.reels))")
                
            } catch {
                // Handle and print any errors
                print("Failed to load or parse JSON: \(error)")
            }
    }
    
    func makeReels(items: [MediaFile]) -> [Reel] {
        return items.map { item -> Reel in
            // let url = Bundle.main.path(forResource: item.url, ofType: "mp4") ?? ""
            if let url = URL(string: item.url ?? "") {
                let player = AVPlayer(url: url)
                return Reel(player: player, mediaFile: item)
            }
            return Reel(player: nil, mediaFile: item)
            // let player = AVPlayer(url: URL(fileURLWithPath: url))
        }
    }
}
