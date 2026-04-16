//
//  File.swift
//  SpeechKit
//
//  Created by Joshua Wolfson on 12/4/2026.
//

#if canImport(AVFoundation)

    import Foundation
    import AVFoundation

   final class DarwinTTSEngine: _TTSEngine {
        ///https://developer.apple.com/documentation/avfaudio/avspeechsynthesizer
        private let synthesiser = AVSpeechSynthesizer()

        ///https://developer.apple.com/documentation/avfaudio/avspeechsynthesizer/isspeaking
        var isSpeaking: Bool {
            synthesiser.isSpeaking
        }

        ///https://developer.apple.com/documentation/avfaudio/avspeechsynthesizer/ispaused
        var isPaused: Bool {
            synthesiser.isPaused
        }

        ///https://developer.apple.com/documentation/avfaudio/avspeechsynthesizer/speak(_:)
        func speak(_ utterance: TTSUtterance) {
            let utterance = AVSpeechUtterance(string: utterance.speechString)
            synthesiser.speak(utterance)
        }

        ///https://developer.apple.com/documentation/avfaudio/avspeechsynthesizer/continuespeaking()
        func continueSpeaking() {
            synthesiser.continueSpeaking()
        }

        ///https://developer.apple.com/documentation/avfaudio/avspeechsynthesizer/pausespeaking(at:)
        func pauseSpeaking() {
            synthesiser.pauseSpeaking(at: .immediate)
        }

        ///https://developer.apple.com/documentation/avfaudio/avspeechsynthesizer/stopspeaking(at:)
        func stopSpeaking() {
            synthesiser.stopSpeaking(at: .immediate)
        }
    }

#endif
