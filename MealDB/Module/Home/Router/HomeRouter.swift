//
//  HomeRouter.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 26/10/21.
//

import SwiftUI

class HomeRouter {
    func makeDetailView(id: String) -> some View {
        let mealDetailUseCase = Injection.init().provideMealDetail(id: id)
        let presenter = MealDetailPresenter(useCase: mealDetailUseCase)
        return MealDetailView(presenter: presenter)
    }
}
