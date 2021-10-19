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
    
    var homePresenter: HomePresenter{ HomePresenter(homeUseCase: homeUseCase)}
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homePresenter)
        }
    }
}
