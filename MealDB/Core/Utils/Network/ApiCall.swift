//
//  ApiCall.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 19/10/21.
//

import Foundation

struct APICall {
    static let baseUrl = "https://www.themealdb.com/api/json/v1/1/"
}

protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    enum Gets: Endpoint {
        case categories
        case filterCategories
        
        public var url: String {
            switch self {
            case .categories:
                return "\(APICall.baseUrl)categories.php"
            case .filterCategories:
                return "\(APICall.baseUrl)filter.php?c="
            }
        }
    }
}
