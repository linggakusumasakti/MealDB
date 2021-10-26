//
//  MealDetailPresenter.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 26/10/21.
//

import SwiftUI
import Combine
import MapKit

class MealDetailPresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    
    private var useCase: DetailMealUseCase
    
    @Published var meals: [Meal] = []
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    
    init(useCase: DetailMealUseCase){
        self.useCase = useCase
    }
    
    func getMealDetail() {
        isLoading = true
        useCase.getMealDetail()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isError = false
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { meals in
                self.meals = meals
                print("DETAIL MEALS \(meals)")
            })
            .store(in: &cancellables)
    }
}
