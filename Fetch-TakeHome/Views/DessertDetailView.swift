//
//  DessertDetailView.swift
//  Fetch-TakeHome
//
//  Created by Blake Tucker on 1/24/24.
//

import SwiftUI

struct DessertDetailView: View {
    @ObservedObject private var viewModel: DessertDetailViewModel
    
    init(viewModel: DessertDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Group {
            switch viewModel.dessertState {
            case .loading:
                ProgressView()
            case .loaded(let dessert):
                ScrollView {
                    LazyVStack(spacing: 10) {
                        AsyncImage(url: URL(string: dessert.imageUrl)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 100, height: 100)
                            case .success(let image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 300, minHeight: 300, alignment: .center)
                            case .failure:
                                EmptyView()
                            @unknown default:
                                EmptyView()
                            }
                        }
                        HStack {
                            Text("Instructions:")
                                .font(.title)
                            Spacer()
                        }
                        Text(dessert.instructions)
                            .multilineTextAlignment(.leading)
                        HStack {
                            Text("Ingredients:")
                                .font(.title)
                            Spacer()
                        }
                        IngredientsListView(dessert: dessert)
                    }
                }
                .navigationTitle(dessert.name)
            case .failed:
                Text("Failed to load data")
            }
        }
        .padding([.leading, .trailing], 20)
        .task {
            await viewModel.fetchDessert()
        }
    }
}

#Preview {
    DessertDetailView(viewModel: DessertDetailViewModel(recipeId: "52767"))
}
