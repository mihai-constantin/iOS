//
//  DetailView.swift
//  Apple-Frameworks
//
//  Created by Mihai Constantin on 19.12.2023.
//

import SwiftUI

struct DetailView: View {
    
    var framework: Framework
    
    @State private var isShowingSafariView: Bool = false
    
    var body: some View {
        
        VStack {
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button(action: {
                isShowingSafariView = true
            }, label: {
//                AppleFrameworkButton(title: "Learn More")
                
                Label("Learn More", systemImage: "book.fill")
            })
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.red)
        }
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: String(framework.urlString)) ?? URL(string: "www.apple.com")!)
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(framework: MockData.sampleFramework)
    }
}
