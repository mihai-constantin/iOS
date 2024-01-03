//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

struct AppetizerListView: View {
    
    @State var appetizers: [Appetizer] = []
    
    var body: some View {
        NavigationStack {
            List(appetizers, rowContent: { appetizer in
                AppetizerListCell(appetizer: appetizer)
            })
            .navigationTitle("🍟 Appetizers")
            .onAppear() {
                getAppetizers()
            }
        }
    }
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            switch result {
            case .success(let response):
                self.appetizers = response.request
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    AppetizerListView()
}
