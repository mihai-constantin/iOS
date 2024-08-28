//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mihai Constantin on 28.08.2024.
//

import SwiftUI

enum Move {
    case rock
    case paper
    case scissors
    case undefined
}

struct ContentView: View {
    
    @State private var moves: [Move] = [
        .rock,
        .paper,
        .scissors
    ]
    
    @State private var currentAppMove = Move.rock
    @State private var currentPlayerMove = Move.undefined
    
    @State private var currentRound = 0
    @State private var playerScore = 0
    
    @State private var playerShouldWin = false
    @State private var shouldEndGame: Bool = false
    
    private var maxRounds = 10
    
    var body: some View {
        VStack {
            
            Text("Round: \(currentRound) / \(maxRounds)")
            
            Text("App's move: \(currentAppMove)")
                .padding()
            
            Text("Player should win: \(playerShouldWin)")
                .padding()
            
            Text("Player score: \(playerScore)")
                .padding()

            HStack {
                Button(action: {
                    currentPlayerMove = .rock
                    updateScore()
                    getNewRoundValues()
                }, label: {
                    Text("🪨")
                        .font(.title)
                    
                })
                
                Button(action: {
                    currentPlayerMove = .paper
                    updateScore()
                    getNewRoundValues()
                }, label: {
                    Text("📑")
                        .font(.title)
                })
                
                Button(action: {
                    currentPlayerMove = .scissors
                    updateScore()
                    getNewRoundValues()
                }, label: {
                    Text("✂️")
                        .font(.title)
                })
            }
        }
        .padding()
        .onAppear {
            getNewRoundValues()
        }
        .alert("Game Over", isPresented: $shouldEndGame) {
            Button("Reset Game") {
                resetGame()
            }
        }
    }
    
    func getNewRoundValues() {
        if currentRound == maxRounds {
            shouldEndGame = true
        } else {
            currentAppMove = moves.randomElement() ?? Move.rock
            playerShouldWin = Bool.random()
            currentRound += 1
        }
    }
    
    func updateScore() {
        var win = false
        if currentPlayerMove == .rock {
            if currentAppMove == .scissors {
                win = true
            }
        } else if currentPlayerMove == .paper {
            if currentAppMove == .rock {
                win = true
            }
        } else if currentPlayerMove == .scissors {
            if currentAppMove == .paper {
                win = true
            }
        }
        if (playerShouldWin && win) || (!playerShouldWin && !win) {
            playerScore += 1
        } else {
            playerScore -= 1
        }
    }
    
    func resetGame() {
        currentRound = 0
        playerScore = 0
        getNewRoundValues()
    }
}

#Preview {
    ContentView()
}
