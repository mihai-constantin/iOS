//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

struct AppetizerListView: View {
    
    var body: some View {
        NavigationStack {
            List(MockData.appetizers, rowContent: { appetizer in
                AppetizerListCell(appetizer: appetizer)
            })
            .navigationTitle("🍟 Appetizers")
        }
    }
}

#Preview {
    AppetizerListView()
}
