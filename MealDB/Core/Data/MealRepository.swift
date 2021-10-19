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
}
