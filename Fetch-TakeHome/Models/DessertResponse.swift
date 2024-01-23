//
//  DessertResponse.swift
//  Fetch-TakeHome
//
//  Created by Blake Tucker on 1/23/24.
//

import Foundation

struct DessertResponse: Codable {
    let meals: [SimpleRecipe]
}

struct SimpleRecipe: Codable, Equatable {
    let id: String
    let name: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
}
