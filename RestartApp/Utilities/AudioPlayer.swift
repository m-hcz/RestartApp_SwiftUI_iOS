//
//  AudioPlayer.swift
//  RestartApp
//
//  Created by M H on 04/12/2021.
//

import Foundation
import AVFoundation
import SwiftUI

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
	if let path = Bundle.main.path(forResource: sound, ofType: type) {
		do{
			audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
			audioPlayer?.play()
		}
		catch {
			print("Could not play the sound file.")
		}
	}
}

func getColorScheme() -> ColorScheme{
	@Environment(\.colorScheme) var colorScheme: ColorScheme
	return colorScheme
}


