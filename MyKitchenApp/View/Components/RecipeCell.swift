//
//  RecipeCell.swift
//  MyKitchenApp
//
//  Created by Владислав Склюев on 03.07.2023.
//

import SwiftUI

struct RecipeCell: View {
    
    let recipe: Recipe
    
    var body: some View {
        
        TabView {
            ForEach(recipe.images, id: \.self) { image in

                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                        .tabItem {
                            Image(systemName: "globe.central.south.asia.fill")
                        }
            }
        }
        .tabViewStyle(.page)
    }
}

//struct RecipeCell_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeCell()
//    }
//}
