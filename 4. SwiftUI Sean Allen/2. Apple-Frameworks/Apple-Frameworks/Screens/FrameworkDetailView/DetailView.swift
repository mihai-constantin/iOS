//
//  DetailView.swift
//  Apple-Frameworks
//
//  Created by Mihai Constantin on 19.12.2023.
//

import SwiftUI

struct DetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    
    @State private var isShowingSafariView: Bool = false
    
    var body: some View {
        
        VStack {
            
            XDismissButton(isShowingDetailView: $isShowingDetailView)
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button(action: {
                isShowingSafariView = true
            }, label: {
                AppleFrameworkButton(title: "Learn More")
            })
        }
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: String(framework.urlString)) ?? URL(string: "www.apple.com")!)
        })
    }
}

struct BackgroundView: View {
    var body: some View {
        ContainerRelativeShape()
            .fill(Color.black.gradient)
            .ignoresSafeArea()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
        DetailView(framework: MockData.sampleFramework,
                   isShowingDetailView: .constant(false))
    }
}
