//
//  Dish.swift
//  Yummie
//
//  Created by Ahmed on 27/02/2022.
//

import Foundation

struct Dish: Codable {
    let id, name, description, image: String?
    let calories: Double?
    
    var fprmattedCalories: String {
        return String(format: "%.2f", calories ?? 0)
    }
}
