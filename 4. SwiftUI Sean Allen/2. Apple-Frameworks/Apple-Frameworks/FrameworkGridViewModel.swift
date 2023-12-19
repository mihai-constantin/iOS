//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Mihai Constantin on 19.12.2023.
//

import Foundation
import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView = false
}
