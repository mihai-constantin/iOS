//
//  ContentView.swift
//  DependencyInjection
//
//  Created by Mihai Constantin on 20.05.2024.
//

import SwiftUI

struct PostsView: View {
    
    var networkManager: DataServiceProtocol
    
    @StateObject var vm: PostsListViewModel
    
    init(networkManager: DataServiceProtocol) {
        self.networkManager = networkManager
        _vm = StateObject(wrappedValue: PostsListViewModel(networkManager: networkManager))
    }
    
    var body: some View {
        NavigationStack {
            List(vm.posts) { post in
                Text(post.body)
            }
            .task {
                vm.getPosts()
            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    
    static let networkManager = NetworkManager(urlString: "https://jsonplaceholder.typicode.com/posts")
    
//    static let networkManager = MockDataService(posts: [
//        PostModel(id: 3, userId: 3, title: "Three", body: "three")
//    
//    ])
    
    static var previews: some View {
        PostsView(networkManager: networkManager)
    }
    
    
}
