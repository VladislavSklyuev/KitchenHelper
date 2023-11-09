//
//  Recipe.swift
//  MyKitchenApp
//
//  Created by Владислав Склюев on 03.07.2023.
//

import Foundation

struct Recipe: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let images: [String]
    
}

extension Recipe {
    static var recipes: [Recipe] = [
        Recipe(title: "Мотоцикл", images: ["m1","m2"]),
        Recipe(title: "Карт", images: ["k1","k2","k3"])
    ]
}
