//
//  CategoryMapper.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 19/10/21.
//

import Foundation

final class CategoryMapper {
    static func mapCategoryResponseToDomain(input categoryResponse: [CategoryResponse]) -> [Category] {
        return categoryResponse.map { result in
            return Category(id: result.id ?? "", title: result.title ?? "", image: result.image ?? "", description: result.description ?? "")
        }
    }
    
    static func mapMealResponseToDomain(input mealsResponse: [MealResponse]) -> [Meal] {
        return mealsResponse.map{ result in
            return Meal(id: result.id, name: result.name, image: result.image, instruction: result.instruction ?? "", category: result.category ?? "", tag: result.tag ?? "", youtube: result.youtube ?? "", ingridients1: result.ingridients1 ?? "", ingridients2: result.ingridients2 ?? "", ingridients3: result.ingridients3 ?? "", ingridients4: result.ingridients4 ?? "", ingridients5: result.ingridients5 ?? "", ingridients6: result.ingridients6 ?? "", ingridients7: result.ingridients7 ?? "", ingridients8: result.ingridients8 ?? "", ingridients9: result.ingridients9 ?? "", ingridients10: result.ingridients10 ?? "", measure1: result.measure1 ?? "", measure2: result.measure2 ?? "", measure3: result.measure3 ?? "", measure4: result.measure4 ?? "", measure5: result.measure5 ?? "", measure6: result.measure6 ?? "", measure7: result.measure7 ?? "", measure8: result.measure8 ?? "", measure9: result.measure9 ?? "", measure10: result.measure10 ?? "")
        }
    }
    
    static func mapEntitiesFavoriteToDomain(input favorites: [FavoriteEntity]) -> [Meal] {
        return favorites.map { favorite in
            return Meal(id: favorite.id, name: favorite.name, image: favorite.image, instruction: "", category: "", tag: "", youtube: "", ingridients1: "", ingridients2: "", ingridients3: "", ingridients4: "", ingridients5: "", ingridients6: "", ingridients7: "", ingridients8: "", ingridients9: "", ingridients10: "", measure1: "", measure2: "", measure3: "", measure4: "", measure5: "", measure6: "", measure7: "", measure8: "", measure9: "", measure10: "")
        }
    }
    
    static func mapEntityFavoriteToDomain(input favorite: FavoriteEntity) -> Meal {
        return Meal(id: favorite.id, name: favorite.name, image: favorite.image, instruction: "", category: "", tag: "", youtube: "", ingridients1: "", ingridients2: "", ingridients3: "", ingridients4: "", ingridients5: "", ingridients6: "", ingridients7: "", ingridients8: "", ingridients9: "", ingridients10: "", measure1: "", measure2: "", measure3: "", measure4: "", measure5: "", measure6: "", measure7: "", measure8: "", measure9: "", measure10: "")
    }
    
    static func domainMealToEntity(input meal: Meal) -> FavoriteEntity {
        let entity = FavoriteEntity()
        entity.id = meal.id
        entity.image = meal.image
        entity.name = meal.name
        return entity
    }
}
