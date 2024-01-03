//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Mihai Constantin on 28.12.2023.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(delegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private var scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didFail(with error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInputAlert
            case .invalidScanValue:
                scannerView.alertItem = AlertContext.invalidScanValueAlert
            }
        }
    }
}

