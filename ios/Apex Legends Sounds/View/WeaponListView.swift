//
//  WeaponSoundsView.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/20/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import SwiftUI

struct WeaponListView: View {
    let weapons: [Weapon]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.weapons) { weapon in
                    NavigationLink(destination: WeaponDetailView(weapon: weapon)) {
                        Text(weapon.name)
                    }
                    
                    .simultaneousGesture(
                        TapGesture().onEnded({
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        })
                    )
                }
            }
            
            .navigationBarTitle("Weapons", displayMode: .inline)
        }
        
    }
}
