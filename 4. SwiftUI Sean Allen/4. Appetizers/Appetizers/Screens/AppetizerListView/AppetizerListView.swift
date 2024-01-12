//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Mihai Constantin on 03.01.2024.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        
        ZStack {
            NavigationStack {
                List(viewModel.appetizers, rowContent: { appetizer in
                        AppetizerListCell(appetizer: appetizer)
//                        .listRowSeparator(.hidden)
//                        .listRowSeparatorTint(.accentColor)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetailView = true
                        }
                })
                .disabled(viewModel.isShowingDetailView)
                .blur(radius: viewModel.isShowingDetailView ? 40 : 0)
                .navigationTitle("🍟 Appetizers")
                .task {
                    viewModel.getAppetizers()
                }
            }
            
            if viewModel.isShowingDetailView {
                DetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer,
                           isShowingDetailView: $viewModel.isShowingDetailView)
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
