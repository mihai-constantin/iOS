//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.appetizers, rowContent: { appetizer in
                AppetizerListCell(appetizer: appetizer)
            })
            .navigationTitle("🍟 Appetizers")
            .onAppear() {
                viewModel.getAppetizers()
            }
        }
    }
}

#Preview {
    AppetizerListView()
}
