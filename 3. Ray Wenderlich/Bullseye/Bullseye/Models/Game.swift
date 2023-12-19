//
//  Game.swift
//  Bullseye
//
//  Created by Mihai Constantin on 11.08.2022.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func calculateScore(sliderValue: Int) -> Int {
        let score = 100 - abs(self.target - sliderValue)
        var bonus = 0
        if self.target == sliderValue {
            bonus = 100
        } else if abs(self.target - sliderValue) <= 2 {
            bonus = 50
        }
        return score + bonus
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
