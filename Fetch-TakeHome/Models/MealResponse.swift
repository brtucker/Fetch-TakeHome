//
//  MealResponse.swift
//  Fetch-TakeHome
//
//  Created by Blake Tucker on 1/23/24.
//

import Foundation

struct MealResponse: Codable {
    let meals: [DetailedRecipe]
}

struct DetailedRecipe: Codable {
    let id: String
    let name: String
    let drinkAlternate: String?
    let category: String
    let region: String
    let instructions: String
    let thumbnail: String
    let youtubeLink: String?
    let ingredientOne: String?
    let ingredientTwo: String?
    let ingredientThree: String?
    let ingredientFour: String?
    let ingredientFive: String?
    let ingredientSix: String?
    let ingredientSeven: String?
    let ingredientEight: String?
    let ingredientNine: String?
    let ingredientTen: String?
    let ingredientEleven: String?
    let ingredientTwelve: String?
    let ingredientThirteen: String?
    let ingredientFourteen: String?
    let ingredientFifteen: String?
    let ingredientSixteen: String?
    let ingredientSeventeen: String?
    let ingredientEighteen: String?
    let ingredientNineteen: String?
    let ingredientTwenty: String?
    let measurementOne: String?
    let measurementTwo: String?
    let measurementThree: String?
    let measurementFour: String?
    let measurementFive: String?
    let measurementSix: String?
    let measurementSeven: String?
    let measurementEight: String?
    let measurementNine: String?
    let measurementTen: String?
    let measurementEleven: String?
    let measurementTwelve: String?
    let measurementThirteen: String?
    let measurementFourteen: String?
    let measurementFifteen: String?
    let measurementSixteen: String?
    let measurementSeventeen: String?
    let measurementEighteen: String?
    let measurementNineteen: String?
    let measurementTwenty: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case region = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case youtubeLink = "strYoutube"
        case ingredientOne = "strIngredient1"
        case ingredientTwo = "strIngredient2"
        case ingredientThree = "strIngredient3"
        case ingredientFour = "strIngredient4"
        case ingredientFive = "strIngredient5"
        case ingredientSix = "strIngredient6"
        case ingredientSeven = "strIngredient7"
        case ingredientEight = "strIngredient8"
        case ingredientNine = "strIngredient9"
        case ingredientTen = "strIngredient10"
        case ingredientEleven = "strIngredient11"
        case ingredientTwelve = "strIngredient12"
        case ingredientThirteen = "strIngredient13"
        case ingredientFourteen = "strIngredient14"
        case ingredientFifteen = "strIngredient15"
        case ingredientSixteen = "strIngredient16"
        case ingredientSeventeen = "strIngredient17"
        case ingredientEighteen = "strIngredient18"
        case ingredientNineteen = "strIngredient19"
        case ingredientTwenty = "strIngredient20"
        case measurementOne = "strMeasure1"
        case measurementTwo = "strMeasure2"
        case measurementThree = "strMeasure3"
        case measurementFour = "strMeasure4"
        case measurementFive = "strMeasure5"
        case measurementSix = "strMeasure6"
        case measurementSeven = "strMeasure7"
        case measurementEight = "strMeasure8"
        case measurementNine = "strMeasure9"
        case measurementTen = "strMeasure10"
        case measurementEleven = "strMeasure11"
        case measurementTwelve = "strMeasure12"
        case measurementThirteen = "strMeasure13"
        case measurementFourteen = "strMeasure14"
        case measurementFifteen = "strMeasure15"
        case measurementSixteen = "strMeasure16"
        case measurementSeventeen = "strMeasure17"
        case measurementEighteen = "strMeasure18"
        case measurementNineteen = "strMeasure19"
        case measurementTwenty = "strMeasure20"
    }
}
