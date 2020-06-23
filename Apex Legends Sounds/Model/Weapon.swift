//
//  Weapon.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/22/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import Foundation

enum WeaponCategory: String {
    case rifle = "rifle"
    case lmg = "lmg"
    case smg = "smg"
    case sniper = "sniper"
    case shotgun = "shotgun"
    case pistol = "pistol"
    case unknown = "💩"
    
    var weaponPreviewImageName: String {
        return "weapon_category_\(self.rawValue.lowercased())"
    }
    
    var displayName: String {
        switch self {
        case .rifle:
            return "Rifle"
        case .lmg:
            return"LMG"
        case .smg:
            return "SMG"
        case .sniper:
            return "Sniper"
        case .shotgun:
            return "Shotgun"
        case .pistol:
            return "Pistol"
        case .unknown:
            return "💩"
        }
    }
}

enum WeaponAmmoType: String {
    case light = "light"
    case heavy = "heavy"
    case energy = "energy"
    case sniper = "sniper"
    case shotgun = "shotgun"
    case special = "special"
    case unknown = "💩"
}


struct Weapon: Identifiable {
    let id: Int
    let name: String
    let category: WeaponCategory
    let ammo: WeaponAmmoInfo
}

struct WeaponAmmoInfo {
    let type: WeaponAmmoType
}
