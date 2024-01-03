//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Mihai Constantin on 27.12.2023.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                ScannerView(scannedCode: $viewModel.scannedCode,
                            alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                
                Label("Scanned Barcode:",systemImage: "barcode.viewfinder")
                    .font(.title2)
                    .padding()
                
                Text(viewModel.statusText)
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.statusTextColor)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
