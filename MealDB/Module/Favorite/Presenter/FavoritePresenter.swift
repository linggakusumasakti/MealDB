//
//  FavoritePresenter.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 14/12/21.
//

import SwiftUI
import Combine
import RealmSwift
import MapKit

class FavoritePreseneter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    
    private var useCase: FavoriteUseCase
    private let router = HomeRouter()
    
    @Published var meals: [Meal] = []
    
    init(useCase: FavoriteUseCase){
        self.useCase = useCase
    }
    
    func getFavorites(){
        useCase.getFavorites()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                  break
                case .finished:
                    break
                    
                }
            }, receiveValue: { meals in
                self.meals = meals
            })
            .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(
        id: String,
        @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(destination: router.makeDetailView(id: id)) { content() }
    }
}
