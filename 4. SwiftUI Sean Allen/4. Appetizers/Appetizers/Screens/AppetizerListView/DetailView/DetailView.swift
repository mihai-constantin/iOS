//
//  DetailView.swift
//  Appetizers
//
//  Created by Mihai Constantin on 04.01.2024.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var order: Order
    
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
                
                HStack(spacing: 40) {
                    NutritionInfoView(name: "Calories", data: "\(appetizer.calories)")
                    NutritionInfoView(name: "Carbs", data: "\(appetizer.carbs) g")
                    NutritionInfoView(name: "Protein", data: "\(appetizer.protein) g")
                }
                .padding()
            }
             
            Button(action: {
                order.add(appetizer)
                isShowingDetailView = false
            }, label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
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
                    .foregroundStyle(Color.accentColor)
            })
        }
    }
}
                    
struct NutritionInfoView: View {
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
