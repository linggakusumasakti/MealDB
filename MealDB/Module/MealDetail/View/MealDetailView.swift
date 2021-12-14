//
//  MealDetailView.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 26/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MealDetailView: View {
    @ObservedObject var presenter: MealDetailPresenter
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            if presenter.isLoading {
                loadingIndicator
            } else {
                ScrollView(.vertical, showsIndicators: false){
                    header
                    actionMenu
                    content
                }
                
            }
            
        }.onAppear{
            presenter.getMealDetail()
            presenter.getFavorite()
        }.navigationBarTitle(Text(self.presenter.nameMeal), displayMode: .large)
        
    }
}

extension MealDetailView {
    
    var loadingIndicator: some View {
        VStack {
            Text("Loading...")
            ActivityIndicator()
        }
    }
    var spacer: some View {
        Spacer()
    }
    
    var header: some View {
        VStack(alignment: .leading) {
            WebImage(url: URL(string: self.presenter.imageMeal))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
            
        }
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            Text("Ingridients")
                .font(.title3)
                .bold()
                .foregroundColor(.black)
                .padding(.horizontal,8)
                .padding(.vertical, 2)
            
            ForEach(self.presenter.ingridients.indices, id: \.self) { i in
                IngridientRow(number: i+1, ingridient: self.presenter.ingridients[i])
            }
            
            Text("Instruction")
                .font(.title3)
                .bold()
                .foregroundColor(.black)
                .padding(.horizontal,8)
                .padding(.vertical, 2)
            
            Text(self.presenter.instruction)
                .font(.body)
                .foregroundColor(.black)
                .padding(.horizontal,8)
                .padding(.bottom, 72)
        }
    }
    
    var actionMenu: some View {
        HStack {
            
            spacer
            
            Button(action: {
                self.presenter.addFavorite()
            }) {
                VStack {
                    Image(systemName: presenter.isFavorite ? "suit.heart.fill" : "suit.heart")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 25, height: 25, alignment: .center)
                    Text("Favorite")
                        .foregroundColor(.black)
                }
            }
            
            spacer
            
            Button(action: {
                let youtubeId = self.presenter.youtubeId
                var youtubeUrl = NSURL(string:"youtube://\(youtubeId)")!
                if UIApplication.shared.canOpenURL(youtubeUrl as URL){
                    UIApplication.shared.open(youtubeUrl as URL)
                } else{
                    youtubeUrl = NSURL(string:self.presenter.youtubeUrl)!
                    UIApplication.shared.open(youtubeUrl as URL)
                }
            }) {
                VStack {
                    Image(systemName: "video")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 25, height: 25, alignment: .center)
                    Text("Tutorial")
                        .foregroundColor(.black)
                }
            }
            
            spacer
            
            Button(action: {
                
            }) {
                VStack {
                    Image(systemName: "bell")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 25, height: 25, alignment: .center)
                    Text("Notification")
                        .foregroundColor(.black)
                }
            }
            
            spacer
        }
    }
}
