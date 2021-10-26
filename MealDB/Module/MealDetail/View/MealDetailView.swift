//
//  MealDetailView.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 26/10/21.
//

import SwiftUI

struct MealDetailView: View {
    @ObservedObject var presenter: MealDetailPresenter
    
    var body: some View {
        VStack {
            
        }.onAppear{
            presenter.getMealDetail()
        }
    }
}
