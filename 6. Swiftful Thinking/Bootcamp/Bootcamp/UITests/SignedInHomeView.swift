//
//  SignedInHomeView.swift
//  Bootcamp
//
//  Created by Mihai Constantin on 23.05.2024.
//

import SwiftUI

struct SignedInHomeView: View {
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView(content: {
            
            VStack(spacing: 20, content: {
                
                Button(action: {
                    showAlert.toggle()
                }, label: {
                    Text("Show welcome alert!")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                .accessibilityIdentifier("ShowAlertButton")
                .alert(isPresented: $showAlert, content: {
                    return Alert(title: Text("Welcome to the app!"))
                })
                
                NavigationLink(
                    destination: Text("Destination")
                ) {
                    Text("Navigate")
                }
                .accessibilityIdentifier("NavigationLinkToDestination")
            })
            .padding()
            .navigationTitle("Welcome")
            
        })
    }
}

#Preview {
    SignedInHomeView()
}
