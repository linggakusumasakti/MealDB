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
    @State var selected = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if self.selected == 0 {
                        
                        HomeView(presenter: homePresenter)
                        
                    } else {
                        
                        SearchView(presenter: searchPresenter)
                        
                    }
                }
                
                FloatingTabBar(selected: self.$selected)
                
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
        //        NavigationView {
        //            TabView {
        //                HomeView(presenter: homePresenter).tabItem {
        //                    TabBarIcon(imageName: "house", title: "Home")
        //                }
        //
        //                SearchView(presenter: searchPresenter).tabItem {
        //                    TabBarIcon(imageName: "magnifyingglass", title: "Search")
        //                }
        //
        //
        //
        //            }.accentColor(.red)
        //        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FloatingTabBar: View {
    
    @Binding var selected: Int
    
    var body: some View {
        HStack {
            Spacer(minLength: 0)
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    self.selected = 0
                }) {
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(self.selected == 0 ? .red : .gray)
                }
                
                Spacer()
                
                Button(action: {
                    self.selected = 1
                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(self.selected == 1 ? .red : .gray)
                }
                
                Spacer()
                
            }
            
        }.padding(16)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: .gray, radius: 8)
            .padding(22)
            .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
