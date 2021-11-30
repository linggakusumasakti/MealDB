//
//  MealRepository.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 19/10/21.
//

import Foundation
import Combine
import UIKit

protocol MealRepositoryProtocol {
    func getCategories() -> AnyPublisher<[Category], Error>
    func getFilterCategories(category: String) -> AnyPublisher<[Meal], Error>
    func getMealDetail(id: String) -> AnyPublisher<[Meal], Error>
    func getSearchMeal(query: String) -> AnyPublisher<[Meal], Error>
}

final class MealRepository {
    
    typealias MealInstance = (RemoteDataSource) -> MealRepository
    
    fileprivate let remote: RemoteDataSource
    
    private init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: MealInstance = { remoteRepo in
        return MealRepository(remote: remoteRepo)
    }
}

extension MealRepository: MealRepositoryProtocol {
    func getCategories() -> AnyPublisher<[Category], Error> {
        return self.remote.getCategories()
            .map { CategoryMapper.mapCategoryResponseToDomain(input: $0)}
            .eraseToAnyPublisher()
    }
    
    func getFilterCategories(category: String) -> AnyPublisher<[Meal], Error> {
        return self.remote.getFilterCategories(category: category)
            .map{ CategoryMapper.mapMealResponseToDomain(input: $0)}
            .eraseToAnyPublisher()
    }
    
    func getMealDetail(id: String) -> AnyPublisher<[Meal], Error> {
        return self.remote.getMealDetail(id: id)
            .map{ CategoryMapper.mapMealResponseToDomain(input: $0)}
            .eraseToAnyPublisher()
    }
    
    func getSearchMeal(query: String) -> AnyPublisher<[Meal], Error> {
        return self.remote.getSearchMeal(query: query)
            .map{ CategoryMapper.mapMealResponseToDomain(input: $0)}
            .eraseToAnyPublisher()
    }
}
