//
//  LegendStore.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/22/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import Foundation
#if os(iOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

class LegendStore: ObservableObject {
    @Published var legends: [Legend] = []
    
    func load() {
        let asset = NSDataAsset(name: "legends", bundle: Bundle.main)
        let json = try? JSONSerialization.jsonObject(with: asset!.data, options: JSONSerialization.ReadingOptions.allowFragments)
        
        print("Unparsed legend data:", json!)
        
        if let legendsJson = json as? [[String: Any]] {
            for legendJson in legendsJson {
                let id = legendJson["id"] as! Int
                let name = legendJson["name"] as! String
                
                self.legends.append(Legend(id: id, name: name))
            }
        }
    }
}
