//
//  LinuxTTS.swift
//  SpeechKit
//
//  Created by Joshua Wolfson on 12/4/2026.
//

#if os(Linux)

    import Foundation
    import libespeak_ng

    final class LinuxTTSEngine: _TTSEngine {
        var isSpeaking: Bool {
            true
        }

        var isPaused: Bool {
            true
        }

        func speak(_: TTSUtterance) {}

        func continueSpeaking() {}

        func pauseSpeaking() {}

        func stopSpeaking() {}
    }

#endif
