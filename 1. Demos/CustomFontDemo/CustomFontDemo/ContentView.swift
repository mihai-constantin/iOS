//
//  ContentView.swift
//  CustomFontDemo
//
//  Created by Mihai Constantin on 24.04.2024.
//

import SwiftUI

//struct ToggleModel {
//    var state: Bool = false {
//        didSet {
//            (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = state ? .dark : .light
//        }
//    }
//}

struct ContentView: View {
    
//    @State private var isDarkModeOn = ToggleModel()
    
    @State private var showDetailsView = false
    
    @State var text = ""
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Text("This is a Text")
                    .customTextStyle()
                    
                
                Spacer()
                
                Button("Details View Screen") {
                    showDetailsView.toggle()
                }
                .buttonStyle(.primary)
            }
            .padding()
            .sheet(isPresented: $showDetailsView) {
                DetailsView()
            }
            .navigationTitle("Theme Switcher")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
