//
//  ViewController.swift
//  Xylophone
//
//  Created by Алексей Гуляев on 05.07.2022.
//
// Позднее доделать это приложение так что бы после нажатия у меня
// в командной строке печаталось слово старт, проигрывался звук и спустя
// 2 секунды печаталось Конец. При этом кнопка при нажатии меняла прозначность
// на половину и при отпускании кнопки прозрачность возращалась в исходное
// значение

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    @IBAction func keyPressed(_ sender: UIButton) {
//        sender.alpha = 0.5
//        print("Start")
        guard let text = sender.titleLabel?.text else { return }
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
//            print("End")
//        })
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

