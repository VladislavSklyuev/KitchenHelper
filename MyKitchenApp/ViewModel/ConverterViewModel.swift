//
//  ConverterViewModel.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 28.06.2023.
//

import Foundation

class ConverterViewModel: ObservableObject {
    @Published var inputValue: Double? 
    @Published var substances = Substance.substances
    @Published var measures = Measure.measures
    @Published var inMeasure = Measure.measures[0]
    @Published var outMeasure = Measure.measures[0]
    @Published var selectedSubstance = Substance.substances[0]
    @Published var resultValue = 0.0
    @Published var positions: [IngredientPosition] = []
    
    init() {
        UDService.shared.getFirstTimeValue()
        getSubstances()
    }

    
    func solve() {
        //1 - V -> V
        //2 - M -> M
        //3 - M -> V
        //4 - V -> M
        
        guard let inputValue else {
            resultValue = 0.0
            return
        }
        
        switch (inMeasure.isWeight, outMeasure.isWeight) {
        case (true, true), (false, false):  //1 || 2
            resultValue = inputValue * inMeasure.baseCoeff / outMeasure.baseCoeff
        case (true, false):
            resultValue = inputValue * inMeasure.baseCoeff / (outMeasure.baseCoeff * selectedSubstance.density)
        case (false, true):
            resultValue = inputValue * inMeasure.baseCoeff * selectedSubstance.density / outMeasure.baseCoeff
        }
        self.inputValue = 0
    }
    
    func getSubstances() {
        self.substances = UDService.shared.getSubstances()
    }
    
    func createPosition() {
        guard resultValue != 0.0 else { return }
        
        let ingredientPosition = IngredientPosition(substance: selectedSubstance, amount: resultValue, measure: outMeasure)
        
        self.positions.append(ingredientPosition)
        resultValue = 0
    }
    
    func deletePosition(_ position: IngredientPosition) {
        guard let index = self.positions.firstIndex(of: position) else { return }
        self.positions.remove(at: index)
    }
    
    func changeValue(_ newValue: Double, forPosition position: IngredientPosition) {
        guard let index = self.positions.firstIndex(of: position) else { return }
        self.positions[index].amount = newValue
    }
    
}
