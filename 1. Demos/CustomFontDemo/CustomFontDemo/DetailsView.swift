//
//  DetailsView.swift
//  CustomFontDemo
//
//  Created by Mihai Constantin on 24.04.2024.
//

import SwiftUI

struct DetailsView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        
        CustomText(text: "This is a Text!")
            .background(.red)
            
        Button("This is a Button") { }
            .buttonStyle(.primary)
        
        TextField("This is a TextField", text: $text)
            .textFieldStyle(.primary)
    }
}

#Preview {
    DetailsView()
}
