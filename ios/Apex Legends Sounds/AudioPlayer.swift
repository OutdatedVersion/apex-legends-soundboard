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

    func setPlayerOptions() {
        do {
            try AVAudioSession.sharedInstance().setCategory(
                // Audio is critical to this app so we should be
                // allowed to play when the device is silenced
                .playback,
                mode: AVAudioSession.Mode.default,
                // We play short lived audio clips so ducking other
                // audio on the device while they play seems ok.
                options: [.duckOthers]
            )
            
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
