//
//  WindowsTTS.swift
//  SpeechKit
//
//  Created by Joshua Wolfson on 12/4/2026.
//

#if canImport(WinSDK)

    import Foundation

    final class WindowsTTSEngine: _TTSEngine {
        func speak(_: String) {}

        func stop() {}
    }

#endif
