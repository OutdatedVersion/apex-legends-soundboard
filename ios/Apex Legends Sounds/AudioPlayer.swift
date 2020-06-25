//
//  AudioPlayer.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/25/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayer {
    public static var instance = AudioPlayer()
    var player = AVPlayer()

    func create() {
        player = AVPlayer()
        
        self.setPlayerOptions()
    }

    func setPlayerOptions() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: AVAudioSession.Mode.default, options: [.allowBluetooth])
            print("Set audio playback settings")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Set active audio session")
        } catch {
            print(error)
        }
    }

    func pause() {
        player.pause()
    }

    func play() {
        player.play()
    }
    
    func setAndPlay(url: URL) {
        self.player.replaceCurrentItem(with: AVPlayerItem(url: url))
        self.play()
    }
}
