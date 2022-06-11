//
//  AllDishes.swift
//  Yummie
//
//  Created by Ahmed on 10/06/2022.
//

import Foundation

struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
