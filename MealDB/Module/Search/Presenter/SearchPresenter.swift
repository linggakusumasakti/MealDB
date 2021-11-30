//
//  SearchPresenter.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 30/11/21.
//

import SwiftUI
import Combine

class SearchPresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let searchUseCase: SearchUseCase
    private let router = HomeRouter()
    @Published var meals: [Meal] = []
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    @Published var query: String = ""
    
    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
    }
    
    func getSearchMeal() {
        isLoading = true
        searchUseCase.getSearchMeal(query: query)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = "Menu not Found"
                    self.isError = true
                    self.isLoading = false
                case .finished:
                    self.isLoading = false
                    self.isError = false
                }
            }, receiveValue: { meals in
                self.meals = meals
                print("SEARCH \(self.meals)")
                
            })
            .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(
        id: String,
        @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(destination: router.makeDetailView(id: id)) { content() }
    }

}
