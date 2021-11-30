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
    @Published var imageMeal: String = ""
    @Published var nameMeal: String = ""
    @Published var instruction: String = ""
    @Published var errorMessage: String = ""
    @Published var youtubeUrl: String = ""
    @Published var youtubeId: String = ""
    @Published var ingridients: [String] = []
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
                self.imageMeal = meals[0].image
                self.nameMeal = meals[0].name
                self.instruction = meals[0].instruction
                self.ingridients.append("\(meals[0].ingridients1) \(meals[0].measure1)")
                self.ingridients.append("\(meals[0].ingridients2) \(meals[0].measure2)")
                self.ingridients.append("\(meals[0].ingridients3) \(meals[0].measure3)")
                self.ingridients.append("\(meals[0].ingridients4) \(meals[0].measure4)")
                self.ingridients.append("\(meals[0].ingridients5) \(meals[0].measure5)")
                self.ingridients.append("\(meals[0].ingridients6) \(meals[0].measure6)")
                self.ingridients.append("\(meals[0].ingridients7) \(meals[0].measure7)")
                self.ingridients.append("\(meals[0].ingridients8) \(meals[0].measure8)")
                self.ingridients.append("\(meals[0].ingridients9) \(meals[0].measure9)")
                self.ingridients.append("\(meals[0].ingridients10) \(meals[0].measure10)")
                self.youtubeUrl = meals[0].youtube
                self.youtubeId = self.youtubeUrl.replacingOccurrences(of: "https://www.youtube.com/watch?v=", with: "")
                
                print("DETAIL MEALS \(self.youtubeId)")
            })
            .store(in: &cancellables)
    }
}
