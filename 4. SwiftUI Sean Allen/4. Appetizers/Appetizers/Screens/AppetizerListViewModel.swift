//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.appetizers = response.request
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
