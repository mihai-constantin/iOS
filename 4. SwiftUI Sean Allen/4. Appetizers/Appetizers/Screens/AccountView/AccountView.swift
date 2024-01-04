//
//  AccountView.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

struct AccountView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var date = Date()
    
    @State var extraNapkins = false
    @State var frequentRefills = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $firstName)
                    
                    TextField("Last Name", text: $lastName)
                    
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $date, displayedComponents: .date)
                    
                    Button(action: {
                        print("Save")
                    }, label: {
                        Text("Save changes")
                        
                    })
                }
                
                Section("Requests") {
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                        
                    Toggle("Frequent Refills", isOn: $frequentRefills)
                }
                .tint(Color.brandPrimaryColor)
                
            }
            .navigationTitle("🧔🏻‍♂️ Account")
        }
    }
}

#Preview {
    AccountView()
}
