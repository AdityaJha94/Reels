//
//  MediaFile.swift
//  ReelsDemo2
//
//  Created by Jha, Aditya on 04/11/24.
//

import Foundation
import SwiftUI

struct MediaFile: Codable {
    
    var url: String?
    var title: String?
    var teaser: String?
    var date: String?
    var source: String?
}

/*
var MediaFileJSON = [
    MediaFile(url: "https://res.cloudinary.com/dcxtnrjuy/video/upload/v1730192369/inmark_8_vh4joy.mp4", title: "Apple Airtag...."),
    MediaFile(url: "https://res.cloudinary.com/dcxtnrjuy/video/upload/v1730192204/inmark_4_tfhzbz.mp4", title: "omg.....animal crossing"),
    MediaFile(url: "https://res.cloudinary.com/dcxtnrjuy/video/upload/v1730192196/inmark_gpq3h1.mp4", title: "So hyped for halo....."),
    MediaFile(url: "https://res.cloudinary.com/dcxtnrjuy/video/upload/v1730192195/inmark_6_vdciew.mp4", title: "Sponsorship...."),
    MediaFile(url: "https://res.cloudinary.com/dcxtnrjuy/video/upload/v1730192194/inmark_5_zja4vw.mp4", title: "I have been creating more vertical 30 second content"),
    MediaFile(url: "https://res.cloudinary.com/dcxtnrjuy/video/upload/v1730192193/inmark_7_rlgk8s.mp4", title: "The brand new Apple tower theatre opens"),
]
*/
