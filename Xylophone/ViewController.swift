//
//  ViewController.swift
//  Xylophone
//
//  Created by Алексей Гуляев on 05.07.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    @IBAction func keyPressed(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        print(text)
        playSound(forResource: text)
    }
    
// Method wich do play wav source
    func playSound(forResource: String) -> Void {
        guard let url = Bundle.main.url(
            forResource: forResource,
            withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(
                .playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(
                contentsOf: url,
                fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            player.play()
            
            } catch let error { print(error.localizedDescription) }
    }
}

