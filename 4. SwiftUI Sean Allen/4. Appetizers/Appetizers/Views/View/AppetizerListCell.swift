//
//  AppetizerView.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
//            Spacer()

            Image("chicken-avocado-spring-roll")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 120, height: 90)

//            Spacer()

            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$ \(appetizer.price, specifier: "%.2f")")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    
            }
            .padding(.leading)
            
//            Spacer()
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
