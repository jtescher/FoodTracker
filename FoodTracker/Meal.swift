//
//  Meal.swift
//  FoodTracker
//
//  Created by Julian Tescher on 1/1/16.
//  Copyright © 2016 Julian Tescher. All rights reserved.
//

import UIKit

class Meal {

    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int

    //MARK Initialialization
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating

        if name.isEmpty || rating < 0 {
            return nil
        }
    }

}