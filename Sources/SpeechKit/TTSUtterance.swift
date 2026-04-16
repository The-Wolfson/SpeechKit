protocol _TTSUtterance {
    var speechString: String { get }

    init(string: String)
}

public final class TTSUtterance: _TTSUtterance, Sendable {
    let speechString: String
    
    init(string: String) {
        self.speechString = string
    }
}
