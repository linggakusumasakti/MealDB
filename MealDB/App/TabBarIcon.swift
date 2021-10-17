//
//  TabBarIcon.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 17/10/21.
//

import SwiftUI

struct TabBarIcon: View {
    
    var imageName: String
    var title: String
    var body: some View {
      VStack {
        Image(systemName: imageName)
        Text(title)
      }
    }

}
