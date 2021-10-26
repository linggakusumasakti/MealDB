//
//  DetailMealInteractor.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 26/10/21.
//

import Foundation
import Combine

protocol DetailMealUseCase {
    func getMealDetail() -> AnyPublisher<[Meal], Error>
}

class DetailMealInteractor: DetailMealUseCase {
    
    private let repository: MealRepositoryProtocol
    private let id: String
    
    required init(repository: MealRepositoryProtocol, id: String) {
        self.repository = repository
        self.id = id
    }
    
    func getMealDetail() -> AnyPublisher<[Meal], Error> {
        return repository.getMealDetail(id: id)
    }
}
