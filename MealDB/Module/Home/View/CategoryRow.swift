//
//  CategoryRow.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 20/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryRow: View {
    var category: Category
    var body: some View {
        VStack(alignment: .leading) {
            content
        }
    }
}

extension CategoryRow {
    var content: some View {
        HStack {
            WebImage(url: URL(string: category.image))
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .cornerRadius(16)
            
            Text(category.title)
                .bold()
                .foregroundColor(.black)
        }
        .padding(.horizontal,16)
        .padding(.vertical, 8)
        .background(CustomColor.lightGrey)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .circular))
        
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            category: Category(
                id: "1",
                title: "Beef",
                image: "https://www.themealdb.com/images/category/beef.png",
                description: ""))
    }
}
