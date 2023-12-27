//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Mihai Constantin on 27.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer()
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                
                Label("Scanned Barcode:",systemImage: "barcode.viewfinder")
                    .font(.title2)
                    .padding()
                
                Text("Not Yet Scanned")
                    .font(.largeTitle)
                    .foregroundStyle(.red)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    ContentView()
}
