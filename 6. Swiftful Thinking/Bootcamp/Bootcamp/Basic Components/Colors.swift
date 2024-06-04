//
//  Colors.swift
//  Bootcamp
//
//  Created by Mihai Constantin on 04.06.2024.
//

import SwiftUI

struct Colors: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
//                Color.primary
//                Color(#colorLiteral(red: 0, green: 0, blue: 1, alpha: 1))
//                Color(.secondarySystemBackground)
                Color("CustomColor")
            )
//            .shadow(radius: 10)
            .shadow(color: Color("CustomColor").opacity(0.5),
                    radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .frame(width: 200, height: 50)
    }
}

#Preview {
    Colors()
}
