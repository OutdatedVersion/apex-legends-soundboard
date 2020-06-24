//
//  WeaponDetailView.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/22/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import SwiftUI

struct WeaponDetailView: View {
    let weapon: Weapon
    
    var body: some View {
        Text("Weapon: \(self.weapon.name)")
    }
}

//struct WeaponDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeaponDetailView()
//    }
//}
