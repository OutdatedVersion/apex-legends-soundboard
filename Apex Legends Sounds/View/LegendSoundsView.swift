//
//  LegendSoundsView.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/20/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import SwiftUI

struct LegendSoundsView: View {
    let legend: Item
    
    var body: some View {
        Text("Legend: \(self.legend.displayName)")
    }
}

//struct LegendSoundsView_Previews: PreviewProvider {
//    static var previews: some View {
//        LegendSoundsView()
//    }
//}
