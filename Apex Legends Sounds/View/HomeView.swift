//
//  HomeView.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/19/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import SwiftUI

enum HomeCategory: String {
    case legend = "Legend"
    case weapon = "Weapon"
    case system = "System"
}

struct Item : Identifiable {
    var id: Int
    var category: String
    var displayName: String
    
    var imageName: String {
        return "\(self.category.lowercased())_\(self.displayName.lowercased().replacingOccurrences(of: " ", with: "_"))"
    }
}

struct TempDetail: View {
    let item: Item
    
    var body: some View {
        Text("ID \(self.item.id)\n\(self.item.category): \(self.item.displayName)")
    }
}

struct HomeView: View {
    let items: [Item] = [
        Item(id: 12, category: "Legend", displayName: "Bangalore"),
        Item(id: 2, category: "Legend", displayName: "Bloodhound"),
        Item(id: 7, category: "Legend", displayName: "Caustic"),
        Item(id: 6, category: "Legend", displayName: "Crypto"),
        Item(id: 13, category: "Legend", displayName: "Gibraltar"),
        Item(id: 4, category: "Legend", displayName: "Lifeline"),
        Item(id: 8, category: "Legend", displayName: "Loba"),
        Item(id: 10, category: "Legend", displayName: "Mirage"),
        Item(id: 1, category: "Legend", displayName: "Octane"),
        Item(id: 9, category: "Legend", displayName: "Pathfinder"),
        Item(id: 5, category: "Legend", displayName: "Revenant"),
        Item(id: 3, category: "Legend", displayName: "Wattson"),
        Item(id: 11, category: "Legend", displayName: "Wraith"),
        Item(id: 20, category: "Weapon", displayName: "Rifle"),
        Item(id: 15, category: "Weapon", displayName: "SMG"),
        Item(id: 16, category: "Weapon", displayName: "LMG"),
        Item(id: 19, category: "Weapon", displayName: "Shotgun"),
        Item(id: 18, category: "Weapon", displayName: "Sniper"),
        Item(id: 22, category: "System", displayName: "Care Package"),
        Item(id: 14, category: "System", displayName: "Kill Leader"),
        Item(id: 21, category: "System", displayName: "Ring Closing"),
    ]

    var body: some View {
        CategorizedView(
            categoryOrder: [
                "Legend",
                "Weapon",
                "System"
            ],
            items: self.items
        )
    }
}
