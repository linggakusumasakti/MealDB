//
//  ContentView.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 17/10/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var homePresenter: HomePresenter
    var body: some View {
        NavigationView {
            TabView {
                HomeView(presenter: homePresenter).tabItem {
                    TabBarIcon(imageName: "house", title: "Home")
                }
                
                SearchView().tabItem {
                    TabBarIcon(imageName: "magnifyingglass", title: "Search")
                }
                
                CartView().tabItem {
                        TabBarIcon(imageName: "cart", title: "Cart")
                    }
                
            }.accentColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
