//
//  IngridientView.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 30/11/21.
//

import SwiftUI

struct IngridientRow : View {
    var number: Int
    var ingridient: String
    var body: some View {
        VStack{
            Text("\(number). \(ingridient)")
                .font(.body)
                .foregroundColor(.black)
                .padding(.horizontal,8)
        }
    }
}
