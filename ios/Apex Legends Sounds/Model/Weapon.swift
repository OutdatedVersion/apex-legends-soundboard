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
    case throwable = "throwable"
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
        case .throwable:
            return "Throwable"
        case .unknown:
            return "💩"
        }
    }
    
    var order: Int {
        switch self {
        case .rifle:
            return 1
        case .smg:
            return 2
        case .lmg:
            return 3
        case .sniper:
            return 4
        case .shotgun:
            return 5
        case .pistol:
            return 6
        case .throwable:
            return 7
        case .unknown:
            return 8
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
