//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Mihai Constantin on 02.01.2024.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    
    @Published var scannedCode: String = ""
    @Published var alertItem: AlertItem?
 
    var statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
    
}
