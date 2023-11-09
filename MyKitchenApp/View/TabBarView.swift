//
//  TabBarView.swift
//  KitchenApp
//
//  Created by Влад Мади on 27.06.2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ConverterView()
                .tabItem { Label("Конвертер", systemImage: "function") }
            NavigationView {
                RecipesView()
            }
            .tint(.blue)
            .tabItem { Label("Рецепты", systemImage: "fork.knife") }
            
        }
        .tabViewStyle(.automatic)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
