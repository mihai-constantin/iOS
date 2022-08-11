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
        return 100 - abs(self.target - sliderValue)
    }
}
