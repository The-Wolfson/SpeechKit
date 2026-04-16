protocol _TTSEngine {
    var isSpeaking: Bool { get }
    var isPaused: Bool { get }

    func speak(_ utterance: TTSUtterance)
    func continueSpeaking()
    func pauseSpeaking()
    func stopSpeaking()
}

public final class TTSEngine: _TTSEngine {
    private let _engine: (any _TTSEngine)
    
    init() {
        #if canImport(AVFoundation)
            _engine = DarwinTTSEngine()
        #elseif os(Linux)
            _engine = LinuxTTSEngine()
        #elseif os(WASI)
            _engine = WebTTSEngine()
        #elseif os(Windows)
            _engine = WindowsTTSEngine()
        #elseif os(Android)
            _engine = AndroidTTSEngine()
        #else
            fatalError("TTSEngine: unsupported platform")
        #endif
    }

    var isSpeaking: Bool {
        _engine.isSpeaking
    }

    var isPaused: Bool {
        _engine.isPaused
    }

    func speak(_ utterance: TTSUtterance) {
        _engine.speak(utterance)
    }

    func continueSpeaking() {
        _engine.continueSpeaking()
    }

    func pauseSpeaking() {
        _engine.pauseSpeaking()
    }

    func stopSpeaking() {
        _engine.stopSpeaking()
    }
}
