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
        case instruction = "strInstructions"
        case category = "strCategory"
        case tag = "strTags"
        case youtube = "strYoutube"
        case ingridients1 = "strIngredient1"
        case ingridients2 = "strIngredient2"
        case ingridients3 = "strIngredient3"
        case ingridients4 = "strIngredient4"
        case ingridients5 = "strIngredient5"
        case ingridients6 = "strIngredient6"
        case ingridients7 = "strIngredient7"
        case ingridients8 = "strIngredient8"
        case ingridients9 = "strIngredient9"
        case ingridients10 = "strIngredient10"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
    }
    
    let name: String
    let image: String
    let id: String
    let instruction: String?
    let category: String?
    let tag: String?
    let youtube: String?
    let ingridients1: String?
    let ingridients2: String?
    let ingridients3: String?
    let ingridients4: String?
    let ingridients5: String?
    let ingridients6: String?
    let ingridients7: String?
    let ingridients8: String?
    let ingridients9: String?
    let ingridients10: String?
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
}
