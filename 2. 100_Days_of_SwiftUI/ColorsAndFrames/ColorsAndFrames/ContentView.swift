//
//  ContentView.swift
//  ColorsAndFrames
//
//  Created by Mihai Constantin on 29.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            
//            Rectangle()
//                .frame(width: 200, height: 200)
//                .background(.black)
//            
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.white)
            
            Text("Text")
                .frame(width: 100, height: 100)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
