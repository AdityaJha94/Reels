//
//  Reel.swift
//  ReelsDemo2
//
//  Created by Jha, Aditya on 04/11/24.
//

import Foundation
import AVKit

struct Reel: Identifiable {
    var id = UUID().uuidString
    var player: AVPlayer?
    var mediaFile: MediaFile
}
