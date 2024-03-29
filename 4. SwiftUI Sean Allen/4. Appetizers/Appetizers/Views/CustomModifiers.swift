//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Mihai Constantin on 11.01.2024.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.accentColor)
            .controlSize(.large)
    }
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}

struct AppetizerImageCellStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(width: 120, height: 90)
    }
}
