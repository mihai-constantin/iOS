//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    @Published var selectedAppetizer: Appetizer?
    @Published var isShowingDetailView: Bool = false
    
    // MARK: - OLD APPROACH
    func oldGetAppetizers() {
        isLoading = true
        NetworkManager.shared.oldGetAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let response):
                    self.appetizers = response.request
                
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
    // MARK: - Async/Await
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                if let data = try await NetworkManager.shared.getAppetizers() {
                    self.appetizers = data.request
                }
                isLoading = false
            } catch {
                self.alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
        
    }
}
