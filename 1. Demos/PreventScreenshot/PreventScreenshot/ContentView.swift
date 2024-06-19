//
//  ContentView.swift
//  PreventScreenshot
//
//  Created by Mihai Constantin on 18.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .preventScreenshot()
//        .screenshotProtected(isProtected: true)
    }
}

#Preview {
    ContentView()
}
