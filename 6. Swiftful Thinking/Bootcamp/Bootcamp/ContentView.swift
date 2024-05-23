//
//  ContentView.swift
//  Bootcamp
//
//  Created by Mihai Constantin on 22.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    static let networkManager = NetworkManager(urlString: "https://jsonplaceholder.typicode.com/posts")
    
    var body: some View {
//        PostsView(networkManager: ContentView.networkManager)
        
        UITestingView()
    }
}

#Preview {
    ContentView()
}
