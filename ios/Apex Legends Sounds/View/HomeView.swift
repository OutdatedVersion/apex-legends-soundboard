//
//  HomeView.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/19/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import SwiftUI


struct HomeView: View {
    let legendStore = LegendStore()
    let weaponStore = WeaponStore()
    let broadcastStore = BroadcastStore()
    
    init() {
        self.legendStore.load()
        self.weaponStore.load()
        self.broadcastStore.load()
        
        AudioPlayer.instance.create()
        
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var legendsMappedToItem: [CategorizedItem<LegendSoundsView>] {
        return self.legendStore.legends.map { legend in
            CategorizedItem(
                id: legend.id,
                name: legend.name,
                imageName: legend.legendPreviewImageName,
                linkView: {
                   LegendSoundsView(legend: legend)
               }
            )
        }
    }
    
    
    var weaponsGroupedByCategory: [String: [Weapon]] {
        return Dictionary(grouping: self.weaponStore.weapons, by: { $0.category.rawValue })
    }
    
    var weaponsMappedToItem: [CategorizedItem<WeaponListView>] {
        return self.weaponsGroupedByCategory
            .enumerated().map { (index, entry) in
                return CategorizedItem(
                    id: index,
                    name: entry.value[0].category.displayName,
                    imageName: entry.value[0].category.weaponPreviewImageName,
                    linkView: {
                        WeaponListView(weapons: entry.value)
                   }
            )
        }
        .sorted {
            return $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending
        }
    }
    
     var broadcastsMappedToItem: [CategorizedItem<BroadcastDetailView>] {
           return self.broadcastStore.broadcasts.map { broadcast in
               CategorizedItem(
                   id: broadcast.id,
                   name: broadcast.name,
                   imageName: broadcast.broadcastPreviewImageName,
                   linkView: {
                      BroadcastDetailView(broadcast: broadcast)
                  }
               )
           }
       }

    var body: some View {
        NavigationView {
            List {
                CategoryRow<LegendSoundsView>(
                    categoryName: "Legends",
                    items: self.legendsMappedToItem
                )
                
                .padding(.top, 20)
                .listRowInsets(EdgeInsets())
                    
                CategoryRow<WeaponListView>(
                    categoryName: "Weapons",
                    items: self.weaponsMappedToItem
                )

                .padding(.top, 20)
                .listRowInsets(EdgeInsets())
                
                CategoryRow<BroadcastDetailView>(
                    categoryName: "Broadcasts",
                    items: self.broadcastsMappedToItem
                )

                .padding(.top, 20)
                .listRowInsets(EdgeInsets())
            }
            
            .listRowInsets(EdgeInsets())
            .navigationBarTitle("Sounds", displayMode: .large)
        }
    }
}
