//
//  SimpleDessertRowView.swift
//  Fetch-TakeHome
//
//  Created by Blake Tucker on 1/24/24.
//

import SwiftUI

struct SimpleDessertRowView: View {
    let recipe: SimpleRecipe
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: recipe.thumbnail)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 50, height: 50)
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                case .failure(_):
                    Image(systemName: "fork.knife.circle.fill")
                @unknown default:
                    EmptyView()
                }
            }

            Text(recipe.name)
        }
    }
}

#Preview {
    SimpleDessertRowView(recipe: SimpleRecipe(id: "53049", name: "Apam balik", thumbnail: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"))
}
