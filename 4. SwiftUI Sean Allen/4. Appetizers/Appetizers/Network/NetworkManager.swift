//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {
        
    }
    
    let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    func getAppetizers(completed: @escaping (Result<AppetizerResponse, APError>) -> Void) {
        let urlString = baseURL + "appetizers"
        performRequest(with: urlString, completed: completed)
    }
    
    func performRequest(with urlString: String, completed: @escaping (Result<AppetizerResponse, APError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                completed(.failure(.unableToComplete))
                return
            }
            
            if let safeData = data {
                if let appetizerData = self.parseJSON(safeData) {
                    completed(.success(appetizerData))
                } else {
                    completed(.failure(.invalidData))
                }
            } else {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data) -> AppetizerResponse? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
