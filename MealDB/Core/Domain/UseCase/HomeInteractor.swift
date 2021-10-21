//
//  HomeInteractor.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 19/10/21.
//

import Foundation
import Combine
import UIKit

protocol HomeUseCase {
    func getCategories() -> AnyPublisher<[Category],Error>
    func getFilterCategories(category: String) -> AnyPublisher<[Meal], Error>
}

class HomeInteractor: HomeUseCase {
    
    private let repository: MealRepositoryProtocol
    
    required init(repository: MealRepositoryProtocol){
         self.repository = repository
    }
    
    func getCategories() -> AnyPublisher<[Category], Error> {
        return repository.getCategories()
    }
    
    func getFilterCategories(category: String) -> AnyPublisher<[Meal], Error> {
        return repository.getFilterCategories(category: category)
    }
}
