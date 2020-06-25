//
//  LegendSoundsView.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/20/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import SwiftUI
import AVFoundation

struct LegendSoundsView: View {
    let legend: Legend
    
    var body: some View {
        List {
            Section(header: Text("Taunts")) {
                ForEach(self.legend.taunts) { taunt in
                    NavigationLink(destination: TauntDetailsView(taunt: taunt)) {
                        Text(taunt.group)
                    }
                }
            }
        }
    }
}
