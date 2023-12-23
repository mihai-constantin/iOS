//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Mihai Constantin on 19.12.2023.
//

import Foundation
import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}
