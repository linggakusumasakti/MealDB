//
//  HomePresenter.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 19/10/21.
//

import SwiftUI
import Combine
import FirebaseAuth

class HomePresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let router = HomeRouter()
    private let homeUseCase: HomeUseCase
    
    @Published var categories: [Category] = []
    @Published var meals: [Meal] = []
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    @Published var session: User?
    var isLoggedIn: Bool { session != nil}
    var handle: AuthStateDidChangeListenerHandle?
    
    @Published var categorySelected: String = "Beef"
    
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.session = user
                print("NAME \(String(describing: user.displayName))")
            } else {
                self.session = nil
            }
        }
    }
    
    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    func getCategories(){
        isLoading = true
        homeUseCase.getCategories()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isLoading = false
                    
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { categories in
                self.categories = categories
            })
            .store(in: &cancellables)
    }
    
    func getFilterCategories(category: String) {
        categorySelected = category
        homeUseCase.getFilterCategories(category: category)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { meals in
                self.meals = meals
                print("MEALS \(meals)")
            })
            .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(
        id: String,
        @ViewBuilder content: () -> Content) -> some View {
            NavigationLink(destination: router.makeDetailView(id: id)) { content() }
        }
}
