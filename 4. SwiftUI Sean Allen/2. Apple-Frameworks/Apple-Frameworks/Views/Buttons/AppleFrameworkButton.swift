//
//  AppleFrameworkButton.swift
//  Apple-Frameworks
//
//  Created by Mihai Constantin on 19.12.2023.
//

import SwiftUI

struct AppleFrameworkButton: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .frame(width: 300, height: 50)
            .foregroundStyle(.white)
            .background(.red)
            .font(.title2)
            .fontWeight(.semibold)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
    }
}

#Preview {
    AppleFrameworkButton(title: "Learn More")
}
