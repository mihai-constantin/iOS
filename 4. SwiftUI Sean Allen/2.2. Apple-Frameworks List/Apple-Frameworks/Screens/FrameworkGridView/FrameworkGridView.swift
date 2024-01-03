//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Mihai Constantin on 13.12.2023.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(value: framework) {
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .navigationDestination(for: Framework.self) { framework in
                DetailView(framework: framework)
            }
        }
        .tint(Color(.label))
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}
