//
//  SearchView.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 17/10/21.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var presenter: SearchPresenter
    
    var body: some View {
        VStack {
            header
            spacer
            if self.presenter.isLoading {
                loadingIndicator
            } else if self.presenter.isError {
                errorMessage
            } else {
                content
            }
        }.navigationBarTitle(Text("Search Meal"), displayMode: .automatic)
        
    }
}

extension SearchView {
    
    var loadingIndicator: some View {
        VStack {
            Text("Loading...")
            ActivityIndicator()
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    var spacer: some View {
        Spacer()
    }
    
    var header: some View {
        VStack {
            
            TextField("Search", text: $presenter.query)
                .cornerRadius(16)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.system(size: 24))
                .padding(.horizontal,8)
                .padding(.vertical, 4)
                .onChange(of: self.presenter.query) { _ in
                    self.presenter.getSearchMeal()
                }
            
        }
    }
    
    var content: some View {
        ScrollView(.vertical, showsIndicators: false) {
            MealSearchRow(presenter: presenter)
        }
    }
    
    var errorMessage: some View {
        VStack(alignment: .center) {
            Text(self.presenter.errorMessage)
                .font(.title2)
                .foregroundColor(.black)
                .padding(.horizontal,8)
                .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .center)
        }
    }
}

