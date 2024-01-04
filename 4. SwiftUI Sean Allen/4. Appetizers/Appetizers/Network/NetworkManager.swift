//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {
        
    }
    
    let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    // MARK: - GET Appetizers
    
    func getAppetizers(completed: @escaping (Result<AppetizerResponse, APError>) -> Void) {
        let urlString = baseURL + "appetizers"
        
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
            return nil
        }
    }
    
    // MARK: - GET image
    
    func getImage(with urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                completed(nil)
                return
            }
            
            if let safeData = data, let image = UIImage(data: safeData) {
                self.cache.setObject(image, forKey: cacheKey)
                completed(image)
            } else {
                completed(nil)
            }
        }
        task.resume()
    }
}