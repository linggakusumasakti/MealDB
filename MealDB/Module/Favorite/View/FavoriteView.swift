//
//  FavoriteView.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 13/12/21.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var presenter: FavoritePreseneter
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false){
                FavoriteRow(presenter: presenter)
            }
        }.onAppear{
            self.presenter.getFavorites()
        }.navigationBarTitle(Text("Favorites Meal"), displayMode: .automatic)
    }
}
