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
    
    // MARK: - Network Allerts
    
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
    
    // MARK: - Account Allerts
    
    static let invalidForm      = AlertItem(title: Text("Invalid Form"),
                                            message: Text("Please ensure all fields in the form have been filled out."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidEmail     = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please ensure your email is correct."),
                                            dismissButton: .default(Text("Ok")))
    
    
    // MARK: - User Profile
    static let userSaveSuccess  = AlertItem(title: Text("Profile saved."),
                                            message: Text("Profile successfully saved."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidUserData  = AlertItem(title: Text("Invalid User Data"),
                                            message: Text("There was an error saving or retriving your profile."),
                                            dismissButton: .default(Text("Ok")))
}
