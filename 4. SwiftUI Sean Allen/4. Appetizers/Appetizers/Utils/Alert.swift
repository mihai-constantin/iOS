//
//  Alert.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from server."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid URL."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid data."),
                                            dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete the request."),
                                            dismissButton: .default(Text("Ok")))
}

