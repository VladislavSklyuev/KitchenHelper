//
//  AddMeasureViewModel.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 29.06.2023.
//

import Foundation

class AddMeasureViewModel: ObservableObject {
    var title: String = ""
    var shorttitle: String = ""
    var isWeight: Bool = true
    var baseCoeff: Double = 0
    
    func save() {
        let measure = Measure(title: title, shorttitle: shorttitle, isWeight: isWeight, baseCoeff: baseCoeff)
        Measure.measures.append(measure)
    }
    
    func remove() {
        Measure.measures.removeLast()
    }
}
