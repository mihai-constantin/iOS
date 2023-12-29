//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Mihai Constantin on 27.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scannedCode: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                ScannerView(scannedCode: $scannedCode)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                
                Label("Scanned Barcode:",systemImage: "barcode.viewfinder")
                    .font(.title2)
                    .padding()
                
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .font(.largeTitle)
                    .foregroundStyle(scannedCode.isEmpty ? .red : .green)
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
