//
//  NetworkManager.swift
//  DependencyInjection
//
//  Created by Mihai Constantin on 20.05.2024.
//

import Foundation
import SwiftUI

class NetworkManager: DataServiceProtocol {
    
    let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    // async/await approach
    func getPosts() async throws -> [PostModel] {
        guard let url = URL(string: urlString) else {
            throw PostError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            return try JSONDecoder().decode([PostModel].self, from: data)
        } catch {
            throw PostError.invalidData
        }
    }
}
