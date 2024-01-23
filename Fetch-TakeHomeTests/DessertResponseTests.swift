//
//  DessertResponseTests.swift
//  Fetch-TakeHomeTests
//
//  Created by Blake Tucker on 1/23/24.
//

import XCTest
@testable import Fetch_TakeHome

final class DessertResponseTests: XCTestCase {
    
    var responseData: Data?
    
    override func setUpWithError() throws {
        guard let url = Bundle(for: DessertResponseTests.self).url(forResource: "Desserts", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            XCTFail("Could not load Desserts.json")
            return
        }
        
        responseData = data
    }
    
    func test_successfulCodableResponse() {
        guard let responseData else {
            XCTFail("No response data to test")
            return
        }
        
        let response = try? JSONDecoder().decode(DessertResponse.self, from: responseData)
        XCTAssertNotNil(response)
    }
    
    func test_correctFirstMeal() {
        guard let responseData else {
            XCTFail("No response data to test")
            return
        }
        
        let response = try? JSONDecoder().decode(DessertResponse.self, from: responseData)
        guard let firstRecipe = response?.meals.first else {
            XCTFail("No recipes in response")
            return
        }
        
        let expectedRecipe = SimpleRecipe(id: "53049", name: "Apam balik", thumbnail: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        XCTAssertEqual(expectedRecipe, firstRecipe)
    }

}
