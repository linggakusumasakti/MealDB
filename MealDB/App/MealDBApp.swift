//
//  MealDBApp.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 17/10/21.
//

import SwiftUI

@main
struct MealDBApp: App {
    
    let injection = Injection()
    
    let homeUseCase = Injection.init().provideHome()
    let searchUseCase = Injection.init().provideSearhMeal()
    let favoriteUseCase = Injection.init().provideFavorite()
    
    var homePresenter: HomePresenter{ HomePresenter(homeUseCase: homeUseCase)}
    var searchPresenter: SearchPresenter { SearchPresenter(searchUseCase: searchUseCase)}
    var favoritePresenter: FavoritePreseneter { FavoritePreseneter(useCase: favoriteUseCase)}
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homePresenter)
                .environmentObject(searchPresenter)
                .environmentObject(favoritePresenter)
        }
    }
}
