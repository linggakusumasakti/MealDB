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
        VStack(alignment: .leading) {
            if presenter.isLoading {
                loadingIndicator
            } else if presenter.isError {
                errorIndicator
            } else {
                categoryLabel
                spacer
                categoryView
                spacer
                mealView
            }
        }.onAppear{
            self.presenter.getCategories()
            self.presenter.getFilterCategories(category: self.presenter.categorySelected)
        }
        .navigationBarHidden(true)
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
    
    var spacer: some View {
        Spacer()
    }
    
    var categoryView: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                ForEach(self.presenter.categories, id: \.id) { category in
                    CategoryRow(category: category, presenter: presenter)
                }
            }
        }.padding(.horizontal, 8)
    }
    
    var categoryLabel: some View {
        Text("Category")
            .font(.title2)
            .bold()
            .foregroundColor(.black)
            .padding(.horizontal,8)
            .padding(.vertical, 8)
    }
    
    var mealView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            MealRow(presenter: presenter)
        }
    }
    
}


