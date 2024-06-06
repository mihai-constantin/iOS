//
//  ContentView.swift
//  WebView
//
//  Created by Mihai Constantin on 06.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showActionSheet = false
    @State private var availableBrowsers: [(name: String, urlScheme: String)] = []
    
    var body: some View {
        VStack {
            Button(action: {
                checkAvailableBrowsers()
                showActionSheet = true
            }) {
                Text("Open Link")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(
                    title: Text("Open With"),
                    buttons: availableBrowsers.map { browser in
                            .default(Text(browser.name)) {
                                openURL(in: browser.urlScheme)
                            }
                    } + [.cancel()]
                )
            }
        }
    }
    
    func checkAvailableBrowsers() {
        let browsers = [
            ("Chrome", "googlechrome://"),
            ("Firefox", "firefox://open-url?url=https://"),
            ("Safari", "http://") // Safari uses http directly
        ]
        
        availableBrowsers = browsers.filter { canOpenURL(urlScheme: $0.1) }
    }
    
    func canOpenURL(urlScheme: String) -> Bool {
        if let url = URL(string: urlScheme), UIApplication.shared.canOpenURL(url) {
            return true
        }
        return false
    }
    
    func openURL(in browserScheme: String) {
        let urlString = "apple.com"
        let escapedURL = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let urlToOpen = URL(string: "\(browserScheme)\(escapedURL)")!
        
        UIApplication.shared.open(urlToOpen, options: [:], completionHandler: nil)
    }
}

#Preview {
    ContentView()
}
