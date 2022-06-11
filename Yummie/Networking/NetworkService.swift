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
    
    func fetchOrders(completion: @escaping(Result<[Order],Error>) -> Void) {
        request(route: .fetchOrders, method: .get, parameter: nil, completion: completion)
    }
    
    func fetchCategoryDishes(categoryId: String, compleion: @escaping(Result<[Dish],Error>) -> Void) {
        request(route: .fetchCategryID(categoryId), method: .get, parameter: nil, completion: compleion)
    }
    
    func placeOredr(dishId: String, name: String, compleion: @escaping(Result<Order,Error>) -> Void) {
        let param = [
            "name": name
        ]
        request(route: .palceOrder(dishId), method: .post, parameter: param, completion: compleion)
    }
    
    func fetchAllCategories(completion: @escaping(Result<AllDishes, Error>) -> Void) {
        request(route: .fetchAllCategories, method: .get, parameter: nil, completion: completion)
    }
    
    private func handelResponse<T: Codable>(result: Result<Data, Error>?, completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        switch result {
            
        case .success(let data):
            guard let response = try? JSONDecoder().decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
            }
            if let data = response.data {
                completion(.success(data))
            } else {
                completion(.failure(AppError.unknownError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    private func request<T: Codable>(route: Route, method: Method, parameter: [String: Any]? = nil, completion: @escaping(Result<T, Error>) -> Void) {
        guard let request = makeRequest(route: route, method: method, parameter: parameter) else {
            completion(.failure(AppError.invalidUrl))
            return
        }
            
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
//                let responseString = String(data: data, encoding: .utf8) ?? "Cant stringify"
//                print("response string: \(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("Error: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                self.handelResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    private func makeRequest(route: Route, method: Method, parameter: [String: Any]? = nil) -> URLRequest? {
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
