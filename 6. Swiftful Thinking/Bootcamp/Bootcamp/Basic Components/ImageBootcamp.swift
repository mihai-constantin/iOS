//
//  ImageBootcamp.swift
//  Bootcamp
//
//  Created by Mihai Constantin on 10.06.2024.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        Image("google")
//            .renderingMode(.template)
            .resizable()
            .scaledToFit()
//            .scaledToFill()
            .frame(width: 300, height: 200)
            .foregroundStyle(.green)
            .clipped()
//            .clipShape(Circle())
    }
}

#Preview {
    ImageBootcamp()
}
