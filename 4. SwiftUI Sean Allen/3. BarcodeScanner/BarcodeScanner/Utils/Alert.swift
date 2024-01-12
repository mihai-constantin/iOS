//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Mihai Constantin on 02.01.2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInputAlert = AlertItem(title: Text("Invalid Device Input"),
                                                   message: Text("Something is wrong with the camera. We are unable to capture the input."),
                                                   dismissButton: .default(Text("Ok")))
    
    static let invalidScanValueAlert = AlertItem(title: Text("Invalid Scan Value"),
                                                 message: Text("The value scanned is not valid. This app scans EAB-8 and EAN-13."),
                                                 dismissButton: .default(Text("Ok")))
}
