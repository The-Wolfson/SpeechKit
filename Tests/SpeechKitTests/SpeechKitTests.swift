import Testing
@testable import SpeechKit
import Foundation

@MainActor @Test func testEngineMethods() async throws {
    let speech = "But soft! What light through yonder window breaks?"
    let utterance = TTSUtterance(string: speech)
    #expect(utterance.speechString == speech)
    
    let engine = TTSEngine()
            
    #expect(engine.isPaused == false)
    #expect(engine.isSpeaking == false)
    
    engine.speak(utterance)
    
    try await Task.sleep(for: .seconds(1))
    
    #expect(engine.isPaused == false)
    #expect(engine.isSpeaking == true)
    
    engine.pauseSpeaking()
    
    try await Task.sleep(for: .seconds(1))
    
    #expect(engine.isPaused == true)
    #expect(engine.isSpeaking == true)
    
    engine.continueSpeaking()
    
    try await Task.sleep(for: .seconds(1))
    
    #expect(engine.isPaused == false)
    #expect(engine.isSpeaking == true)
    
    engine.stopSpeaking()
    
    try await Task.sleep(for: .seconds(1))
    
    #expect(engine.isPaused == false)
    #expect(engine.isSpeaking == false)
}
