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
        VStack {
            
        }.onAppear{
            self.presenter.getCategories()
        }
    }
}
