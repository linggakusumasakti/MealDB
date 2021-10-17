//
//  ContentView.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 17/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
              HomeView()
            }.tabItem {
              TabBarIcon(imageName: "house", title: "Home")
            }
            NavigationView {
              HomeView()
            }.tabItem {
              TabBarIcon(imageName: "magnifyingglass", title: "Search")
            }
            NavigationView {
              HomeView()
            }.tabItem {
              TabBarIcon(imageName: "cart", title: "Cart")
            }

        }.accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
