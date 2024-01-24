//
//  DessertsViewModel.swift
//  Fetch-TakeHome
//
//  Created by Blake Tucker on 1/23/24.
//

import Foundation

class DessertsViewModel: ObservableObject {
    @Published var desserts = [SimpleRecipe]()
    private let networker = Networker()
    
    func fetchDesserts() async {
        guard let result = try? await networker.fetch(path: .category("Dessert")) else {
            return
        }
        
        switch result {
        case .success(let data):
            guard let response = try? JSONDecoder().decode(DessertResponse.self, from: data) else {
                return
            }
            
            desserts = response.meals
        case .failure(let error):
            break
        }
    }
}