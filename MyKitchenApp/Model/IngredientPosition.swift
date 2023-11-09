//
//  IngredientPosition.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 28.06.2023.
//

import Foundation

struct IngredientPosition: Identifiable, Equatable {
    let id: String = UUID().uuidString
    let substance: Substance
    var amount: Double
    let measure: Measure
    
    static func ==(lhs: IngredientPosition, rhs: IngredientPosition) -> Bool {
        lhs.id == rhs.id
    }
}
