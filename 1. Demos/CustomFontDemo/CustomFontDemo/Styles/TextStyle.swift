//
//  CustomTextStyle.swift
//  CustomFontDemo
//
//  Created by Mihai Constantin on 24.04.2024.
//

import SwiftUI

struct TextStyle: ViewModifier {
    
    @Environment(\.theme) private var theme
    
    @ScaledMetric(relativeTo: .body) var scaledPadding: CGFloat = 10
    
    func body(content: Content) -> some View {
        content
            .padding(scaledPadding)
            .font(Font.custom(Fonds.papyrus.rawValue, size: 20))
            .foregroundStyle(self.theme.text.primary.color)
            .border(self.theme.text.primary.borderColor)
    }
}

extension View {
    func customTextStyle() -> some View {
        self.modifier(TextStyle())
    }
}

struct CustomText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .customTextStyle()
    }
}
