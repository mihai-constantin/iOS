//
//  OrderView.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItem)
                    }.listStyle(InsetListStyle())
                    
                    Button(action: {
                        print("Order Placed")
                    }, label: {
//                        APButton(title: "$\(order.total, specifier: "%.2f") - Place Order")
                        Text("$\(order.total, specifier: "%.2f") - Place Order")
                    })
//                    .modifier(StandardButtonStyle())
                    .standardButtonStyle()
                    .padding(.bottom)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "No Items in the cart.")
                }
            }
            
            .navigationTitle("🧾 Order")
        }
    }
    
    
}

#Preview {
    OrderView()
}
