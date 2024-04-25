//
//  PrimaryButtonStyle.swift
//  CustomFontDemo
//
//  Created by Mihai Constantin on 24.04.2024.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    @Environment(\.theme) private var theme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(Font.custom(Fonds.papyrus.rawValue, size: 20))
            .foregroundColor(self.theme.button.primary.color)
            .background {
                Capsule()
                    .stroke(self.theme.button.primary.color, lineWidth: 3)
            }
    }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: Self { .init() }
}
