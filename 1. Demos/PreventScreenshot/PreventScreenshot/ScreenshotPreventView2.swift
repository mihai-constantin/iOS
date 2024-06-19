//
//  ScreenshotPreventView2.swift
//  PreventScreenshot
//
//  Created by Mihai Constantin on 18.06.2024.
//

import Foundation
import SwiftUI

public struct ScreenshotPreventView2<Content: View>: UIViewRepresentable {
    
    let content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public func makeUIView(context: Context) -> UIView {
        let secureTextField = UITextField()
        secureTextField.isSecureTextEntry = true
        secureTextField.isUserInteractionEnabled = false
        
        guard let secureView = secureTextField.layer.sublayers?.first?.delegate as? UIView else {
            return UIView()
        }
        
        secureView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
        let hController = UIHostingController(rootView: content())
        hController.view.backgroundColor = .clear
        hController.view.translatesAutoresizingMaskIntoConstraints = false
        
        secureView.addSubview(hController.view)
        NSLayoutConstraint.activate([
            hController.view.topAnchor.constraint(equalTo: secureView.topAnchor),
            hController.view.bottomAnchor.constraint(equalTo: secureView.bottomAnchor),
            hController.view.leadingAnchor.constraint(equalTo: secureView.leadingAnchor),
            hController.view.trailingAnchor.constraint(equalTo: secureView.trailingAnchor)
        ])
        
        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(context.coordinator.userDidTakeScreenshot), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
        
        return secureView
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) { }
    
    public func makeCoordinator() -> Coordinator {
            Coordinator()
        }
        
        public class Coordinator: NSObject {
            @objc func userDidTakeScreenshot() {
                if let window = UIApplication.shared.windows.first {
                    let overlayView = UIHostingController(rootView: ScreenshotOverlayView()).view!
                    overlayView.backgroundColor = .clear
                    overlayView.frame = window.bounds
                    window.addSubview(overlayView)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        overlayView.removeFromSuperview()
                    }
                }
            }
        }
}

extension View {

    @ViewBuilder func preventScreenshot(_ shouldPrevent: Bool = true) -> some View {
        if shouldPrevent {
            ScreenshotPreventView2 { self }
        } else {
            self
        }
    }
}
