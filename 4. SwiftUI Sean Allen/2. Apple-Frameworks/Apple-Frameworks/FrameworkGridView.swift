//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Mihai Constantin on 13.12.2023.
//

import SwiftUI

struct FrameworkGridView: View {
    
    var columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        
        LazyVGrid(columns: columns) {
            FrameworkTitleView(imageName: "app-clip",
                               name: "App Clips")
            FrameworkTitleView(imageName: "app-clip",
                               name: "App Clips")
            FrameworkTitleView(imageName: "app-clip",
                               name: "App Clips")
            FrameworkTitleView(imageName: "app-clip",
                               name: "App Clips")
            FrameworkTitleView(imageName: "app-clip",
                               name: "App Clips")
            FrameworkTitleView(imageName: "app-clip",
                               name: "App Clips")
        }
        
    }
}

struct FrameworkTitleView: View {
    
    var imageName: String
    var name: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 90, height: 90)
            
            Text(name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}
