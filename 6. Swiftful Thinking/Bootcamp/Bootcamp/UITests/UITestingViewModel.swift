//
//  UITestingViewModel.swift
//  Bootcamp
//
//  Created by Mihai Constantin on 23.05.2024.
//

import Foundation
import SwiftUI

final class UITestingViewModel: ObservableObject {
 
    let placeholder: String = "Add your name"
    
    @Published var textFieldText: String = ""
    
    @Published var currentUserIsSignedIn: Bool = false
    
    func signUpButtonPressed() {
        guard !textFieldText.isEmpty else { return }
        currentUserIsSignedIn = true
    }
    
}
