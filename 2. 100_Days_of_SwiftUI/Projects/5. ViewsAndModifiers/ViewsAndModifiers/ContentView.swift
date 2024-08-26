//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Mihai Constantin on 05.08.2024.
//

import SwiftUI

struct GridStack<Content: View> : View {
    
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) {column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            GridStack(rows: 3, columns: 5) { row, col in
                Text("[\(row),\(col)]")
                    .titleStyle()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
