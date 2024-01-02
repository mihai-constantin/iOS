//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Mihai Constantin on 27.12.2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInputAlert = AlertItem(title: "Invalid Device Input",
                                                   message: "Something is wrong with the camera. We are unable to capture the input.",
                                                   dismissButton: .default(Text("Ok")))
    
    static let invalidScanValueAlert = AlertItem(title: "Invalid Scan Value",
                                                 message: "The value scanned is not valid. This app scans EAB-8 and EAN-13.",
                                                 dismissButton: .default(Text("Ok")))
}

struct BarcodeScannerView: View {
    
    @State private var scannedCode: String = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
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
            .alert(item: $alertItem) { alertItem in
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
