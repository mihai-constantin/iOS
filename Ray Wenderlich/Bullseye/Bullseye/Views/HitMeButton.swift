//
//  HitMeButton.swift
//  Bullseye
//
//  Created by Mihai Constantin on 22.08.2022.
//

import SwiftUI

struct ContentHitMeButton: View {
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        HitMeButton(alertIsVisible: $alertIsVisible,
                    sliderValue: $sliderValue,
                    game: $game)
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            self.alertIsVisible = true
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(.white, lineWidth: 2.0)
        )
        .alert("Hello there", isPresented: $alertIsVisible) {
            Button("Awesome!") {
                game.startNewRound(points: game.calculateScore(sliderValue: Int(self.sliderValue.rounded())))
            }
        } message: {
            let roundedScore = Int(self.sliderValue.rounded())
            Text("The slider's value is \(roundedScore).\n" + "You score \(game.calculateScore(sliderValue: roundedScore))")
        }
    }
}

struct HitMeButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentHitMeButton()
    }
}
