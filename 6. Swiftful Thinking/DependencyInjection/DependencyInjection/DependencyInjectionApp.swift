//
//  DependencyInjectionApp.swift
//  DependencyInjection
//
//  Created by Mihai Constantin on 20.05.2024.
//

import SwiftUI

@main
struct DependencyInjectionApp: App {
    
    static let networkManager = NetworkManager(urlString: "https://jsonplaceholder.typicode.com/posts")
    
    var body: some Scene {
        WindowGroup {
            PostsView(networkManager: DependencyInjectionApp.networkManager)
        }
    }
}
