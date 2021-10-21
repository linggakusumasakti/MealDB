//
//  CategoryRow.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 20/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryRow: View {
    var category: Category
    @ObservedObject var presenter: HomePresenter
    var body: some View {
        VStack(alignment: .leading) {
            categoryView
        }
    }
}

extension CategoryRow {
    var categoryView: some View {
        Button(action: {
            self.presenter.getFilterCategories(category: category.title)
        }){
            HStack {
                WebImage(url: URL(string: category.image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .cornerRadius(16)
                
                Text(category.title)
                    .bold()
                    .foregroundColor(self.presenter.categorySelected == category.title ? .white : .black)
            }
            .padding(.horizontal,8)
            .padding(.vertical, 8)
            .background(self.presenter.categorySelected == category.title ? Color.red : CustomColor.lightGrey)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .circular))
            
        }
    }
    
}
