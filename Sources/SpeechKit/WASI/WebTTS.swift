//
//  File.swift
//  SpeechKit
//
//  Created by Joshua Wolfson on 12/4/2026.
//

#if os(WASI)

    import Foundation
    import JavaScriptKit

    final class WebTTSEngine: _TTSEngine<WebUtterance> {
        ///https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis
        private var speechSynthesis: JSObject {
            let window: JSObject = JSObject.global
            return window.speechSynthesis.object!
        }

        ///https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/speaking
        var isSpeaking: Bool {
            speechSynthesis.speaking.boolean!
        }

        ///https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/paused
        var isPaused: Bool {
            speechSynthesis.paused.boolean!
        }

        ///https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/speak
        func speak(_ utterance: TTSUtterance) {
            let utterance: JSObject = JSObject().new(string)
            let _ = speechSynthesis.speak!(utterance)
        }

        ///https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/resume
        func continueSpeaking() {
            let _ = speechSynthesis.resume!
        }

        ///https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/pause
        func pauseSpeaking() {
            let _ = speechSynthesis.pause!
        }

        ///https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/cancel
        func stopSpeaking() {
            let _ = speechSynthesis.cancel!
        }
    }

#endif
