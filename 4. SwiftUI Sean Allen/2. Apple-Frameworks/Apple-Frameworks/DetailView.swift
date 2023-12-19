//
//  DetailView.swift
//  Apple-Frameworks
//
//  Created by Mihai Constantin on 19.12.2023.
//

import SwiftUI

struct DetailView: View {
    
    var framework: Framework
    
    var body: some View {
        
        ZStack {
            VStack {
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color(.label))
                            .font(.title2)
                    })
                }
                .padding()
                
                Spacer()
                
                FrameworkTitleView(framework: framework)
                Text(framework.description)
                    .font(.body)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    AppleFrameworkButton(title: "Learn More")
                })
            }
        }
        
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
        DetailView(framework: MockData.sampleFramework)
    }
}
