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
    func setFavorite(favorite: Meal) -> AnyPublisher<Bool, Error>
    func getFavorites() -> AnyPublisher<[Meal], Error>
    func getFavorite(id: String) -> AnyPublisher<Meal, Error>
}

final class MealRepository {
    
    typealias MealInstance = (RemoteDataSource, LocalDataSource) -> MealRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let local: LocalDataSource
    
    private init(remote: RemoteDataSource, local: LocalDataSource) {
        self.remote = remote
        self.local = local
    }
    
    static let sharedInstance: MealInstance = { remoteRepo, localRepo in
        return MealRepository(remote: remoteRepo, local: localRepo)
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
    
    func setFavorite(favorite: Meal) -> AnyPublisher<Bool, Error> {
        return self.local.setFavorite(favoriteEntity: CategoryMapper.domainMealToEntity(input: favorite))
            .eraseToAnyPublisher()
    }
    
    func getFavorites() -> AnyPublisher<[Meal], Error> {
        return self.local.getFavorites()
            .map { CategoryMapper.mapEntitiesFavoriteToDomain(input: $0)}
            .eraseToAnyPublisher()
    }
    
    func getFavorite(id: String) -> AnyPublisher<Meal, Error> {
        return self.local.getFavorite(id: id)
            .map{ CategoryMapper.mapEntityFavoriteToDomain(input: $0)}
            .eraseToAnyPublisher()
    }
}
