//
//  TextDemo.swift
//  Bootcamp
//
//  Created by Mihai Constantin on 04.06.2024.
//

import SwiftUI

struct TextDemo: View {
    var body: some View {
        Text("Hello, World!")
//            .font(.body)
//            .fontWeight(.semibold)
//            .bold()
//            .underline()
            .underline(true, color: .red)
            .italic()
            .strikethrough(true, color: .green)
            .font(.system(size: 24, weight: .semibold, design: .serif))
//            .baselineOffset(-50.0)
//            .kerning(10)
            .multilineTextAlignment(.leading)
            .foregroundStyle(.red)
            .frame(width: 200, height: 200, alignment: .leading)
            .minimumScaleFactor(0.1)
    }
}

#Preview {
    TextDemo()
}
