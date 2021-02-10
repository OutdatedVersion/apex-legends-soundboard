//
//  WeaponStore.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/22/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import Foundation
#if os(iOS)
    import UIKit
#elseif os(macOS)
    import AppKit
#endif

class WeaponStore: ObservableObject {
    @Published var weapons: [Weapon] = []
    
    func load() {
        let asset = NSDataAsset(name: "weapons", bundle: Bundle.main)
        let json = try? JSONSerialization.jsonObject(with: asset!.data, options: JSONSerialization.ReadingOptions.allowFragments)
        
        print("Unparsed weapon data:", json!)
        
        if let weaponsJson = json as? [[String: Any]] {
            for weaponJson in weaponsJson {
                let id = weaponJson["id"] as! Int
                let name = weaponJson["name"] as! String
                let category = WeaponCategory(rawValue: weaponJson["category"] as! String) ?? .unknown
                
                let ammo = weaponJson["ammo"] as! [String: Any]
                let ammoType = WeaponAmmoType(rawValue: ammo["type"] as! String) ?? .unknown
                
                self.weapons.append(
                    Weapon(
                        id: id,
                        name: name,
                        category: category,
                        ammo: WeaponAmmoInfo(
                            type: ammoType
                        )
                    )
                )
            }
        }
    }
}
