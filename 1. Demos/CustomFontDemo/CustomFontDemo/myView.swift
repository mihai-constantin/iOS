//
//  myView.swift
//  CustomFontDemo
//
//  Created by Mihai Constantin on 25.04.2024.
//

import SwiftUI

struct myView: View {

    @State private var value1: String = "TextField with .automatic style"
    @State private var value2: String = "TextField with .plain style"
    @State private var value3: String = "TextField with .roundedBorder style"
    @State private var value4: String = "TextField with custom style"

    var body: some View {

        VStack() {

            TextField("Automatic Style", text: $value1)
                .textFieldStyle(.automatic)

            TextField("Plain Style", text: $value2)
                .textFieldStyle(.plain)

            TextField("Rounded Border Style", text: $value3)
                .textFieldStyle(.roundedBorder)

            TextField("Custom Style", text: $value4)
        }
        .padding()
        .background(.purple)
        // ↓ Custom textFieldStyle applied to the VStack view
        .textFieldStyle(WhiteBorder())
    }
}

// Structure creating a custom textFieldStyle
struct WhiteBorder: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white, lineWidth:2)
            )
    }
}


#Preview {
    myView()
}
