//
//  ContentView.swift
//  Bullseye
//
//  Created by Mihai Constantin on 08.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                    .padding()
                    .font(.callout)
                Slider(value: self.$sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
                    .padding()
                    .font(.callout)
            }
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text("HIT ME")
            }
            .alert("Hello there", isPresented: $alertIsVisible) {
                Button("Awesome!") { }
            } message: {
                let roundedScore = Int(self.sliderValue.rounded())
                Text("The slider's value is \(roundedScore).\n" + "You score \(game.calculateScore(sliderValue: roundedScore))")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
