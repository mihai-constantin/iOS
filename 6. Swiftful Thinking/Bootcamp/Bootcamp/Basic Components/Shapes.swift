//
//  Shapes.swift
//  Bootcamp
//
//  Created by Mihai Constantin on 04.06.2024.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
//        Circle()
//        Ellipse()
//        Capsule(style: .circular)
//        Rectangle()
        RoundedRectangle(cornerRadius: 25.0)
//            .fill(.green)
//            .foregroundStyle(.green)
//            .stroke()
//            .stroke(.red)
//            .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, dash: [100]))
//            .trim(from: 0.4, to: 1.0)
            .frame(width: 300, height: 100)
    }
}

#Preview {
    Shapes()
}
