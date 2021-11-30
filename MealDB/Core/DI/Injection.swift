//
//  Injection.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 19/10/21.
//

import Foundation

final class Injection {
    
    private func provideRepository() -> MealRepositoryProtocol {
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        
        return MealRepository.sharedInstance(remote)
    }
    
    func provideHome() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    
    func provideMealDetail(id: String) -> DetailMealUseCase {
        let repository = provideRepository()
        return DetailMealInteractor(repository: repository, id: id)
    }
}
