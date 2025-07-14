//
//  ContentView.swift
//  DeepLinksDemo
//
//  Created by Mihai Constantin on 14.07.2025.
//

// https://www.avanderlee.com/swiftui/deeplink-url-handling/

import SwiftUI

struct ContentView: View {
    
    @State private var recipeName: String?
    
    var body: some View {
        VStack {
            Text("Hello, there")
            if let recipeName = recipeName {
                Text("Recipe Name: \(recipeName)")
            }
        }
        .padding()
        .onOpenURL { url in
            print("Received URL: \(url)")
            handleIncomingURL(url)
        }
    }
    
    // Handles the incoming URL and performs validations before acknowledging.
    private func handleIncomingURL(_ url: URL) {
        guard url.scheme == "recipeapp" else {
            return
        }
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            print("Invalid URL")
            return
        }
        
        guard let action = components.host, action == "open-recipe" else {
            print("Unknown URL, we can't handle this one!")
            return
        }
        
        guard let recipeName = components.queryItems?.first(where: { $0.name == "name" })?.value else {
            print("Recipe name not found")
            return
        }
        
        self.recipeName = recipeName
    }
}

#Preview {
    ContentView()
}
