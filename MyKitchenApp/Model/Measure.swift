//
//  Measure.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 28.06.2023.
//

import Foundation

struct Measure: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let title: String
    let shorttitle: String
    let isWeight: Bool // true - Масса, false - объём
    let baseCoeff: Double // Отношение либо к кг, либо к М^3
    
    static var measures: [Measure] = [
        Measure(title: "Килограмм", shorttitle: "КГ", isWeight: true, baseCoeff: 1),
        Measure(title: "Литр", shorttitle: "Л", isWeight: false, baseCoeff: 0.001),
        Measure(title: "Грамм", shorttitle: "Г", isWeight: true, baseCoeff: 0.001),
        Measure(title: "Фунт", shorttitle: "Фунт", isWeight: true, baseCoeff: 2.20462)
    ]
    
}
