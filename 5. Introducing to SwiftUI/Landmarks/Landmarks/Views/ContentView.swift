//
//  ContentView.swift
//  Landmarks
//
//  Created by Mihai Constantin on 20.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
