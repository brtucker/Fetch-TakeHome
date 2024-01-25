//
//  DessertsView.swift
//  Fetch-TakeHome
//
//  Created by Blake Tucker on 1/23/24.
//

import SwiftUI

struct DessertsView: View {
    @ObservedObject private var viewModel = DessertsViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.desserts) { item in
                NavigationLink {
                    DessertDetailView(viewModel: DessertDetailViewModel(recipeId: item.id))
                } label: {
                    SimpleDessertRowView(recipe: item)
                }
            }
            .navigationTitle("Desserts")
        }
        .task {
            await viewModel.fetchDesserts()
        }
    }
}

#Preview {
    DessertsView()
}
