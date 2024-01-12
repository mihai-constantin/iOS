//
//  DetailView.swift
//  Apple-Frameworks
//
//  Created by Mihai Constantin on 19.12.2023.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @ObservedObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        
        VStack {
            XDismissButton(isShowingDetailView: $viewModel.isShowingDetailView.wrappedValue)

            Spacer()
            
            FrameworkTitleView(framework: viewModel.framework)
            Text(viewModel.framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button(action: {
                viewModel.isShowingSafariView = true
            }, label: {
                AppleFrameworkButton(title: "Learn More")
            })
        }
        .sheet(isPresented: $viewModel.isShowingSafariView, content: {
            SafariView(url: URL(string: String(viewModel.framework.urlString)) ?? URL(string: "www.apple.com")!)
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: MockData.sampleFramework,
                                                                isShowingDetailView: .constant(false)))
    }
}
