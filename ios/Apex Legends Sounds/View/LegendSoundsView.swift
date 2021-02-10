//
//  LegendSoundsView.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/20/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import SwiftUI
import AVFoundation

struct TestThing: View {
    let legend: Legend
    
    var body: some View {
        List {
          ForEach(self.legend.taunts) { taunt in
            TauntDetailsView(taunt: taunt)
          }
        }
    }
}

struct LegendSoundsView: View {
    let legend: Legend
    
    var body: some View {
        List {
            CategoryRow<SoundListView>(
               categoryName: "Actions",
               items: [
                  CategorizedItem(
                     id: 1,
                     name: "Ping",
                     imageName: "smile",
                     linkView: {
                        SoundListView()
                     }
                  ),
                  CategorizedItem(
                     id: 2,
                     name: "Taunt",
                     imageName: "smile",
                     linkView: {
                        SoundListView()
                     }
                  ),
                  CategorizedItem(
                     id: 3,
                     name: "Revive",
                     imageName: "smile",
                     linkView: {
                        SoundListView()
                     }
                  ),
                  CategorizedItem(
                     id: 4,
                     name: "Revived",
                     imageName: "smile",
                     linkView: {
                        SoundListView()
                     }
                  )
               ]
           )
            
            .listRowInsets(EdgeInsets())
             
            CategoryRow<SoundListView>(
              categoryName: "Passive Broadcast",
              items: [
                 CategorizedItem(
                    id: 1,
                    name: "Kill Leader",
                    imageName: "smile",
                    linkView: {
                       SoundListView()
                    }
                 ),
                 CategorizedItem(
                    id: 2,
                    name: "Ring Closing",
                    imageName: "smile",
                    linkView: {
                       SoundListView()
                    }
                 )
              ]
           )
           
           .listRowInsets(EdgeInsets())
            
            CategoryRow<SoundListView>(
                categoryName: "Passive Inter-character Dialogue",
                items: [
                   CategorizedItem(
                      id: 1,
                      name: "Revenant",
                      imageName: "smile",
                      linkView: {
                         SoundListView()
                      }
                   ),
                   CategorizedItem(
                      id: 2,
                      name: "Lifeline",
                      imageName: "smile",
                      linkView: {
                         SoundListView()
                      }
                   )
                ]
            )
            
            .listRowInsets(EdgeInsets())
            
            CategoryRow<TestThing>(
                categoryName: "Testing",
                items: [
                   CategorizedItem(
                      id: 1,
                      name: "Show sound list",
                      imageName: "smile",
                      linkView: {
                        TestThing(legend:self.legend)
                      }
                   )
                ]
            )
        }
    }
}
