//
//  APButton.swift
//  Appetizers
//
//  Created by Mihai Constantin on 04.01.2024.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .background(Color.accentColor)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
    }
}

#Preview {
    APButton(title: "Title")
}
