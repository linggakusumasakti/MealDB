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
                }
                floatingButton
            }
            
        }.onAppear{
            presenter.getMealDetail()
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
    
    var floatingButton: some View {
        VStack {
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
                }){
                    HStack {
                        Text("Watch Tutorial")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    spacer
                        
                        Image(systemName: "video.fill")
                            .foregroundColor(.white)
                            
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .circular))
                    
                }
            }.padding(16)

    }
}
