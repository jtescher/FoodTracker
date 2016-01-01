//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Julian Tescher on 12/30/15.
//  Copyright © 2015 Julian Tescher. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {

    // MARK: FoodTracker Tests
    func testMealInitialization() {
        // Success case
        let meal = Meal(name: "Newest Meal", photo: nil, rating: 5)
        XCTAssertNotNil(meal)

        // Failure cases
        let mealWithoutValidName = Meal(name: "", photo: nil, rating: 5)
        XCTAssertNil(mealWithoutValidName, "Empty name is invalid")

        let mealWithoutValidRating = Meal(name: "", photo: nil, rating: 5)
        XCTAssertNil(mealWithoutValidRating, "Negative rating is invalid")
    }

}
