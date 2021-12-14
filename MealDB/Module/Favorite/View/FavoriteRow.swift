//
//  FavoriteRow.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 14/12/21.
//

import SwiftUI

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteRow: View {
    @ObservedObject var presenter: FavoritePreseneter
    var body: some View {
        VStack {
            content
        }
    }
}

extension FavoriteRow {
    
    var content: some View {
        GridStack(rows: self.presenter.meals.count, columns: 2){ row, col in
            if self.presenter.meals.indices.contains(row * 2 + col) {
                self.presenter.linkBuilder(id: self.presenter.meals[row * 2 + col].id) {
                ZStack {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(.white)
                            .shadow(radius: 4)
                        VStack {
                            WebImage(url: URL(string: self.presenter.meals[row * 2 + col].image))
                                .resizable()
                                .indicator(.activity)
                                .transition(.fade(duration: 0.5))
                                .scaledToFit()
                                .cornerRadius(16)
                            
                            Text(self.presenter.meals[row * 2 + col].name)
                                .font(.title3)
                                .bold()
                                .foregroundColor(.black)
                                .padding()
                                .frame(alignment: .center)
                        }
                    }.buttonStyle(PlainButtonStyle())
                }
            } else {
                VStack {
                    EmptyView()
                }.frame(maxWidth: .infinity)
            }
            
        }.padding(.horizontal, 8)
            .padding(.vertical, 8)
        
    }
}
