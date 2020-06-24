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
    
    var legendPreviewImageName: String {
        return "legend_\(self.name.lowercased().replacingOccurrences(of: " ", with: "_"))"
    }
}
