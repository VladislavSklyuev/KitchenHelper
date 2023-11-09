//
//  RecipesViewModel.swift
//  MyKitchenApp
//
//  Created by Владислав Склюев on 03.07.2023.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published var recipes = Recipe.recipes
}
