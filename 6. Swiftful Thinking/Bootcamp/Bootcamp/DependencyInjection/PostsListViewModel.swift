//
//  PostsListViewModel.swift
//  DependencyInjection
//
//  Created by Mihai Constantin on 20.05.2024.
//

import Foundation
import SwiftUI

@MainActor final class PostsListViewModel: ObservableObject {
    
    var networkManager: DataServiceProtocol
    
    @Published var posts: [PostModel] = []
    
    init(networkManager: DataServiceProtocol) {
        self.networkManager = networkManager
    }
    
    func getPosts() {
        Task {
            do {
                self.posts = try await networkManager.getPosts()
            } catch {
                
            }
        }
    }
    
}
