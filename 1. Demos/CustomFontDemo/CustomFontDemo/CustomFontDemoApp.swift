//
//  CustomFontDemoApp.swift
//  CustomFontDemo
//
//  Created by Mihai Constantin on 24.04.2024.
//

import SwiftUI

@main
struct CustomFontDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.sizeCategory, .accessibilityLarge)
                .environment(\.theme, .default)
        }
    }
}
