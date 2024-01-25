//
//  DessertDetailViewModel.swift
//  Fetch-TakeHome
//
//  Created by Blake Tucker on 1/24/24.
//

import Foundation

@MainActor
class DessertDetailViewModel: ObservableObject {
    @Published public var dessertState = DessertState.loading
    
    private var recipeId: String
    private let networker = Networker()
    
    enum DessertState {
        case loading
        case loaded(DetailedDessert)
        case failed
    }
    
    init(recipeId: String) {
        self.recipeId = recipeId
    }
    
    func fetchDessert() async {
        guard let result = try? await networker.fetch(path: .detail(uuid: recipeId)) else {
            return
        }
        
        switch result {
        case .success(let data):
            guard let response = try? JSONDecoder().decode(MealResponse.self, from: data),
                  let dessert = response.meals.first else {
                dessertState = .failed
                return
            }
            
            dessertState = .loaded(translate(recipe: dessert))
        case .failure:
            dessertState = .failed
        }
    }
    
    private func translate(recipe: DetailedRecipe) -> DetailedDessert {
        var ingredientsWithMeasurements = [Ingredient?]()
        
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementOne, ingredient: recipe.ingredientOne))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementTwo, ingredient: recipe.ingredientTwo))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementThree, ingredient: recipe.ingredientThree))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementFour, ingredient: recipe.ingredientFour))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementFive, ingredient: recipe.ingredientFive))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementSix, ingredient: recipe.ingredientSix))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementSeven, ingredient: recipe.ingredientSeven))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementEight, ingredient: recipe.ingredientEight))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementNine, ingredient: recipe.ingredientNine))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementTen, ingredient: recipe.ingredientTen))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementEleven, ingredient: recipe.ingredientEleven))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementTwelve, ingredient: recipe.ingredientTwelve))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementThirteen, ingredient: recipe.ingredientThirteen))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementFourteen, ingredient: recipe.ingredientFourteen))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementFifteen, ingredient: recipe.ingredientFifteen))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementSixteen, ingredient: recipe.ingredientSixteen))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementSeventeen, ingredient: recipe.ingredientSeventeen))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementEighteen, ingredient: recipe.ingredientEighteen))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementNineteen, ingredient: recipe.ingredientNineteen))
        ingredientsWithMeasurements.append(combine(measurement: recipe.measurementTwenty, ingredient: recipe.ingredientTwenty))
        
        return DetailedDessert(name: recipe.name,
                               imageUrl: recipe.thumbnail,
                               instructions: recipe.instructions,
                               ingredients: ingredientsWithMeasurements.compactMap({ $0 }))
    }
    
    private func combine(measurement: String?, ingredient: String?) -> Ingredient? {
        guard let measurement, let ingredient,
              !measurement.isEmpty, !ingredient.isEmpty else {
            return nil
        }
        
        return Ingredient(measurement: measurement, name: ingredient)
    }
}
