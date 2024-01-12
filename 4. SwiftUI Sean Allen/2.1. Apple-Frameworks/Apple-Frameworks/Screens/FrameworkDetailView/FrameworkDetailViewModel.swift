//
//  FrameworkDetailViewModel.swift
//  Apple-Frameworks
//
//  Created by Mihai Constantin on 12.01.2024.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    
    let framework: Framework
    var isShowingDetailView: Binding<Bool>
    
    @Published var isShowingSafariView: Bool = false
    
    init(framework: Framework, isShowingDetailView: Binding<Bool>) {
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView
    }
}
