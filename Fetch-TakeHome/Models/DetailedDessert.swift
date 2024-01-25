//
//  DetailedDessert.swift
//  Fetch-TakeHome
//
//  Created by Blake Tucker on 1/24/24.
//

import Foundation

struct DetailedDessert: Hashable, Equatable {
    let name: String
    let imageUrl: String
    let instructions: String
    let ingredients: [Ingredient]
}

struct Ingredient: Equatable, Hashable {
    let measurement: String
    let name: String
}
