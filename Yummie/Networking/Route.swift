//
//  Route.swift
//  Yummie
//
//  Created by Ahmed on 10/06/2022.
//

import Foundation

enum Route {
    static let baseURL = "https://yummie.glitch.me"
    
    case temp
    
    var description: String {
        switch self {
        case .temp:
            return "temp"
        }
    }
}
