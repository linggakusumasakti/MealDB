//
//  SearchInteractor.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 30/11/21.
//

import Foundation
import Combine

protocol SearchUseCase {
    func getSearchMeal(query: String) -> AnyPublisher<[Meal], Error>
}

class SearchInteractor: SearchUseCase {
    private let repository: MealRepositoryProtocol
    
    required init(repository: MealRepositoryProtocol) {
        self.repository = repository
    }
    
    func getSearchMeal(query: String) -> AnyPublisher<[Meal], Error> {
        return repository.getSearchMeal(query: query)
    }
}
