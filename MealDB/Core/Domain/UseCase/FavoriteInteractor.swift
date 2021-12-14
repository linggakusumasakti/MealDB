//
//  FavoriteInteractor.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 14/12/21.
//

import Foundation
import Combine

protocol FavoriteUseCase {
    func getFavorites() -> AnyPublisher<[Meal], Error>
}

class FavoriteInteractor: FavoriteUseCase {
    
    private let repository: MealRepositoryProtocol
    
    required init(repository: MealRepositoryProtocol){
         self.repository = repository
    }
    
    func getFavorites() -> AnyPublisher<[Meal], Error> {
        return self.repository.getFavorites()
    }
}
