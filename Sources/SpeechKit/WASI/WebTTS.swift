//
//  WebTTS.swift
//  SpeechKit
//
//  Created by Joshua Wolfson on 12/4/2026.
//

#if os(WASI)

    import Foundation
    import JavaScriptKit

    final class WebTTSEngine: _TTSEngine<WebUtterance> {
        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis
        private var speechSynthesis: JSObject {
            let window = JSObject.global
            return window.speechSynthesis.object!
        }

        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/speaking
        var isSpeaking: Bool {
            speechSynthesis.speaking.boolean!
        }

        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/paused
        var isPaused: Bool {
            speechSynthesis.paused.boolean!
        }

        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/speak
        func speak(_: TTSUtterance) {
            let utterance = JSObject().new(string)
            _ = speechSynthesis.speak!(utterance)
        }

        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/resume
        func continueSpeaking() {
            _ = speechSynthesis.resume!
        }

        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/pause
        func pauseSpeaking() {
            _ = speechSynthesis.pause!
        }

        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/cancel
        func stopSpeaking() {
            _ = speechSynthesis.cancel!
        }
    }

#endif
