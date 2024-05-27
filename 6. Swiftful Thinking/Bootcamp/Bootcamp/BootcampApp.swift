//
//  BootcampApp.swift
//  Bootcamp
//
//  Created by Mihai Constantin on 22.05.2024.
//

import SwiftUI

@main
struct BootcampApp: App {
    
    static let networkManager = NetworkManager(urlString: "https://jsonplaceholder.typicode.com/posts")
    
    let currentUserIsSignedIn: Bool
    
    init() {
//        let userIsSignedIn: Bool = CommandLine.arguments.contains("-UITest_startSignedIn") ? true : false
        let userIsSignedIn: Bool = ProcessInfo.processInfo.arguments.contains("-UITest_startSignedIn") ? true : false
//        print("userIsSignedIn: \(userIsSignedIn)")
        self.currentUserIsSignedIn = userIsSignedIn
        
    }
    
    var body: some Scene {
        WindowGroup {
//            PostsView(networkManager: BootcampApp.networkManager)
            UITestingView(currentUserIsSignedIn: currentUserIsSignedIn)
            
        }
    }
}
