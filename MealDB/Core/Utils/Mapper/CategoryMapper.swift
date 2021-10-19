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
}
