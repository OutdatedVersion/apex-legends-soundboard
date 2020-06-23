//
//  BroadcastDetailView.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/20/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import SwiftUI

struct BroadcastDetailView: View {
    let broadcast: Broadcast
    
    var body: some View {
        Text("Broadcast: \(self.broadcast.name)")
    }
}
