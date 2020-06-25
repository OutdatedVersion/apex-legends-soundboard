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
                let taunts = parseTaunts(tauntsJson: legendJson["taunts"] as! [[String: Any]])
                
                self.legends.append(
                    Legend(
                        id: id,
                        name: name,
                        taunts: taunts
                    )
                )
            }
        }
    }
    
    func parseTaunts(tauntsJson: [[String: Any]]) -> [Taunt] {
        var parsed: [Taunt] = []
        
        for tauntJson in tauntsJson {
            let id = tauntJson["id"] as! Int
            let title = tauntJson["title"] as! String
            let group = tauntJson["group"] as! String
            let transcriptionJson = tauntJson["transcription"] as! [String: Any]
            let filesJson = tauntJson["files"] as! [[String: Any]]
            
            let transcription = Taunt.Transcription(
                confidence: transcriptionJson["confidence"] as! Double,
                text: transcriptionJson["text"] as! String
            )
            
            parsed.append(
                Taunt(
                    id: id,
                    title: title,
                    group: group,
                    transcription: transcription,
                    files: parseFiles(filesJson: filesJson)
                )
            )
        }
        
        return parsed
    }
    
    func parseFiles(filesJson: [[String: Any]]) -> [AudioFile] {
        var parsed: [AudioFile] = []
        
        for fileJson in filesJson {
            let name = fileJson["name"] as! String
            let digest = fileJson["digest"] as! String
            
            parsed.append(
                AudioFile(
                    name: name,
                    digest: digest
                )
            )
        }
        
        return parsed
    }
}
