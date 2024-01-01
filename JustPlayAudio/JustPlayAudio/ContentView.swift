//
//  ContentView.swift
//  JustPlayAudio
//
//  Created by Stephen R Smith on 12/30/23.
//

import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer!

struct ContentView: View {
    var body: some View {
        Button("play Boing") {
            playSound()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

func playSound() {
    // Load a local sound file
    guard let soundFileURL = Bundle.main.url(
        forResource: "boing",
        withExtension: "mp3"
    ) else {
        return
    }
    
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundFileURL)
            guard let player = audioPlayer else { return }

            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
}
