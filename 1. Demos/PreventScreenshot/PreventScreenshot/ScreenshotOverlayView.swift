//
//  ScreenshotOverlayView.swift
//  PreventScreenshot
//
//  Created by Mihai Constantin on 18.06.2024.
//

import SwiftUI

struct ScreenshotOverlayView: View {
    var body: some View {
        VStack {
            Image(systemName: "camera.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    ScreenshotOverlayView()
}
