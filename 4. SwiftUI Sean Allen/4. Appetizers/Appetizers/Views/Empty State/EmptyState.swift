//
//  EmptyState.swift
//  Appetizers
//
//  Created by Mihai Constantin on 11.01.2024.
//

import SwiftUI

struct EmptyState: View {
    
    var imageName: String
    var message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
        }
        
    }
}

#Preview {
    EmptyState(imageName: "empty-order", 
               message: "No Orders Yet")
}
