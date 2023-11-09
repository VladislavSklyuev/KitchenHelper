//
//  Substance.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 28.06.2023.
//

import Foundation

struct Substance: Identifiable, Hashable {
    var id: String = UUID().uuidString
    let title: String
    let density: Double
    
}

extension Substance {
    static var substances: [Substance] = [
        Substance(title: "Вода", density: 1000),
        Substance(title: "Рис", density: 910),
        Substance(title: "Гречка", density: 740),
        Substance(title: "Сахар", density: 1110),
        Substance(title: "Соль", density: 940)
    ]
}

extension Substance {
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = id
        repres["title"] = title
        repres["density"] = density
        return repres
    }
    
    init?(_ representation: [String: Any]) {
        guard let id = representation["id"] as? String,
              let title = representation["title"] as? String,
              let density = representation["density"] as? Double else { return nil }
        self.id = id
        self.title = title
        self.density = density
    }
    
}
