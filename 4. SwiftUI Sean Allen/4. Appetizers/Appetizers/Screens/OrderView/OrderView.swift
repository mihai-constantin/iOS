//
//  OrderView.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.orderItems
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(orderItems) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItem)
                }.listStyle(InsetListStyle())
                
                Button(action: {
                    print("Order Placed")
                }, label: {
                    APButton(title: "$30.97 - Place Order")
                })
                .padding(.bottom)
                
            }.navigationTitle("🧾 Order")
        }
    }
    
    func deleteItem(at indexSet: IndexSet) {
        orderItems.remove(atOffsets: indexSet)
    }
}

#Preview {
    OrderView()
}
