//
//  ContentView.swift
//  WeSplit
//
//  Created by Mihai Constantin on 29.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        
        NavigationStack {
            Form {
                
                Picker("Tip Percentage", selection: $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text("\($0)")
                    }
                }
                
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}

#Preview {
    ContentView()
}
