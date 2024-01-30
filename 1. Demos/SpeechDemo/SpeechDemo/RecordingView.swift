//
//  RecordingView.swift
//  SpeechDemo
//
//  Created by Mihai Constantin on 18.12.2023.
//

import SwiftUI

struct RecordingView: View {
    
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    
    @State var transcript: String? = nil
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Button(action: {
                    if !isRecording {
                        startRecording()
                    } else {
                        endRecording()
                    }
                }, label: {
                    Text(isRecording ? "Stop Recording" : "Start Recording")
                        .frame(width: 280, height: 50)
                        .background(.tint)
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                        .padding(.top)
                })
                
                Image(systemName: isRecording ? "mic" : "mic.slash")
                    .font(.largeTitle)
                    .padding(.top)
            }
            
            if let transcript = transcript {
                Text("Transcript")
                    .font(.headline)
                    .padding(.top)
                Text(transcript)
            }
        }
        .padding()
            
    }
    
    private func startRecording() {
        speechRecognizer.resetTranscript()
        speechRecognizer.startTranscribing()
        isRecording = true
        transcript = ""
    }
    
    private func endRecording() {
        speechRecognizer.stopTranscribing()
        isRecording = false
//        print(speechRecognizer.transcript)
        transcript = speechRecognizer.transcript
    }
}

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingView(transcript: "")
    }
}
