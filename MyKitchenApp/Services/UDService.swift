//
//  UDService.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 29.06.2023.
//

import Foundation

class UDService {
    static let shared = UDService(); private init() { }
    private let ud = UserDefaults.standard
    
    enum Keys: String {
        case firstTime, substances, measures
    }
    
    @discardableResult
    func getFirstTimeValue() -> Bool {
        guard ud.value(forKey: Keys.firstTime.rawValue) is Bool else {
            addInitData()
            setNotFirstTime()
            return true
        }
        
        return false
    }
    
    func setNotFirstTime() {
        ud.set(false, forKey: Keys.firstTime.rawValue)
    }
    
    func getSubstances() -> [Substance] {
        guard let representantions = ud.array(forKey: Keys.substances.rawValue) as? [[String: Any]]
        else { return [] }
        
        return representantions
            .map { Substance($0) }
            .filter { $0 != nil }
            .map { $0! }
    }
    
    func addSubstance(_ substance: Substance) {
        var representantions = ud.array(forKey: Keys.substances.rawValue) as? [[String: Any]] ?? []
        let newRepres = substance.representation
        representantions.append(newRepres)
        ud.setValue(representantions, forKey: Keys.substances.rawValue)
    }
    
    func addInitData() {
        let representations = Substance.substances.map { $0.representation }
        ud.setValue(representations, forKey: Keys.substances.rawValue)
    }
    
}



