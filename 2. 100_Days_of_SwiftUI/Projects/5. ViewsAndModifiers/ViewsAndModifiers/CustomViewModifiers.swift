//
//  CustomViewModifiers.swift
//  ViewsAndModifiers
//
//  Created by Mihai Constantin on 26.08.2024.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.title)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(TitleStyle())
    }
}
