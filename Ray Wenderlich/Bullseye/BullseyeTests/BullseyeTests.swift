//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Mihai Constantin on 11.08.2022.
//

import XCTest
@testable import Bullseye

final class BullseyeTests: XCTestCase {

    var game: Game!
    
    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() {
        let guess = game.target + 5
        let score = game.calculateScore(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.calculateScore(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
}
