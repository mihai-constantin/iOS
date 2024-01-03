//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Mihai Constantin on 02.01.2024.
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
