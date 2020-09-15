//
//  AudioPlayerView.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/23/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import SwiftUI

struct PlayerView: UIViewRepresentable {
    let url: URL
    
  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
  }
    
  func makeUIView(context: Context) -> UIView {
    let audio = AudioPlayerView(frame: .zero)
    print("play \(self.url)")
    audio.play(url: self.url)
    
    return audio
  }
}

class AudioPlayerView: UIView {
    private let playerLayer = AVPlayerLayer()
    
    let player = AVPlayer()
    
    override init(frame: CGRect) {
    super.init(frame: frame)
    
//    let url = URL(string: "https://outdatedversion.com/apex-legends-soundboard/asset/0176ddacc1d826de0d5080e0be8e2422c58cbcf9")!
//
//    let player = AVPlayer(url: url)
//    player.replaceCurrentItem(with: AVPlayerItem(url: ))
    
    playerLayer.player = player
    layer.addSublayer(playerLayer)
  }
    
    func play(url: URL) {
        self.player.replaceCurrentItem(with: AVPlayerItem(url: url))
        self.player.play()
    }
    
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
  override func layoutSubviews() {
    super.layoutSubviews()
    playerLayer.frame = bounds
  }
}
