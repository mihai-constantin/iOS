//
//  DetailView.swift
//  Appetizers
//
//  Created by Mihai Constantin on 04.01.2024.
//

import SwiftUI

struct DetailView: View {
    
    let appetizer: Appetizer
    
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding()
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack {
                    NutritionalView(name: "Calories", data: "\(appetizer.calories)")
                    NutritionalView(name: "Carbs", data: "\(appetizer.carbs) g")
                    NutritionalView(name: "Protein", data: "\(appetizer.protein) g")
                }
                .padding()
            }
             
            Button(action: {
                
            }, label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .background(Color.brandPrimary)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
            })
            .padding()
        }
        .frame(width: 320)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {

            Button(action: {
                isShowingDetailView = false
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundStyle(.brandPrimary)
            })
        }
    }
}
                    
struct NutritionalView: View {
    
    var name: String
    var data: String
    
    var body: some View {
        VStack {
            Text(name)
                .bold()
                .font(.caption)
            Text(data)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .italic()
        }
    }
}

#Preview {
    DetailView(appetizer: MockData.sampleAppetizer, 
               isShowingDetailView: .constant(false))
}
