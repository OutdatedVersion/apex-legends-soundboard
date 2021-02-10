//
//  TauntDetailsView.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/25/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import SwiftUI

struct TauntDetailsView: View {
    let taunt: Taunt
    @State private var tauntText: String
    
    init(taunt: Taunt) {
        self.taunt = taunt
        _tauntText = State(initialValue: self.taunt.transcription.text)
    }
    
    var body: some View {
        VStack {
            Text(self.taunt.group)
            TextField("Text", text: $tauntText).textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.top, 20)
            Text("Confidence: \(self.taunt.transcription.confidence)")
            
           Button(
             action: {
               AudioPlayer.instance.setAndPlay(url: self.taunt.files[0].url)
             },
             label: {
               Image(systemName: "play.circle.fill")
                 .resizable()
                 .frame(width: 35, height: 35)
             }
           )
            
           .padding(.top, 20)
        }
    }
}
