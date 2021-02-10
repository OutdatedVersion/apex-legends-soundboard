//
//  Legend.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/22/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import Foundation

struct Legend: Identifiable {
    let id: Int
    let name: String
    let taunts: [Taunt]
    
    var legendPreviewImageName: String {
        return "legend_\(self.name.lowercased().replacingOccurrences(of: " ", with: "_"))"
    }
}

struct Taunt: Identifiable {
    let id: Int
    let title: String
    let group: String
    let transcription: Transcription
    let files: [AudioFile]
    
    struct Transcription {
        let confidence: Double
        let text: String
    }
}

struct AudioFile {
    let name: String
    let digest: String
    
    var url: URL {
        return URL(string: "https://apexsounds.app/asset/\(self.digest)")!
    }
}
