//
//  TextFieldStyle.swift
//  CustomFontDemo
//
//  Created by Mihai Constantin on 25.04.2024.
//

import SwiftUI

struct PrimaryTextFieldStyle: TextFieldStyle {
    
    @Environment(\.theme) private var theme
    
    @ScaledMetric(relativeTo: .body) var scaledPadding: CGFloat = 10
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(scaledPadding)
            .foregroundStyle(self.theme.textField.primary.textColor)
            .background(self.theme.textField.primary.backgroundColor)
            .cornerRadius(20)
    }
}

extension TextFieldStyle where Self == PrimaryTextFieldStyle {
    static var primary: Self { .init() }
}
