//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Mihai Constantin on 04.01.2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {

    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var date = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    
    
}
