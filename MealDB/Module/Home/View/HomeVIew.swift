//
//  HomeVIew.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 17/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    
    var body: some View {
        ZStack {
            if presenter.isLoading {
                loadingIndicator
            } else if presenter.isError {
                errorIndicator
            } else {
                content
            }
        }.onAppear{
            self.presenter.getCategories()
        }
    }
}

extension HomeView {
    
    var loadingIndicator: some View {
        VStack {
            Text("Loading...")
            ActivityIndicator()
        }
    }
    
    var errorIndicator: some View {
        CustomEmptyView(
            image: "assetSearchNotFound",
            title: presenter.errorMessage
        ).offset(y: 80)
    }
    
    var content: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                ForEach(self.presenter.categories, id: \.id) { category in
                    CategoryRow(category: category)
                }
            }
        }.padding(.horizontal, 8)
    }
    
}


