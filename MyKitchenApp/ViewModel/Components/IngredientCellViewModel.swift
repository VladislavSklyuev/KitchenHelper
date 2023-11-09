//
//  IngredientCellViewModel.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 28.06.2023.
//

import Foundation

class IngredientCellViewModel: ObservableObject {
    @Published var position: IngredientPosition
    
    init(position: IngredientPosition) {
        self.position = position
    }
}
