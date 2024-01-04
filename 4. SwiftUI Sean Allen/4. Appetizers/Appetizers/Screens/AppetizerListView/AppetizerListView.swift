//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State var selectedAppetizer: Appetizer?
    @State var isShowingDetailView: Bool = false
    
    var body: some View {
        
        ZStack {
            NavigationStack {
                List(viewModel.appetizers, rowContent: { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            self.selectedAppetizer = appetizer
                            isShowingDetailView = true
                        }
                })
                .disabled(isShowingDetailView)
                .blur(radius: isShowingDetailView ? 40 : 0)
                .navigationTitle("🍟 Appetizers")
                .onAppear() {
                    viewModel.getAppetizers()
                }
            }
            
            if isShowingDetailView {
                DetailView(appetizer: selectedAppetizer ?? MockData.sampleAppetizer,
                           isShowingDetailView: $isShowingDetailView)
            }
            
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
