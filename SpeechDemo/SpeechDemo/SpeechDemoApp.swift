//
//  SpeechDemoApp.swift
//  SpeechDemo
//
//  Created by Mihai Constantin on 18.12.2023.
//

import SwiftUI

@main
struct SpeechDemoApp: App {
    var body: some Scene {
        WindowGroup {
            RecordingView(transcript: "")
        }
    }
}
