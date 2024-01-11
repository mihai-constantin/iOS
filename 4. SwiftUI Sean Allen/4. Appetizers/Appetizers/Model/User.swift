//
//  User.swift
//  Appetizers
//
//  Created by Mihai Constantin on 09.01.2024.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var date = Date()
    var extraNapkins = false
    var frequentRefills = false
}
