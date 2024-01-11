//
//  ContentView.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

struct AppetizersTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
        .tint(Color.accentColor)
    }
}

#Preview {
    AppetizersTabView()
}
