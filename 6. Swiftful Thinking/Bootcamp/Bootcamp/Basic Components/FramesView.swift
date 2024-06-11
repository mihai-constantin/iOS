//
//  FramesView.swift
//  Bootcamp
//
//  Created by Mihai Constantin on 11.06.2024.
//

import SwiftUI

struct FramesView: View {
    var body: some View {
        Text("Hello, World!")
            .background(.red)
            .frame(height: 100, alignment: .top)
            .background(.gray)
            .frame(width: 150)
            .background(.blue)
            .frame(maxWidth: .infinity)
            .background(.green)
            .frame(height: 400)
            .background(.orange)
            .frame(maxHeight: .infinity)
            .background(.purple)
    }
}

#Preview {
    FramesView()
}
