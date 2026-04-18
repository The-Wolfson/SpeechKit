//
//  WebTTS.swift
//  SpeechKit
//
//  Created by Joshua Wolfson on 12/4/2026.
//

#if os(WASI)

    import Foundation
    import JavaScriptKit

    final class WebTTSEngine: _TTSEngine {
        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis
        private var synthesiser: JSObject {
            let window = JSObject.global
            return window.speechSynthesis.object!
        }

        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/speaking
        var isSpeaking: Bool {
            synthesiser.speaking.boolean!
        }

        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/paused
        var isPaused: Bool {
            synthesiser.paused.boolean!
        }

        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/speak
        func speak(_ utterance: TTSUtterance) {
            let utterance = JSObject().new(utterance.speechString)
            _ = synthesiser.speak!(utterance)
        }

        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/resume
        func continueSpeaking() {
            _ = synthesiser.resume!
        }

        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/pause
        func pauseSpeaking() {
            _ = synthesiser.pause!
        }

        /// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/cancel
        func stopSpeaking() {
            _ = synthesiser.cancel!
        }
    }

#endif
