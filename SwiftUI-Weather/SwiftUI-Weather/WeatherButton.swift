//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Mihai Constantin on 11.12.2023.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
    }
}
