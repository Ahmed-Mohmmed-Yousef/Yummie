//
//  DishCategory.swift
//  Yummie
//
//  Created by Ahmed on 27/02/2022.
//

import Foundation

struct DishCategory: Codable {
    let id, name, image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
