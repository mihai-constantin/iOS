//
//  AccountView.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

struct AccountView: View {
    
   @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.firstName)
                    
                    TextField("Last Name", text: $viewModel.lastName)
                    
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewModel.date, displayedComponents: .date)
                    
                    Button(action: {
                        viewModel.saveChanges()
                    }, label: {
                        Text("Save changes")
                        
                    })
                }
                
                Section("Requests") {
                    Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
                        
                    Toggle("Frequent Refills", isOn: $viewModel.frequentRefills)
                }
                .tint(Color.brandPrimaryColor)
                
            }
            .navigationTitle("🧔🏻‍♂️ Account")
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
            
        }
    }
}

#Preview {
    AccountView()
}
