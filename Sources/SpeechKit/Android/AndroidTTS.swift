//
//  AndroidTTS.swift
//  SpeechKit
//
//  Created by Joshua Wolfson on 12/4/2026.
//

#if os(Android)
    import Foundation

    final class AndroidTTS: _TTSEngine {
        func speak(_: String) {}

        func stop() {}
    }

#endif
