//
//  SafariView.swift
//  Apple-Frameworks
//
//  Created by Mihai Constantin on 23.12.2023.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
        
    typealias UIViewControllerType = SFSafariViewController
    
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        
    }
    
}
