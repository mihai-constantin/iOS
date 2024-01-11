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
                    TextField("First Name", text: $viewModel.user.firstName)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewModel.user.date, displayedComponents: .date)
                    
                    Button(action: {
                        viewModel.saveChanges()
                    }, label: {
                        Text("Save changes")
                    })
                }
                
                Section("Requests") {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .tint(Color.accentColor)
            }
            .navigationTitle("🧔🏻‍♂️ Account")
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
            
        }
        .onAppear() {
            viewModel.getUser()
        }
    }
}

#Preview {
    AccountView()
}
