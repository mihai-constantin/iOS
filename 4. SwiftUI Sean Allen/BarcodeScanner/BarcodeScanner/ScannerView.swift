//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Mihai Constantin on 28.12.2023.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(delegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        func didFind(barcode: String) {
            print(barcode)
        }
        
        func didFail(with error: CameraError) {
            print(error.rawValue)
        }
    }
}

#Preview {
    ScannerView()
}
