//
//  NetworkService.swift
//  Yummie
//
//  Created by Ahmed on 10/06/2022.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func makeRequest(route: Route, method: Method, parameter: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseURL + route.description
        guard let url = urlString.asURL else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        if let parameter = parameter {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = parameter.map { URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                do {
                    let bodyData = try JSONSerialization.data(withJSONObject: parameter, options: [])
                    urlRequest.httpBody = bodyData
                } catch let error {
                    print(error.localizedDescription)
                    return nil
                }
                
            }
        }
        return urlRequest
    }
}
