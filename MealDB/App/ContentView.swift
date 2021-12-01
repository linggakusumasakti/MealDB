//
//  ContentView.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 17/10/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var homePresenter: HomePresenter
    @EnvironmentObject var searchPresenter: SearchPresenter
    var body: some View {
        NavigationView {
            TabView {
                HomeView(presenter: homePresenter).tabItem {
                    TabBarIcon(imageName: "house", title: "Home")
                }
                
                SearchView(presenter: searchPresenter).tabItem {
                    TabBarIcon(imageName: "magnifyingglass", title: "Search")
                }
                
              
                
            }.accentColor(.red)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
