//
//  WindowsTTS.swift
//  SpeechKit
//
//  Created by Joshua Wolfson on 12/4/2026.
//

#if canImport(WinSDK)

    import Foundation

    final class WindowsTTSEngine: _TTSEngine {
        /// https://learn.microsoft.com/en-us/uwp/api/windows.media.speechsynthesis.speechsynthesizer

        /// https://developer.apple.com/documentation/avfaudio/avspeechsynthesizer/isspeaking
        var isSpeaking: Bool {
            false
        }

        /// https://developer.apple.com/documentation/avfaudio/avspeechsynthesizer/ispaused
        var isPaused: Bool {
            false
        }

        /// https://learn.microsoft.com/en-us/uwp/api/windows.media.speechsynthesis.speechsynthesizer.synthesizetexttostreamasync
        /// https://learn.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.mediaelement.play
        func speak(_ utterance: TTSUtterance) {

        }

        /// https://learn.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.mediaelement.pause
        func continueSpeaking() {

        }

        /// https://learn.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.mediaelement.pause
        func pauseSpeaking() {

        }

        /// https://learn.microsoft.com/en-us/uwp/api/windows.media.speechsynthesis.speechsynthesizer.close
        /// https://learn.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.mediaelement.stop
        func stopSpeaking() {

        }
    }

#endif
