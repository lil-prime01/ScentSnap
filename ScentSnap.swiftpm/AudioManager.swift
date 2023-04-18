//
//  AudioManager.swift
//  ScentSnap
//
//  Created by 박리라 on 2023/04/19.
//

import Foundation
import AVFoundation

class AudioManager {
    static let shared = AudioManager()
    
    private var player: AVPlayer?
    
    private init() {}
    
    func playBackgroundMusic(filename: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: fileExtension) else { return }
        let item = AVPlayerItem(url: url)
        
        player = AVPlayer(playerItem: item)
        player?.play()
    }
}
