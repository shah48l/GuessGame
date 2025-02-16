import XCTest
@testable import GuessGame

final class GuessGameTests: XCTestCase {
    
    var contentView: ContentView!
    
    override func setUp() {
        super.setUp()
        contentView = ContentView()
    }
    
    override func tearDown() {
        contentView = nil
        super.tearDown()
    }
    
    func testInitialState() {
        XCTAssertEqual(contentView.score, 0, "Initial score should be 0")
        XCTAssertEqual(contentView.gameTitle, "?", "Initial game title should be '?'")
    }
    
    func testCorrectAnswerIncreasesScore() {
        contentView.correctAnswer = 1
        contentView.check(answer: 1)
        
        XCTAssertEqual(contentView.score, 1, "Score should increase when the correct answer is chosen")
        XCTAssertEqual(contentView.gameTitle, "Success", "Game title should change to 'Success' on correct answer")
    }
    
    func testIncorrectAnswerDecreasesScore() {
        contentView.correctAnswer = 2
        contentView.score = 3  // Set an initial score
        contentView.check(answer: 1)
        
        XCTAssertEqual(contentView.score, 2, "Score should decrease when the wrong answer is chosen")
        XCTAssertEqual(contentView.gameTitle, "Failed!", "Game title should change to 'Failed!' on wrong answer")
    }
    
    func testScoreDoesNotGoBelowZero() {
        contentView.correctAnswer = 0
        contentView.score = 0
        contentView.check(answer: 1)
        
        XCTAssertEqual(contentView.score, 0, "Score should not go below zero")
    }
    
    func testRandomizeCorrectAnswer() {
        contentView.randomizeCorrectAnswer()
        XCTAssertTrue((0...2).contains(contentView.correctAnswer), "Correct answer should be between 0 and 2")
    }
}
