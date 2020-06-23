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
  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
  }
  func makeUIView(context: Context) -> UIView {
    return AudioPlayerView(frame: .zero)
  }
}

class AudioPlayerView: UIView {
  private let playerLayer = AVPlayerLayer()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let url = URL(string: "https://cfr.media/apexAudio/Loba/15199%20-%20diag_mp_loba_glad_taunt_06_1p.mp3")!
    let player = AVPlayer(url: url)
    
    player.play()
    
    playerLayer.player = player
    layer.addSublayer(playerLayer)
  }
    
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
  override func layoutSubviews() {
    super.layoutSubviews()
    playerLayer.frame = bounds
  }
}
