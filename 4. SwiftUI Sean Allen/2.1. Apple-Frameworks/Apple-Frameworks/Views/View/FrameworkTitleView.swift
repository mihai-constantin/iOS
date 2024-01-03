//
//  FrameworkTitleView.swift
//  Apple-Frameworks
//
//  Created by Mihai Constantin on 23.12.2023.
//

import SwiftUI

struct FrameworkTitleView: View {
    
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 90, height: 90)
            
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}

#Preview {
    FrameworkTitleView(framework: MockData.sampleFramework)
}
