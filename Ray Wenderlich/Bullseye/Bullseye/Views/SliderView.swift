//
//  SliderView.swift
//  Bullseye
//
//  Created by Mihai Constantin on 22.08.2022.
//

import SwiftUI

struct ContentSliderView: View {
    @State private var sliderValue: Double = 50.0
    
    var body: some View {
        SliderView(sliderValue: $sliderValue)
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.callout)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentSliderView()
    }
}
