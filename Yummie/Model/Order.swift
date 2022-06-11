//
//  Order.swift
//  Yummie
//
//  Created by Ahmed on 28/02/2022.
//

import Foundation

struct Order: Codable {
    let id: String?
    let name: String?
    let dish: Dish?
}
