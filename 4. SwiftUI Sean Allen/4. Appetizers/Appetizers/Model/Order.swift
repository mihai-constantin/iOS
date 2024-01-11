//
//  Order.swift
//  Appetizers
//
//  Created by Mihai Constantin on 11.01.2024.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var total: Double {
        var totalPrice: Double = 0
        for item in items {
            totalPrice = totalPrice + item.price
        }
        return totalPrice
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItem(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}
