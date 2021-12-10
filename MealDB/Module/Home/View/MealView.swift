//
//  MealView.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 21/10/21.
//

import SwiftUI
import SDWebImageSwiftUI
import PartialSheet

struct MealRow: View {
    
    @ObservedObject var presenter: HomePresenter
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            content
        }
    }
}

extension MealRow {
    
    var content: some View {
        GridStack(rows: self.presenter.meals.count, columns: 2){ row, col in
            if presenter.isLoggedIn {
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
            } else {
                
                Button(action: {
                    isPresented = true
                }) {
                    if self.presenter.meals.indices.contains(row * 2 + col) {
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
                            .partialSheet(isPresented: $isPresented) {
                                LoginView()
                            }
                    } else {
                        VStack {
                            EmptyView()
                        }.frame(maxWidth: .infinity)
                    }
                }
                
            }
            
            
        }.padding(.horizontal, 8)
            .padding(.vertical, 8)
        
    }
}
