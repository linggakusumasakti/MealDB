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
    @EnvironmentObject var favoritePresenter: FavoritePreseneter
    @State var selected = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if self.selected == 0 {
                        
                        HomeView(presenter: homePresenter)
                        
                    } else if self.selected == 1 {
                        
                        SearchView(presenter: searchPresenter)
                        
                    } else {
                        FavoriteView(presenter: favoritePresenter)
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
                
                Button(action: {
                    self.selected = 0
                }) {
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(self.selected == 0 ? .white : .gray)
                    
                    if selected == 0 {
                        Text("Home")
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    
                }
                .padding()
                .background(self.selected == 0 ? Color.red : Color.white)
                .clipShape(Capsule())
                .padding()
                .animation(Animation.spring())
                
                Spacer()
                
                Button(action: {
                    self.selected = 1
                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(self.selected == 1 ? .white : .gray)
                    
                    if selected == 1 {
                        Text("Search")
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    
                }
                .padding()
                .background(self.selected == 1 ? Color.red : Color.white)
                .clipShape(Capsule())
                .padding()
                .animation(Animation.spring())
                
                
                Spacer()
                
                Button(action: {
                    self.selected = 2
                }) {
                    Image(systemName: "suit.heart.fill")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(self.selected == 2 ? .white : .gray)
                    
                    if selected == 2 {
                        Text("Favorite")
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    
                }
                .padding()
                .background(self.selected == 2 ? Color.red : Color.white)
                .clipShape(Capsule())
                .padding()
                .animation(Animation.spring())
                
            }
            
        }
        .background(Color.white)
        .clipShape(Capsule())
        .shadow(color: .gray, radius: 8)
        .padding(.horizontal, 16)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
