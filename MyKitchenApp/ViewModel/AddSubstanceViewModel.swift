//
//  AddSubstanceViewModel.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 29.06.2023.
//

import Foundation

class AddSubstanceViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var density: Double = 1000
    
    func save() {
        let substance = Substance(title: title, density: density)
        UDService.shared.addSubstance(substance)
    }
}
