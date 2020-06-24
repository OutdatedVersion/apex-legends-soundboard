//
//  BroadcastStore.swift
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

class BroadcastStore: ObservableObject {
    @Published var broadcasts: [Broadcast] = []
    
    func load() {
        let asset = NSDataAsset(name: "broadcasts", bundle: Bundle.main)
        let json = try? JSONSerialization.jsonObject(with: asset!.data, options: JSONSerialization.ReadingOptions.allowFragments)
        
        print("Unparsed broadcast data:", json!)
        
        if let legendsJson = json as? [[String: Any]] {
            for legendJson in legendsJson {
                let id = legendJson["id"] as! Int
                let name = legendJson["name"] as! String
                
                self.broadcasts.append(Broadcast(id: id, name: name))
            }
        }
    }
}
