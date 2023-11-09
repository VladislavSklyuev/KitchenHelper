//
//  RecipesView.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 03.07.2023.
//

import SwiftUI

struct RecipesView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @StateObject var viewModel = RecipesViewModel()
    
    var body: some View {
        GeometryReader { proxy in
        ScrollView() {
            
            Section {
                LazyVGrid(columns: columns, spacing: 8) {
                    
                    ForEach(viewModel.recipes) { recipe in
                        
                        NavigationLink {
                            
                            ConverterView()
                            
                        } label: {
                            
                            RecipeCell(recipe: recipe)
                            
                                .frame(height: proxy.size.width / 2 - 4)
                        }


                    }

                    
                }

            }

            }
        .navigationBarTitle("Авто")
        .navigationTitle("всего")
        }.padding(8)
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
