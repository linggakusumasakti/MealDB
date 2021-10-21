//
//  MealsResponse.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 21/10/21.
//

import Foundation

struct MealsResponse: Decodable {
    let meals: [MealResponse]
}

struct MealResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case image = "strMealThumb"
        case id = "idMeal"
    }
    
    let name: String
    let image: String
    let id: String
}
