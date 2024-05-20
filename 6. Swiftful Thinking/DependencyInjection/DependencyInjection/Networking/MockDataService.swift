//
//  MockDataService.swift
//  DependencyInjection
//
//  Created by Mihai Constantin on 20.05.2024.
//

import Foundation
import SwiftUI

protocol DataServiceProtocol {
    func getPosts() async throws -> [PostModel]
}

class MockDataService: DataServiceProtocol {
    
    var posts: [PostModel]
    
    init(posts: [PostModel]?) {
        self.posts = posts ?? [
            PostModel(id: 1, userId: 1, title: "One", body: "one"),
            PostModel(id: 2, userId: 2, title: "Two", body: "two")
        ]
    }
    
    func getPosts() async throws -> [PostModel] {
        return posts
    }
}
