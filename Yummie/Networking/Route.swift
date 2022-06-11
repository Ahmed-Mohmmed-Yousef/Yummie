//
//  Route.swift
//  Yummie
//
//  Created by Ahmed on 10/06/2022.
//

import Foundation

enum Route {
    static let baseURL = "https://yummie.glitch.me"
    
    case fetchAllCategories
    case palceOrder(String)
    case fetchCategryID(String)
    case fetchOrders
    
    var description: String {
        switch self {
        case .fetchAllCategories:
            return "/dish-categories"
        case .palceOrder(let dishId):
            return "/orders/\(dishId)"
        case .fetchCategryID(let catID):
            return "/dishes/\(catID)"
        case .fetchOrders:
            return "/orders"
        }
    }
}
