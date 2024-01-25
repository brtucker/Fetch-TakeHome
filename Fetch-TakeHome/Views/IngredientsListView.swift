//
//  IngredientsListView.swift
//  Fetch-TakeHome
//
//  Created by Blake Tucker on 1/24/24.
//

import SwiftUI

struct IngredientsListView: View {
    let dessert: DetailedDessert
    private let ingredientColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: ingredientColumns, alignment: .leading, spacing: 4) {
            ForEach(dessert.ingredients, id: \.self) { value in
                Text(value.measurement)
                Text(value.name)
            }
        }
    }
}

#Preview {
    IngredientsListView(dessert: DetailedDessert(name: "Cake", imageUrl: "", instructions: "Bake to perfection", ingredients: [
        Ingredient(measurement: "1 Cup", name: "Sugar"),
        Ingredient(measurement: "2 Cups", name: "Flour")
    ]))
}
