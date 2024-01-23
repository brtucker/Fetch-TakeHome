//
//  DetailedRecipeResponseTests.swift
//  Fetch-TakeHomeTests
//
//  Created by Blake Tucker on 1/23/24.
//

import XCTest
@testable import Fetch_TakeHome

final class DetailedRecipeResponseTests: XCTestCase {

    var responseData: Data?
    
    override func setUpWithError() throws {
        guard let url = Bundle(for: DessertResponseTests.self).url(forResource: "Recipe", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            XCTFail("Could not load Desserts.json")
            return
        }
        
        responseData = data
    }
    
    func test_successfulCodableResponse() {
        guard let responseData else {
            XCTFail("No data to decode with")
            return
        }
        
        let response = try? JSONDecoder().decode(MealResponse.self, from: responseData)
        XCTAssertNotNil(response)
    }

}
