//
//  Appetizer.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

struct Appetizer: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let carbs: Int
    let protein: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 1,
                                           name: "Chicken Avocado Spring Roll",
                                           description: "These won't last 10 seconds once they hit the table.",
                                           price: 12.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-avocado-spring-roll.jpg",
                                           calories: 480,
                                           carbs: 19,
                                           protein: 7)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let order1 = Appetizer(id: 1,
                                  name: "Chicken Avocado Spring Roll",
                                  description: "These won't last 10 seconds once they hit the table.",
                                  price: 12.99,
                                  imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-avocado-spring-roll.jpg",
                                  calories: 480,
                                  carbs: 19,
                                  protein: 7)
    
    static let order2 = Appetizer(id: 2,
                                  name: "Chicken Avocado Spring Roll",
                                  description: "These won't last 10 seconds once they hit the table.",
                                  price: 12.99,
                                  imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-avocado-spring-roll.jpg",
                                  calories: 480,
                                  carbs: 19,
                                  protein: 7)
    
    static let order3 = Appetizer(id: 3,
                                  name: "Chicken Avocado Spring Roll",
                                  description: "These won't last 10 seconds once they hit the table.",
                                  price: 12.99,
                                  imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-avocado-spring-roll.jpg",
                                  calories: 480,
                                  carbs: 19,
                                  protein: 7)
    
    static let orderItems = [order1, order2, order3]
}
